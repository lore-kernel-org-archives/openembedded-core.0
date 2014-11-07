Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id B150F6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:19:04 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id r20so3884249wiv.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 01:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=4p7kP6P4LnrDpBjiSHlNdJmDkuIjpTW6PHGFgwHMoVM=;
	b=CI/od4RW/PAciMLm1NBBWUQj6sqVgjngtR3nO7OZFiVi9kqS1qt31d3glFxx/0kmYM
	zWLrXJT6dUj1XK+GoJcVupYniv+SefN/OGee9OFIHsVLvpyBTsJvYiSF1Y6XU4IQ4eYD
	carU4nfz8Kg099pgz+IVegEWk0fNQb+XtTCjqU781EHqVzzClGN9kQOacHjdg3tgLNsH
	7skBacXl5bxLwYV0buCcay0YhEp+1vbFBmbssreSTpmcEVRed9/X+aj4q4chpp5edAmx
	QNbDH4r5mgKEWNJR5SN2wEzQx5X0wF3iXH7XSA3BcztsR/t6J/bO4xujvaVpdJ92Lkf1
	PL1g==
X-Gm-Message-State: ALoCoQnx+NyxmjdiyeZanCvdaBcP7BluyTgMuG6J3pVH18yP/el+7Iur6FEU64u9swJLG4vT0ffP
X-Received: by 10.180.9.169 with SMTP id a9mr3129207wib.7.1415351944880;
	Fri, 07 Nov 2014 01:19:04 -0800 (PST)
Received: from [172.20.0.187] ([77.162.165.174])
	by mx.google.com with ESMTPSA id
	cz3sm11003759wjb.23.2014.11.07.01.19.03 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Nov 2014 01:19:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1415350038.git.kai.kang@windriver.com>
Date: Fri, 7 Nov 2014 10:18:59 +0100
Message-Id: <4BAF41A0-2647-427A-9F10-B2DF8D721FF5@dominion.thruhere.net>
References: <cover.1415350038.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Fri, 07 Nov 2014 09:19:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> het =
volgende geschreven:
>=20
> V2:
> * rebase on master and drop qemu upgrade commit
> * built for lib32-core-image-sato core-image-sato-sdk meta-toolchain =
and world
>=20
> V1:
> The original configuration files and tune fils for arm arch64 are from =
linaro.
> And we rename it to qemuarm64 for consistency.

Consistent to what? All current qemu machines are named after the qemu =
arch, so consistent would be 'qemuaarch64'. The 'arm64' moniker is =
*only* used in the kernel and that was caused by Linus being grumpy, =
everything else is 'aarch64' or 'armv8'=20=

