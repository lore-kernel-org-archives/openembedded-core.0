Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE6760167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 22:57:42 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c41so167797eek.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 15:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TeLjpt3hI8Qf4sYLb7EDNziv1lTJ6gI0942rp3pE5xQ=;
	b=fnfUE9Vs/uongKw8af2yvAFgZhx6AfNY2VaCYKWsOfupan9H7yqcuVQsopq1f1RSg4
	hnvG2LVQYR+jmiI4hLLMPYeS2/Gx1xySlUQQPR1nbcJgbZR7FFCmpw5pLrSNmhM+GRwY
	aryQi3a7Nt1dxAia5BXd8AiIXqz2qsL1j3aFQB+MhaJrEBKmgCOykY9RgKc+x3P3vLAs
	LI/YfujxscePpiQjWOtGvV879BRkbuI78o+uh7fOSRR7sYm+5tiZarQ1IU7WHlzBUnl1
	D1O4ECTw+07Bz4HQqpqvKR03EMc0a9p8eR8UErCH8I8iowBj4gmdmL+RNg8O9tdoAHRX
	ZP+Q==
X-Received: by 10.14.176.193 with SMTP id b41mr12875914eem.55.1399417063171;
	Tue, 06 May 2014 15:57:43 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id m44sm15470013eep.6.2014.05.06.15.57.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 15:57:41 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Tue, 6 May 2014 22:57:39 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140506225739.GA25360@gmail.com>
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
	<A4B8EEBF-A117-4A52-B23E-FB09372AC3DF@dominion.thruhere.net>
	<3786353.G8dUuZuNuH@peggleto-mobl5.ger.corp.intel.com>
	<3296908.lWzdU1Kadh@peggleto-mobl5.ger.corp.intel.com>
	<20140506103329.GD12987@gmail.com>
	<CAMKF1srXCeedrKMS78WvgXO9PAMJe1sWXAywPSsgp1Tya7q7pA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srXCeedrKMS78WvgXO9PAMJe1sWXAywPSsgp1Tya7q7pA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Tue, 06 May 2014 22:57:44 -0000
X-Groupsio-MsgNum: 52902
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 11:25:31AM -0700, Khem Raj wrote:
> On Tue, May 6, 2014 at 3:33 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> > On Tue, May 06, 2014 at 10:18:41AM +0100, Paul Eggleton wrote:
> >>
> >> Oops, sent too early - bug link:
> >>
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6268
> >>
> >> Cheers,
> >> Paul
> >>
> >
> > I just had a quick look at this as I've done a bit of work with libarch=
ive. It
> > looks like as long as the header isn't found at configure time there's =
no
> > problem at compile time. Could we work around this by modifying config.=
h in a
> > do_configure_append() function to undefine the relevant symbol
> > (HAVE_EXT2FS_EXT2_FS_H)?
>=20
> It can be disabled in many ways and easiest is to cache the autconf
> variable and set it to 'no'
> but we loose The EXT2 ioctls that are used on Linux to get/set file
> flags since our build systems
> are mostly linux I would think this is a good thing to enable in libarchi=
ve.

Yea that makes a lot more sense. I was in effect replying to the bug report
saying "There is no way to hard-disable this dependency.".

Sounds like it's worth using that header if possible though so ignore my
comment.

Cheers,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTaWjjAAoJEBwoJlo7UPQDPCMIAIzYq9QPsNLNdnUCsSVIfKRa
PIsOLBPcp9bPXHC4QB9wqPTGI6ER7Zm6D90InevB+D4/dQZFjTh18FDCL0/EHzTa
u81QKoPFNDJE9sLAD6k3GgUwaKExf3rIE/tfM0lcCvfmo+fKBjkSNCjDg4JQHj6L
0fEDIr5Ezp5Kot2BnE96n0Y59BT36QehoHr3liVc2/NRwPykqpC9MTYxuJefZZsf
O4rrO8C8iXhv294IhM8kwR20E7oYcxVPmdMAImZoVgFn++sZKjPNZXFXXKGr8QJx
Adm0wFFd6HYArYpjiM88FKoO8iteGkm9nFGSsHWfArhXSist7A3dYeaUJrDHVrU=
=sH4p
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
