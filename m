Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B2A2D7CD37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 05:34:32 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id l139so17479210ita.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 21:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lj9FV6YPDV4jJfxO+fAyJ9p30xOtZymLe3KZ/eUtiJs=;
	b=aCTm5L92pv87FR4mZF/4LiLRZCpwaU3/awf0A9VKXa8USXXfBOIPj+ycD1vNbI+TVs
	PGbwSIMcOWcUmyuuKPtrgYGFbbkKvFsj62rps5rd+VFSzNuEpuk/XdugAk0LrnTOGC+0
	e7w+5aikTLwN+mvms6FPYBqvYI47/OA16Cts9mG0iodut+8jMkxU4YdEqQqRE7d63uhl
	aSnj8z6D5Ims1+ZdkkIdhrXJkWekQSCT0DYyqfFc/DZEYZYUUBvIEZUCYbkUy+7ZyNP1
	j4jbHRqBHYXV7Uo4CIvzRPtua2v7fTZQhr7V68QJLCwCSpJiCR/S/KEz4X6h0A/0clfB
	hNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Lj9FV6YPDV4jJfxO+fAyJ9p30xOtZymLe3KZ/eUtiJs=;
	b=ler5Ok15z/uhAbmzDWMN/StABYJIUwkMpQMWGvBBTJi6rW/VASW+bjgJQLnZAxSXT3
	bfipg8GMPX26zvBNY7OEqIyj62zIRSrw84xfJQI/xZl5VexQIQnTiw3UejKGWEgBucoW
	ZVeDJdgUvmt9M2K2EgOWdarho5aUCRYFxZveIWvvgj/RrGvaqXVXbvvT00P0VJXSW4sg
	BX2tGNsyCo7emdxWlxefUPpn+bHDdMx2etqQqYO7RGCEf6kQVHnh58qBq5VM1s3FEccB
	kAuzpsCTvRRrYRQJIQujVEcWOBDKg6v1gBMrSgVIcx2F7DArGwk+xa8w6+igug+zIS4G
	BhqA==
X-Gm-Message-State: APjAAAVKluPgA6W39GQE54zf8cB145gitcKZzaBt0lZLA9QezJURIAFr
	ERYxWR9kS15QCEc66UuGHJY=
X-Google-Smtp-Source: APXvYqzD74V1nnLnx4qHYx+L+FsqvH0nmKpqeF7BGO4Tk9sMcOgD+9Rq/Gt2vWaU+GheXTmF7iFOFQ==
X-Received: by 2002:a24:730f:: with SMTP id y15mr2183132itb.126.1551418473561; 
	Thu, 28 Feb 2019 21:34:33 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id k77sm3935110itb.7.2019.02.28.21.34.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 21:34:32 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Mar 2019 00:34:25 -0500
Message-Id: <356c0ac2d21b8e45341bf703ad8d43bef5fd0e44.1551418113.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551418113.git.bruce.ashfield@gmail.com>
References: <cover.1551418113.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto: qemuarm|qemuarm64: graphics support
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
X-List-Received-Date: Fri, 01 Mar 2019 05:34:32 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the configuration changes from Jon Mason <jdmason@kudzu.us>
to enable graphics for qemuarm/qemuarm64.

Note: we are also remapping qemuarm to qemuarma15 in the 4.19 kernel
      as part of this graphics enablement.

Note2: This requires the machine/configuration changes also sent by
       John to have working graphics.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 18f84827fd..07dc5b77a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3059029718900250904b9f587e37ba22fb949ea6"
-SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
+SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 8efa9cbe3e..c6d1594a82 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "6cc861e796ab19a6827cf9996e7755f1875d553e"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
+SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 9e29379a73..5a64e1babe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,10 @@ SRCREV_machine_qemux86 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemux86-64 ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
 SRCREV_machine_qemumips64 ?= "fc7a2bf24e0e39b6a260f8650a3c8d497b8cdcfd"
 SRCREV_machine ?= "11e0e616ed095bb8012e1b4a231254c9656a0193"
-SRCREV_meta ?= "17912f45855984e53a3416a88699c9f0f2233972"
+SRCREV_meta ?= "41fe45f7c5e69f6ec26c657fea16c459544042cf"
+
+# remap qemuarm to qemuarma15 for the 4.19 kernel
+KMACHINE_qemuarm ?= "qemuarma15"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.19.1


