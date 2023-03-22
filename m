Return-Path: <zhangjialing@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D640C6FD20
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 01:34:20 +0000 (UTC)
Received: from loongson.cn (loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web11.32490.1679448851341282568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 18:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zhangjialing@loongson.cn)
Received: from loongson.cn (unknown [10.20.42.22])
	by gateway (Coremail) with SMTP id _____8DxJYwOWxpklskPAA--.23469S3;
	Wed, 22 Mar 2023 09:34:07 +0800 (CST)
Received: from NUC.loongson.cn (unknown [10.20.42.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxjb4NWxpkhkMJAA--.27044S4;
	Wed, 22 Mar 2023 09:34:06 +0800 (CST)
From: zhangjialing@loongson.cn
To: openembedded-core@lists.openembedded.org
Cc: Jialing Zhang <zhangjialing@loongson.cn>,
	Qizheng Zhu <zhuqizheng@loongson.cn>
Subject: [PATCH] class-recipe: add support for loongarch64
Date: Wed, 22 Mar 2023 09:34:03 +0800
Message-Id: <20230322013403.252200-1-zhangjialing@loongson.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxjb4NWxpkhkMJAA--.27044S4
X-CM-SenderInfo: x2kd0wxmldzxtqj6z05rqj20fqof0/1tbiAQARB2QZnnYACQAJsC
X-Coremail-Antispam: 1Uk129KBjvJXoWxGrW7WrWrJr47JF1UCFyDWrg_yoW5ur1fpF
	1Skry8GFW7KFW8Gan3Aa4DWFyDW3Z7GFs09F4xGayrC390934UXr18KrW2qF12vFZ8Wayr
	uF4FyF13KF4UurDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b4kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4xxMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7na9DUUUU
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 01:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178903

From: Jialing Zhang <zhangjialing@loongson.cn>

Signed-off-by: Jialing Zhang <zhangjialing@loongson.cn>
Signed-off-by: Qizheng Zhu <zhuqizheng@loongson.cn>
---
 meta/classes-recipe/libc-package.bbclass       |  3 ++-
 meta/classes-recipe/meson-routines.bbclass     |  2 ++
 meta/classes-recipe/rust-target-config.bbclass | 11 +++++++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index 8a99f73ae7..bf160b115d 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -268,7 +268,8 @@ python package_do_split_gconvs () {
                 "riscv32": " --uint32-align=4 --little-endian ", \
                 "i586":    " --uint32-align=4 --little-endian ", \
                 "i686":    " --uint32-align=4 --little-endian ", \
-                "x86_64":  " --uint32-align=4 --little-endian "  }
+                "x86_64":  " --uint32-align=4 --little-endian ", \
+                "loongarch64": " --uint32-align=4 --little-endian "  }
 
             if target_arch in locale_arch_options:
                 localedef_opts = locale_arch_options[target_arch]
diff --git a/meta/classes-recipe/meson-routines.bbclass b/meta/classes-recipe/meson-routines.bbclass
index 6086fce9d9..a944a8fff1 100644
--- a/meta/classes-recipe/meson-routines.bbclass
+++ b/meta/classes-recipe/meson-routines.bbclass
@@ -23,6 +23,8 @@ def meson_cpu_family(var, d):
         return 'arm'
     elif arch == 'aarch64_be':
         return 'aarch64'
+    elif arch == 'loongarch64':
+        return 'loongarch64'
     elif arch == 'mipsel':
         return 'mips'
     elif arch == 'mips64el':
diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 5e71546fee..21a56ede3e 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -245,6 +245,14 @@ TARGET_POINTER_WIDTH[riscv64gc] = "64"
 TARGET_C_INT_WIDTH[riscv64gc] = "64"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
+## loongarch64-unknown-linux-{gnu, musl}
+DATA_LAYOUT[loongarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+TARGET_ENDIAN[loongarch64] = "little"
+TARGET_POINTER_WIDTH[loongarch64] = "64"
+TARGET_C_INT_WIDTH[loongarch64] = "32"
+MAX_ATOMIC_WIDTH[loongarch64] = "64"
+FEATURES[loongarch64] = "+d"
+
 # Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
 # rust's internals won't choke on.
 def arch_to_rust_target_arch(arch):
@@ -288,6 +296,7 @@ def llvm_cpu(d):
     trans['mips64el'] = "mips64"
     trans['riscv64'] = "generic-rv64"
     trans['riscv32'] = "generic-rv32"
+    trans['loongarch64'] = "la464"
 
     if target in ["mips", "mipsel", "powerpc"]:
         feat = frozenset(d.getVar('TUNE_FEATURES').split())
@@ -367,6 +376,8 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-abiname'] = "lp64d"
     if "riscv32" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "ilp32d"
+    if "loongarch64" in tspec['llvm-target']:
+        tspec['llvm-abiname'] = "lp64d"
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
     tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
-- 
2.34.1


