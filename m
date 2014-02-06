Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B0DDC6D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 08:47:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 06 Feb 2014 00:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,792,1384329600"; d="scan'208";a="470710593"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2014 00:47:16 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 6 Feb 2014 08:47:08 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.192]) with mapi id
	14.03.0123.003; Thu, 6 Feb 2014 08:47:08 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] build-appliance-image: Update to poky
	commit	b37dd451a52622d5b570183a81583cc34c2ff555
Thread-Index: AQHPINCvlsu85A84EkK7WrQzWPD+R5qn7l+Q
Date: Thu, 6 Feb 2014 08:47:08 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CFD5D2@IRSMSX105.ger.corp.intel.com>
References: <cover.1391425810.git.cristian.iorga@intel.com>
	<20aef1c75f6816af7f2d1e946fe7dabb47bc2ed8.1391425810.git.cristian.iorga@intel.com>
In-Reply-To: <20aef1c75f6816af7f2d1e946fe7dabb47bc2ed8.1391425810.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] build-appliance-image: Update to poky commit	b37dd451a52622d5b570183a81583cc34c2ff555
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
X-List-Received-Date: Thu, 06 Feb 2014 08:47:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Monday, February 3, 2014 1:14 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 1/1] build-appliance-image: Update to poky commit=
 b37dd451a52622d5b570183a81583cc34c2ff555

This update will add improvements to HOB, fix issues encountered during bui=
ld.

Fixes [YOCTO #5759].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/images/build-appliance-image_8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_8.0.bb b/meta/r=
ecipes-core/images/build-appliance-image_8.0.bb
index 650c1a2..8906c1c 100644
--- a/meta/recipes-core/images/build-appliance-image_8.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_8.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES =3D "vmdk"
=20
 inherit core-image
=20
-SRCREV ?=3D "ee9a3c191c64636971c94d8a9870c41d7bac02bf"
+SRCREV ?=3D "b37dd451a52622d5b570183a81583cc34c2ff555"
 SRC_URI =3D "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
--
1.8.3.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

