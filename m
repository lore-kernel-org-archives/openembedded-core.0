Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95DD577115
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:27:05 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d65so3864434ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cDFUuGNXcqglxhuFCzYBVwGKJkSyTGs3V4PRKUBF9XM=;
	b=wUsLTNMBpjU/t9Pgz7ZyDRD9e0ohMg6exnzGkG5FGF8Z1faA0Exe2KGw64wjSxls41
	+KmmhBa0yfDZ4CasQHAAmub81Fl/uJuGBLlbhDhzbsQBD1cPLvp3nvsskj7ByqwTKFVd
	IshMY5nohWqpd32DzsN0MxCN3RdwAYunO8QtWsiXsN9wt7cszv/M0pFHmatXHpfQGUuC
	/tqLs23fdwe5AvlZ85CDNpbqi7A6Ic+//ilvFns8WdIajqK2110DwJodBauFQ5lh7Zz6
	uklCjN30lAzI19la08WKYoQxoYpkorCfWRrtzy98CwlGYkc9niYsLXiAbadfcaMpDDPC
	VD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=cDFUuGNXcqglxhuFCzYBVwGKJkSyTGs3V4PRKUBF9XM=;
	b=XRK15ttiT/3Etdavd5hKrUkoZCJ1m2t7YQ7CUww27aE4W1OEw8sKr35x3/a31uH+9a
	slliH+3RAOnSIeiTgoPS0XVvRpAN7rnq4JZd/UpBTSUJgjXlQNegzcPhfvVP880Imh2D
	QQHZkMM7cwyRI5hZsZZTtAvnRafFIXH+jDWRBnMV38UvVK2Ii9iYKCPeCqruAd34tiKi
	ODmkrLU49PT4d2AaBgvZ+CGFVNsOuscHJFfsj1q1ng3jcvrRKKiOQ1HSFtO0G6nvAgHi
	GT6UxSa5chkwFEH5Spj4zbzM8InfMVoGbc/SLiH4prF8f3hKogZoVKspQHJ3vx+DNtDC
	wzFw==
X-Gm-Message-State: AEkoouuY8cWrevoOJ0uP/uXEDL36b4UmrNY1Bd2WI1FJw6szhH8ASsjLBTFeK4LQST+pJg==
X-Received: by 10.36.39.195 with SMTP id g186mr14653558ita.53.1471285626109;
	Mon, 15 Aug 2016 11:27:06 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CMbcc810032faf.cpe.net.cable.rogers.com.
	[174.112.43.94])
	by smtp.gmail.com with ESMTPSA id 65sm7908858itl.16.2016.08.15.11.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Aug 2016 11:27:05 -0700 (PDT)
Sender: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2016 14:27:00 -0400
Message-Id: <9122780c8c60296ef0df0f260165466024e9cb69.1471281772.git.bruce@zedd.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
In-Reply-To: <cover.1471281772.git.bruce@zedd.org>
References: <cover.1471281772.git.bruce@zedd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] yocto-bsp/yocto-kernel: update to work with the latest kern-tools
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
X-List-Received-Date: Mon, 15 Aug 2016 18:27:05 -0000

With some recent changes in the kern tools, we can drop some changes in
the yocto-bsp and yocto-kernel tools that ensured proper patching and
BSP inheritance.

In particular, we no longer need to signify the start of patching, and
we must instruct the tools that we only want configuration fragments
via inheritance .. no patches (since they are already applied).

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 scripts/lib/bsp/kernel.py                                      |  1 -
 .../arch/arm/recipes-kernel/linux/files/machine-standard.scc   |  2 +-
 .../arch/i386/recipes-kernel/linux/files/machine-standard.scc  |  2 +-
 .../arch/mips/recipes-kernel/linux/files/machine-standard.scc  |  2 +-
 .../mips64/recipes-kernel/linux/files/machine-standard.scc     |  2 +-
 .../powerpc/recipes-kernel/linux/files/machine-standard.scc    |  2 +-
 .../arch/qemu/recipes-kernel/linux/files/machine-standard.scc  | 10 +++++-----
 .../x86_64/recipes-kernel/linux/files/machine-standard.scc     |  2 +-
 8 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index 32cab3b..a3ee325 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -331,7 +331,6 @@ def write_patch_items(scripts_path, machine, patch_items):
     patch list [${machine}-user-patches.scc].
     """
     f = open_user_file(scripts_path, machine, machine+"-user-patches.scc", "w")
-    f.write("mark patching start\n")
     for item in patch_items:
         f.write("patch " + item + "\n")
     f.close()
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/files/machine-standard.scc
index 405972d..8a88157 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH arm
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine-standard.scc
index 67a54be..38d1ca5 100644
--- a/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/i386/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH i386
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/files/machine-standard.scc
index 7c9dc52..b34f3d3 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/mips/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH mips
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/files/machine-standard.scc
index 7c9dc52..b34f3d3 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/mips64/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH mips
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/files/machine-standard.scc
index 89b344f..c166fcd 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH powerpc
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/files/machine-standard.scc
index 14554da..43cf642 100644
--- a/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/qemu/recipes-kernel/linux/files/machine-standard.scc
@@ -4,15 +4,15 @@ define KMACHINE {{=machine}}
 define KARCH {{=qemuarch}}
 
 {{ if qemuarch == "i386" or qemuarch == "x86_64": }}
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if qemuarch == "arm": }}
-include bsp/arm-versatile-926ejs/arm-versatile-926ejs-standard
+include bsp/arm-versatile-926ejs/arm-versatile-926ejs-standard nopatch
 {{ if qemuarch == "powerpc": }}
-include bsp/qemu-ppc32/qemu-ppc32-standard
+include bsp/qemu-ppc32/qemu-ppc32-standard nopatch
 {{ if qemuarch == "mips": }}
-include bsp/mti-malta32/mti-malta32-be-standard
+include bsp/mti-malta32/mti-malta32-be-standard nopatch
 {{ if qemuarch == "mips64": }}
-include bsp/mti-malta64/mti-malta64-be-standard
+include bsp/mti-malta64/mti-malta64-be-standard nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
diff --git a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/files/machine-standard.scc b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/files/machine-standard.scc
index 9c9cc90..a2b2910 100644
--- a/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/files/machine-standard.scc
+++ b/scripts/lib/bsp/substrate/target/arch/x86_64/recipes-kernel/linux/files/machine-standard.scc
@@ -3,7 +3,7 @@ define KMACHINE {{=machine}}
 
 define KARCH x86_64
 
-include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}}
+include {{=map_standard_kbranch(need_new_kbranch, new_kbranch, existing_kbranch)}} nopatch
 {{ if need_new_kbranch == "y": }}
 define KTYPE {{=new_kbranch}}
 branch {{=machine}}
-- 
2.5.0


