Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Ty5Xkiqf4N1TccNP245oIXZYxo4JRpmT7bJtOlpsN3oQfCkJuMcjUt/05Nn5G+x3BcJkceJfR5
 tYa2BCKDrXcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794721"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794721"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:04 -0700
IronPort-SDR: iM0o88Xm+1X2dlUhtZxlvXHPe5mgD9oTDHY/ZHbiJpR3Vj1kOx8mYEC9sJICSXXK5MyZ3clpAL
 FUvSo/EghpwA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331581"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/31] yocto-uninative: Update to 3.1 which includes a patchelf fix
Date: Fri,  7 May 2021 15:02:22 +0800
Message-Id: <2f8edab7ccc80144a7575c8e95c463a161bf5c82.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d9d38eb6b3621fed58a217eeb4de1816e3e6487)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a2a2dd18ec..05b79d14c3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.0/"
-UNINATIVE_CHECKSUM[aarch64] ?= "1c668909098c5b56132067adc69a249cb771f4560428e5822de903a12d97bf33"
-UNINATIVE_CHECKSUM[i686] ?= "e6cc2fc056234cffa6a2ff084cce27d544ea3f487a62b5e253351cefd4421900"
-UNINATIVE_CHECKSUM[x86_64] ?= "5ec5a9276046e7eceeac749a18b175667384e1f445cd4526300a41404d985a5b"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.1/"
+UNINATIVE_CHECKSUM[aarch64] ?= "7fa12b9fe7a95934cc09beb0e8a25ff97179ef3105116015d32548eadd27b024"
+UNINATIVE_CHECKSUM[i686] ?= "bbfcdd48336800b5af97e294918c6586a0a8fa903f127f813b0bd5110de8c55c"
+UNINATIVE_CHECKSUM[x86_64] ?= "5d0611df544edff6428cef7d871257a91aa6ba1bd92f5365a2df8deb54b6b31e"
-- 
2.30.2

