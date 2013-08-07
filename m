Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 979266B5B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:26:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2013 01:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,831,1367996400"; d="scan'208";a="377362341"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2013 01:26:31 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.83]) with mapi id
	14.03.0123.003; Wed, 7 Aug 2013 09:26:31 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] subversion: Add patch to use neon 0.30
Thread-Index: AQHOkudUtZGZEw8AckGFsDg6FkQu85mJacrA
Date: Wed, 7 Aug 2013 08:26:30 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C12CDE@IRSMSX105.ger.corp.intel.com>
References: <1375822528-2026-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1375822528-2026-1-git-send-email-sgw@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH v2] subversion: Add patch to use neon 0.30
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
X-List-Received-Date: Wed, 07 Aug 2013 08:26:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, August 06, 2013 11:55 PM
To: richard.purdie@linuxfoundation.org; openembedded-core@lists.openembedde=
d.org
Cc: Iorga, Cristian
Subject: [PATCH v2] subversion: Add patch to use neon 0.30

The neon update is not recognized but subversion, so we need to patch the c=
onfigure.ac to know about 0.30, otherwise we don't have http/https support =
in subversion.

v2: Add patch header (doh!)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../subversion-1.7.10/allow-updated-neon.patch       | 20 ++++++++++++++++=
++++
 .../recipes-devtools/subversion/subversion_1.7.10.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/allo=
w-updated-neon.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updat=
ed-neon.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/allow-up=
dated-neon.patch
new file mode 100644
index 0000000..e8acb12
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-n
+++ eon.patch
@@ -0,0 +1,20 @@
+
+Allow neon 0.30 to be usable also
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: subversion-1.7.10/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- subversion-1.7.10.orig/configure.ac
++++ subversion-1.7.10/configure.ac
+@@ -118,7 +118,7 @@ AC_PATH_PROG(PKG_CONFIG, pkg-config)
+=20
+ # Either a space-separated list of allowable Neon versions, or "any"=20
+to  # mean allow anything.
+-NEON_ALLOWED_LIST=3D"0\.25 0\.26 0\.27\.2 0\.28 0\.29"
++NEON_ALLOWED_LIST=3D"0\.25 0\.26 0\.27\.2 0\.28 0\.29 0\.30"
+ NEON_RECOMMENDED_VER=3D"0.29.6"
+ NEON_URL=3D"http://www.webdav.org/neon/neon-${NEON_RECOMMENDED_VER}.tar.g=
z"
+ dnl You can skip the neon version check only if you know what you are=20
+ doing
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/r=
ecipes-devtools/subversion/subversion_1.7.10.bb
index a24edb5..f77656b 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -12,6 +12,7 @@ inherit gettext
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
+           file://allow-updated-neon.patch \
 "
 SRC_URI[md5sum] =3D "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] =3D "c1df222bec83d014d17785e2ceba6bc80962f64b280967de02=
85836d8d77a8e7"
--
1.8.1.4


