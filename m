Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D47A46AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 14:48:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 23 Apr 2015 07:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,631,1422950400"; d="scan'208";a="484706758"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2015 07:48:19 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX104.ger.corp.intel.com ([169.254.3.49]) with mapi id
	14.03.0224.002; Thu, 23 Apr 2015 15:48:18 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v5 0/4] Switch to BlueZ 5.x as default
	Bluetooth	stack
Thread-Index: AQHQfdNPXbSJ7coU6EqYERfMJx56vp1aqyhg
Date: Thu, 23 Apr 2015 14:48:18 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B4E93@irsmsx105.ger.corp.intel.com>
References: <cover.1429799661.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429799661.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/4] Switch to BlueZ 5.x as default Bluetooth	stack
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
X-List-Received-Date: Thu, 23 Apr 2015 14:48:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In v5:
1. removed bluez5 exclusion from world builds;
2. Updated commit messages/general message;
3. Updated bluez4 recipe with improved systemd support.

Please merge this patchset only after the SRCREV of linux-yocto for qemu* m=
achines will advance after the BT kernel config updates, otherwise systemd =
runtime tests will still fail (as RP noticed), as the Bluetooth service can=
not properly start without appropriate BT kernel settings (and stack).

Regards,
Cristian Iorga
Yocto Project
Intel Corporation


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Thursday, April 23, 2015 5:39 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v5 0/4] Switch to BlueZ 5.x as default Bluetooth =
stack

BlueZ 5.x is now the default Bluetooth stack.
BlueZ 4.x is moved to recipes-connectivity in meta-oe layer and still suppo=
rted in poky/YP.

The following changes since commit 781165b071babb888f46a4e1d15880df924c65f6=
:

  bison: don't depend on help2man (2015-04-21 13:59:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/YB7479_v3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3DCiorga/YB7479_=
v3

Cristian Iorga (4):
  bluez4: add proper systemd support
  bluez: remove bluez4 recipes
  bitbake.conf: backfill bluez5 feature
  bluez5: don't exclude from world builds

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
 meta/recipes-connectivity/bluez5/bluez5.inc        |   2 -
 15 files changed, 1 insertion(+), 455 deletions(-)  delete mode 100644 met=
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

