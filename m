Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.14380.1585929472050041983
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 08:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TY/YdMOc;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: rehsack@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id i19so8301321wmb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=d7qMY7wDooN8C+UC5bBL5hsYisl76vJ0oA3Z/cSE/YM=;
        b=TY/YdMOcXwmxB9S4veKWerItC2rF3ZuLlSAb17fOMoHCqFQaRksePMmI2dV+gfLlGM
         MxPMm2rZeiOy21JNe9MGhpgaTev15/h64C3f0M0n4mBaXQKrnoThjA4XLywy04ibj/o1
         cLGzwb3JuEetpN3HzhS5LooyXlIVbA2VhyUN/rC5WyT41/py/ocAoEOppZW++uVSHZJR
         /AcJTtqDSrAFX7u5gjClmwyz885XShQ27gaOsox7NIpGUtTaL+/K0j9UgFb/V4wHxrFp
         2cFagIVh46/P4FS82Odf8kH8KJSxA8yxc/L+UIzzXJIGj6MnkRJD3OLL2DWAw7GtMq2I
         G5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=d7qMY7wDooN8C+UC5bBL5hsYisl76vJ0oA3Z/cSE/YM=;
        b=Kxe4tPldDcAAY4B5qSwTtIWjGDFQWEeVGGzj/hcJMrTUSP+ySEQSY7NTyhDuabYiTt
         t/dbdtMfZrUak66r8W2+JcQHw1jcRZc5M1Iyx1gsVk237mDNjXGJ8L+/nuEGouUKoEpU
         /QEKFl0Q8o9HzwU7ngEzS0ovL7qRv58e8Cp6qm1dHB+VXD5sb7MR1xdU0qKIuj97Ovwn
         p+3HfOhe9XSz/SD6kuU4tvQoGLli8ukLgZRVbwgYXpSZDRzRXD2RQjOwlbglVrzq3q4f
         iVRQX9FxJsoitqx4SfceMVMwZt39R+Wt97TypDeo7AjZbzP5E7p8ZXDTek4pFPQdh/ng
         HJ9Q==
X-Gm-Message-State: AGi0PuYWXdBEMQeD4fFvw8Y0oHcqKtIxmfmwmXEiVZ+PTzqV2SWVLRyl
	KZprtXU07nu/ZVDKZFRwvAA=
X-Google-Smtp-Source: APiQypIzvOHIeIe0NX2h7ws6YKDxdTOuUPGiQJKyWiLeIeMOiPG3jkUY/4d4pJ8NgVkvZehEfPqOpA==
X-Received: by 2002:a05:600c:2297:: with SMTP id 23mr8848326wmf.166.1585929470281;
        Fri, 03 Apr 2020 08:57:50 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5B25B65E.dip0.t-ipconnect.de. [91.37.182.94])
        by smtp.gmail.com with ESMTPSA id q8sm13682585wrc.8.2020.04.03.08.57.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2020 08:57:49 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <6603E84C-D054-4927-968B-1AFBFFCF129D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Fri, 3 Apr 2020 17:57:47 +0200
In-Reply-To: <CAJ86T=UzXroEiVQhD8TZOH6ia0bnGY+drtSZawtocvWOH7JsWQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200330165105.7151-1-sno@netbsd.org>
 <CAJ86T=UzXroEiVQhD8TZOH6ia0bnGY+drtSZawtocvWOH7JsWQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 136979
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8D2C7ABA-49BF-4F1D-A18C-DD90F3E469A2";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_8D2C7ABA-49BF-4F1D-A18C-DD90F3E469A2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 30.03.2020 um 19:19 schrieb Andre McCurdy <armccurdy@gmail.com>:
>=20
> On Mon, Mar 30, 2020 at 9:51 AM Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>>    Author: Yue Tao <Yue.Tao@windriver.com>
>>    Date:   Fri May 25 10:48:08 2018 +0800
>>=20
>>        initscripts: Avoid starting rpcbind daemon twice
>>=20
>>        Check the status before start it to avoid duplicates.
>>=20
>> the use of a script {/usr/sbin/}service is introduced - maybe earlier
>> provided by systemd, nowadays mostly by init-system-helpers from
>> debian project.
>>=20
>> For the very first shot, maybe discussions and improvements based
>> on that script collection, use just the init-system-helpers-service
>> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
>> boot stage.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> .../initscripts/init-system-helpers_1.57.bb   | 52 +++++++++++++++++++
>> .../initscripts/initscripts_1.0.bb            |  1 +
>> 2 files changed, 53 insertions(+)
>> create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.=
57.bb
>>=20
>> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb =
b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
>> new file mode 100644
>> index 0000000000..2b09983483
>> --- /dev/null
>> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
>> @@ -0,0 +1,52 @@
>> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>=20
> Is this really necessary?

Nope. It's a default preambel, vim adds :)

>> +SUMMARY =3D "helper tools for all init systems"
>> +DESCRIPTION =3D "This package contains helper tools that are necessary=
 for switching between \
>> +the various init systems that Debian contains (e. g. sysvinit or \
>> +systemd). An example is deb-systemd-helper, a script that enables syst=
emd unit \
>> +files without depending on a running systemd. \
>> +\
>> +It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\"=
 scripts which \
