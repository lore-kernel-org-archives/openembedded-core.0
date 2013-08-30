Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EC5176BD5B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:55:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Aug 2013 06:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="395978444"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga002.jf.intel.com with ESMTP; 30 Aug 2013 06:55:31 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Fri, 30 Aug 2013 14:55:30 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Prica, Mihai" <mihai.prica@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] YB3506: Include web browser in Build
	Appliance
Thread-Index: AQHOpYfOpFTVxjvC20CF6F6PpTzpKpmtxhJg
Date: Fri, 30 Aug 2013 13:55:29 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C30B99@IRSMSX105.ger.corp.intel.com>
References: <cover.1377434794.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377434794.git.mihai.prica@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] YB3506: Include web browser in Build Appliance
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
X-List-Received-Date: Fri, 30 Aug 2013 13:55:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Mihai Prica
Sent: Friday, August 30, 2013 4:48 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/2] YB3506: Include web browser in Build Applian=
ce

Integrate Midori web browser in Build Appliance. This will allow the users =
to get help and file a bug from Hob in Build Appliance.

[YOCTO #3506]
[YOCTO #5034]

The following changes since commit 4fd453ef7cd2e7e2b1d72284440dac574603ed27=
:

  midori: add version 0.5.5 from meta-gnome (2013-08-28 00:51:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mihaip/b3506
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmihaip/b3506

Mihai Prica (2):
  packagegroup-self-hosted: integrate midori
  builder: register html links and files with Midori

 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 .../builder/files/builder_hob_start.sh             |    8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

--
1.7.9.5

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

