Return-Path: <mihaly.varga@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id DC5AF76538
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 17:06:09 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t76H68fZ017445; Thu, 6 Aug 2015 12:06:08 -0500
Received: from mihaly-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015080612060768-1046605 ;
	Thu, 6 Aug 2015 12:06:07 -0500 
From: Mihaly Varga <mihaly.varga@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 6 Aug 2015 20:04:51 +0300
Message-Id: <1438880692-35724-3-git-send-email-mihaly.varga@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
References: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 08/06/2015 12:06:07 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 08/06/2015 12:06:07 PM,
	Serialize complete at 08/06/2015 12:06:07 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-08-06_09:, , signatures=0
Cc: Mihaly Varga <mihaly.varga@ni.com>
Subject: [PATCH 2/3] wic: add mkhybridiso kickstart file
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
X-List-Received-Date: Thu, 06 Aug 2015 17:06:12 -0000

Add kickstart file for generating a hybrid bootable iso image using
isoimage-isohybrid plugin, the output image is HYBRID_ISO_IMG-cd.iso,
the label is HYBRIDISO, and the rootfs.img file is an image with ext3
file system, and uses grub as bootloader for EFI boot and
syslinux for legacy boot.

Signed-off-by: Mihaly Varga <mihaly.varga@ni.com>
---
 scripts/lib/image/canned-wks/mkhybridiso.wks | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 scripts/lib/image/canned-wks/mkhybridiso.wks

diff --git a/scripts/lib/image/canned-wks/mkhybridiso.wks b/scripts/lib/image/canned-wks/mkhybridiso.wks
new file mode 100644
index 0000000..b443c15
--- /dev/null
+++ b/scripts/lib/image/canned-wks/mkhybridiso.wks
@@ -0,0 +1,7 @@
+# short-description: Create a hybrid ISO image
+# long-description: Creates an EFI and legacy bootable hybrid ISO image
+# which can be used on optical media as well as USB media.
+
+part /boot --source isoimage-isohybrid --sourceparams="loader=grub-efi,image_name=HYBRID_ISO_IMG" --ondisk cd --label HYBRIDISO --fstype=ext3
+
+bootloader  --timeout=15  --append=""
-- 
1.9.1


