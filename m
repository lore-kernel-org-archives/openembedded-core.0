Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 17D8260670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655391; x=1521191391;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XP6qDUmX+mNnw3Z8lpeGE8Pxd7F/BlGDu13agKDuN1Y=;
	b=nwLXHMfK3f8/ucPEnJls9Vao/xMKzr+1kwfn3p4LS+I2Q76b5qq79sie
	OfwkIVk7O26BTcK+3taY8FivY+xz/g==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:09:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="236881409"
Received: from klim10-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.172.61])
	by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2017 02:09:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 22:09:42 +1300
Message-Id: <b81f5c38920007df83f55c10eea8375baa1828af.1489655348.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489655348.git.paul.eggleton@linux.intel.com>
References: <cover.1489655348.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/base: reformat HOSTTOOLS error
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
X-List-Received-Date: Thu, 16 Mar 2017 09:09:50 -0000

Adjust the message slightly to make it clearer, in particular mentioning
the HOSTTOOLS variable.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index fec351a..cf8748a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -136,7 +136,7 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
             else:
                 notfound.append(tool)
     if notfound and fatal:
-        bb.fatal("These tools appear to be unavailable in PATH, please install them in order to proceed:\n%s" % " ".join(notfound))
+        bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
-- 
2.9.3


