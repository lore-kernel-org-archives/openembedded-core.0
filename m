Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 154E778882
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:28 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id b16-v6so9166473oic.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AEKtBHgZ2ucwAtYFlTrPXD/Whol9NJVtp5Pd0ujGKS4=;
	b=H4IznMYDSz+1pABXvRRTThTmULffi73bJBh1rJtGJ7Kt8/1ewi9ehVJyjJiedlGe7d
	39QY+cheN3/bb/hyJ3HLAcKSmfvtLDVSAu8x4vPa+L4AqwmIm9LwamUz0FZQY2kU8+ju
	tJ+9Ejcmedzv+VKm7nRPKb4al/LKTHHL4vmT2YS1gVhGyyU4Z6RZ5/7Wp0Up23HqheRA
	m/Zn6/9sDFxi4AWlJJc4c4F7Nhlamu54t8pqUoX5uMt7/wSaMC0ZChIYMvt7/u6b2M7e
	MPE2kXK3c7iNOsHZ2xYl1l9LUc/KwSiVSNWsgvuIKekU7DM8tHTbC34g/WLE2Pfe0Fb/
	5zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AEKtBHgZ2ucwAtYFlTrPXD/Whol9NJVtp5Pd0ujGKS4=;
	b=KS3B75s+qr9GAOgmn0RodNzaxTnG9idKPe93YSdfNgmD0XCMXBQAxElkFdFN8pUpY0
	is1TxoPfphjMdJTuSjteZagbWvUAKHqHhkfdIUCoWfbwfebJaGze0eMaDS+zJaUMbzEm
	zZFtemFEzj5eNRcjsph82l5upejTes9RvVLPuHfgmeMyA42O0Y0BicmGemQGfHhqhBZE
	YBGVStcSTAEwejVC6os+RVPpjNSYyzBgp+QWevSxC/2xvJXy/Xdru6+D9hNMT20YVBgj
	KfNF3p1iP4ZJjh38Ly7KLfBBgx4ypLaWK0cJ62NgmYZLEAXTTKIa4D1FllFlL4cuQMag
	YGOA==
X-Gm-Message-State: AOUpUlFhhx1nCYWX6Iq+J/XMrZu54OJaCh4KMa1h+lCqRzOgHt1FS7Re
	SiV27zM07tb1/Zm5ZrA67K8=
X-Google-Smtp-Source: AA+uWPwXbxn4S74VVg27l7pMqKWxGdH6lPN0RmiLfcTWrzKq4mpHuprrVgS6sFzJyx6JplExLJxU+w==
X-Received: by 2002:aca:3805:: with SMTP id
	f5-v6mr13599624oia.310.1533565770166; 
	Mon, 06 Aug 2018 07:29:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:16 -0700
Message-Id: <1533565758-2467-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 10/12] binutls: Security fix CVE-2018-10372
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:29 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-10372.patch         | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 7b1705e..8693757 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -44,6 +44,7 @@ SRC_URI = "\
      file://CVE-2018-7569.patch \
      file://CVE-2018-7568.patch \
      file://CVE-2018-10373.patch \
+     file://CVE-2018-10372.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch
new file mode 100644
index 0000000..053e9d8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch
@@ -0,0 +1,58 @@
+From 6aea08d9f3e3d6475a65454da488a0c51f5dc97d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 17 Apr 2018 12:35:55 +0100
+Subject: [PATCH] Fix illegal memory access when parsing corrupt DWARF
+ information.
+
+	PR 23064
+	* dwarf.c (process_cu_tu_index): Test for a potential buffer
+	overrun before copying signature pointer.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE: CVE-2018-10372
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/dwarf.c   | 13 ++++++++++++-
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -9252,7 +9252,18 @@ process_cu_tu_index (struct dwarf_sectio
+ 		}
+ 
+ 	      if (!do_display)
+-		memcpy (&this_set[row - 1].signature, ph, sizeof (uint64_t));
++		{
++		  size_t num_copy = sizeof (uint64_t);
++
++		  /* PR 23064: Beware of buffer overflow.  */
++		  if (ph + num_copy < limit)
++		    memcpy (&this_set[row - 1].signature, ph, num_copy);
++		  else
++		    {
++		      warn (_("Signature (%p) extends beyond end of space in section\n"), ph);
++		      return 0;
++		    }
++		}
+ 
+ 	      prow = poffsets + (row - 1) * ncols * 4;
+ 	      /* PR 17531: file: b8ce60a8.  */
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2018-04-17  Nick Clifton  <nickc@redhat.com>
++
++       PR 23064
++       * dwarf.c (process_cu_tu_index): Test for a potential buffer
++       overrun before copying signature pointer.
++
+ 2018-01-27  Nick Clifton  <nickc@redhat.com>
+ 
+ 	Back to development.
-- 
2.7.4


