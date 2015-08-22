Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB0675794
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 17:00:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2015 10:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,728,1432623600"; d="scan'208";a="753503567"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2015 10:00:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Sat, 22 Aug 2015 09:55:14 -0700
Message-Id: <1440262519-13582-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/5] Support for "baremetal" toolchains
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
X-List-Received-Date: Sat, 22 Aug 2015 17:00:11 -0000

These patches allow building "baremetal" images, in particular
"baremetal" cross-compilers. The cross-compilers make no assumtions about
target OS and come with no "C" libraries.  

I tested the patches with the following in local.conf:

PACKAGE_CLASSES="package_ipk"
SDKMACHINE="i686" 
TCLIBC="baremetal"
 
MACHINE="qemuarm" 
MACHINE="qemux86"
 
GCCVERSION="5.2.0"  
GCCVERSION="4.9.3" 
 
The patches are based on the original work by Richard Purdie.

Juro Bystricky (5):
  tclibc-baremetal.inc: baremetal specific distro policy file
  gcc-cross-canadian.inc: overrides for libc-baremetal
  gcc-cross.inc: overrides for libc-baremetal
  libgcc-common.inc: overrides for libc-baremetal
  cross-canadian.bbclass: support for TCLIBC="baremetal"

 meta/classes/cross-canadian.bbclass              |  3 +++
 meta/conf/distro/include/tclibc-baremetal.inc    | 32 ++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc |  4 +++
 meta/recipes-devtools/gcc/gcc-cross.inc          |  4 +++
 meta/recipes-devtools/gcc/libgcc-common.inc      |  6 +++++
 5 files changed, 49 insertions(+)
 create mode 100644 meta/conf/distro/include/tclibc-baremetal.inc

-- 
1.9.1


