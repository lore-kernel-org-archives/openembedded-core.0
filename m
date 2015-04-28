Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED39716CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 09:10:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2015 02:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="702005773"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2015 02:10:51 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.204]) with mapi id
	14.03.0224.002; Tue, 28 Apr 2015 10:10:51 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v6 0/3] Switch to BlueZ 5.x as default
	Bluetooth	stack
Thread-Index: AQHQgZJfaFrbXJKPRkiKn5lOeN2uEJ1iIvEQ
Date: Tue, 28 Apr 2015 09:10:50 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4B8B22@irsmsx105.ger.corp.intel.com>
References: <cover.1430211653.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430211653.git.cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/3] Switch to BlueZ 5.x as default Bluetooth	stack
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
X-List-Received-Date: Tue, 28 Apr 2015 09:10:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In v6:
1. fix systemd crash for gst-plugin-bluetooth;
2. dropped patch that removed exclusion from world build.
/Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Cristian Iorga
Sent: Tuesday, April 28, 2015 12:03 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v6 0/3] Switch to BlueZ 5.x as default Bluetooth =
stack

BlueZ 5.x is now the default Bluetooth stack.
BlueZ 4.x is moved to recipes-connectivity in meta-oe layer and still suppo=
rted in poky/YP.

The following changes since commit ae736dbdd140975ba43f06e635b461dbf36a117e=
:

  libxfont: Security Advisory - libxfont - CVE-2015-1804 (2015-04-28 07:56:=
57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib Ciorga/YB7479_v5
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3DCiorga/YB7479_=
v5

Cristian Iorga (3):
  bluez4: add proper systemd support
  bluez: remove bluez4 recipes
  bitbake.conf: backfill bluez5 feature

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
 14 files changed, 1 insertion(+), 453 deletions(-)  delete mode 100644 met=
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

