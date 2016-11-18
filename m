Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E813719BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 13:03:39 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u144so6041157wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 05:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
	:to; bh=8vjLt6Sn/7ZepE3DIgkolPHS5MZiSM892phe1u9UGiY=;
	b=Wi/Be/rv9oOODWCJtc6p88JqW0wHUJ7Fu4sDWUy2yIvaTLZA+C/9H69Fnn33KDfxpE
	s7+9ZKTD+j9EMF04wKsxeOUxng0StFC6INbho5crCltrh2j1gtxHK9uXA04HWL1LlNj9
	VYjTmkfAfiED1uNreRSGRjiltgXof25UAgjvcVGQTPqYfJtNBRBVIOxj784Oo0liqaMS
	yQyI7E3I7H9MVxwtaz/Tsq8PqIviTssgI9+7Mb0PrEUndrNLfix9zYf8H10mau9OUFe0
	nbEEFZ6yX6IbPPdfLuPobDmFX3qwnEuP0HsYkZ6cbw/e+LAdLMtvRwcd3E9ooIMWpYsl
	+m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8vjLt6Sn/7ZepE3DIgkolPHS5MZiSM892phe1u9UGiY=;
	b=EP7p868ALc4xLwxHWnUAptblwrZOz4ZN0DN/2oDMyd4zdIuQLj2AUcRPoLdhpdzq73
	DSBIfwA9y2RQSF24apEGhorG09XJSdf/tEHIs5DoFkZE5s+ilCkubNbRvwOUhQyIUfQE
	ZY/ixoszuuEFQK1tVOOvnYSivML6w+m92BRBXMKIa3ikHo6ehz+RJXiXBgL3joS/t2hJ
	F+L2FhWqT4hSzjSXdjTEd2RAOT7mUjs3Os+fqZXhuuJmZyXVi6Lhwa9gDa34OoBj1+bT
	/yHKNCz240mi/ZtJMc+gFJkx8nqEybHPU5QdkPzfbEpSBl4nUsuEKtF+ubz/kYLYSv53
	yQ9Q==
X-Gm-Message-State: AKaTC00LaINOq16X5VXPTibrMAjBoTB3W/nhzENwSEBzvlG8veY6lwAif8bgma4zM7Q08Q==
X-Received: by 10.194.115.70 with SMTP id jm6mr5768329wjb.140.1479474221112;
	Fri, 18 Nov 2016 05:03:41 -0800 (PST)
Received: from [192.168.10.204] ([62.157.143.22])
	by smtp.gmail.com with ESMTPSA id d8sm3257992wmi.21.2016.11.18.05.03.40
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Nov 2016 05:03:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1479472068.27546.12.camel@andred.net>
Date: Fri, 18 Nov 2016 14:03:39 +0100
Message-Id: <01757D4C-B847-4311-A9AA-21B19450DE0F@gmail.com>
References: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
	<1479472068.27546.12.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: small number of perl modules that can't be cross-compiled
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
X-List-Received-Date: Fri, 18 Nov 2016 13:03:40 -0000
X-Groupsio-MsgNum: 89570
Content-Type: multipart/signed;
	boundary="Apple-Mail=_74A2D9C5-A3FF-4DF9-A332-F47396CBDF4E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_74A2D9C5-A3FF-4DF9-A332-F47396CBDF4E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> Am 18.11.2016 um 13:27 schrieb Andr=C3=A9 Draszik <git@andred.net>:
>=20
> On Fri, 2016-11-18 at 06:41 -0500, Robert P. J. Day wrote:
>>   after OE recipfying over 100 perl modules from CPAN, i'm down to
>> less than a dozen that are going to take more work, and a small =
number
>> of those seem to be simply badly written in that they don't support
>> cross-compilation for my target choice of "qemuppc". example
>> boilerplate recipe i put together produces this:
>>=20
>> $ make libauthen-pam-perl
>> ... snip ...
>> Checking if your kit is complete...
>> Looks good
>> checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float =
-mcpu=3D7400
>> --
>> =
sysroot=3D/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qem=
up
>> pc
>> checking for C compiler default output file name... a.out
>> checking whether the C compiler works... configure: error: cannot run
>> C compiled programs.
>> If you meant to cross compile, use `--host'.
>> See `config.log' for more details.
>=20
> It'd be useful to see config.log, ...
>=20
>> Error in configuring the Authen::PAM module.
>> ... snip ...
>>=20
>>   so i'm assuming the source itself for Authen::PAM:
>>=20
>> https://metacpan.org/pod/Authen::PAM
>>=20
>> is somehow flawed in that it doesn't properly recognize
>> cross-compilation, would that be it?
>=20
> ... there is at least one issue in Authen-PAM-0.16/configure.ac, I =
would
> say, in that it tries to detect RTLD_GLOBAL support based on the =
host's
> perl. So it's likely there are more flaws.

Looks as if Makefile.PL doesn't pass all reasonable flags to ./configure =
call.
Maybe you should send the Author to http://act.yapc.eu/lpw2016/talk/6966 =
or
at least send him =
http://www.netbsd.org/~sno/talks/nrpm/Cross-Compiling-For-Perl-Hackers.pdf=
 :)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_74A2D9C5-A3FF-4DF9-A332-F47396CBDF4E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJYLvwrAAoJEESZlq7c5Qqd7RgP/3ssU4vQwF/CWkTncT9IIsE7
oIbGUs21hnYZsPbPz5TekYP78bXk+OeX2NVHqVX/cvbZLwtRmjkoXqwFo2TwJKfs
zVCOluX5lrfzhRGD4zWqtzu8KnWq4BCmezgUQyAriCIl3wxl35f3iwEUY3yXbawm
SucVI9+HeEzZ9M8Hm8e2XyJzBWeFunbEWdyjKoLsxtuMd5TajWmESKm820fVCxu3
6t7qfNU/ln4nzB+9gX6THfXAQthV8wkE4tJc/r7ha2K06FxYiyYHzvKrEOY6Tryu
0yAV16JlMAA5UYJFkav7jf5KSOrI8iAb3D6DuCPGq+xNFL3Cio/+9YooAmYJaGzR
Dxd7+cmG5X4u3riuJVJbaHxA9P26t3L1m8YDcedSb+8t/aTdjSNCbuSYdHQXwBsH
/MCLK/DsVeRgazxqz6Bg+ZbhKXYLpP97C+mnW1xVbMeZK2CnRAjHPWu+RWbIUv/6
nrMUXzGiCzEFbh+ZUbFRyzuzzTPQym8HJJq2xJy80d9pU/V0QQ2OGCBChCJwwqDf
/UX5tyQEjsT/gORP7YVNWBfQh6f0/aScx3HTOKYtSUtsqznUNZBwRxQhD4FtrpA/
KDkFgUCCCOXazndsTtwSN8+YAoeNLyDbwulLj2CsR40gmHJDNDN98Y+dPFKLpIxB
oqf5GZt2LChdUIfbZy1B
=Mle9
-----END PGP SIGNATURE-----

--Apple-Mail=_74A2D9C5-A3FF-4DF9-A332-F47396CBDF4E--
