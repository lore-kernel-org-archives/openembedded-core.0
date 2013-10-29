Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 227D46D406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 17:01:25 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2013 10:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,594,1378882800"; d="scan'208";a="424681635"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2013 09:59:42 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Tue, 29 Oct 2013 16:58:32 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] connman: upgrade to 1.19
Thread-Index: AQHOzzAncaQJpXc1Akq/ATPfgUXa0JoL8bLQ
Date: Tue, 29 Oct 2013 16:58:32 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CAEDDC@IRSMSX105.ger.corp.intel.com>
References: <cover.1382450957.git.cristian.iorga@intel.com>
	<488941bb9793d52f804353b60d9976d0786e58f9.1382450957.git.cristian.iorga@intel.com>
In-Reply-To: <488941bb9793d52f804353b60d9976d0786e58f9.1382450957.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] connman: upgrade to 1.19
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
X-List-Received-Date: Tue, 29 Oct 2013 17:01:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.
Any comments on this one?
/Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Tuesday, October 22, 2013 5:10 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/1] connman: upgrade to 1.19

Improvements:
- On startup keep interfaces already configured with static IPv4 addresses =
if there is a service configuration file containing the very same static va=
lues. If not, take the interface down and flush the old configuration as be=
fore (Jukka Rissanen).
- Handle FallbackNameservers properly;
use them when no other nameservers have been configured for a service (Patr=
ik Flykt).

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/{connman_1.18.bb =3D> connman_1.19.bb}                    | 6 =
++----
 1 file changed, 2 insertions(+), 4 deletions(-)  rename meta/recipes-conne=
ctivity/connman/{connman_1.18.bb =3D> connman_1.19.bb} (65%)

diff --git a/meta/recipes-connectivity/connman/connman_1.18.bb b/meta/recip=
es-connectivity/connman/connman_1.19.bb
similarity index 65%
rename from meta/recipes-connectivity/connman/connman_1.18.bb
rename to meta/recipes-connectivity/connman/connman_1.19.bb
index 44a4a07..c63dfe4 100644
--- a/meta/recipes-connectivity/connman/connman_1.18.bb
+++ b/meta/recipes-connectivity/connman/connman_1.19.bb
@@ -6,9 +6,7 @@ SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP=
}.tar.xz \
             file://connman \
             "
=20
-SRC_URI[md5sum] =3D "7578ec8f0422d34f5a4ba51b605fe576"
-SRC_URI[sha256sum] =3D "56c2ca7842be2100b6b59367845d5beec125f231af6ea50560=
4992e0c5a69992"
-
-PR =3D "${INC_PR}.0"
+SRC_URI[md5sum] =3D "47cce1d17a693dc307e6796c81991bd0"
+SRC_URI[sha256sum] =3D "7e4e624cadf42feed18e783351b10f81ef23d7e298bddc7ffe=
26fe5e69f25b8b"
=20
 RRECOMMENDS_${PN} =3D "connman-conf"
--
1.8.1.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

