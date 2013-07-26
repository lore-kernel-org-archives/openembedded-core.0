Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 944A16041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 10:39:18 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r6QAdHav027370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 26 Jul 2013 12:39:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1374835157;
	bh=Nv4415LPWCx3jr6P12aW9lElY6sNiZqpfDAaozaUeUQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ldPCyKh+EDAEsFVDBxa7bSR+SYEh0bJC9lANo1wUbBi2ChOOwr2BWPce9FlJFrIYE
	1ZoRRdItZ6ANpklDx5ipuH8hZ6ozFfDk+gwIqaszwlrdi4fAfOMjMfJY6MSp1x/RsQ
	E5X9UNV5QIuoJMikNg6zu15mCBxRTs+PauwiHzQI=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r6QAdCdQ029563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Jul 2013 12:39:13 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1V2fQW-0005wo-P4; Fri, 26 Jul 2013 12:39:12 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 26 Jul 2013 12:39:12 +0200
In-Reply-To: <5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
	(Qi's message of "Fri, 26 Jul 2013 15:39:36 +0800")
Message-ID: <lyk3kdk3lb.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.8
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Fri, 26 Jul 2013 10:39:19 -0000
Content-Type: text/plain

<Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> To avoid generating ssh keys every time a system with read-only rootfs
> starts, we generate ssh keys at rootfs creation time.

This is security wise a very bad and dangerous change because all devices
will get the same key which can be extracted very easy from (public)
images.


Enrico

