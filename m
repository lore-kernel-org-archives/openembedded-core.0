Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB6B6C129
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:42:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q1so6958060pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jBP0FX4tk7YaGxiueDRaojn1OhnJOxq3p8EMXtqTk8Q=;
	b=LIwuc/oi6sAFoT5BDT2knUXmsKEljf/yogkHXMsFDe81LgG3OUPlBuwvxNzzMYaTSI
	w6qyc8V5Ddxu5K8fzkfjzVvCQ6vigwTGVNu7OuW6KT6V7n1OoSHZRoO9aGrmJXHjAJyJ
	I09IEcaYYCObqgnpL35+1jjUkvZncukafzs4Gi/o6eSB/n6U98sSRODx46atKGA9AN/2
	1MwGjl477wAxXRrvlzbPVP+PCT+VzzdP7We7eOLiiQmKVGWXBA93OBcx8LfS2hhO5ewc
	kxDTvbSXPJ/dS1GGV42yg4YCG9D+ZA9QfxR61SA+Qa9l62H8KQUeExfw/RGr7ccPq9b/
	AxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jBP0FX4tk7YaGxiueDRaojn1OhnJOxq3p8EMXtqTk8Q=;
	b=UIjTML5L9q04VfYggAXoBZQN8MyKtXrt8k2ZLSMm1/yAcneam2536RKPTsuHmL+J9J
	gPo/SxiebbZdl6xR4fgKUD+ApKiNlr+mX55nx4DwazWLWpyjuFD5xx916W0YMUBq+cbX
	1uC9+AmAIWbVEvMamRis51wPwWc9g0kjh38DcpDXjYiZzJn6eN2FZ8YKDVsAOsiYQC3a
	9pqlw8yE4a6Xs/DYdK4SHSJvL8VWQgrC3j/1ZhkmKFu9Ok1bLNEV1Ll9uj8G8qDEAE7j
	p+ekB1jIoGk3h3Qt4L4ZM+nr66Te5Q3RKbbUG/3c0itdcC0XXXrBRRcQITY8XyQW78xN
	NyMQ==
X-Gm-Message-State: AGRZ1gLGTAkW72+C1NMqmD7nrHinReB099BKUpRhzw4yGG35OXlsGTL3
	F47e56L00VunY4T78RMkF/g=
X-Google-Smtp-Source: AJdET5c76WL5U0tdIet06N+k/SHMDbQneaF1UOisVQRa3K1RmE1vXeI5EWRCO3pVyrSnMJUN8Q7SpQ==
X-Received: by 2002:a63:588:: with SMTP id 130mr20076493pgf.273.1542638523218; 
	Mon, 19 Nov 2018 06:42:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:cd6c:2c60:eff2:335a])
	by smtp.gmail.com with ESMTPSA id
	w136sm26777300pfd.169.2018.11.19.06.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 06:42:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 06:41:57 -0800
Message-Id: <1542638517-19735-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
References: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 5/5] kexec-tools: update to 2.0.18
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
X-List-Received-Date: Mon, 19 Nov 2018 14:42:02 -0000

Drop patch included
0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...or-Unhandled-rela-relocation-R_X86_64_PLT.patch | 41 ----------------------
 ...kexec-tools_2.0.17.bb => kexec-tools_2.0.18.bb} |  5 ++-
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.17.bb => kexec-tools_2.0.18.bb} (93%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
deleted file mode 100644
index e0cced5..0000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From b9de21ef51a7ceab7122a707c188602eae22c4ee Mon Sep 17 00:00:00 2001
-From: Chris Clayton <chris2553@googlemail.com>
-Date: Mon, 20 Aug 2018 12:00:31 +0100
-Subject: [PATCH] kexec: fix for "Unhandled rela relocation: R_X86_64_PLT32" error
-
-In response to a change in binutils, commit b21ebf2fb4c
-(x86: Treat R_X86_64_PLT32 as R_X86_64_PC32) was applied to
-the linux kernel during the 4.16 development cycle and has
-since been backported to earlier stable kernel series. The
-change results in the failure message in $SUBJECT when
-rebooting via kexec.
-
-Fix this by replicating the change in kexec.
-
-Upstream-Status: Backport[https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=b9de21ef51a7ceab7122a707c188602eae22c4ee]
-
-Signed-off-by: Chris Clayton <chris2553@googlemail.com>
-Acked-by: Baoquan He <bhe@redhat.com>
-Tested-by: Bhupesh Sharma <bhsharma@redhat.com>
-Acked-by: Bhupesh Sharma <bhsharma@redhat.com>
-Signed-off-by: Simon Horman <horms@verge.net.au>
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- kexec/arch/x86_64/kexec-elf-rel-x86_64.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-index 7fdde73..db85b44 100644
---- a/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-+++ b/kexec/arch/x86_64/kexec-elf-rel-x86_64.c
-@@ -79,6 +79,7 @@ void machine_apply_elf_rel(struct mem_ehdr *UNUSED(ehdr),
- 			goto overflow;
- 		break;
- 	case R_X86_64_PC32: 
-+	case R_X86_64_PLT32:
- 		*(uint32_t *)location = value - address;
- 		break;
- 	default:
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb
similarity index 93%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb
index 4b9b5ac..b06c343 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.17.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.18.bb
@@ -18,11 +18,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://kexec-x32.patch \
            file://0001-Disable-PIE-during-link.patch \
-           file://0001-kexec-fix-for-Unhandled-rela-relocation-R_X86_64_PLT.patch \
            "
 
-SRC_URI[md5sum] = "8e071ca473694a71e4ae60ed7ef6f377"
-SRC_URI[sha256sum] = "450c87ba048641eb05f9717f5567aca57f063c266149ae663b58a34e5852deaf"
+SRC_URI[md5sum] = "43845327af54b002aaebd5b8076c7bd7"
+SRC_URI[sha256sum] = "594ac13ea437c70b0d5f0eaf5075b93422b05c23c2a5e21991d2442bbd202d86"
 
 inherit autotools update-rc.d systemd
 
-- 
2.7.4


