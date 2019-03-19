Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 378276C17F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:42:06 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id a3so12815733pff.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IXNVNO0ddOQbJrU5ymGU3oFE4Gap5Yi8jXBe2Xj71ao=;
	b=o02J21uNswiHn8JqoR5xF+PrkTS82W+A1E8Aw/VKFmZUZ769bqBLtJqyP4vXqq5mHU
	ZEu5YULfr1ddPhtLM/BmfdOSOto4T8qhJKdPQRqS/25vbVU3rp27JqKpKNzLrcuO+kMk
	Dl2C4UvIr6isuXPNvWLwXcsI1Yhe36tn8xB8rQu+9qEDnkmVULN/sPLSSjwPL+27VJqG
	af6o8DnFdufdcz6+auh0ETyD0VAGRvadYZMDrCIqeq36jJ6DaQny6XU+UfxWyy4ylTbd
	urpsLncilA1zloHIOuySqCBAmbrJGl2+CHopQeYOOpPdbLhHpjp3fp+/kxF+iah817eE
	4J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IXNVNO0ddOQbJrU5ymGU3oFE4Gap5Yi8jXBe2Xj71ao=;
	b=SyND/6IRRnlqjCRPzD5Fh2GHC8SzFkYI97sd0rDrFclqsaroEplT5joRu0+vvrmpB3
	Jiq39Vb4zyGL1wU9NTufmjN7gR4Xsz3TfQZNZYlVolVUzY6aR8X/pZ4jJRT4QM+24M4z
	uuAL6h7Vnk8207DetuhQt5FTU0o9H1CCiCSBkymMEnhwTS4IcIA2RjQSrzVwfyebItoz
	//eHlI+nTFdrCvjAckOqhO1nqLA/LItIv5MHnA4IwaojgJrb3oDSQJRdx6aCPiNI/nxy
	rbSaGl0DJRQBd1UB7CC4XE6hyemWH7O2yp1JbvOFlN8+K1jR9TXhTtvOxiFVixgV2bKj
	THuw==
X-Gm-Message-State: APjAAAU3Zik/LD2wmJNRnhjaA8fIThBDcgNec9feLuvxRvrl90fKsqVv
	SUy7K1Nd9vlh0dmmnNH7YACpL2CR
X-Google-Smtp-Source: APXvYqwEmddN6EJg7yBf5gi47Uwx5Wbk1w4RBLSn6eCCEAOmZ66fffyYo5DERf5aSEP1ace4LXXGQw==
X-Received: by 2002:aa7:8a92:: with SMTP id a18mr64pfc.218.1552970526918;
	Mon, 18 Mar 2019 21:42:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	m67sm19131742pfj.70.2019.03.18.21.42.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 21:42:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 21:41:58 -0700
Message-Id: <20190319044159.27902-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319044159.27902-1-raj.khem@gmail.com>
References: <20190319044159.27902-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] packagegroup-core-tools-profile: Do not remove lttng-ust for musl and risc-v
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
X-List-Received-Date: Tue, 19 Mar 2019 04:42:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
---
v2: Rebased

 .../packagegroups/packagegroup-core-tools-profile.bb           | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 762c046636..3d8e0c2ed7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -39,16 +39,13 @@ SYSTEMTAP_riscv64 = ""
 LTTNGUST = "lttng-ust"
 LTTNGUST_libc-musl = ""
 LTTNGUST_arc = ""
-LTTNGUST_riscv64 = ""
 
 LTTNGTOOLS = "lttng-tools"
 LTTNGTOOLS_libc-musl = ""
 LTTNGTOOLS_arc = ""
-LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
 LTTNGMODULES_arc = ""
-LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
 
-- 
2.21.0


