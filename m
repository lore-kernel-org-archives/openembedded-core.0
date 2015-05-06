Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BE31D73D48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:26:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2015 08:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="706155291"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2015 08:26:16 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.46]) with mapi id
	14.03.0224.002; Wed, 6 May 2015 16:25:45 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2] qemu 2.3.0 upgrade
Thread-Index: AQHQiBB5CEZrK+peeki/91cti5HcDp1vERqQ
Date: Wed, 6 May 2015 15:25:45 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4BC395@irsmsx105.ger.corp.intel.com>
References: <cover.1430925667.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430925667.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] qemu 2.3.0 upgrade
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
X-List-Received-Date: Wed, 06 May 2015 15:26:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
Can other interested stakeholders test this upgrade to their own interest a=
nd variations?

I tested a lot of combinations, but my testing cannot be exhaustive when we=
 are talking about qemu.

Thanks,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Wednesday, May 6, 2015 6:22 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/2] qemu 2.3.0 upgrade

The following changes since commit b2b59b14ecfe13ba794d92f97d1403d6503c7407=
:

  poky.conf: remove SVK mirror (2015-05-05 22:18:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/qemu-upg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3DCiorga/qemu-up=
g

Cristian Iorga (2):
  qemu: upgrade to 2.3.0
  runqemu-internal: correctly set format for root FS as raw

 ...-Arm-versatilepb-Add-memory-size-checking.patch | 22 ++++----
 meta/recipes-devtools/qemu/qemu.inc                |  2 +-
 .../37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch | 59 ------------------=
----
 .../qemu/{qemu_2.2.0.bb =3D> qemu_2.3.0.bb}          |  5 +-
 scripts/runqemu-internal                           |  4 +-
 5 files changed, 17 insertions(+), 75 deletions(-)  delete mode 100644 met=
a/recipes-devtools/qemu/qemu/37ed3bf1ee07bb1a26adca0df8718f601f231c0b.patch
 rename meta/recipes-devtools/qemu/{qemu_2.2.0.bb =3D> qemu_2.3.0.bb} (76%)

--
2.1.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

