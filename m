Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A94826011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 17:22:39 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id y82so32706739wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 09:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=XOpcjaid8YNvML1/etHFeoCQr4O3MazR5LdgAiY4HL0=;
	b=s9GZiAhPBGvjHMwhhQAwVcDyAU8A7hm85/mcK0zDRZ40ngjfExJr6AVqJUu594yHHS
	iEl2z/AGpi+z5GjEOqEdaSLcZpSqyVykdAxOivQVPAEyOeV1YWERAekblpNJbh7Fs3OQ
	AqfO/nLfPBPylGlpmsmcuqybYXC7q6EsYkTAQe944ffjr1FNj+e1rneLfKnarEGx/uQz
	W8e5THyqbSPWkdjg861KamjaBNEnLxqdiXUpZy1NjP1BupyoxXFR4V5X/KurUTkI99CG
	D7nv5mRLrQaLPVZLzRv/vIkTgCVIrQIJ8O1ojxr894E8w5UM9ZuS2QyQQShFmBKQM6NB
	fWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=XOpcjaid8YNvML1/etHFeoCQr4O3MazR5LdgAiY4HL0=;
	b=uYRuaRvNESMdiZzNMteGciwVx2q46Ivzaxn9oDOjMbh9Bh/NRBK11nMiXApCQLkmoa
	alBIHvQ1Zu+vPDTWESrZ98zlLNC1g93FsjJB4omKuifYlaIzcCePRT81OZ6eEKHcFFch
	IXWOSafoL5Zf4otLzQSP2gDGGIyJp75N5AWR24I0MB3XLWQgoxtZU+2HPd7uAH4y9aeI
	oFld3vgJ70yX2GRpGeUWk5pWKNA1u3U5dkwC96uK66PdPtdCmpQVcVxiNWC6nr6RYAEt
	i87st3xj7jiPDr75qAveW6dmeJrDqjzc517ayoADRqmBjnIa29Mvl8knu2galLbdWPjO
	xfvg==
X-Gm-Message-State: AJaThX5ACaz3ura4STtWoN5YGrOX11WZc129J86XodVPc2wlfG2qjpHw
	cU1TqCrBf23K1WIZKlYZVDUmujajGAGln50mhQht/g==
X-Google-Smtp-Source: AGs4zMaIStOk3RBirgv+JOwA78x2TwYpfuF4mrSz+GxaP0uUkqMO66Sl9nMrJZ5cLtyqWTb/p6sphzR+ZcFvHkL+X4g=
X-Received: by 10.80.179.120 with SMTP id r53mr3763472edd.174.1511889759987;
	Tue, 28 Nov 2017 09:22:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.169.50 with HTTP; Tue, 28 Nov 2017 09:22:39 -0800 (PST)
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Tue, 28 Nov 2017 18:22:39 +0100
Message-ID: <CAEQ58sgvjUMZK8VfmRmgs2+G7VGQ9rL71NgTxmUg=S832_ANvg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: connman-wait-online is not behaving properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Nov 2017 17:22:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am doing a build on the Raspberry Pi 3 for an University project. I
included in the core-image-minimal image the connman packages, so that
I have connmanctl, connman.service and connman-wait-online.service
enabled.

Wired network is set up properly and so is wifi using connmanctl. I
can successfully connect to the board using ssh.

What bugs me is the fact that connman-wait-online is not signaling
properly systemd that the network is configured.

systemctl status network.target yields that the target network has
been reached so far.
On the same side, network-online.target is not even started (no one
notified it of the network being online).

Also, connman-wait-online.service seems to not be even started
(reports inactive (dead)).

What is happening? Can someone tell me what I am missing in order to
connman-wait-online to correctly signal network being online?

Many thanks,
Francesco

