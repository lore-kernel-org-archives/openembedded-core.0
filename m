Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8CF746FA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 13:00:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w10-v6so13312287wrk.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 06:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Lusqrx26RBGu00zHOaz15NHdksrLvXGyDbHNv6/IkQk=;
	b=Jf74fOSRY/SsX0wLBGwdrVdMQ9qVe+LG1FWF85QfRV3uv/LdkctmptC1SrXLSbF4Ea
	ElO/DCngYRsEbU3MVvW7AqKxoZMJN+EJo0NJFk/o2ps4elTvpTotIK3T1YUzuI0sPlN+
	j9ei9xTwfYwO6PVUOmiIhgypxkkpRYk6jYZHM02nqul7V5C0RyRS4C7kVF/FBvF0wml0
	h0eiq+kG8Zu1xxSr+ogukyaVh8K41gQVOafykigf28QfR6j/zzubvvMXrvhhA6mtuRGl
	zyDk5r5P0VEX/6NgAv56qIwEiwmpk93N1E0iw5kY6t7g7RtlH1VfDff4GfHED86aCThe
	O9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Lusqrx26RBGu00zHOaz15NHdksrLvXGyDbHNv6/IkQk=;
	b=tk0aLfnZOszYYAl8gX5FlkTzytRBiQ38/NYo7kFIMoHXuH4EfIqmtnj+jySbZ9+JbR
	og0Vz2w41eVMpJZbOcmLDGnmFLSqvYliut0xAIaMHE6UOK3rH18xyq9LyUD4K5Jn2t1R
	NJoh8PVN5MHVNzXX044FNnE2c2AqYj3iojnqJUXGCns0RR5NfqdX/111CQGlhaSkBatX
	HVDrssuscrqSm2RnesxT8o//EbHYnKrqElBF6B0MCSBdguE4BfK3btQ3oMBFJFpGFpc0
	hH4Ydlqmb3uPW/rvU6aOCoRArq3C9yWu/2Y3jIKKptpUzCRN0+Mbq2vX0mfcmvRGQbPH
	k+Ag==
X-Gm-Message-State: APt69E3yoYx0Zh2S0TpOCpRAfVJc31NUFOnPlBcbBZnrubv6XQy4Co0y
	fW/02xp1/IUeJx4hgQwXIrHbwndQ
X-Google-Smtp-Source: ADUXVKK3Iy8SLEty26xNXdsQ88K6FV3LDWlyUgyN3KnVx3enijeKdg2oubjcKADvuHXmlMuWCQgMww==
X-Received: by 2002:adf:a645:: with SMTP id
	k63-v6mr5329319wrc.231.1528462856806; 
	Fri, 08 Jun 2018 06:00:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e13-v6sm47433318wrm.45.2018.06.08.06.00.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 06:00:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 14:00:52 +0100
Message-Id: <20180608130052.2598-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] cmake: fix Upstream-Status tag spelling
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
X-List-Received-Date: Fri, 08 Jun 2018 13:00:56 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch     | 2 +-
 .../0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch     | 2 +-
 .../0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch     | 2 +-
 .../0004-FindBoost-Generate-imported-targets-for-future-Boost.patch     | 2 +-
 .../cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch        | 2 +-
 .../0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
index a45eda52011..b3a75206f72 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-FindBoost-Fix-incorrect-alphabetisation-of-headers-l.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/6] FindBoost: Fix incorrect alphabetisation of headers list
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch b/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
index 88301c64c06..d5d442a519a 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-FindBoost-Implement-Architecture-and-Address-Model-t.patch
@@ -8,7 +8,7 @@ library file name layout.
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch b/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
index 5178f5c4dc6..a44fa3e3665 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-FindBoost-Search-for-upstream-packaged-libs-next-to-.patch
@@ -9,7 +9,7 @@ Upstream packages Boost binaries for Windows with the 'boost' directory
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch b/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
index bec04c4c140..8101e8f479c 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-FindBoost-Generate-imported-targets-for-future-Boost.patch
@@ -13,7 +13,7 @@ support newly-released Boost versions pending a new CMake release.
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch b/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
index 37d69ba0808..c0330fb335a 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-FindBoost-support-OPTIONAL_COMPONENTS.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 5/6] FindBoost: support OPTIONAL_COMPONENTS
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
diff --git a/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch b/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
index d25cd356d53..edcfdbefa57 100644
--- a/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
+++ b/meta/recipes-devtools/cmake/cmake/0006-FindBoost-Add-support-for-Boost-1.67-with-Python-ver.patch
@@ -8,7 +8,7 @@ Fixes: #16612, #16335, #16391, #12955
 
 Affects cmake < 3.11.0
 
-Upsteam-Status: Backport
+Upstream-Status: Backport
 [Yocto 12762]
 Signed-off-by: Armin Kuster <akuster808@gmail.com>
 
-- 
2.11.0


