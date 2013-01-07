Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TsDvi-0006zw-90
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 15:44:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Jan 2013 06:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,424,1355126400"; d="scan'208";a="240859801"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by azsmga001.ch.intel.com with ESMTP; 07 Jan 2013 06:28:47 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 7 Jan 2013 14:28:45 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.21]) with mapi id
	14.01.0355.002; Mon, 7 Jan 2013 14:28:45 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH V2] libtelepathy: python-native is now used during build
Thread-Index: AQHN7OLYvHkGQYuAhkuhjpytb2VHiZg97I7w
Date: Mon, 7 Jan 2013 14:28:44 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DB1A6@IRSMSX102.ger.corp.intel.com>
References: <1357568699-8094-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1357568699-8094-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH V2] libtelepathy: python-native is now used during build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 14:44:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With [PATCH V2] the commit message is clarified and more meaningful.

-----Original Message-----
From: Iorga, Cristian=20
Sent: Monday, January 07, 2013 4:25 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH V2] libtelepathy: python-native is now used during build

libtelepathy generated makefiles contain an assignment like this: PYTHON=3D=
python This could lead to potential build problems in Yocto environment bec=
ause python-native is not used during the build.

Fixes [YOCTO #3679]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/me=
ta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index ee131ee..7d0ef79 100644
--- a/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -17,7 +17,7 @@ SRC_URI =3D "http://telepathy.freedesktop.org/releases/li=
btelepathy/libtelepathy-$
 SRC_URI[md5sum] =3D "490ca1a0c614d4466394b72d43bf7370"
 SRC_URI[sha256sum] =3D "e0d230be855125163579743418203c6f6be2f10f98c4f06573=
5c1dc9ed115878"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig pythonnative
=20
 FILES_${PN} +=3D "${datadir}/telepathy \
 		${datadir}/dbus-1"
--
1.7.10.4



