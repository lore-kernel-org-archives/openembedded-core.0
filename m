Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A16FA608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 13:47:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 06:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="285847234"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 06:47:36 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 23 Aug 2013 14:47:35 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.233]) with mapi id
	14.03.0123.003; Fri, 23 Aug 2013 14:47:36 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 2/4] packagegroup-self-hosted: pcmanfm and
	xdg-utils integration - no comment on the patch itself!!
Thread-Index: AQHOoAZ3NJlUrR1+3E+ke/P4kNPKVpmizfEg
Date: Fri, 23 Aug 2013 13:47:35 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C19829@IRSMSX105.ger.corp.intel.com>
References: <cover.1377264698.git.cristian.iorga@intel.com>
	<b14c1c4990e540ebaee263fd631fecea7154682a.1377264698.git.cristian.iorga@intel.com>
In-Reply-To: <b14c1c4990e540ebaee263fd631fecea7154682a.1377264698.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] packagegroup-self-hosted: pcmanfm and	xdg-utils integration - no comment on the patch itself!!
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
X-List-Received-Date: Fri, 23 Aug 2013 13:47:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There seems to be an issue with the create-pull-request script..
It will break the subject in two lines...
As such, at least under Outlook, the mail titles look strange.
Is this happening to other people also?
Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Friday, August 23, 2013 4:42 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v3 2/4] packagegroup-self-hosted: pcmanfm and xdg=
-utils integration

PCManFm file manager is integrated in Build Appliance; xdg-utils is also in=
tegrated for file association support.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/=
meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 6a0722a..2d35c16 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -38,11 +38,13 @@ RDEPENDS_packagegroup-self-hosted-host-tools =3D "\
     hdparm \
     iptables \
     lsb \
+    xdg-utils \
     mc \
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
     mc-helpers-python \
+    pcmanfm \
     parted \
     pseudo \
     screen \
--
1.8.1.2

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

