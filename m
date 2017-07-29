Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E29E78547
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 08:35:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 125so12249055pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 01:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ymzsqK7gawJiVolsXrsg1n49iHjl+7xiU1uN6Lt1wE0=;
	b=fhtqaoeMIGiqMUtM5lKkptkNRGj/aJrpVKekZ7EKXMWmiE3TrisRtsnw0A9Pi4SwCN
	cn0RsSnq5IUHNIyAGWhkROv77HL3QF3KkMKF3CqVN4ehLwUchTEnPIkK9hyLj5X32c2t
	LlpfKRNDB8kXDichjMvXUVXe+3pHPoYvJ906zeXa7V0t5nds8KFp07b6sE+qDGdOmDAZ
	ZU4yfct+cSFgvHzZ3qMw/xfIbsjLXtTuDOSXQbyZFKuWeFKIl85P8UyVrsN9C6wj6BGl
	XQTsJPVyflcwDH/YgHOcFklxccFzBALcgPuEBbI2rywqu1tOAKYAvHDecCufkJ6stj7v
	HFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ymzsqK7gawJiVolsXrsg1n49iHjl+7xiU1uN6Lt1wE0=;
	b=OKxcPU+OoVqHh1eBsD/FvtAsYZjysYt5fgpF90HJ5rDpZUtVqbkKa7Unyi0mXHYr7v
	4sGC8HX6cRb7DJBjFGjd73FShThIdPZa/XYjQrYfEO7pzu15UYvrwYOQSpDugIzk+wwt
	VB9s497DKE4G4cSRoDBceIhx4IeCiejYupPd6OmsulP45B/EXN8x3lJlK+ZBWcJcnaf1
	V80uTd8xBKY8+e/Mc0tuBhpzVgF//rPt/XmSEd87rNJ9cE7u0Ui8Lx11YKY/jqmHzTx1
	CG0lrX8mBYsktCNReS+LJ0zkQcjY7orSmTdTo/Vdq2mMujQODcEj8vQEZaI5JV0Z6hdo
	IRAw==
X-Gm-Message-State: AIVw113nxuBuF1DWjb9hykvCnCXoIVTtbWmHcN+y1aaFHkRgj+8Tf7Ka
	E3R8H4ujkmD8Htvo
X-Received: by 10.84.132.40 with SMTP id 37mr10700683ple.149.1501317337267;
	Sat, 29 Jul 2017 01:35:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	g15sm6605689pgu.22.2017.07.29.01.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 01:35:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 01:35:28 -0700
Message-Id: <cover.1501317178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH V3 0/4] llvm: Add recipe for 5.0
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
X-List-Received-Date: Sat, 29 Jul 2017 08:35:36 -0000

Create a recipe just for building llvm, which is needed by many other packages e.g. mesa
can use it for llvmpipe

Fix mesa to work with llvm 5.0.0

Add supporting recipes needed to build llvm

The following changes since commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e:

  core-image-minimal-initramfs: use initramfs-framework by default (2017-07-27 22:20:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/llvm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/llvm

Khem Raj (4):
  ninja: Add recipe
  re2c: Transfer recipe from meta-oe and upgrade to 0.16
  llvm: Add recipe for 5.0
  mesa: Fix build when building with llvmpipe

 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
 .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
 meta/recipes-devtools/llvm/llvm_git.bb             | 166 +++++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.7.2.bb         |  29 ++++
 ...1-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch |  40 +++++
 ...allivm-Fix-build-against-LLVM-SVN-r302589.patch |  49 ++++++
 .../mesa/files/llvm-config-version.patch           |  23 +++
 meta/recipes-graphics/mesa/mesa.inc                |   7 +-
 meta/recipes-graphics/mesa/mesa_17.1.5.bb          |   3 +
 meta/recipes-support/re2c/re2c_0.16.bb             |  15 ++
 10 files changed, 462 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
 create mode 100644 meta/recipes-graphics/mesa/files/0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch
 create mode 100644 meta/recipes-graphics/mesa/files/llvm-config-version.patch
 create mode 100644 meta/recipes-support/re2c/re2c_0.16.bb

-- 
2.13.3


