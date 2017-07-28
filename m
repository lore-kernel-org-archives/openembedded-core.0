Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 094FE78399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:56:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 125so9039333pgi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=iRTKRUkNflTJIPjZAzaKZS/tPoejIn0yWgwLhrTKUx8=;
	b=B4t7quwOpx1FquF07CDmbho/JFb6Pm4lsMvI7nCqyKpurxLsXrl++3ekP9K/jm2Wvx
	xmvo2ZX1JTBiG+UDrXyCd+OBdZ/HMNVYBCJypxx/FnniB/5seZbtHRK0UfXr/0WFO536
	uZ82i+lYDl7c3C9fRwqtns/gPVPkg9tCba2oi10K5P3l/4sPCu94V0uacItJMSNWp4eK
	ek+DCsiLY1lu/ETWWE49RxQkGEtwf+Rdk+IwhmpY+jE0Y1n++oeiICn0uZPMUqD2U2ri
	ty1sChVi/emi/GVVe1n4iVKmzl74jJ92drDT3DDnV3EjQqT8Oq6Y/IXhh0SNGsn2q36R
	B+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iRTKRUkNflTJIPjZAzaKZS/tPoejIn0yWgwLhrTKUx8=;
	b=HhX+xEvUclIee1Y2CCmQp0Y2stAyK0n0lOAhhf1vRPGtGnSRtw/yXzx4g428++Ph7B
	YvNJ3HQsQr8JtPMrClVipa5yqsdW5hBzK7ilk9IG4obW0R86LA/5OG1Ebh6Yd1lECL7S
	9ilsdL89ow5bA1DmO8+mGUVcgge41klg71ngPuoDuZJeRvfKHIDEJ5nMzHt38xViJxqX
	irSBRL0uEyjYVWe6Vya/22AV3RGXrMCp9IYSlqn3hLC0ISn7mRgxmkf0OgZs7xATP3tO
	sl8nJwbO/5pNG4Ffs/EOlXa7qaX83sBZKzrFVdfHG/eVTtxHGMf859VUgYzcREXnMRuO
	MEWA==
X-Gm-Message-State: AIVw112TR3nFzJOpjFoUkU1XzQtfdgrqx6j27IC3q6C8n0gw6AODZz+H
	qin9/Bxrn977khIl
X-Received: by 10.99.148.2 with SMTP id m2mr6398168pge.291.1501217763928;
	Thu, 27 Jul 2017 21:56:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	p123sm37082712pfb.177.2017.07.27.21.56.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 21:56:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jul 2017 21:55:54 -0700
Message-Id: <cover.1501217624.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH V2 0/2] llvm: Add recipe for 5.0
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
X-List-Received-Date: Fri, 28 Jul 2017 04:56:03 -0000

Bring in ninja recipe from meta-oe since llvm is using it

The following changes since commit 28fc6ba761ed4a47efa7c43e7f7dff5e2fe72b5e:

  core-image-minimal-initramfs: use initramfs-framework by default (2017-07-27 22:20:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/llvm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/llvm

Khem Raj (2):
  llvm: Add recipe for 5.0
  ninja: Add recipe

 ...LibraryInfo-Undefine-libc-functions-if-th.patch |  93 ++++++++++++
 .../0002-llvm-allow-env-override-of-exe-path.patch |  39 +++++
 meta/recipes-devtools/llvm/llvm_git.bb             | 169 +++++++++++++++++++++
 meta/recipes-devtools/ninja/ninja_1.7.2.bb         |  29 ++++
 4 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm_git.bb
 create mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb

-- 
2.13.3


