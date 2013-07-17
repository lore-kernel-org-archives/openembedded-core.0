Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 055F66B251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 10:16:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2013 03:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,683,1367996400"; d="scan'208";a="371680731"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 17 Jul 2013 03:16:03 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.52]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.153]) with mapi id
	14.03.0123.003; Wed, 17 Jul 2013 11:16:03 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Yi Zhao <yi.zhao@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] iproute2: Fix alternative link for ip command
Thread-Index: AQHOgs0QEm0b4oyblUu4S+ItIo5ewplop6JA
Date: Wed, 17 Jul 2013 10:16:02 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C05F2D@IRSMSX105.ger.corp.intel.com>
References: <cover.1374050202.git.yi.zhao@windriver.com>
	<debb3a1d640dd3ef022f96495612116bb284a5fd.1374050202.git.yi.zhao@windriver.com>
In-Reply-To: <debb3a1d640dd3ef022f96495612116bb284a5fd.1374050202.git.yi.zhao@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] iproute2: Fix alternative link for ip command
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
X-List-Received-Date: Wed, 17 Jul 2013 10:16:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK.

-----Original Message-----
From: Yi Zhao [mailto:yi.zhao@windriver.com]=20
Sent: Wednesday, July 17, 2013 12:07 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH 1/1] iproute2: Fix alternative link for ip command

In busybox the default location of symbolic link for command ip is /sbin/ip=
. But in iproute2, the alternatvie link for ip is /bin/ip.
It will cause an error when running update-alternatives:
Cannot register alternative ip to /bin/ip since it is already registered to=
 /sbin/ip.

[YOCTO #4855]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes=
-connectivity/iproute2/iproute2.inc
index fb233eb..3db21db 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -31,7 +31,7 @@ FILES_${PN}-dbg +=3D "${libdir}/tc/.debug"
=20
 ALTERNATIVE_${PN} =3D "ip"
 ALTERNATIVE_TARGET[ip] =3D "${base_sbindir}/ip.${BPN}"
-ALTERNATIVE_LINK_NAME[ip] =3D "${base_bindir}/ip"
+ALTERNATIVE_LINK_NAME[ip] =3D "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY =3D "100"
=20
 PARALLEL_MAKE =3D ""
--
1.7.9.5


