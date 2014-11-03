Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6241860809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:13:43 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ex7so7132356wid.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3GVjOfsHUf7/10HpBj/cIxL8RP2Soi83BLuc5XFwoAY=;
	b=CSLsFuTNlH9TUbe5DgC9aetIUidxN1EkiB/O4jFqe/MRyP/2FhSxrX166Ptm4l0ANr
	NeKXE/9Azy3YScgz4BnTvBHCg+C57lWPrrY8qv1I37eM6y84+KwNpZVdEtwPB0hCd6G+
	uGBBaml5Y/OCBjzlfoJLZSQXfxqeNfNEXfGalXqyLXaD2X6nr/0THqIFjMMK4IboGZq8
	+4MCJ1DZDvs2c2V2Wmts0+tv2RGVgBKyDqpm0dfSBfsHiURqakJO2OSoZba6cNqC/Rs+
	K0PHr4YFwqyU7xEGe/peLYp3qavP8SaATdbd4+6ECq57ba5zcrGSWMRbUkUROyud8SX5
	gE3g==
X-Gm-Message-State: ALoCoQkdUjJ9L9cG6Dbwilzydv0pdUKCsFHpbmPAeQEd5Q0ztPtGHTt9suW9hPlTxp5KMujpDHut
X-Received: by 10.194.186.207 with SMTP id fm15mr50901029wjc.1.1415034823520; 
	Mon, 03 Nov 2014 09:13:43 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id n4sm9371240wiz.17.2014.11.03.09.13.42
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 09:13:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LaeFG5ceKK1a1ugPEHyQ5z1dz6YVqY7Y0gPyD6vyWY=BA@mail.gmail.com>
Date: Mon, 3 Nov 2014 18:13:41 +0100
Message-Id: <363A0B14-2FE4-4F63-BA2C-C9581F1D86CA@dominion.thruhere.net>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
	<CAJTo0LaeFG5ceKK1a1ugPEHyQ5z1dz6YVqY7Y0gPyD6vyWY=BA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 17:13:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 nov. 2014, om 17:08 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
>=20
> On 3 November 2014 15:24, Koen Kooi <koen.kooi@linaro.org> wrote:
> It's been over a month and libpng is still broken, so I refuse to =
classify this new process as 'helpful' or as 'appreciated' at this =
point.
>=20
> Remember that 1.7 was frozen solid for several weeks of that month, so =
no it wouldn't have been merged in that time period.  It's only just =
re-opened: master is currently 80 patches ahead of dizzy, 35 in the =
C-Pull I sent last night, and another 33 in my staging branch right now =
so it's not like we're taking it easy right now.
>=20
> Some context: during September it was obvious that various parties had =
an interest in aarch64 (Linaro and Wind River).  Patches to fix build =
failures were being sent sporadically, a qemuarm64 machine was =
submitted, but there was no kernel for said machine to actually build.   =
At the time there was no qemuarm64 machine that actually worked, so even =
merging the "simple" fixes on just faith that they're correct would be =
reckless considering we were freezing.  This is why I suggested[1] that =
someone with a vested interest in aarch64 collate all the patches into a =
single branch and keep it rebased to master so that when master opens, =
it can be tested on *all* qemu architectures and merged.  It appears =
that this hasn't happened.  Will Linaro be able to create a branch that =
incorporates all of the patches and new machine that's been tested as a =
whole?

Most likely not because we already have meta-aarch64 for the toolchain =
and kernel support. But aside from that, the past few *years* it wasn't =
a problem to get aarch64 related patches merged into OE-core, so why is =
there suddenly such a problem now?

Furthermore, this libpng patch isn't strictly an aarch64 patch, it fixes =
a previous commit that should have been flagged in review as being wrong =
for using double qualifiers in a bogus way. So why did the culprit go in =
and the fix submitted 3 days later not?=

