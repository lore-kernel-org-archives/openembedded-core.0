Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hl+KS+Ft0WkvtZalbzdUQN4Rh0ISwiyNxzPtd174QzSwDzFi2Gn0LN4vujbm+Z7q4yM8MpSY6r
 +pf4YufPebQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163178007"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163178007"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:37 -0800
IronPort-SDR: xy4294HpbBd3p6gZh5YYq6AJFUWCaJ5HQNVslfKDGeqPh3tHGChgm4NdXEDSBNIHg4xcf7vs4g
 FRAevtIlNeLA==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269220"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/12] btrfs-tools: upgrade 5.10 -> 5.10.1
Date: Thu, 18 Feb 2021 12:24:16 +0800
Message-Id: <20210218042418.281245-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../btrfs-tools/{btrfs-tools_5.10.bb => btrfs-tools_5.10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.10.bb => btrfs-tools_5.10.1.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
index 8095319f0c..fca010d4ae 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "273380d98f4412ae8b0f35ad69debf682e48c6bd"
+SRCREV = "f2ffce38b9c1477a7350bfe165f0e34b9bde40f5"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.29.2

