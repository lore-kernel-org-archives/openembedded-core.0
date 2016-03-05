Return-Path: <robert_joslyn@selinc.com>
X-Greylist: delayed 7180 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 05 Mar 2016 02:54:09 UTC
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id EDA8960667
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 02:54:09 +0000 (UTC)
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by valiant.selinc.com (8.15.0.59/8.15.0.59) with ESMTP id
	u250rHqm007999 for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2016 16:53:17 -0800
In-Reply-To: <CAJTo0Lb1zkB4QhLMDQJFpwVkok04aOtVzxd1LqTTKqXhNxoG9w@mail.gmail.com>
References: <OF21316994.A2EBE251-ON88257F6C.007FC931-88257F6C.007FFBBB@selinc.com>
	<CAMKF1sqwf11WhEAtCtRf+VrqR=BVCegRCVsnc2MeaUK7ReoH3A@mail.gmail.com>
	<OFFA897E48.32A2821D-ON88257F6C.00833AFA-88257F6D.00012E40@selinc.com>
	<CAJTo0Lb1zkB4QhLMDQJFpwVkok04aOtVzxd1LqTTKqXhNxoG9w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 07CDD5E2:A67C87A5-88257F6D:0001D7A9;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
Message-ID: <OF07CDD5E2.A67C87A5-ON88257F6D.0001D7A9-88257F6D.0004F953@selinc.com>
From: robert_joslyn@selinc.com
Date: Fri, 4 Mar 2016 16:54:19 -0800
X-MIMETrack: S/MIME Sign by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 03/04/2016 04:54:19 PM,
	Serialize by Notes Client on Robert Joslyn/SEL(Release 8.5.3FP4
	SHF39|May 13, 2013) at 03/04/2016 04:54:19 PM,
	Serialize complete at 03/04/2016 04:54:19 PM,
	S/MIME Sign failed at 03/04/2016 04:54:19 PM: The cryptographic key was
	not found,
	Serialize by Router on Edison/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 03/04/2016 04:54:30 PM,
	Serialize complete at 03/04/2016 04:54:30 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8094
	signatures=670697
Subject: [PATCH] btrfs-tools: Add libgcc to RDEPENDS
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
X-List-Received-Date: Sat, 05 Mar 2016 02:54:11 -0000
Content-Type: text/plain; charset="US-ASCII"

From: Robert Joslyn <robert_joslyn@selinc.com>

libgcc_s.so.1 is required by btrfs-tools at runtime for certain
operations, such as scrub.

Signed-off-by: Robert Joslyn <robert_joslyn@selinc.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.1.2.bb 
b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.1.2.bb
index 37c622b..cc2ccfc 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.1.2.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.1.2.bb
@@ -11,6 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
+RDEPENDS_${PN} = "libgcc"

 SRCREV = "7f1328ccb5d159efe850d4eaea9b49bbe8c4181e"
 SRC_URI = 
"git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
--
1.9.1

