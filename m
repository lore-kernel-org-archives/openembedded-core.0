Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1029173DF0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:44:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2015 07:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,695,1432623600"; d="scan'208";a="543459766"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by FMSMGA003.fm.intel.com with ESMTP; 17 Aug 2015 07:44:01 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.223]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.59]) with mapi id
	14.03.0224.002; Mon, 17 Aug 2015 15:44:00 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] canned-wks: added a qemux86* directdisk recipe for wic
Thread-Index: AQHQ1qlzxoWdKVTobk+WM8MwhP+4Lp4QSI4g
Date: Mon, 17 Aug 2015 14:43:59 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44B7CFFE@irsmsx105.ger.corp.intel.com>
References: <1439567651-9281-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1439567651-9281-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] canned-wks: added a qemux86* directdisk recipe for wic
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
X-List-Received-Date: Mon, 17 Aug 2015 14:44:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore, there are some troubles with non-KVM accelerated qemux86* ma=
chines.
Better version in the work, the never-ending story of root mount points in =
KVM qemu/non-KVM qemu hit me.
/Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Friday, August 14, 2015 6:54 PM
To: openembedded-core@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH] canned-wks: added a qemux86* directdisk recipe for wic

qemu-directdisk.wks creates a raw disk image that a qemux86* machine can bo=
ot from.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/lib/image/canned-wks/qemux86-directdisk.wks | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 scripts/lib/image/canned-wks/qemux86-directdisk.wks

diff --git a/scripts/lib/image/canned-wks/qemux86-directdisk.wks b/scripts/=
lib/image/canned-wks/qemux86-directdisk.wks
new file mode 100644
index 0000000..8fc38b5
--- /dev/null
+++ b/scripts/lib/image/canned-wks/qemux86-directdisk.wks
@@ -0,0 +1,10 @@
+# short-description: Create a qemu machine 'pcbios' direct disk image #=20
+long-description: Creates a partitioned legacy BIOS disk image that the=20
+user # can directly use to boot a qemu machine.
+
+
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active=20
+--align 1024 part / --source rootfs --ondisk sda --fstype=3Dext4 --label=20
+platform --align 1024
+
+bootloader  --timeout=3D0  --append=3D"vga=3D0 uvesafb.mode_option=3D640x4=
80-32 root=3D/dev/vda2 rw mem=3D256M ip=3D192.168.7.2::192.168.7.1:255.255.=
255.0 oprofile.timer=3D1 rootfstype=3Dext4 "
+
--
2.1.4


