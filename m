Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TGFc5-0000Kc-3A
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:50:45 +0200
Received: from mail26-am1-R.bigfish.com (10.3.201.225) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.23; Mon, 24 Sep 2012 20:37:56 +0000
Received: from mail26-am1 (localhost [127.0.0.1])	by mail26-am1-R.bigfish.com
	(Postfix) with ESMTP id C8EB02C01C8	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 20:37:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdh137ah13b6hbe9i1155h)
Received: from mail26-am1 (localhost.localdomain [127.0.0.1]) by mail26-am1
	(MessageSwitch) id 1348519074611470_24716;
	Mon, 24 Sep 2012 20:37:54 +0000 (UTC)
Received: from AM1EHSMHS008.bigfish.com (unknown [10.3.201.249])	by
	mail26-am1.bigfish.com (Postfix) with ESMTP id 887CE1C013B	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 20:37:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS008.bigfish.com
	(10.3.207.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 24 Sep 2012 20:37:49 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Mon, 24 Sep 2012 15:36:04 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/9] rpm: Use link time check for libssp
Thread-Index: AQHNmpQ3+VNspL2mSUu0Za4XTqV5Fg==
Date: Mon, 24 Sep 2012 20:36:03 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6A3103@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1339740433.git.raj.khem@gmail.com>
	<1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH 4/9] rpm: Use link time check for libssp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 20:50:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5CD17E53303FEB418F734808C60FE9DE@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 1:12 AM, Khem Raj <raj.khem@gmail.com> wrote:
> -fstack-protector needs libssp to link with
> so when checking for this option support we
> need to find if libssp is staged in root file
> system

Won't this still break on systems without libssp where sstate-cache
was built on systems with libssp?

-M

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../rpm/rpm/fstack-protector-configure-check.patch |   13 +++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    1 +
>  2 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-config=
ure-check.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-che=
ck.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.p=
atch
> new file mode 100644
> index 0000000..84d0430
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patc=
h
> @@ -0,0 +1,13 @@
> +Index: rpm-5.4.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/configure.ac        2012-06-01 11:41:19.741480143 -07=
00
> ++++ rpm-5.4.0/configure.ac     2012-06-01 11:41:51.773481676 -0700
> +@@ -193,7 +193,7 @@
> +  my_save_cflags=3D"$CFLAGS"
> +  CFLAGS=3D$c
> +  AC_MSG_CHECKING([whether GCC supports $c])
> +- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
> ++ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
> +     [AC_MSG_RESULT([yes])]
> +     [my_cflags=3D$c],
> +     [AC_MSG_RESULT([no])]
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtoo=
ls/rpm/rpm_5.4.9.bb
> index 404916a..ccf015a 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -74,6 +74,7 @@ SRC_URI =3D "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-=
5.4.9-0.20120508.src.rpm;ex
>            file://rpm-pkgconfigdeps.patch \
>            file://uclibc-support.patch \
>            file://rpmatch.patch \
> +          file://fstack-protector-configure-check.patch \
>           "
>
>  SRC_URI[md5sum] =3D "60d56ace884340c1b3fcac6a1d58e768"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



