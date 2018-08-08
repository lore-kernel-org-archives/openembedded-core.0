Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB6878E39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:29 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id v8-v6so6428307oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bCzHpCpv1P9BJclm5JsLI6gXZPHVqraBDd4+dK7Q+ag=;
	b=JGnG64nSiGiJImqYYVlxwi4FuyOa/I12BLQHjlTCpwurCzY2I8pKKogaqX8O4g0lCM
	+KTU7+R50GTdFlDjZJyGuU3Fp47z4PiCPsJxPR8B1fF9fWgvmCHD4IUWKaaQTbmYd7eL
	clTWTS1xQj29gWhcf2f14iTW5ZuhrhtWiYMIRQp5zMtF6dWLI1kGA3R/JkwfJeQ8kdx6
	443rB8OLViuFS5aoYkXGbIIY9nRwlNO6eGcJdUiYSV/vsaqASn/YexSO1Nmo8KLb/GJo
	xnx/ivBla67pJcr2X5+vRNMkNVhKMWXYHF53xuH1Y+D5DLPF9D77sqtaPM6++dH3D190
	MrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bCzHpCpv1P9BJclm5JsLI6gXZPHVqraBDd4+dK7Q+ag=;
	b=oMQh7oB0in3EfW9WaahtMKR9mIBiq0K6oCKO1WMR79ozTkH5llxLT8JAyMTkHUerLc
	H0BtJRRHHY8b/g/wNm9Rz6W4epmplVzs+BIF3Zm1V7v+IfxLg+OX0EiicM3grdG5qbD7
	josnKJ735eua8qaezUJt1bvsTn9SYsP5WD4e2pDRei9Hc7TcsmEOBAFukLeY3tax/Ht3
	r/lLioToIV4sQT1Erx68T7MkI4odVPdvGl00WH1eozY8GB7R0EaT3Ib8UDg+TLD6Npyo
	INz9tqpBXyqhlbnGZOzjKW82CzuyBAIhPCE5IBSf4J09fwqbz+owLRN6too0og1SQTeG
	+26w==
X-Gm-Message-State: AOUpUlExkFCJyWJV5dICKW8EOIx8KM8xQFyX/WzZ10Q+JYF7EAK/lvS3
	b9CVFs4fuYh6fnSw9vp4HYE=
X-Google-Smtp-Source: AA+uWPzaEywYTSfQZPcGvNYeIrHD+FWm8NXKhxGtjVLYAhBEaxibmBUe79eS0uLpvEDnYAZvDGY2eg==
X-Received: by 2002:aca:3091:: with SMTP id
	w139-v6mr4976071oiw.67.1533765270424; 
	Wed, 08 Aug 2018 14:54:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:16 -0700
Message-Id: <1533765259-10091-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 09/12] Binutils: Security fix for CVE-2018-7208
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:29 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-7208.patch          | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index c668e63..13389a1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
      file://CVE-2018-13033.patch \
      file://CVE-2018-6323.patch \
      file://CVE-2018-6759.patch \
+     file://CVE-2018-7208.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch
new file mode 100644
index 0000000..7d78db7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch
@@ -0,0 +1,47 @@
+From eb77f6a4621795367a39cdd30957903af9dbb815 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 27 Jan 2018 08:19:33 +1030
+Subject: [PATCH] PR22741, objcopy segfault on fuzzed COFF object
+
+	PR 22741
+	* coffgen.c (coff_pointerize_aux): Ensure auxent tagndx is in
+	range before converting to a symbol table pointer.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-7208
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/coffgen.c | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+Index: git/bfd/coffgen.c
+===================================================================
+--- git.orig/bfd/coffgen.c
++++ git/bfd/coffgen.c
+@@ -1555,7 +1555,8 @@ coff_pointerize_aux (bfd *abfd,
+     }
+   /* A negative tagndx is meaningless, but the SCO 3.2v4 cc can
+      generate one, so we must be careful to ignore it.  */
+-  if (auxent->u.auxent.x_sym.x_tagndx.l > 0)
++  if ((unsigned long) auxent->u.auxent.x_sym.x_tagndx.l
++      < obj_raw_syment_count (abfd))
+     {
+       auxent->u.auxent.x_sym.x_tagndx.p =
+ 	table_base + auxent->u.auxent.x_sym.x_tagndx.l;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-01-29  Alan Modra  <amodra@gmail.com>
++
++       PR 22741
++       * coffgen.c (coff_pointerize_aux): Ensure auxent tagndx is in
++       range before converting to a symbol table pointer.
++
+ 2018-02-06  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22794
-- 
2.7.4


