Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.966.1585934632214538226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D9Tb76FU;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: rehsack@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id z14so2616244wmf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=c7rt70I+vZCVzqKLr9b9S+xfxSoPlqd9Q8vRBQmNi4Y=;
        b=D9Tb76FUeFu2kHO31TFjBJYZ3om1zlCvyGqvA8+9SQKsEPybwtyx2Ym0+4yKeEP5kd
         4/q15hfg2soCKpZbjX4F3ngh0pNy5pvuusBGqTzstuYMSX/3p+VLHJvVYliDb0rfUu65
         8J7REU/zIbsZhD+tdiDOUB6iUd0oe6r3CFCYiGP5yJZ8ZRzpj3icjR3xDqHaJmVESNyv
         xThxDSeF9alK71uKB906tn7R4pRCFUiAyV9YVK90Cw1Q3ceukOy11fj8rjrv5FxpcnMk
         ruL9ldGdnVehyJu41IUUg3V4JcEp8a8JE0WF0WMHXxUaSRzxTQBgpPzanJFSFRNXQc+y
         Tjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=c7rt70I+vZCVzqKLr9b9S+xfxSoPlqd9Q8vRBQmNi4Y=;
        b=jJFwCXn71biHWYQNQzW/PLmervfEhD9INFUf67ZvVKx1ybyMlopVabzzfFdxIvkNI/
         SDvtJ95UwM/WQmIceohdwFby4hGXDC3TeB/d5IBR05WJmr7L3rhkqvDYm9o7VQT+EriK
         x1wOshLSKqosh5udDuctVb0VPNuAlGGEGVTK3OI421tfEC6CqPZI5eiOkD1gxDjzCQCf
         zDc1v0YUm1U95/rOgNNPcO7ReknVIxU4h62SUOD3NFRVY34yR3nzgchoJhmEplKw7QsS
         sgmtWigRV8nEp5MBdNBEDBzQv2E7+CG7lukK3c5pZyeOcTtqr0kf/EQgF9qFnMaX0W9z
         E1tw==
X-Gm-Message-State: AGi0PuYp7GmhrU58La9kUnBaSFCMZSOom9rSVaR5wPnWSfa4B8VzCPUV
	G6v2CB8kka6u0fcCTdZPgDQ=
X-Google-Smtp-Source: APiQypLZl7ql18Mx0ShJu+7NYGzDGbnjgnSgmzPB9WGGLaD1eXay/dAxnKC6/JbJy9MPGgsN4AaD9Q==
X-Received: by 2002:a05:600c:552:: with SMTP id k18mr10271934wmc.180.1585934630763;
        Fri, 03 Apr 2020 10:23:50 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p5B25B65E.dip0.t-ipconnect.de. [91.37.182.94])
        by smtp.gmail.com with ESMTPSA id e8sm4889025wrw.40.2020.04.03.10.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2020 10:23:49 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <9AC1F461-839C-476A-A91B-0FE0AE18A570@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core][PATCH] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Fri, 3 Apr 2020 19:23:48 +0200
In-Reply-To: <CAJ86T=VW2WxbxpKNvF4fSV6iPg6_NHPtSu6kKAY37XRZ_m_c8Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200330165105.7151-1-sno@netbsd.org>
 <CAJ86T=UzXroEiVQhD8TZOH6ia0bnGY+drtSZawtocvWOH7JsWQ@mail.gmail.com>
 <6603E84C-D054-4927-968B-1AFBFFCF129D@gmail.com>
 <CAJ86T=VW2WxbxpKNvF4fSV6iPg6_NHPtSu6kKAY37XRZ_m_c8Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 136986
Content-Type: multipart/signed;
	boundary="Apple-Mail=_430448AC-0163-4ED2-B97E-B2364B6067C5";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_430448AC-0163-4ED2-B97E-B2364B6067C5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 03.04.2020 um 19:11 schrieb Andre McCurdy <armccurdy@gmail.com>:
