Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 547FF65CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 09:43:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aGkcV-0002wT-U5 from Awais_Belal@mentor.com ;
	Wed, 06 Jan 2016 01:43:08 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Wed, 6 Jan 2016 09:43:07 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
Thread-Index: AQHRPXQQ2iBTKTrMm0uMwa00fKoPVp7lJjJVgAWJ1ACAAF0f3IADRTSx
Date: Wed, 6 Jan 2016 09:43:06 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB7A43D@EU-MBX-02.mgc.mentorg.com>
References: <1450869629-27805-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB77C51@EU-MBX-02.mgc.mentorg.com>, 
	<5689D53A.3040902@gmail.com>,
	<2021B186DC632746BD5A3CE32F12BD28011FB78A03@EU-MBX-02.mgc.mentorg.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB78A03@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Wed, 06 Jan 2016 09:43:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, January 04, 2016 12:53 PM=0A=
To: akuster808=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370=0A=
=0A=
Hi Armin,=0A=
=0A=
Odd, applies cleanly on dizzy for me. Can you please share the patch log?=
=0A=
=0A=
On a scratch build dir, I get the following:=0A=
--------------------------------------------------------------=0A=
awais@alpha:~/yocto/build-dizzy$ bitbake -c patch grub=0A=
Parsing recipes: 100% |####################################################=
#########| Time: 00:00:36=0A=
Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 targets, 6=
6 skipped, 0 masked, 0 errors.=0A=
NOTE: Resolving any missing task queue dependencies=0A=
=0A=
Build Configuration:=0A=
BB_VERSION        =3D "1.24.0"=0A=
BUILD_SYS         =3D "x86_64-linux"=0A=
NATIVELSBSTRING   =3D "Ubuntu-14.04"=0A=
TARGET_SYS        =3D "x86_64-poky-linux"=0A=
MACHINE           =3D "amdfalconx86"=0A=
DISTRO            =3D "poky"=0A=
DISTRO_VERSION    =3D "1.7.3"=0A=
TUNE_FEATURES     =3D "dbfp4"=0A=
TARGET_FPU        =3D ""=0A=
meta=0A=
meta-yocto=0A=
meta-yocto-bsp    =3D "(detachedfromorigin/dizzy):6d34267e0a13e10ab91b60590=
b27a2b5ba3b7da6"=0A=
common=0A=
meta-amdfalconx86 =3D "(detachedfromorigin/dizzy):84ae10ad68c7b253ab87558c5=
a6df057c9a84f08"=0A=
meta-oe=0A=
meta-python       =3D "(detachedfromorigin/dizzy):7f1df52e9409edcc4d4cd5f34=
694f8740f56e1bf"=0A=
=0A=
NOTE: Preparing runqueue=0A=
NOTE: Executing SetScene Tasks=0A=
NOTE: Executing RunQueue Tasks=0A=
NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to be rerun =
and all succeeded.=0A=
awais@alpha:~/yocto/build-dizzy$=0A=
--------------------------------------------------------------=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: akuster808 [akuster808@gmail.com]=0A=
Sent: Monday, January 04, 2016 7:13 AM=0A=
To: Belal, Awais=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370=0A=
=0A=
On 12/31/15 5:38 AM, Belal, Awais wrote:=0A=
Awais,=0A=
=0A=
> Ping!=0A=
This patch does not apply to the current dizzy branch.=0A=
=0A=
is there a dependency patch I missed to apply?=0A=
=0A=
regards,=0A=
Armin=0A=
>=0A=
> BR,=0A=
> Awais=0A=
>=0A=
> ________________________________________=0A=
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core=
-bounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
> Sent: Wednesday, December 23, 2015 4:20 PM=0A=
> To: openembedded-core@lists.openembedded.org=0A=
> Subject: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370=0A=
>=0A=
> http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432e1=
09771bb8febafca7a5f1f2=0A=
>=0A=
> Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> ---=0A=
>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++++=
++++++=0A=
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +=0A=
>  meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +=0A=
>  3 files changed, 54 insertions(+)=0A=
>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Gr=
ub2-user-pass-vulnerability.patch=0A=
>=0A=
> diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-use=
r-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-=
8370-Grub2-user-pass-vulnerability.patch=0A=
> new file mode 100644=0A=
> index 0000000..f9252e9=0A=
> --- /dev/null=0A=
> +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-=
vulnerability.patch=0A=
> @@ -0,0 +1,52 @@=0A=
> +Upstream-Status: Accepted=0A=
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
> +=0A=
> +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001=
=0A=
> +From: Hector Marco-Gisbert <hecmargi@upv.es>=0A=
> +Date: Wed, 16 Dec 2015 04:57:18 +0000=0A=
> +Subject: Fix security issue when reading username and password=0A=
> +=0A=
> +This patch fixes two integer underflows at:=0A=
> +  * grub-core/lib/crypto.c=0A=
> +  * grub-core/normal/auth.c=0A=
> +=0A=
> +CVE-2015-8370=0A=
> +=0A=
> +Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>=0A=
> +Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>=0A=
> +Also-By: Andrey Borzenkov <arvidjaar@gmail.com>=0A=
> +---=0A=
> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c=0A=
> +index 010e550..683a8aa 100644=0A=
> +--- a/grub-core/lib/crypto.c=0A=
> ++++ b/grub-core/lib/crypto.c=0A=
> +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)=0A=
> +=0A=
> +       if (key =3D=3D '\b')=0A=
> +       {=0A=
> +-        cur_len--;=0A=
> ++        if (cur_len)=0A=
> ++          cur_len--;=0A=
> +         continue;=0A=
> +       }=0A=
> +=0A=
> +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c=0A=
> +index c6bd96e..8615c48 100644=0A=
> +--- a/grub-core/normal/auth.c=0A=
> ++++ b/grub-core/normal/auth.c=0A=
> +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)=
=0A=
> +=0A=
> +       if (key =3D=3D '\b')=0A=
> +       {=0A=
> +-        cur_len--;=0A=
> +-        grub_printf ("\b");=0A=
> ++        if (cur_len)=0A=
> ++          {=0A=
> ++            cur_len--;=0A=
> ++            grub_printf ("\b");=0A=
> ++          }=0A=
> +         continue;=0A=
> +       }=0A=
> +=0A=
> +--=0A=
> +cgit v0.9.0.2=0A=
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.00.bb=0A=
> index 7674255..6822e7a 100644=0A=
> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb=0A=
> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb=0A=
> @@ -30,6 +30,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.=
gz \=0A=
>             file://grub-2.00-add-oe-kernel.patch \=0A=
>             file://grub-efi-fix-with-glibc-2.20.patch \=0A=
>             file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.pa=
tch \=0A=
> +           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.p=
atch \=0A=
>            "=0A=
>  SRC_URI[md5sum] =3D "e927540b6eda8b024fb0391eeaa4091c"=0A=
>  SRC_URI[sha256sum] =3D "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6ca=
f1cd0fd3b3cc11e3"=0A=
> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/g=
rub_2.00.bb=0A=
> index d4df676..94b6da9 100644=0A=
> --- a/meta/recipes-bsp/grub/grub_2.00.bb=0A=
> +++ b/meta/recipes-bsp/grub/grub_2.00.bb=0A=
> @@ -25,6 +25,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.=
gz \=0A=
>            file://fix-endianness-problem.patch \=0A=
>            file://grub2-remove-sparc64-setup-from-x86-builds.patch \=0A=
>            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.pat=
ch \=0A=
> +          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.pa=
tch \=0A=
>            "=0A=
>=0A=
>  SRC_URI[md5sum] =3D "e927540b6eda8b024fb0391eeaa4091c"=0A=
> --=0A=
> 1.9.1=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-core mailing list=0A=
> Openembedded-core@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

