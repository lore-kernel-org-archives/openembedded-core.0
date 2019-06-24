Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id D548A7E466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 12:44:46 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r185so384823iod.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BwMKq1vwZ6/Klh8U7oLx5ms0bObqttRwHnszsfnIcPo=;
	b=t6obZIiWRSzauZ3Gu3g+GOI8FJlvgmln4GTYHCNQKvtUQwKVnDH6E++J4DjMO6MJI/
	+kUb2ey9Ay0UNW02kbnnyx4C1AA9i1uCgp0myJWWIyGYt2D/3rNwM8vBRlm5pVwy57jI
	x8yW1a8akncIMuEu/gLVGvbcHpEBZyE/zwWKXlLmoJERu5MN8Pdvo9+cyQ7MnwHuCCks
	/WGaCekBfGB8VS0FkZRFhx+JtmzoLAAn0GhMMbWBbX2fLdGEdRk/cGmQ88vSPYDcIEH+
	cuJFewG2cQYd5xdyRv9XejOdPtEpk21RvDwB/wG/gIi50mgYFdCnCTVot4V7CXwUOlHD
	ZvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BwMKq1vwZ6/Klh8U7oLx5ms0bObqttRwHnszsfnIcPo=;
	b=PD0bOJy1gVz1avmp59IQ4Vu5brkGzjJAM6QB5knlDf3j4KS7K6+LrF0IKB6fWMs2SI
	u8lCWP2AAh2OWCwFkFKpO3SkUYlVjqmKrmCERC+49IhwOS9EmZtpZaxynYr7BPkZYA0X
	uFLGSZDamoy4KDqaYC+pzUEin0b2adEi2E+9480SQeF6FTd391yKuOx/1dJFnyKm0Q6u
	P9KChPokqycDTWGQS2AVduf5mUOxm1Gro5g0IynQwnAKMtuB1I0wxymUGtT7wj93zRSE
	hUc30q96/6Y/d7cg40XRLkqY7xZVaMZt2uOAjJz66h6VQTd0RGPLW2FK6wVHpywyMIIj
	Gpjg==
X-Gm-Message-State: APjAAAXM4qeJx+F37sbdZIdCbULbyMnMF2KdtcBFyV9yxy+m9EHIUKX9
	np61fsHQlQrK+wd4H3I4Evg=
X-Google-Smtp-Source: APXvYqxv+H7jF0J72eFTQMafU3CEnyDg4kBwnFGBIphSbgWBAXttRmW2IH2INK7aOB7bDifkDAvMOA==
X-Received: by 2002:a05:6602:220a:: with SMTP id
	n10mr680755ion.205.1561380287902; 
	Mon, 24 Jun 2019 05:44:47 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	q15sm10119321ioi.15.2019.06.24.05.44.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 05:44:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Jun 2019 08:44:42 -0400
Message-Id: <d3d3d374e985ccfe061a986d2735791476b24511.1561379933.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1561379933.git.bruce.ashfield@gmail.com>
References: <cover.1561379933.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.0: make scsci-debug include scsci core configs
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
X-List-Received-Date: Mon, 24 Jun 2019 12:44:47 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the scsci-debug fragment to include the core scsci config
options. This allows standalone use of the fragment, since all
supporting options will be enabled simply by including the top
level config in a BSP.

This also removes a configuration warning on qemuarm, since we
will no longer have missing / unavailable options during the
config audit.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index c5bd342d5b..35f2350d52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index d6e45c69c0..96cfb3dcd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 5bc2d54916..d4d30853f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
 SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
 SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
-SRCREV_meta ?= "97eac3146504a2348543b8b8859f44a7b8f0d590"
+SRCREV_meta ?= "eb6ef084f987441359145c41cadcbdd768eeb012"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


