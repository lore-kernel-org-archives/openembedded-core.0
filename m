Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B19746FF72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:52:15 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id jx14so34211358pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=3RA1dyolBKqpYxIglN2KbxLNY14EDu9JG6sVKd5aV1k=;
	b=UQ1hlG2YHEsY7BdUkDnK5hJE09MlLNP6J/euo6IJfgSijLEcTeuMthu6jFgbmvi1GJ
	OClY3pqFl7dzmLeu7s7yEXDARrLfrCamqs6pVKKZw6dYEP2OkdNWAIqucSpkkUjoNZlp
	ECXMyu0gXPKj7fiP576GhDpafjKQ9GGqw5mUiyr3iDrjVBJWjJgjMB+mANL2Nwkfy3Lg
	vcJY6BjxOnr2d0xdBbgymc7xYwW2roFQNSl2jn7LruoHwYSP7rsXzHZkuUnmkhkqqsxS
	nGncpaA4+9ieel8DzkHZk7abU7vuA6WhHDVmdekbqxbzR4muvIinN4lSnNSSw1/dKDQc
	aSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=3RA1dyolBKqpYxIglN2KbxLNY14EDu9JG6sVKd5aV1k=;
	b=Te32zE28qsXI+6oy/td/dKJBHLkWQVA/ecaBsTPeRCTiS4d2v1JwVyX8ycqdQ5NuOH
	XD1mqy2j21A/zLvufYnAD34imX9Zh5H/390DUy2RgWSPmNCJcN66+yJTnv8b0haOa+FY
	ydma3Ss8fxE3reqUKZVlDcqQL3KgXFrjMGX22zB1CCq0gwsMfCuvSKB7vnGI9vlhj+Vb
	W0edr7uqtppDJO3k/ZfyjoE6oeYOE8VRwGaVL9teq+vZtXrGjJfKuwNyfroSbX4+iez9
	Dc7oHcXcHootbDsAZEVlrEyVUB299zrQBfFixocEJExbt0HXH2ug013sPRoQDRJjejmg
	vDXg==
X-Gm-Message-State: ALoCoQmn/nPizcPeikEgWRUN08Csq58tmw5cCW8Klc/hUfX4iOVNPBeL7LUwTS8mPf/1C1P3D5FYxwIrqP3V31EHrlNo+NDZ5Q==
X-Received: by 10.66.102.70 with SMTP id fm6mr6783243pab.80.1450457536243;
	Fri, 18 Dec 2015 08:52:16 -0800 (PST)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	cn1sm18434263pad.11.2015.12.18.08.52.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 08:52:14 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id u7so5056063pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:52:14 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.14.217 with SMTP id 86mr6742743pfo.101.1450457533924;
	Fri, 18 Dec 2015 08:52:13 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 18 Dec 2015 08:52:13 -0800 (PST)
In-Reply-To: <1450389888-24760-2-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-2-git-send-email-tom.hochstein@freescale.com>
Date: Fri, 18 Dec 2015 14:52:13 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrdjBD=RXJ_hPgQCqO0C7hK3=dECXg_JKT11xVVYOEMwA@mail.gmail.com>
Message-ID: <CAP9ODKrdjBD=RXJ_hPgQCqO0C7hK3=dECXg_JKT11xVVYOEMwA@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 2/4] weston: Include weston-launch if Wayland is configured.
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
X-List-Received-Date: Fri, 18 Dec 2015 16:52:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 17, 2015 at 8:04 PM, Tom Hochstein
<tom.hochstein@freescale.com> wrote:
> The weston-launch app is required for Wayland.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>

The commit log needs a good rework; this is explaining the source code
and not why it has been change. Please rework it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

