Return-Path: <scott@jumpnowtek.com>
Received: from smtp77.iad3a.emailsrvr.com (smtp77.iad3a.emailsrvr.com
	[173.203.187.77])
	by mail.openembedded.org (Postfix) with ESMTP id 93A556FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 10:42:47 +0000 (UTC)
Received: from smtp26.relay.iad3a.emailsrvr.com (localhost.localdomain
	[127.0.0.1])
	by smtp26.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	6EDD28051B for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 05:42:48 -0500 (EST)
Received: from app48.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp26.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	672DF80500 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 05:42:48 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from app48.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.5.4);
	Mon, 18 Jan 2016 05:42:48 -0500
Received: from jumpnowtek.com (localhost.localdomain [127.0.0.1])
	by app48.wa-webapps.iad3a (Postfix) with ESMTP id 5811D3820F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 05:42:48 -0500 (EST)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Mon, 18 Jan 2016 05:42:48 -0500 (EST)
Date: Mon, 18 Jan 2016 05:42:48 -0500 (EST)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
X-Auth-ID: scott@jumpnowtek.com
Message-ID: <1453113768.358823222@apps.rackspace.com>
X-Mailer: webmail/11.6.10-RC
Subject: [PATCH] coreutils: Add xattr PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Jan 2016 10:42:48 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From Yocto poky where it also stops this warning=0A=0AWARNING: QA Issue: co=
reutils rdepends on libattr, but it isn't a build dependency? [build-deps]=
=0A=0ASigned-off-by: Scott Ellis <scott@jumpnowtek.com>=0A---=0Ameta/recipe=
s-core/coreutils/coreutils_8.24.bb | 9 +++++++--=0A1 file changed, 7 insert=
ions(+), 2 deletions(-)=0A=0Adiff --git a/meta/recipes-core/coreutils/coreu=
tils_8.24.bb b/meta/recipes-core/coreutils/coreutils_8.24.bb=0Aindex f04234=
6..6a09c59 100644=0A--- a/meta/recipes-core/coreutils/coreutils_8.24.bb=0A+=
++ b/meta/recipes-core/coreutils/coreutils_8.24.bb=0A@@ -28,14 +28,19 @@ SR=
C_URI[manpages.sha256sum] =3D "cf0333b5f134a331e0b46e2ddf90666f8bdc3281c1ca=
2c7cc=0AEXTRA_OECONF_class-native =3D "--without-gmp"=0AEXTRA_OECONF_class-=
target =3D "--enable-install-program=3Darch --libexecdir=3D${libdir}"=0A=0A=
-# acl is not a default feature=0A+# acl and xattr are not default features=
=0A#=0A-PACKAGECONFIG_class-target ??=3D "${@bb.utils.contains('DISTRO_FEAT=
URES', 'acl', 'acl', '', d)}"=0A+PACKAGECONFIG_class-target ??=3D "\=0A+   =
 ${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \=0A+    ${@=
bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr', '', d)} \=0A+"=0A+=
=0APACKAGECONFIG_class-native ??=3D ""=0A=0A# with, without, depends, rdepe=
nds=0A#=0APACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl,"=0A+PACKA=
GECONFIG[xattr] =3D "--enable-xattr,--disable-xattr,attr,"=0A=0A# [ df mkte=
mp base64 gets a special treatment and is not included in this=0Abindir_pro=
gs =3D "arch basename chcon cksum comm csplit cut dir dircolors dirname du =
\=0A--=0A2.5.0