>=20
> On Fri, Apr 3, 2020 at 8:57 AM Jens Rehsack <rehsack@gmail.com> wrote:
>>> Am 30.03.2020 um 19:19 schrieb Andre McCurdy <armccurdy@gmail.com>:
>>> On Mon, Mar 30, 2020 at 9:51 AM Jens Rehsack <rehsack@gmail.com> wrote=
:
>>>>=20
>>>> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>>>>   Author: Yue Tao <Yue.Tao@windriver.com>
>>>>   Date:   Fri May 25 10:48:08 2018 +0800
>>>>=20
>>>>       initscripts: Avoid starting rpcbind daemon twice
>>>>=20
>>>>       Check the status before start it to avoid duplicates.
>>>>=20
>>>> the use of a script {/usr/sbin/}service is introduced - maybe earlier
>>>> provided by systemd, nowadays mostly by init-system-helpers from
>>>> debian project.
>>>>=20
>>>> For the very first shot, maybe discussions and improvements based
>>>> on that script collection, use just the init-system-helpers-service
>>>> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
>>>> boot stage.
>>>>=20
>>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>>> ---
>>>> .../initscripts/init-system-helpers_1.57.bb   | 52 ++++++++++++++++++=
+
>>>> .../initscripts/initscripts_1.0.bb            |  1 +
>>>> 2 files changed, 53 insertions(+)
>>>> create mode 100644 meta/recipes-core/initscripts/init-system-helpers_=
1.57.bb
>>>>=20
>>>> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.b=
b b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
>>>> new file mode 100644
>>>> index 0000000000..2b09983483
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
>>>> @@ -0,0 +1,52 @@
>>>> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
>>>> +# Released under the MIT license (see COPYING.MIT for the terms)
>>>=20
>>> Is this really necessary?
>>=20
>> Nope. It's a default preambel, vim adds :)
>>=20
>>>> +SUMMARY =3D "helper tools for all init systems"
>>>> +DESCRIPTION =3D "This package contains helper tools that are necessa=
ry for switching between \
>>>> +the various init systems that Debian contains (e. g. sysvinit or \
>>>> +systemd). An example is deb-systemd-helper, a script that enables sy=
stemd unit \
>>>> +files without depending on a running systemd. \
>>>> +\
>>>> +It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d=
\" scripts which \
>>>> +provide an abstraction for enabling, disabling, starting, and stoppi=
ng \
>>>> +services for all supported Debian init systems as specified by the p=
olicy. \
>>>> +\
>>>> +While this package is maintained by pkg-systemd-maintainers, it is N=
OT \
>>>> +specific to systemd at all. Maintainers of other init systems are we=
lcome to \
>>>> +include their helpers in this package."
>>>> +HOMEPAGE =3D "https://salsa.debian.org/debian/init-system-helpers"
>>>> +SECTION =3D "base"
>>>> +LICENSE =3D "BSD-3-clause & GPLv2"
>>>> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dee2b1830fcfead84=
d07bc060ec43e072"
>>>> +
>>>> +PACKAGES +=3D "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
>>>=20
>>> According to the OE style guide, PACKAGES should go near the end of
>>> the recipe (after do_install, before FILES_${PN}).
>>=20
>> *shrug*
>> I see that neither initscripts nor busybox following this guide - so I =
don't know.
>=20
> Yeah, most people don't care about variable ordering and maintainers
> don't do anything to enforce it so this comment was mainly FYI.

I checked http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEm=
bedded
but there is nothing prominent regarding style.

>>>> +DEPENDS =3D "perl"
>>>=20
>>> Since this recipe doesn't do anything in do_configure or do_compile
>>> it's odd that it needs a build time dependency on perl?
>>=20
>> As debian/control says so.
>>=20
>> And maybe little time later someone wants to do something with
>> update-rc.d or one of the systemd helpers as debian does.
>> Or one likes to add man-pages (pod2man)?
>>=20
>> It's not that wrong.
>=20
> Unnecessary build time dependencies can cause increased build times
> (either due to building dependencies which otherwise would not have
> been needed or limiting the scope the build scheduler has for
> parallelization). Maybe not in this case since there's a run time
> dependency on perl too, but in general adding unnecessary dependencies
> just looks bad - as if you don't really understand the concept. Adding
> a dependency now because it might be needed in the future isn't a good
> justification either.

You can bet that I care for seriously unnecessary dependencies :)