>> +provide an abstraction for enabling, disabling, starting, and stopping=
 \
>> +services for all supported Debian init systems as specified by the pol=
icy. \
>> +\
>> +While this package is maintained by pkg-systemd-maintainers, it is NOT=
 \
>> +specific to systemd at all. Maintainers of other init systems are welc=
ome to \
>> +include their helpers in this package."
>> +HOMEPAGE =3D "https://salsa.debian.org/debian/init-system-helpers"
>> +SECTION =3D "base"
>> +LICENSE =3D "BSD-3-clause & GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dee2b1830fcfead84d0=
7bc060ec43e072"
>> +
>> +PACKAGES +=3D "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
>=20
> According to the OE style guide, PACKAGES should go near the end of
> the recipe (after do_install, before FILES_${PN}).

*shrug*
I see that neither initscripts nor busybox following this guide - so I don=
't know.

>> +DEPENDS =3D "perl"
>=20
> Since this recipe doesn't do anything in do_configure or do_compile
> it's odd that it needs a build time dependency on perl?

As debian/control says so.

And maybe little time later someone wants to do something with
update-rc.d or one of the systemd helpers as debian does.
Or one likes to add man-pages (pod2man)?

It's not that wrong.

>> +SRCREV =3D "760c625ec0e1ffebec2e391d891d389da0f65726"
>> +SRC_URI =3D "git://salsa.debian.org/debian/init-system-helpers.git"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_configure() {
>> +       :
>> +}
>> +
>> +do_compile() {
>> +       :
>> +}
>> +
>> +do_install() {
>> +       install -d -m 0755 ${D}${sbindir}
>> +       install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
>> +       install -m 0755 ${S}/script/service ${D}${sbindir}
>> +       install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
>> +}
>> +
>> +FILES_${PN} =3D ""
>=20
> If you want the default package to be empty then you probably need to ad=
d:
>=20
>  ALLOW_EMPTY_${PN} =3D "1"

Yeah - wanted to add that but fall through ...

>> +FILES_${PN}-invoke-rc.d =3D "${sbindir}/invoke-rc.d"
>> +FILES_${PN}-service =3D "${sbindir}/service"
>> +FILES_${PN}-update-rc.d =3D "${sbindir}/update-rc.d"
>> +
>> +RDEPENDS_${PN}-update-rc.d =3D "perl"
>> +RRECOMMENDS_${PN} +=3D "${PN}-invoke-rc.d ${PN}-service ${PN}-update-r=
c.d"
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/re=
cipes-core/initscripts/initscripts_1.0.bb
>> index 1a59b82fbf..4080c4a495 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>> @@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append =3D " ${@bb.utils.contains(=
'DISTRO_FEATURES','systemd','
>> PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
>> RDEPENDS_${PN} =3D "initd-functions \
>>                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${P=
N}-sushell','',d)} \
>> +                  init-system-helpers-service \
>>                 "
>> # Recommend pn-functions so that it will be a preferred default provide=
r for initd-functions
>> RRECOMMENDS_${PN} =3D "${PN}-functions"
>> --
>> 2.17.1
>>=20
>>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_8D2C7ABA-49BF-4F1D-A18C-DD90F3E469A2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl6HXPsACgkQRJmWrtzl
Cp3pWQ//fiqHBWygSSATtRRa1/3x5dBEHuhLAJUxlICC/5TGkZhw5eKng5BPg9rj
krLWYmFkPAqempYNcvioAVMfS5VacLnB/G7o/oI85t/EB61f+jMSW6gdSxaCoA7J
b55bF9aMGZOsI5Unhl9rf0bZVmW22+UvNGiGOUuiL++ITVF3bGCIneIN8sqh6PHK
oCHOHhxgR0Zz+UcalZRvcHHDzD2ZVjJOERxaJCLSoaN0LlhiFAqYfl8oavqo7+2Q
98n5jzJ+f3jAknKtyGrwuYOPiTyys6uFUeNn32LrG0w6rvu9liHPUsYCK7vMgW+h
2f/jZCiPHvBGqrGdS742OYbpse54zO7ZhwU06ETTBFxIYqIsLp2nI3IZyusyTCmu
fpFDQI58IJw+YlcdKeGLRtOxIaU/1+v5ZDHnBrtrSRFiw3amp0ChjJrsT8+ta81F
JJX65ARkBr33Teo3ScSXJnggsX12eST+DNhQV7KpjCgfcSmpFbVJHVFvrqgr+oA4
yyPPq0odOJy8+m/FV8D57D0W6jGMz9rcX3Dq/DkHAwjzwu/Ti3u/rhRS3Zre585E
XDM7nBax+psqWq+8cPbfWJOJyi1e31QwnlRnK3jPPfQ48FceLBVbPIeqFtbC2R0Y
1XIZR4amMzYFwsTYnBbsRAtEXE3moqWvIvzL5BQrkHRc+3x3BKs=
=iVwT
-----END PGP SIGNATURE-----

--Apple-Mail=_8D2C7ABA-49BF-4F1D-A18C-DD90F3E469A2--
