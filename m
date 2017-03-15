Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1994473109
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489616021; x=1521152021;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=SI6iovcHAgeH2q+sqoVylxmJzpf8PSljl9FA+VsqL30=;
	b=dQIZWWA5BDcJKoFFAXkiBvl2SrU5BAr1Ym2Dx+4rbbmgd7GFw5cKs5sG
	nzodBMNJ2T0Pw4PQsdGcfhlOI7Xt6Q==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 15:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1108897486"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 15:13:40 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 15:13:38 -0700
Message-Id: <1489616018-8969-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
References: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 3/3] build-appliance-image: ensure pod2man present in BA
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
X-List-Received-Date: Wed, 15 Mar 2017 22:13:40 -0000

"pod2man" went missing from BA, but it is required.
This patch fixes the Toaster error:

<...>
ERROR: These tools appear to be unavailable in PATH, please install
   them in order to proceed:
       pod2man
<...>

[YOCTO#11144]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index b1d2250..5107246 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
                  kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcp-client \
-                 tzdata python3-pip"
+                 tzdata python3-pip perl-misc"
 
 IMAGE_FEATURES += "x11-base package-management splash"
 
-- 
2.7.4


