Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6269278DC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:32 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id n21-v6so6442795oig.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aU1C4UNt5Ukw1F5TAXi2i0wbMEFolcc5MulF7SLk95w=;
	b=kMdb7PpruJMPk4lZO3U16bk0pHnIjgbLxqg1XumhD6+43x+wnOSb8PL2/xNit5zEPN
	ZZcqNxC3XdBaecJIUu7g8Y1503C9xLSkkgqV2eZCC5VRid5Mwd7md9cXl++yMzYBfqWI
	ftzpwdzLZfRczMpTEcio4yDrPTl1x1ol8WIo2LkeHwbIeeQjH8NaclMmW3HFNqQFyPT7
	gdE6URTfiQRbIy+OrbJbNY6FuYX9gpmNpLNyzyYFybUfOlXK3widcoYjMf9je1mXq3ds
	ZwnjBbOhV8j2QJqBFOCnmucRqNnSVoMoqvQrpuj899SeYnCeOdlXAJDr7FyC2NDE22qX
	IwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aU1C4UNt5Ukw1F5TAXi2i0wbMEFolcc5MulF7SLk95w=;
	b=je43Px7YxnNazUB6cv+fK1DGDhqfXKqW+qCPQBMxl3IQy1wSfRjmxP3P0roD0pL2UH
	qevcJHyQOPP6jS2V+fY6Yt4EXYeq+i+QCfSxX10ZNmqFBiX6L2ZO+IvE7Z/7cwj0/EuZ
	S0UeV6oHDk7x9gAUhlbtA80FybyMCIgKTq4XZi0VXvTjki/jGRNdeWn4pW/HMnzlOT/k
	fgJq3Ox3dFgal7X0Cf0I7OTAyfJvATEgj9xCsxT9jbRAJsbYs0/y3B2A0GqnEQHTGwou
	/cH/V3SCfpcAtbCofu9BU6MAVTErve4FyoNQJabF+N1A+Oeee6xK8IELZXEEFGUTDmfC
	x+mA==
X-Gm-Message-State: AOUpUlEKMe02PT+ZnUr7nU8Z16el2n98/Nw+tb18pwfwqQ6IOLvKdigO
	afmTcbEMf15jG1umxew4+WBxzWVe
X-Google-Smtp-Source: AA+uWPzKbhA5nZ2xUcCD/3EBtEbz3EQsRvB1SwlYyHWCDKlUtndWijaM4w68eTP7TunG7b7EUfn7qA==
X-Received: by 2002:aca:5885:: with SMTP id
	m127-v6mr4447388oib.162.1533765273339; 
	Wed, 08 Aug 2018 14:54:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:19 -0700
Message-Id: <1533765259-10091-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 12/12] Binutils: Security fix for CVE-2018-7642
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:32 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-7642.patch          | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index cfde35c..eccb128 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -76,6 +76,7 @@ SRC_URI = "\
      file://CVE-2018-7568_p1.patch \
      file://CVE-2018-7568_p2.patch \
      file://CVE-2018-7569.patch \
+     file://CVE-2018-7642.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch
new file mode 100644
index 0000000..14b233e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7642.patch
@@ -0,0 +1,51 @@
+From 116acb2c268c89c89186673a7c92620d21825b25 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 28 Feb 2018 22:09:50 +1030
+Subject: [PATCH] PR22887, null pointer dereference in
+ aout_32_swap_std_reloc_out
+
+	PR 22887
+	* aoutx.h (swap_std_reloc_in): Correct r_index bound check.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-7642
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/aoutx.h   | 6 ++++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2018-02-28  Alan Modra  <amodra@gmail.com>
++
++	PR 22887
++	* aoutx.h (swap_std_reloc_in): Correct r_index bound check.
++
+ 2018-02-28  Nick Clifton  <nickc@redhat.com>
+  
+        PR 22895
+Index: git/bfd/aoutx.h
+===================================================================
+--- git.orig/bfd/aoutx.h
++++ git/bfd/aoutx.h
+@@ -2211,10 +2211,12 @@ NAME (aout, swap_ext_reloc_in) (bfd *abf
+       || r_type == (unsigned int) RELOC_BASE22)
+     r_extern = 1;
+ 
+-  if (r_extern && r_index > symcount)
++  if (r_extern && r_index >= symcount)
+     {
+       /* We could arrange to return an error, but it might be useful
+-         to see the file even if it is bad.  */
++        to see the file even if it is bad.  FIXME: Of course this
++        means that objdump -r *doesn't* see the actual reloc, and
++        objcopy silently writes a different reloc.  */
+       r_extern = 0;
+       r_index = N_ABS;
+     }
-- 
2.7.4


