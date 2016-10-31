Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EBFE26078D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:31:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so9135755pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=MemDl4/YqoOS8qWN3Xeqtzx7MH1fzjH23+uszISZ/SE=;
	b=Pj8aNgwLpWHfobTrfbJNBeVj1EjjtpVOrT4sgrYkHL8KYfwHj76McR1REosibPpXjV
	hly5GcpSFp43X65wVWkk+IbWM0EseI5iDtzZYNioT7K1x4f1xonOyekPhs+vvx47/ulY
	pEfcUZisSFQwE7s1QAjdY20GSVaYqgu7sAp5qERWz/JIekEpM7Rk+1aqxQ4yZtkkhrFj
	HZzCLZ5JKN7epyMPZhaPs/s4CIS5jkRm+PI2Vaj++GnviBR9OymoiTP4v8yE59OYWPVp
	Bur2mJHru4fVX4WpkkEV2yLMl6QAdm860G7db0PJlCjrPXqyFY2G2ot5p+s+QNJqAgiC
	E9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MemDl4/YqoOS8qWN3Xeqtzx7MH1fzjH23+uszISZ/SE=;
	b=nCtGeq2YgDw3BeklkONJm1fa3r2g33WHzT2CIg+mUpFT8JYOxT+NvvlsUuTitQ9ukx
	J6Wc+bzChb5H82C/dc8TKfa/+CkKSGBLr/3RGNAmypMUBYnlDDON5t3bvi8/zIdYKHaw
	8fKnMEh7D8gfSgpg04Ta0eZSvrbiG6bQgv5ECQA/VUBYwoqv1MpZ6bKxUwAm50QuM2Zs
	8YH28Q2n2G1ywOeWkayRUABxobqhz/u5ovMfB7S3hEISr51lQFT+lGH0kdYsLzFAiknr
	2Ju4j4q4dDksJqClIKUzcCCkUmrIpgI0iqqzd1h+ecQny4qsRXy8D6HyTSiVrZAPUxoR
	THsA==
X-Gm-Message-State: ABUngvfzZxg197QqK75f4T2Q9kmE2El0YczoYPBEHG6bvKw6evixszlvisJxQSNAirxpjQ==
X-Received: by 10.99.184.25 with SMTP id p25mr42256113pge.120.1477931513096;
	Mon, 31 Oct 2016 09:31:53 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:793b:10a4:267d:c6fc?
	([2601:646:8882:b8c:793b:10a4:267d:c6fc])
	by smtp.gmail.com with ESMTPSA id
	v66sm32875198pfa.33.2016.10.31.09.31.52
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 09:31:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1610310223510.6909@localhost.localdomain>
Date: Mon, 31 Oct 2016 09:31:50 -0700
Message-Id: <5B7BC861-2451-44F4-A166-429D238D6DC1@gmail.com>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
	<alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
	<CAJTo0LZcHSgs+Qw1Zkrj4bUWnU-p6Ja-vg3+J8H22vxoscTrRg@mail.gmail.com>
	<F99EA06D-E6DA-4FD4-BBED-D10D157F200C@gmail.com>
	<alpine.LFD.2.20.1610310223510.6909@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: Christopher Larson <clarson@kergoth.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Mon, 31 Oct 2016 16:31:52 -0000
X-Groupsio-MsgNum: 88810
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D371269F-5EE0-454E-8477-2EF9125EFFFC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D371269F-5EE0-454E-8477-2EF9125EFFFC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 30, 2016, at 11:29 PM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
> On Sun, 30 Oct 2016, Khem Raj wrote:
>=20
>>      On Oct 30, 2016, at 4:36 PM, Burton, Ross =
<ross.burton@intel.com> wrote:
>>=20
>> On 30 October 2016 at 17:35, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>>        fair enough ... i'm embarrassed to admit i didn't really =
understand
>>      the versioning selection so i'm going to examine it way more =
carefully
>>      now. i wonder how many recipes in oe-core are "_git" recipes =
that, in
>>      the end, just lock down to a specific version. as you say, i was =
a bit
>>      surprised.
>>=20
>> Personally I've been endorsing the practise where _git.bb is only
>> used for recipes that are actually tracking git development
>> branches, and if it's just a release that it simply fetched over git
>> via a SHA of a release tag then the recipe should be _1.2.3.bb for
>> clarity.
>>=20
>> with a system integrators hat on I agree. With developer hat on I do =
not.
>=20
> khem:
>=20
>  could you expand on that? now that i understand how the versioning
> works, i'll be more careful in the future, but it's still misleading
> for a "_git"-named recipe file to be locked to a particular version.
>=20
>  AFAICT, there are plenty of OE recipes that download via git, but
> are still named as being version locked. eg, here's
> meta/recipes-devtools/file/file_5.28.bb:
>=20
>  SRC_URI =3D "git://github.com/file/file.git \
>        file://debian-742262.patch \
>        file://0001-Add-P-prompt-into-Usage-info.patch \
>        "
>=20
>  SRCREV =3D "3c521817322a6bf5160cfeb09b9145ccde587b2a"
>=20
> i'm assuming that that particular SRCREV corresponds to release
> version 5,28, so that makes perfect sense.

for traversing the git history file renaming doesnt work well
so when you want to use git log you get a distorted view unless you
use =E2=80=94follow option.

If we want to have a systematic way of flagging a package being locked ( =
foo_x.y.z.bb)
versus one using AUTOREV ( foo_git.bb), it will be fine and become
more useful.

>=20
> rday
>=20
> --
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


--Apple-Mail=_D371269F-5EE0-454E-8477-2EF9125EFFFC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgXcfYACgkQuwUzVZGdMxS3tACbB+RdO4QrV6kFvVtTUIfHuicL
F+YAmgLiLzX08CNUxv4ZordWT9LUb1Ql
=a9dF
-----END PGP SIGNATURE-----

--Apple-Mail=_D371269F-5EE0-454E-8477-2EF9125EFFFC--
