Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id BCB1D60EB8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 18:23:33 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so5271147wes.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2014 10:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=4gMLY6BGuANHU9DpUqhYG7AjdXDyPqT/rP0VBWcApe8=;
	b=lYqPdiKpLHH/yMm3MGwzceAg0HHfnAm1MVaHbii4TOZWA/8blRRqFYTw5bnuFieJSj
	rKBOdD8QiOy72DlFtLufV4cke8Akp/GIyy7txdqG6/g7QF+hrL8ZpFa5OW9GGEVHNhGG
	iouw3ITOBdlMOlwcCcHYm/aeP42p37J/9kNaRf1g+GnGChyF2PKjytk7FIHYoP9Fq7yf
	pu4W7H+nOi18dX6KRNW/L9SpTtM29SH2c8pJNVOPOn7/pvGA87bDIBAbvorzOvTEXZhI
	GSWxFEfftd+YLo80FORUBk2c9Rp+6M8til1TPkBJyRzyeFliazIvopq78MNGJLx4c6St
	5fbg==
X-Gm-Message-State: ALoCoQnTA4PsZkSnvtGr3V3Bd4YEgeK2si/326LMZd2vKFN66A33G71hSwQMzg452ljXLYVygdSD
X-Received: by 10.180.74.230 with SMTP id x6mr8041725wiv.29.1389464613895;
	Sat, 11 Jan 2014 10:23:33 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id hv3sm8796361wib.5.2014.01.11.10.23.32
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 11 Jan 2014 10:23:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAK18fxGFcszrKH30mhDUAU-sjrJa2t7dHshXj-TWkSnGye1AEw@mail.gmail.com>
Date: Sat, 11 Jan 2014 19:23:31 +0100
Message-Id: <9E28661F-3754-4BB9-AA54-B106CE42F5C7@dominion.thruhere.net>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
	<8969D90B-28E6-4C07-A113-93A9C033EFAD@dominion.thruhere.net>
	<CAK18fxGFcszrKH30mhDUAU-sjrJa2t7dHshXj-TWkSnGye1AEw@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Mailer: Apple Mail (2.1827)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Sat, 11 Jan 2014 18:23:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 jan. 2014, om 16:16 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:

>=20
>=20
>=20
> On Sat, Jan 11, 2014 at 5:10 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>=20
> Op 11 jan. 2014, om 16:08 heeft Andrei Gherzan <andrei@gherzan.ro> het =
volgende geschreven:
>=20
> > Avoid a confusion when including thumb in TUNE_FATURES. In the =
curent behavior,
> > if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm" =
which makes
> > no sense for me as a default behavior. Obviously I can change this =
by using
> > ARM_INSTRUCTION_SET =3D thumb. But this seems strange and confusing. =
So let's do
> > it the other way around: have thumb instructions as default when =
TUNE_FATURES
> > contains "thumb" and switch to "arm" instructions when =
ARM_INSTRUCTION_SET is
> > "arm".
>=20
> Since ARM_INSTRUCTION_SET is unset for most things this will change =
the default, are you sure that this is what you want?
>=20
> I am aware of that but still, do you find it normal to add thumb as =
TUNE_FEATURE and get your self with arm instructions flag?

No, but I absolutely hate the ARM tune stuff in OE-core, you pretty much =
need anonymous python methods to change things on a distro level, which =
is crazy. It took me 2 weeks and a lot of help from Khem to switch =
angstrom to thumb2 mode on armv7a.

> And generally people adapt if changes make sense :)

What we actually need here is a way to say "this cpu can't to full ARM =
mode". Which is hard, since we are treating thumb as a superset instead =
of a subset.=20

regards,

Koen=

