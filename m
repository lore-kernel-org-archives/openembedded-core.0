Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id EEFCA7F888
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:39 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id g6so13818720plt.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pFpcqFStI5VNUZYnZDY19UudTzIxDkdYnUbKkU8IRNU=;
	b=RKi9ivNKJn4ACbNKyOXs4+68sMZ2fmdXeLCvgabuzfiSf5kL/1DMCCfwxt+YPHZYnQ
	+uBGPgXeoRoWcCAUY5bJWxxG7cgiN81Y4G+glmW5eQhmQ4szpx0glXcBfx1rqX1c7O8Q
	smnuFa5GzZEHmEwQvd/ZlrJH+89kYyNn0FFh0l5sMrO0g64A4uQRFKlmiVwKN9unv202
	Fmbs/VXEwcnFe8tbzCsHndEAz2CUWr3x649E8M5W4To5c14syGVTOvIgI23kfKyIsCiW
	uUXvWin7eljFyo8HZ+b6AdoL2ve5UBmqzfyZfUlM/AkvoJW/ujglEf+pr+s2oETOyJhe
	4TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pFpcqFStI5VNUZYnZDY19UudTzIxDkdYnUbKkU8IRNU=;
	b=E8hiEGhxRIOwTsVjMkSCNR1H+I4emmUIjM68cVGIuBYJAq4MT9Ba1dXzHUW6ULN9M0
	0tbbeqk0hs03ggFrftYygAQWE3ILgVivf5DazIIAJ7Lvxh2tktQrQ02JcwoNn+dbF0+u
	CtXihgT2L7Mh+d5axBrEBYehhyxEeZAMvSKwpBaiQpke8ztR7z7m/u8Ukzk5Ncs+8Ckl
	g8jLSDURY0pOKVgBebP3T+toqs5X4ekmhRr+RhI9ZPiuA5w7bLBpskxNU+zHnB1xeqsf
	OLIUywok5DcgOSh02QDTED4jLHZEpoxevXANgglkkdM6d8Guv6rBfRnjuPpU7oWVIPIQ
	N/uA==
X-Gm-Message-State: APjAAAWtVvm5rJglvyij6kSyv115U2j9niRwvPkzyk5h89F1Nv+qBpsA
	H8NVby0P1WYhnVkMFq/57QVg/kmt6Vk=
X-Google-Smtp-Source: APXvYqyFveDMvUPJMpXrwHL8JlXdKhECHHNiWlb17CSom/84JkMxHO5PpCzjtihCpLji17JLkikJ8A==
X-Received: by 2002:a17:90a:da01:: with SMTP id
	e1mr41902504pjv.29.1577645080674; 
	Sun, 29 Dec 2019 10:44:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:11 -0800
Message-Id: <20191229184415.19514-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/19] libdnf: Include mising <stdexcept>
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:40 -0000
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


