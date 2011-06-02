Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xK-0006YL-HR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775242"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:08 -0700
Message-Id: <23f9d25f6c692d6415f898e1e353a72d92d762f2.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/12] ghostscript: Fix up file locations and add i686
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:38 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../ghostscript/{ => }/ghostscript/arm/objarch.h   |    0
 .../ghostscript/{ => }/ghostscript/arm/soobjarch.h |    0
 .../ghostscript/{ => }/ghostscript/i586/objarch.h  |    0
 .../{ => }/ghostscript/i586/soobjarch.h            |    0
 meta/recipes-extended/ghostscript/ghostscript/i686 |    1 +
 .../ghostscript/{ => }/ghostscript/mips/objarch.h  |    0
 .../{ => }/ghostscript/mips/soobjarch.h            |    0
 .../{ => }/ghostscript/powerpc/objarch.h           |    0
 .../{ => }/ghostscript/powerpc/soobjarch.h         |    0
 .../{ => }/ghostscript/x86_64/objarch.h            |    0
 .../{ => }/ghostscript/x86_64/soobjarch.h          |    0
 11 files changed, 1 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/arm/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/arm/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/i586/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/i586/soobjarch.h (100%)
 create mode 120000 meta/recipes-extended/ghostscript/ghostscript/i686
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/mips/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/mips/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/powerpc/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/powerpc/soobjarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/x86_64/objarch.h (100%)
 rename meta/recipes-extended/ghostscript/{ => }/ghostscript/x86_64/soobjarch.h (100%)

diff --git a/meta/recipes-extended/ghostscript/arm/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/arm/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
diff --git a/meta/recipes-extended/ghostscript/arm/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/arm/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
diff --git a/meta/recipes-extended/ghostscript/i586/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/i586/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
diff --git a/meta/recipes-extended/ghostscript/i586/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/i586/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
diff --git a/meta/recipes-extended/ghostscript/ghostscript/i686 b/meta/recipes-extended/ghostscript/ghostscript/i686
new file mode 120000
index 0000000..87aaca5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/i686
@@ -0,0 +1 @@
+i586
\ No newline at end of file
diff --git a/meta/recipes-extended/ghostscript/mips/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/mips/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/mips/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mips/objarch.h
diff --git a/meta/recipes-extended/ghostscript/mips/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/mips/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
diff --git a/meta/recipes-extended/ghostscript/powerpc/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/powerpc/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
diff --git a/meta/recipes-extended/ghostscript/powerpc/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/powerpc/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
diff --git a/meta/recipes-extended/ghostscript/x86_64/objarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86_64/objarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/x86_64/objarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/x86_64/objarch.h
diff --git a/meta/recipes-extended/ghostscript/x86_64/soobjarch.h b/meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
similarity index 100%
rename from meta/recipes-extended/ghostscript/x86_64/soobjarch.h
rename to meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
-- 
1.7.3.4



