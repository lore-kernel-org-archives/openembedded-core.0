Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SXBDw-0001Vd-5r
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:03:32 +0200
Received: by eaal1 with SMTP id l1so2393280eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KiaMidOqFO4APtzgK4xzQ/QzuMLXVzB8bKNCWTOu+hM=;
	b=dYgeCxsCjQKgRBlW7gOPxUOjDgaDFuv/pKFmZe01fJ1W8Y2SFbX/S9A/y8zQxr52Ra
	dd16SLctEtxw7CjThoCfBXfRVw5yfX52zvNwfQsz6L8B5gP7ugHSMSLDm+mpPxh5chDu
	cZA81epdhdFjqK3cwvDrzzZRuoZ0BcZ9ImR4JHde3F3Csyvqm8C2NKZnSd1Hu+Ag1MNF
	+vy+ZRKBys2gu21YB8m26R0mJMOAEkIbHMdpFkonVUOKEuqcVLDRYmVF3bABBJrvF2pI
	uZdHZbyXjYEPGI4vxJUK5JifhP2f/i68ZoXUAdhKbFzbVXdKfLQRt9Mg+A6eu5/GwdKD
	xYtA==
Received: by 10.14.95.134 with SMTP id p6mr5756653eef.18.1337777602038;
	Wed, 23 May 2012 05:53:22 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n52sm122721305eeh.9.2012.05.23.05.53.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 05:53:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 23 May 2012 14:53:08 +0200
Message-Id: <1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlP5HHEPulyH4Z9jfsq2EZtENbJ8j/T6YSV9eu4AwV2CZhs3uc/XGyTRn0Z1aZNVhzHyee/
Subject: Re: [PATCH v2] valgrind: Enable valgrind for armv7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 13:03:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mei 2012, om 14:46 heeft Samuel Stirtzel het volgende geschreven:

> Valgrind supports the armv7 architecture, this patch allows armv7 =
users to build and use Valgrind
>=20
> This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
> * The test consisted of running valgrinds memcheck (memory leakage =
detection),
> * and callgrind (profiling) on a Qt 4 application
>=20
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb =
b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index d7c7b24..0998f72 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -23,13 +23,16 @@ SRC_URI[md5sum] =3D =
"a855fda56edf05614f099dca316d1775"
> SRC_URI[sha256sum] =3D =
"5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
>=20
> COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>=20
> inherit autotools
>=20
> EXTRA_OECONF =3D "--enable-tls"
> +EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi"=


we should already be passing --host through autotools.bbclass. Does the =
configure have a special check? I've seen a few projects that insist on =
the -none- TARGET_VENDOR for no good reason :(

> EXTRA_OEMAKE =3D "-w"
> PARALLEL_MAKE =3D ""
>=20
> FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
> RRECOMMENDS_${PN}_powerpc +=3D "${TCLIBC}-dbg"
> RRECOMMENDS_${PN}_powerpc64 +=3D "${TCLIBC}-dbg"
> +RRECOMMENDS_${PN}_armv7a +=3D "libc6-dbg"


${TCLIBC}-dbg ?



