Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 848A77D67C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 09:41:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f2so2371338wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 02:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wjhrskZOC60B/SbKU7JXLImYiEE7BXgMIZpE4In7EBo=;
	b=K4P+9xAVWb6z/gBZu7Re2J6a8n97+M7UZRqw/nCtgpfPFD0B5URcl8ZzjVHAJMTvXv
	peH5qkvpiaMhU/1/CM1WZwBvVc1BgJQ76HD8eHDcY5hddZOXhBeIgfSxKbZ6GaJP0P1y
	Ln1hiO977+3p3VIr4TEOPWEY7UdDhmBFPakKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wjhrskZOC60B/SbKU7JXLImYiEE7BXgMIZpE4In7EBo=;
	b=CZKCu4HfxGnmkcqHVO1Llb2VVVTKcC9R8XPm/UqGckA93PXSaBsMfdsREVVkhGL7Nf
	n9axSX4D4JBY6TZeRIpQS2tnqOCdhiDghwmuuNV/x2pf7LstAqV6BfW1ALFuyzL+Jy1x
	Z3SceWaYOSzzzAjq/aCkKxOCD6fCOdkY5aeHTNQQsaJ/v+2qQV2hTAOZtvt/gDJLUXy1
	hdhMexxJnrDqDePUpJJD6gjawo9Ch771myxmhLsU1DZXQ5dMn/jYv7E1h3oXDjrniqWB
	AA+9j8ajzUfURkOkaXLyKvaH9n1oYrtwHP0wYZ/LzlI/VTuKlURyOAj5y+MS2R1wE/3i
	YFbw==
X-Gm-Message-State: APjAAAUoCyZUqfCcLsy3B0OsgSrevQxu99GO+m8bnItXfDBF2glOXfBI
	qvnf50/2A0zFQ4PYfNde2FDAw6fky8U=
X-Google-Smtp-Source: APXvYqxUnez6JveUVAO4ST28OsoQXde4+jcQf6O109gV2YvLnAwbh8X3Fq9qhARq9gGX1rnByZwajg==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr2262196wml.108.1557308511924; 
	Wed, 08 May 2019 02:41:51 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	15sm3689806wmx.23.2019.05.08.02.41.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 02:41:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 10:41:49 +0100
Message-Id: <20190508094149.19945-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] openssh/systemd/python/qemu: Fix patch Upstream-Status
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
X-List-Received-Date: Wed, 08 May 2019 09:41:51 -0000
Content-Transfer-Encoding: 8bit

Fix some missing or corrupted patch Upstream-Status values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-upstream-Have-progressmeter-force-an-update-at-the-b.patch | 2 +-
 meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch  | 2 +-
 meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch   | 2 +-
 .../systemd/0025-fs-utilh-add-missing-sys-stat-include.patch    | 2 ++
 ...1-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch | 2 ++
 ...3-Revert-target-arm-Use-vector-operations-for-saturati.patch | 2 +-
 6 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
index 2fb57da635a..4c9d574421d 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-Have-progressmeter-force-an-update-at-the-b.patch
@@ -8,7 +8,7 @@ end of each transfer.  Fixes the problem recently introduces where very quick
 transfers do not display the progressmeter at all.  Spotted by naddy@
 
 OpenBSD-Commit-ID: 68dc46c259e8fdd4f5db3ec2a130f8e4590a7a9a
-Ustream-Status: Backport
+Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  progressmeter.c | 13 +++++--------
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
index e2fc607ff82..c5b3baece99 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2018-20685.patch
@@ -9,7 +9,7 @@ current directory; based on report/patch from Harry Sintonen
 OpenBSD-Commit-ID: f27651b30eaee2df49540ab68d030865c04f6de9
 
 CVE: CVE-2018-20685
-Ustream-Status: Backport
+Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  scp.c | 5 +++--
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
index 80cf39b9230..e498da38194 100644
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2019-6111.patch
@@ -18,7 +18,7 @@ has been in snaps for ~1wk courtesy deraadt@
 OpenBSD-Commit-ID: 00f44b50d2be8e321973f3c6d014260f8f7a8eda
 
 CVE: CVE-2019-6111
-Ustream-Status: Backport
+Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  scp.1 | 12 +++++++++++-
diff --git a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
index 1c6a6f50de3..bae9d3eaad4 100644
--- a/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
+++ b/meta/recipes-core/systemd/systemd/0025-fs-utilh-add-missing-sys-stat-include.patch
@@ -7,6 +7,8 @@ fix error:
 | error: passing argument 5 of 'chase_symlinks_and_stat' from incompatible pointer type [-Werror=incompatible-pointer-types]
 
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+Upstream-Status: Pending
 ---
  src/basic/fs-util.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
index 06eb2bd35bd..a0ed7cc830e 100644
--- a/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
+++ b/meta/recipes-devtools/python/python3/0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
@@ -10,6 +10,8 @@ PYTHONHOME. Creating another variable OEPYTHON3HOME to allow for a way
 to set a different path for python3
 
 Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
+
+Upstream-Status: Inappropriate [OE specific configuration]
 ---
  Modules/main.c | 17 +++++++++++++----
  1 file changed, 13 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch b/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
index c38b547e2c3..3d018a74d9c 100644
--- a/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
+++ b/meta/recipes-devtools/qemu/qemu/0013-Revert-target-arm-Use-vector-operations-for-saturati.patch
@@ -8,7 +8,7 @@ This reverts commit 89e68b575e138d0af1435f11a8ffcd8779c237bd.
 This fixes QEMU aborts when running the qemuarm machine.
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-status: Pending
+Upstream-Status: Pending
 ---
  target/arm/helper.h        |  33 -------
  target/arm/translate-a64.c |  36 ++++----
-- 
2.20.1


