Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 949407F436
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:50:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t9so7316720wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3yDUN7IKcowsU77Wr+otGsnhE7xCzq9zwRYb0LbfoFc=;
	b=EbhMLJVrUS/B32TOSS/5T/8z+UlPGMdpRpd+A4xl7J8M7sthVdP08Uw2tTQOSYFA3l
	vg1inx3yHtoreSQLNJ6F1U9PifUgwC97QT/cqnsq42/8gxFBAU5rdGkpF3RNVkl3oXNC
	+zRW8yeZUp+0zBgb0GxwR/nsCJj5bT2JUUCfigfaLd9XgwnS3EGDR+z8VEmqA5BAjqkV
	dL0zLdz5WrfSx5OT2/EgWu8FTsOudi+Sj0Ft4pD+H5TK2+Ug00lHJIikFMDHrp5He5h1
	xa8/HDVo8o+84sH6jllcUaJHLIPUuEzXVuwaDTrk9e90PfFOAfdzYUtbzhBgzZySl3gn
	M+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3yDUN7IKcowsU77Wr+otGsnhE7xCzq9zwRYb0LbfoFc=;
	b=tJixFJcZzm1gK4Hy0ZRJgYqaEuzq1L8P65ki1NT5xclCImxNHTM+5uH88RRTPv0dKl
	jrqrLalYWVEJM19EJ6b56AkWA2yBsjFQB2zyGACJ78kBA6fAY7O0C2Nw1D8GXK7CgehT
	doe2DgIg/2ujUhiPIo5lPtq8Xe6N39wbt4spDbC82jLlI81XBq4Jf1bz5/Q6igmTZ9A3
	QezPSiKATAETu43Qypjxob2mm1Z4aiqGFtJjRxAWiMpyRoRcRL1lsHk+7nYsuIEA20u7
	rxakTZNI2r1TQfOvO4Xho63vIu2DGkBhapP9nEX47o7e7TKCbt84wbmxWFcpBQXrY6+R
	Tt8Q==
X-Gm-Message-State: APjAAAVK1UZ2KC6UgkUO7k/WTz6901euB9UHp+60JeIrQMrFbVsR779O
	8ZJTxgyVqTDPn/zwpkH+4fqNLFIS
X-Google-Smtp-Source: APXvYqxYp5XNWMlFuWEHBesLKYa0vPS8jLm56kg3ZR8zVzddDbtIKUnXCuQx0vmuTdPDCCETOgqq+A==
X-Received: by 2002:a7b:c013:: with SMTP id c19mr11697799wmb.34.1567169412984; 
	Fri, 30 Aug 2019 05:50:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id d1sm6307481wrs.71.2019.08.30.05.50.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 05:50:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:49:54 +0200
Message-Id: <b338023503edd661099cf6649ff37a971b690a97.1567169002.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567169002.git.alex.kanavin@gmail.com>
References: <cover.1567169002.git.alex.kanavin@gmail.com>
Subject: [PATCH 09/13] llvm: use python 3 during builds
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
X-List-Received-Date: Fri, 30 Aug 2019 12:50:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 35ad3ced37c..08b19a33e35 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -71,7 +71,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python2 \
+                  -DPYTHON_EXECUTABLE=${HOSTTOOLS_DIR}/python3 \
                   -G Ninja"
 
 EXTRA_OECMAKE_append_class-target = "\
-- 
2.17.1


