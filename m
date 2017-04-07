Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0290F77D45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 02:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491532702; x=1523068702;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CMzIFpypzCgg5obmooEpwek1W+bp8HEJ/MUMulWywPM=;
	b=kjOTqIx3LV1cHMCIEZAX2FYd9xfw5IwhzzmhJ8GYWvPqOJru/qjpVAxr
	I4GCd9q+VkIbRmyADKo627yakywWLA==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 19:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="953167712"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 19:38:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 14:38:13 +1200
Message-Id: <4edc896d0720c9d8fb9677c01c98af89d6b94950.1491532173.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1491532173.git.paul.eggleton@linux.intel.com>
References: <cover.1491532173.git.paul.eggleton@linux.intel.com>
Subject: [morty][PATCH 1/1] packagegroup-core-standalone-sdk-target: add libssp
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
X-List-Received-Date: Fri, 07 Apr 2017 02:38:21 -0000

If you want to be able to use -fstack-protector then you need the
runtime support - you can either write this yourself or use libssp
supplied with GCC. If you're using GCC then it seems likely that you'd
just be using libssp, so include in the SDK by default; however use
RRECOMMENDS just in case it's been disabled or you aren't using GCC.

(From OE-Core rev: 6c990655e35bb3a14d59555662ec5802c9980028)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-standalone-sdk-target.bb         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 274e11a..43fc599 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -12,3 +12,8 @@ RDEPENDS_${PN} = "\
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
     "
+
+RRECOMMENDS_${PN} = "\
+    libssp \
+    libssp-dev \
+    "
-- 
2.9.3


