Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6377D03E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:06 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id y63so149037itb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JJkrc1Ykplkk1mTVQWGqoEg9rpx23n8ZGg2NCFPXUeM=;
	b=ueQ/S1uj/8wX1XM4VFEHI4ruJpH1y7Q4BNx2kdSlCZjOAda79Ev35mVKlrYeIf6fJ1
	kcwOJ8UqOmbakvRLJvNSoO0K/1/xuBufrW+w04B2PmZTS8fZsncHSY3hDmXtdg/n6Iod
	yKGGBK8xEhtFubtNv/2X8z6i4oDJ3WWtTOeZHJsfrJMpM5O+f13mWRrgfUzjqMxUfayw
	/YGs6a5KEazcjPU4uaqv7Phf9Dj6C4CsYcXbTOmWjXRa0MSyxd7C9Z2emPvWbbCReB44
	CO4dkAYSb0Lu0iW4F3M8RTAVPJkeXD9ziKyZeTg65z1mxMgNLeCdn/SiugCOijNM18GC
	GPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JJkrc1Ykplkk1mTVQWGqoEg9rpx23n8ZGg2NCFPXUeM=;
	b=GFfmEOtzFn5aBbqHvWdxVHIIirj1QquipnFCwuCKQ3DnM1sBz6JrxgfkIufrlUBrkX
	Y8cUk4qXfWmRnjK9dyhKWCCcfOHBRRyVzC50qoZrB+qHH27I4ulnJe2vaCVOq3519ak5
	nmjAyu+fFCTO2kcjAwP6w1yB/5H3nu0durXKK2beZIO/+is7PoNoUYoFuJs137YOZfUD
	FX9KAagkGRY2PCIKuQrpNWQf5wq8rDhAve8YZNLJ1rt+N2fN9SzDtMdaKlkiLv7tkhdh
	yuGN6ilP1U8mDq45q9okBueEfUCfTcBay04G6Livh1tI5kXPxJ6nLfdlznGsi8uWhx4z
	5hSA==
X-Gm-Message-State: APjAAAUpiTD4tAMGg4ziNB6KwwEo0W/COyZnJANQ/AdXA5xQjw0fAmea
	lJ1GQjt6B1oMWheHp/h1yEI=
X-Google-Smtp-Source: APXvYqxqCFzf5TdZLx9VPib/rabXz4xk2Z9km1Rmy9HEU5axQb5k3NxoS9BHl1N68Eq7rGHBY1okRQ==
X-Received: by 2002:a24:9197:: with SMTP id i145mr5762627ite.117.1553483527403;
	Sun, 24 Mar 2019 20:12:07 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:55 -0400
Message-Id: <1a4c58e6d995092ca2a0175c270dba60ba540a16.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto-rt: import 5.0 -rt patches
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:06 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 5.0 release of preempt-rt is available, so we import the
patches to the standard/preempt-rt/* branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 5a185ffa0c..204f70030a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
+SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
+SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index cb6b2bf157..105273ff7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
+SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index e42ead01e6..c7e288c4f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "0c703cb02387003c85fe28cff228cc5c8eda45c4"
+SRCREV_meta ?= "806a4922a78c0f447e3d0f61fe6b3cce1e2c0acb"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