>>>> +SRCREV =3D "760c625ec0e1ffebec2e391d891d389da0f65726"
>>>> +SRC_URI =3D "git://salsa.debian.org/debian/init-system-helpers.git"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +do_configure() {
>>>> +       :
>>>> +}
>>>> +
>>>> +do_compile() {
>>>> +       :
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +       install -d -m 0755 ${D}${sbindir}
>>>> +       install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
>>>> +       install -m 0755 ${S}/script/service ${D}${sbindir}
>>>> +       install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
>>>> +}
>>>> +
>>>> +FILES_${PN} =3D ""
>>>=20
>>> If you want the default package to be empty then you probably need to =
add:
>>>=20
>>> ALLOW_EMPTY_${PN} =3D "1"
>>=20
>> Yeah - wanted to add that but fall through ...
>>=20
>>>> +FILES_${PN}-invoke-rc.d =3D "${sbindir}/invoke-rc.d"
>>>> +FILES_${PN}-service =3D "${sbindir}/service"
>>>> +FILES_${PN}-update-rc.d =3D "${sbindir}/update-rc.d"
>>>> +
>>>> +RDEPENDS_${PN}-update-rc.d =3D "perl"
>>>> +RRECOMMENDS_${PN} +=3D "${PN}-invoke-rc.d ${PN}-service ${PN}-update=
-rc.d"
>>>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/=
recipes-core/initscripts/initscripts_1.0.bb
>>>> index 1a59b82fbf..4080c4a495 100644
>>>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
>>>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
>>>> @@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append =3D " ${@bb.utils.contain=
s('DISTRO_FEATURES','systemd','
>>>> PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
>>>> RDEPENDS_${PN} =3D "initd-functions \
>>>>                  ${@bb.utils.contains('DISTRO_FEATURES','selinux','${=
PN}-sushell','',d)} \
>>>> +                  init-system-helpers-service \
>>>>                "
>>>> # Recommend pn-functions so that it will be a preferred default provi=
der for initd-functions
>>>> RRECOMMENDS_${PN} =3D "${PN}-functions"
>>>> --
>>>> 2.17.1
>>>>=20
>>>>=20
>>=20
>> --
>> Jens Rehsack - rehsack@gmail.com
>>=20
>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_430448AC-0163-4ED2-B97E-B2364B6067C5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl6HcSQACgkQRJmWrtzl
Cp13zw//fexmxXr1/gULgumu+M8fadW3Dz0itHMV+VQfa4i4EVjwWyw8zFJ8T9g3
zrdteQxdXK3ui+9x8rbEvSBh4XWDZdTAsFWypnisbq9Pru91D63IipVORMbCph5x
eZUv5+j7kKsOYOIRS7n6FqienhN6soSqS4zYVjxQbCzwaA/brQFu2/CnccwMnQqn
wHavVwtD1j6J0b0OIkqXTG8eYgHSIKJFsZ4NM1mqt2Mv0DCBLhyiJGnT8zvQTnSi
TX5ghgp0ZRFk4Vuk5q1LVB1M0aKAVq2H+IaJoz3+4IS7C1hSEYYjSJEf5FNRdq+4
+IqioitWdVoJVS9F/RTRBzPhkI/rhC2/v9NCA7pVSJDbhOdhp3HImT48RpcFU2iF
1Gxn3X72Sf6OYCf0yWs/Co0LjR1tcGcqwwxd1X5YHbOG9TK5xtvSznDhHf2Ehspt
pcr+GlGsDuX9J2eAxz2rN0JSrcBpb13r9lDI5vo1keQ0ajiTXpyu9uXtSSIIpp1y
Qjih9oX5ud9XHmUy37DWBabVc0tvnYwC1c4on9CqjJXrkQBej0TOlQiC6k9esPH7
GCkwbxxgRFapVi9+klAq92LE0ZPRAh6iPj+SRlB0mjU124Pd6xaORoXaRneKoAsO
XXxfyoi5g0G8rookPWFR/+sHWs6Evorgzuy6gshK4oZ/MO/ROV4=
=JRIE
-----END PGP SIGNATURE-----

--Apple-Mail=_430448AC-0163-4ED2-B97E-B2364B6067C5--
