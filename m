Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id B5A3F77181
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 07:28:33 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id b74-v6so6196054pfl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Q26my5jT+qelTva3Pyh1VoVTTSr4tDOG2YWUk2ZKSo=;
	b=mwuydvmaE6jAZPlDOVAEX4uZnRvyzskamJOduPoolqgUd9/AP5lXGnBEWr8gwbUVzE
	eYO7sK04M0KSd45Hoy/j8/gTiLVjCoVagi1F3WUYFduK/Ckdim4fqA13TY9UqiVJB63I
	XFUDpRRJi61QN9oPAO6w+Pu3Oo+GyIlD90NmGMKGZfxpkizC5gK1JT5wwjnScvLd4i6Z
	4saphLK7sTCQaDUIbL4Uv5ZyFb4KDmZ3P7+hxLBdpr2wbckn6PF4hFeHDN2zemwLZFj9
	cCLgDH7MSc6Qku+W6wSpMv0wFiisPz8samNqaAOIFvMInuvJHBN4j9HdLT/680cfyUiV
	k2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Q26my5jT+qelTva3Pyh1VoVTTSr4tDOG2YWUk2ZKSo=;
	b=PvKzo9msrhjHdrUsrie8KJmQl1uaaFKXkg2tLrYGrtZspOBSG+YFwAzw1H5kPVOZOL
	cYtLLZl87OZHqPotdBLm2mnWeUBINjwpNhBx8E8QI1DmNSE0gbVuRIbOcGUN/0hVZc2i
	7ch+9jQoV8gPkhQZzrqgbMkY8X2ybMqwttP0QaLcudeIN6Uo/a9nC2lefvkAB0rJUMy3
	pHL9WmIvD/as88wE8K/7k3yL9GjgeBfgtRVfiKkQQVA54LF0DaOpUBQ7tLt4bqYVsAVl
	tURXX8+tVK2Cjwyzn45d09BjA5OPe3zoetYWyRvWLVoC4RSxaMEI3JF1spsigKZar2sX
	PY8Q==
X-Gm-Message-State: APt69E2cL6LZc3xBjRWlSHYYkfOIHDtdUQXajcD85eH764ilhZMFVWfC
	1JtUzgBxSHUW2nzhW6zIdxqGDA==
X-Google-Smtp-Source: ADUXVKIbT54TiAq1Bi0i6bXZ1M70NMHU2uw59mFG0vA5D0p4SQkgAp/0/JQMl26uYv8zKuEWZB8GXQ==
X-Received: by 2002:a63:7b4e:: with SMTP id
	k14-v6mr4252879pgn.261.1528442914473; 
	Fri, 08 Jun 2018 00:28:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	v15-v6sm33935578pfk.12.2018.06.08.00.28.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 00:28:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jun 2018 00:28:26 -0700
Message-Id: <62c1f5167d8386a2e47e18828049c9478f4c5311.1528442551.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528442551.git.raj.khem@gmail.com>
References: <cover.1528442551.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] tune-mips-74k.inc: add tune file for 74kc mips
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
X-List-Received-Date: Fri, 08 Jun 2018 07:28:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../machine/include/mips/tune-mips-74k.inc    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/conf/machine/include/mips/tune-mips-74k.inc

diff --git a/meta/conf/machine/include/mips/tune-mips-74k.inc b/meta/conf/machine/include/mips/tune-mips-74k.inc
new file mode 100644
index 0000000000..94afee34bd
--- /dev/null
+++ b/meta/conf/machine/include/mips/tune-mips-74k.inc
@@ -0,0 +1,37 @@
+DEFAULTTUNE ?= "mips32r2-74kc"
+
+MIPSPKGSFX_MIPS16E ??= ""
+
+require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/mips/feature-mips-mips16e.inc
+
+
+TUNEVALID[74kc] = "Enable MIPS 74K with DSPr2 processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "74kc", " -mtune=74kc", "", d)}"
+
+AVAILTUNES += "mips32r2-74kc mips32r2-74kc-m16"
+AVAILTUNES += "mips32r2el-74kc mips32r2el-74kc-m16"
+
+# big endian: kc+dsp2=kc, kc+dsp2+mips16e=kc-m16
+TUNE_FEATURES_tune-mips32r2-74kc = "${TUNE_FEATURES_tune-mips32r2-nf} 74kc"
+TUNE_FEATURES_tune-mips32r2-74kc-m16 = "${TUNE_FEATURES_tune-mips32r2-74kc} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-74kc = "mips32r2-74kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf} mips32r2-74kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2-74kc-nf = " -cpu 24Kc"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2-74kc-m16 = "mips32r2-74kc${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2-74kc} mips32r2-74kc-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2-74kc-m16-nf = " -cpu 24KEc"
+
+# little endian: kc+dsp2=kc, kc+dsp2+mips16e=kc-m16
+TUNE_FEATURES_tune-mips32r2el-74kc = "${TUNE_FEATURES_tune-mips32r2el-nf} 74kc"
+TUNE_FEATURES_tune-mips32r2el-74kc-m16 = "${TUNE_FEATURES_tune-mips32r2el-74kc} mips16e"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-74kc = "mips32r2el-74kc"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf} mips32r2el-74kc-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-74kc-nf = " -cpu 24Kc"
+
+MIPSPKGSFX_VARIANT_tune-mips32r2el-74kc-m16 = "mips32r2el-74kc${MIPSPKGSFX_MIPS16E}"
+PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc-m16 = "${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-74kc} mips32r2el-74kc-m16-nf"
+QEMU_EXTRAOPTIONS_mips32r2el-74kc-m16-nf = " -cpu 24KEc"
-- 
2.17.1


