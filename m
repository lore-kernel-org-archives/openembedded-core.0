Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B4F26E6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 00:53:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 16:49:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470435619"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 16:53:10 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 16:59:02 -0800
Message-Id: <f0dae94754c45b461ec889cc88180aece12e5fa5.1390351667.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
References: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390351667.git.dvhart@linux.intel.com>
References: <cover.1390351667.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 17/19] eglibc-ld.inc: Update the inc file to match the new x86 tune
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
X-List-Received-Date: Wed, 22 Jan 2014 00:53:38 -0000

I created this after a git grep to look for files impacted by the x86
tune changes. I need a careful review here to determine if this is in
fact the right thing to do.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-ld.inc |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-ld.inc b/meta/recipes-core/eglibc/eglibc-ld.inc
index b1701f00..6261ae3 100644
--- a/meta/recipes-core/eglibc/eglibc-ld.inc
+++ b/meta/recipes-core/eglibc/eglibc-ld.inc
@@ -22,11 +22,13 @@ def eglibc_dl_info(d):
         "powerpc-nf": ["ld.so.1", "FLAG_ELF_LIBC6"],
         "powerpc64": ["ld64.so.1", "FLAG_ELF_LIBC6"],
         "powerpc64-nf": ["ld64.so.1", "FLAG_ELF_LIBC6"],
-        "core2": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+        "core2-32": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
         "core2-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
         "x86": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
         "x86-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
         "i586": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+        "corei7-32": ["ld-linux.so.2", "FLAG_ELF_LIBC6"],
+        "corei7-64": ["ld-linux-x86-64.so.2", "FLAG_ELF_LIBC6"],
     }
 
     infos = {'ldconfig':set(), 'lddrewrite':set()}
-- 
1.7.9.5


