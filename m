Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRe1r-0002if-4E
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 07:31:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 May 2011 22:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,301,1304319600"; 
   d="scan'208";a="4988419"
Received: from unknown (HELO [10.255.13.41]) ([10.255.13.41])
	by azsmga001.ch.intel.com with ESMTP; 31 May 2011 22:28:13 -0700
Message-ID: <4DE5CDED.3050405@linux.intel.com>
Date: Tue, 31 May 2011 22:28:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: "open >> 'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH(fixed bugid)] tcmode-default: disable ARMv7 Optimization for	qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 05:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

[YOCTO #1130]

This diables the ARMv7 optimizations that cause the compiler to fail 
with the following error

| ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function 
'void qt_removeObject(QObject*)':
| ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35: 
error: output number 1 not directly addressable

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
  meta/conf/distro/include/tcmode-default.inc |    1 +
  1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc 
b/meta/conf/distro/include/tcmode-default.inc
index 6eb34ef..6393ffd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -29,6 +29,7 @@ PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= 
"2009.08"
  # Temporary workaround for gcc 4.6.0 ICE with beagleboard
  # gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
  TARGET_CC_ARCH_arm_pn-mesa-xlib := 
"${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
+TARGET_CC_ARCH_arm_pn-qt4-x11-free := 
"${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"

  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
-- 
1.7.4.1


-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



