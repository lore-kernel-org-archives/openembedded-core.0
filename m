Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id CFBE77D3AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:39:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s21so4973571plr.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pFpcqFStI5VNUZYnZDY19UudTzIxDkdYnUbKkU8IRNU=;
	b=NhXRbeLDuokFSm+saGHOGn3Lo0+GkVL1CdOv5VeAvK4IViE1/gf1EF2HEpBIWf9G1j
	QLO+/orWyRPMIy3GXv+o9felHk8fcUM16STp6fDw/h2lhHV3SbZfhGfwcmp3V5f8IfWx
	AMKIPBUFESxyyLwefeJt/p/tgfrcMBuEkF82Y32VlbVsDLC1NxAxLCSO6xA6WB2In54n
	m3YkpuMOlQX7W3/3KNfPCPX3xj0WxaUwToPI8IxrVUldIbDNQlDr11oReyD7aoCrXMhK
	sm/IGO0WclOm8O4WSWpBhUxPbJ7ePP9ofFBJo5WqIoeQGY3Ezstkd9zNpTAliDieRooJ
	VCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pFpcqFStI5VNUZYnZDY19UudTzIxDkdYnUbKkU8IRNU=;
	b=JE2FkNW+TmCJXNFanL6qX6hXr3uEesXnaX/GV0Bo2ewKvO65ASqFsV4DL+Y0omq9Oj
	iOJKZ0atcZAlqEcv4tKXVGB8oe1pp6sx1lzVKeIZEAFildVvsJe5niaZMGVuNlbUcDZe
	EKrU4anWFz9SWuC8R+2rbCSxmkfQwkEtBkXcaTHaERh6nVYoq9lqLwl7ErlmEWRM10Bc
	7enptkCH0ylIk6Ml5GlVBLnfwKZgOQpNhfK6M5JeZWmGn94SExRf64HpB1XvL2/QSoEJ
	UEMpzoopQbNpmoT4lz/gaRRWr6CA4w3GcB+mL+RKEIODXtCIA7Eat8l9yk5bH/gGLhfP
	jSVw==
X-Gm-Message-State: APjAAAVKZNHwEymhAdGXBTZ5ZV2mS0IeJ4PggldIpzzaKcF/6uc7CRh0
	7LJUOsiesraF5CY+DRKvXb2nu4+61xY=
X-Google-Smtp-Source: APXvYqxhRbn2X3q1HxD9omCsSYabSwFSb14sWVwDkyWiu28EW0VQqgfwca7+T65OhB20EHHYwuoy2w==
X-Received: by 2002:a17:902:850a:: with SMTP id
	bj10mr7442085plb.317.1577140765793; 
	Mon, 23 Dec 2019 14:39:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	y21sm5455179pfm.136.2019.12.23.14.39.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:39:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:39:14 -0800
Message-Id: <20191223223914.2274042-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] libdnf: Include mising <stdexcept>
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
X-List-Received-Date: Mon, 23 Dec 2019 22:39:25 -0000
Content-Transfer-Encoding: 8bit

This header is needed for runtime_error element

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-stdexcept-for-runtime_error.patch | 65 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch b/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch
new file mode 100644
index 0000000000..cedf539243
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch
@@ -0,0 +1,65 @@
+From 5f8eee5040d7074710cd542fc50f7a40918321fc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 14:30:22 -0800
+Subject: [PATCH] include <stdexcept> for runtime_error
+
+Fixes
+
+error: class 'libdnf::ModulePackageContainer::Exception' does not have any field named 'runtime_error'
+         explicit Exception(const std::string &what) : runtime_error(what) {}
+                                                       ^~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/867]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libdnf/goal/Goal.hpp                     | 1 +
+ libdnf/module/ModulePackageContainer.hpp | 1 +
+ libdnf/repo/solvable/Dependency.cpp      | 3 ++-
+ 3 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libdnf/goal/Goal.hpp b/libdnf/goal/Goal.hpp
+index f33dfa24..7b8d822c 100644
+--- a/libdnf/goal/Goal.hpp
++++ b/libdnf/goal/Goal.hpp
+@@ -22,6 +22,7 @@
+ #define __GOAL_HPP
+ 
+ #include <memory>
++#include <stdexcept>
+ 
+ #include "../dnf-types.h"
+ #include "../hy-goal.h"
+diff --git a/libdnf/module/ModulePackageContainer.hpp b/libdnf/module/ModulePackageContainer.hpp
+index 1f815fda..37a8832d 100644
+--- a/libdnf/module/ModulePackageContainer.hpp
++++ b/libdnf/module/ModulePackageContainer.hpp
+@@ -30,6 +30,7 @@
+ #include <string>
+ #include <vector>
+ #include <set>
++#include <stdexcept>
+ 
+ //class ModulePackageContainer;
+ //typedef std::shared_ptr<ModulePackageContainer> ModulePackageContainerPtr;
+diff --git a/libdnf/repo/solvable/Dependency.cpp b/libdnf/repo/solvable/Dependency.cpp
+index 6682b729..0fc8b5cd 100644
+--- a/libdnf/repo/solvable/Dependency.cpp
++++ b/libdnf/repo/solvable/Dependency.cpp
+@@ -18,6 +18,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#include <stdexcept>
+ #include "Dependency.hpp"
+ #include "libdnf/utils/utils.hpp"
+ #include "libdnf/repo/DependencySplitter.hpp"
+@@ -106,4 +107,4 @@ Dependency::getReldepId(DnfSack *sack, const char * reldepStr)
+     }
+ }
+ 
+-}
+\ No newline at end of file
++}
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 3f11e0231f..882c435b32 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
+           file://0001-include-stdexcept-for-runtime_error.patch \
            "
 
 SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
-- 
2.24.1


