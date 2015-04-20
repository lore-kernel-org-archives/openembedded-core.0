Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 54F8272E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:51:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2015 07:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="682804067"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 20 Apr 2015 07:51:14 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.2]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.136]) with mapi id
	14.03.0224.002; Mon, 20 Apr 2015 15:51:13 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 0/4] Switch to BlueZ 5.x as default
	Bluetooth	stack
Thread-Index: AQHQe3kj1B+Rj30EV0C291g6TyY8f51V+2vA
Date: Mon, 20 Apr 2015 14:51:12 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F49D718@irsmsx105.ger.corp.intel.com>
References: <cover.1429540534.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429540534.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Switch to BlueZ 5.x as default Bluetooth	stack
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
X-List-Received-Date: Mon, 20 Apr 2015 14:51:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In version 2:
1. Simplified and kept the original logic;
2. bluez5 is now a distro backfill feature;
3. bluez5 upgrade already merged, removed from v2 patchset;
4. Improved commit message.
Regards,
/Cristian


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Monday, April 20, 2015 5:47 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2 0/4] Switch to BlueZ 5.x as default Bluetooth =
stack

BlueZ 5.x is now the default Bluetooth stack.
BlueZ 4.x is moved to meta-oe connectivity collection layer and still suppo=
rted in oe-core.

The following changes since commit 167025e6d72c44cacfdc5d8b98e942066df09a4f=
:

  initscripts: Remove /etc/volatile.cache on upgrade (2015-04-20 15:03:07 +=
0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/YB7479_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3DCiorga/YB7479_=
v3

Cristian Iorga (4):
  maintainers.inc: remove info related to bluez4
  upstream_tracking.inc: bluez4 removed from oe-core
  bluez: remove recipe
  bitbake.conf: backfill bluez5 feature

 meta-yocto/conf/distro/include/maintainers.inc     |   3 -
 .../conf/distro/include/upstream_tracking.inc      |   1 -
 meta/conf/bitbake.conf                             |   2 +-
 .../obsolete_automake_macros.patch                 |  14 ---
 .../bluez/bluez-hcidump_2.5.bb                     |  22 -----
 .../bluez/bluez4-4.101/bluetooth.conf              |  16 ---
 .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 -------
 .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 -----------------=
----
 .../bluez/bluez4-4.101/install-test-script.patch   |  26 -----
 ...ork-fix-network-Connect-method-parameters.patch |  30 ------
 .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ---
 .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 -----
 ...pygobject-instead-ofgobject-introspection.patch |  27 -----
 meta/recipes-connectivity/bluez/bluez4.inc         |  46 ---------
 meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  47 ---------
 .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 --------
 16 files changed, 1 insertion(+), 457 deletions(-)  delete mode 100644 met=
a/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake_macros.pat=
ch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.=
conf
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-p=
aths.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encryp=
t_collision.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-te=
st-script.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-fi=
x-network-Connect-method-parameters.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_a=
utomake_macros.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.pa=
tch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy=
-pygobject-instead-ofgobject-introspection.patch
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
 delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
 delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.=
101.bb

--
2.1.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

