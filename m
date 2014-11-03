Return-Path: <bogdan.purcareata@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0148.outbound.protection.outlook.com [157.56.111.148])
	by mail.openembedded.org (Postfix) with ESMTP id 9F95160557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 13:24:08 +0000 (UTC)
Received: from BY2PR03MB190.namprd03.prod.outlook.com (10.242.36.141) by
	BY2PR03MB556.namprd03.prod.outlook.com (10.141.142.145) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 13:09:31 +0000
Received: from BY2PR03MB189.namprd03.prod.outlook.com (10.242.36.140) by
	BY2PR03MB190.namprd03.prod.outlook.com (10.242.36.141) with Microsoft
	SMTP Server (TLS) id 15.1.11.14; Mon, 3 Nov 2014 13:09:29 +0000
Received: from BY2PR03MB189.namprd03.prod.outlook.com ([169.254.6.172]) by
	BY2PR03MB189.namprd03.prod.outlook.com ([169.254.6.172]) with mapi id
	15.01.0011.000; Mon, 3 Nov 2014 13:09:29 +0000
From: "bogdan.purcareata@freescale.com" <bogdan.purcareata@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] shadow: enable support for subordinate IDs
Thread-Index: AQHP8cOR4SZcHgWCAk2fur8nuReixpxO6sQw
Date: Mon, 3 Nov 2014 13:09:29 +0000
Message-ID: <3b87b5236d394a58a73fbc0068d593e5@BY2PR03MB189.namprd03.prod.outlook.com>
References: <1414088763-15256-1-git-send-email-bogdan.purcareata@freescale.com>
	<1414425094-12256-1-git-send-email-bogdan.purcareata@freescale.com>
In-Reply-To: <1414425094-12256-1-git-send-email-bogdan.purcareata@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.88.166.1]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB190;UriScan:;
x-exchange-antispam-report-test: UriScan:;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(11905935001)(189002)(51704005)(377454003)(13464003)(199003)(92566001)(575784001)(15202345003)(76576001)(19580405001)(40100003)(19580395003)(2656002)(87936001)(122556002)(54356999)(15395725005)(76176999)(77096003)(77156002)(50986999)(86362001)(101416001)(15975445006)(120916001)(31966008)(107046002)(99286002)(95666004)(107886001)(2351001)(450100001)(106356001)(106116001)(105586002)(108616004)(99396003)(33646002)(110136001)(64706001)(21056001)(46102003)(62966003)(74316001)(20776003)(66066001)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB190;
	H:BY2PR03MB189.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB556;
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] shadow: enable support for subordinate IDs
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
X-List-Received-Date: Mon, 03 Nov 2014 13:24:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Can someone kindly review my patch? I haven't sent patches to this list yet=
 and I don't know who the maintainer is.

Please let me know if there's anything else I can do in order to have this =
fix merged.

Thank you,
Bogdan P.

> -----Original Message-----
> From: Bogdan Purcareata [mailto:bogdan.purcareata@freescale.com]
> Sent: Monday, October 27, 2014 5:52 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Purcareata Bogdan-B43198
> Subject: [PATCH v2] shadow: enable support for subordinate IDs
>=20
> The subordinate IDs support in pkg-shadow allows unprivileged users to ma=
nage
> a
> set of UIDs and GIDs. These subordinate IDs are specified by root, and ca=
n be
> further used by the unprivileged user they have been assigned to. This us=
er
> can
> then create an e.g. user namespace, where he is allowed to manage his own=
 set
> of
> users and group from the pool of subordinate IDs. More details can be fou=
nd at
> http://lwn.net/Articles/533617/.
>=20
> Pull a required change from upstream in order to make shadow cross-compil=
e
> with
> subordinate IDs support. Enable flag in recipe.
>=20
> Changes since v1:
> - update changelog
>=20
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |   41
> ++++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc            |    3 +-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-
> extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF=
.patc
> h
>=20
> diff --git a/meta/recipes-
> extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF=
.patc
> h b/meta/recipes-
> extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF=
.patc
> h
> new file mode 100644
> index 0000000..185590c
> --- /dev/null
> +++ b/meta/recipes-
> extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF=
.patc
> h
> @@ -0,0 +1,41 @@
> +From 2cb54158b80cdbd97ca3b36df83f9255e923ae3f Mon Sep 17 00:00:00 2001
> +From: James Le Cuirot <chewi@aura-online.co.uk>
> +Date: Sat, 23 Aug 2014 09:46:39 +0100
> +Subject: [PATCH] Check size of uid_t and gid_t using AC_CHECK_SIZEOF
> +
> +This built-in check is simpler than the previous method and, most
> +importantly, works when cross-compiling.
> +
> +Upstream-Status: Accepted
> +[https://github.com/shadow-
> maint/shadow/commit/2cb54158b80cdbd97ca3b36df83f9255e923ae3f]
> +
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + configure.in | 14 ++++----------
> + 1 file changed, 4 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 1a3f841..4a4d6d0 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -335,16 +335,10 @@ if test "$enable_subids" !=3D "no"; then
> + 	dnl
> + 	dnl FIXME: check if 32 bit UIDs/GIDs are supported by libc
> + 	dnl
> +-	AC_RUN_IFELSE([AC_LANG_SOURCE([
> +-#include <sys/types.h>
> +-int main(void) {
> +-	uid_t u;
> +-	gid_t g;
> +-	return (sizeof u < 4) || (sizeof g < 4);
> +-}
> +-	])], [id32bit=3D"yes"], [id32bit=3D"no"])
> +-
> +-	if test "x$id32bit" =3D "xyes"; then
> ++	AC_CHECK_SIZEOF([uid_t],, [#include "sys/types.h"])
> ++	AC_CHECK_SIZEOF([gid_t],, [#include "sys/types.h"])
> ++
> ++	if test "$ac_cv_sizeof_uid_t" -ge 4 && test "$ac_cv_sizeof_gid_t" -ge =
4;
> then
> + 		AC_DEFINE(ENABLE_SUBIDS, 1, [Define to support the subordinate
> IDs.])
> + 		enable_subids=3D"yes"
> + 	else
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-
> extended/shadow/shadow.inc
> index b2a5f0e..9fada0d 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "http://pkg-
> shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
>             file://fix-installation-failure-with-subids-disabled.patch \
>             file://0001-su.c-fix-to-exec-command-correctly.patch \
>             file://0001-Do-not-read-login.defs-before-doing-chroot.patch =
\
> +           file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.pa=
tch \
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}'=
, '',
> d)} \
>             "
>=20
> @@ -52,7 +53,7 @@ EXTRA_OECONF +=3D "--without-audit \
>                   --without-libcrack \
>                   --without-selinux \
>                   --with-group-name-max-length=3D24 \
> -                 --enable-subordinate-ids=3Dno \
> +                 --enable-subordinate-ids=3Dyes \
>                   ${NSCDOPT}"
>=20
>  NSCDOPT =3D ""
> --
> 1.7.10.4


