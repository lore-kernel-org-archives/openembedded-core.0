Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 100B9771B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:32 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id p21-v6so3628984pgd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z1n0eWV8IXcejJyJjFVApfbsjbSIVqAEO1FpHmsE9bE=;
	b=uRGA3fbl/nuBsIJcsHSEa1yt0oTkkyw89xr+rJNXZDgxVYl7Tv1qOv8fLj3wnmnf0S
	JhEmfmeGmIOSz3JDGCIE9fdIZgZSDDLlBYqx+UjZqJvBnTDOg76URLnfwvuNmhIW4i0G
	zBtJ/HWude32Dc1YMH7FBkFrHcJfZoJ6Qjq/gQFYGSNWZ3A5DdyDYadiwK7OH7FzPql6
	jrKroCe1XYrAux0htpX63ertLI2MEJIixB59v0vNSDnLkbyeABvW5NB6pSBHSC+drZUe
	bHWZva7oc2RL2kwxs7XD/NOeGZh7XkD291tAe3h4t/nvIEHuMHur3GHsNlwUwS3U4D8K
	wZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z1n0eWV8IXcejJyJjFVApfbsjbSIVqAEO1FpHmsE9bE=;
	b=VVa+3nz6AcfJBDo7AfJwtkYkT/IGNNKkqZktKFFZRPkLkFbIi5AVW9M55upnRFsLLU
	5CAFtVG+pdF19jf26JFYPB8p4v1bQt0QRIXeDvmMJDeiq04xBU1ZdlJB5CTczrRENctH
	mLJmSpP2idSwizARhgi2jAaNZBjfCgtgbkVRW5tBiFM8QA2uETuFy5s5yjrswZcoxaoE
	IaBc+hcXOVJaDgglfe2KmYKF28AtrqNWR+C/qpE0Lf9tUG6r9jdlHy89TB5cLXSBi+bS
	g1o6cTdNoxStkbMCd2XoM60f4riihXm+gYam7GX6MRTOIgjy+UiuDUQGWu2DcmEPH7ab
	UV/Q==
X-Gm-Message-State: APt69E1iKInGRaL39PAX7FJbxF5pXw9zdBqMUammlz1XjHB9gzV0PGC1
	6v7htD9wrLtTh6NNs/niVLD3Fg==
X-Google-Smtp-Source: ADUXVKJ9am3057O0586GMSx56gWHb+NF2FdgoBKJ095p0H99p3nks81sQMQw5aO26VN2a+g8zlK+JA==
X-Received: by 2002:a65:5086:: with SMTP id
	r6-v6mr3814667pgp.375.1528321053727; 
	Wed, 06 Jun 2018 14:37:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:23 -0700
Message-Id: <8514f4f99bb46946a792e7b952d1ef7de8d9a034.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 07/12] gcc-8: Enabled mspe options for rs6000 ppc backend
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc         |  1 +
 ...Re-introduce-spe-commandline-options.patch | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index 2b176ac98d..cb0fbd9379 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
            file://0037-sync-gcc-stddef.h-with-musl.patch \
            file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0039-Fix-for-testsuite-failure.patch \
+           file://0040-Re-introduce-spe-commandline-options.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
new file mode 100644
index 0000000000..8afa0102da
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0040-Re-introduce-spe-commandline-options.patch
@@ -0,0 +1,41 @@
+From 8fb8f773e117ee70be00bb0da5f343fe110da5c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Jun 2018 12:10:22 -0700
+Subject: [PATCH 40/40] Re-introduce spe commandline options
+
+This should ensure that we keep accepting
+spe options
+
+Upstream-Status: Inappropriate [SPE port is removed from rs600 port]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/rs6000/rs6000.opt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
+index ace8a477550..d6a8f825d88 100644
+--- a/gcc/config/rs6000/rs6000.opt
++++ b/gcc/config/rs6000/rs6000.opt
+@@ -365,6 +365,18 @@ mdebug=
+ Target RejectNegative Joined
+ -mdebug=	Enable debug output.
+ 
++mspe
++Target Var(rs6000_spe) Save
++Generate SPE SIMD instructions on E500.
++
++mabi=spe
++Target RejectNegative Var(rs6000_spe_abi) Save
++Use the SPE ABI extensions.
++
++mabi=no-spe
++Target RejectNegative Var(rs6000_spe_abi, 0)
++Do not use the SPE ABI extensions.
++
+ mabi=altivec
+ Target RejectNegative Var(rs6000_altivec_abi) Save
+ Use the AltiVec ABI extensions.
+-- 
+2.17.1
+
-- 
2.17.1


