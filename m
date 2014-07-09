Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8E97024A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 08:11:23 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2014 01:11:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,630,1400050800"; d="scan'208";a="454842666"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2014 01:11:23 -0700
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 9 Jul 2014 09:11:22 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.76]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.25]) with mapi id
	14.03.0123.003; Wed, 9 Jul 2014 09:11:22 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] builder: removed setting of BB_NUMBER_THREADS and
	PARALLEL_MAKE
Thread-Index: AQHPl5CVuY/Vkrn/SkurG04eu6KkQZuXa5FQ
Date: Wed, 9 Jul 2014 08:11:22 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F277880@IRSMSX105.ger.corp.intel.com>
References: <1404482504-25076-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1404482504-25076-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH] builder: removed setting of BB_NUMBER_THREADS and PARALLEL_MAKE
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
X-List-Received-Date: Wed, 09 Jul 2014 08:11:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: Iorga, Cristian=20
Sent: Friday, July 4, 2014 5:02 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH] builder: removed setting of BB_NUMBER_THREADS and PARALLEL=
_MAKE

This values are now adjusted automatically, based on underlying hardware CP=
U cores count, so no need to enable manually.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/files/builder_hob_start.sh | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/builder/files/builder_hob_start.sh b/met=
a/recipes-graphics/builder/files/builder_hob_start.sh
index 42c93dd..65a68ee 100644
--- a/meta/recipes-graphics/builder/files/builder_hob_start.sh
+++ b/meta/recipes-graphics/builder/files/builder_hob_start.sh
@@ -30,10 +30,6 @@ fi
 cd /home/builder/poky
 . ./oe-init-build-env
=20
-#uncomment the settings for BB_NUMBER_THREADS and PARALLEL_MAKE -sed -i 's=
/^#BB_NUMBER_THREADS =3D/BB_NUMBER_THREADS =3D/g' conf/local.conf -sed -i '=
s/^#PARALLEL_MAKE =3D/PARALLEL_MAKE =3D/g' conf/local.conf
-
 hob &
=20
 matchbox-terminal&
--
1.9.1


