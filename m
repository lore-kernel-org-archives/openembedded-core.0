Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00BC579F3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 06:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 42C171853B;
	Thu, 14 Feb 2019 07:05:40 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id eNjBKZ-W9fZX; Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 50CBF18531;
	Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 360591E07C;
	Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A5F41E07B;
	Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 1E83C171F;
	Thu, 14 Feb 2019 07:05:39 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Thu, 14 Feb 2019 07:05:38 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Thu, 14 Feb 2019 07:05:38 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install utility
	to create directories with right permissions
Thread-Index: AdTEK0xGMZDJ1DQcTvO8sjAtRXL8qQ==
Date: Thu, 14 Feb 2019 06:05:38 +0000
Message-ID: <532d6b9d7e8349699b24514c80ef8be9@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/3] libc-package.bbclass: Use install utility to create directories with right permissions
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
X-List-Received-Date: Thu, 14 Feb 2019 06:05:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 12 februari 2019 06:48
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/3] libc-package.bbclass: Use install
> utility to create directories with right permissions
>=20
> Could fix issues where dirs with wrong permission is created with mkdir -=
p
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/libc-package.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-
> package.bbclass
> index 0b4c666a74..34025635ce 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -61,7 +61,7 @@ LOCALETREESRC ?=3D "${PKGD}"
>  do_prep_locale_tree() {
>  	treedir=3D${WORKDIR}/locale-tree
>  	rm -rf $treedir
> -	mkdir -p $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${dat=
adir} $treedir/${localedir}
> +	install -d $treedir/${base_bindir} $treedir/${base_libdir} $treedir/${d=
atadir} $treedir/${localedir}

This does not change anything (install -d and mkdir -p does the same thing)=
.=20

>  	tar -cf - -C ${LOCALETREESRC}${datadir} -p i18n | tar -xf - -C $treedir=
/${datadir}
>  	# unzip to avoid parsing errors
>  	for i in $treedir/${datadir}/i18n/charmaps/*gz; do
>		gunzip $i
>	done
>	tar -cf - -C ${LOCALETREESRC}${base_libdir} -p . | tar -xf - -C $treedir/=
${base_libdir}

This is where the problem happens. When the files are copied from=20
${LOCALETREESRC}, the ownership of $treedir${localedir} is changed to that=
=20
of ${LOCALETREESRC}${localedir}. However, I now realized that the problem=20
may be due to the fact that I have usrmerge enabled in DISTRO_FEATURES,=20
which causes the above line to copy things it was never meant to copy, in=20
this case ${LOCALETREESRC}${localedir}. I tried to just remove the line=20
altogether and then it built just fine. But I do not know what the=20
consequences are of removing it... I guess it is related to setting up an=20
environment for qemu to run in, but since that seems to work fine without=20
the files copied by the above line, maybe it is not needed? Or maybe it=20
is just not needed when having usrmerge in DISTRO_FEATURES? I tried to=20
backtrack it through the commit logs, but it was introduced with the=20
do_prep_locale_tree() function, so no help there.

> --
> 2.20.1

//Peter


