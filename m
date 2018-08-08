Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f54.google.com (mail-pl0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 96B5078E40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:27 +0000 (UTC)
Received: by mail-pl0-f54.google.com with SMTP id f6-v6so1203358plo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=55/1vckAbaDEG9UokhQ2m45ysetixPPPut32CzSGhGY=;
	b=NKVdjjZEpJjPvI+ma3ZAMEGOsz2v0loJ/5YGlOBPG4ZZw6FHXP2uw7NVUO72wnIzQ8
	WwcrGK2MfsHWFpNUgIZqwNYDWiOH/lpEvC/7OSXoR+Wp4A1tcBpkQ3hLMRCzaohLjgEl
	KY1sXsYPlNTa69WAAjQ+sqF27dvNWPfBldB9yZ29lynPZDVwLJ5/iWDNI9yfTrKCln2G
	H038BBdc4tFX0x2ZocmO4WDBIQNSg3qiaRKZVvH7/Cpt0KCPrkSfs6gnRbd2S7e2hACN
	JjkwZAta9i5x71YZYLwqdqEwiZ1KqAhDMkfNamA44oo8uNjCkwQhqtvvYEkxMNUcsOkF
	SHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=55/1vckAbaDEG9UokhQ2m45ysetixPPPut32CzSGhGY=;
	b=GuSBUic3S7Q+5NJy0d3yoEvwiMB6c9Yv1LY9WXpqiFowUc7HTCDckQYHg/WPpWMTB5
	Oq6cqhQi2BkRIk4lxTLz7Wlt2aft6FzgSrBlv33aZQ6Tv2Dr07bKRNr13pBMjaKvs2cr
	6cCIvGzYGBaC96DpyQ7EUuO0O6T+uuLdTwgHUtBbTBPeoMRLzsMU/2H5vrFETsFheTlA
	zvBDYh3ptORZQYFZR50EKcmjFEkkYzAFUB3J/lteH41u+HZ/HTg1hjUeGHpb+b2YjXzb
	er0B/zOhlk6+2cEBz9aGTA5UgRwdhq3JCcDH3Qwn0aJxVESG+Ek6wa5VuFs4PkaQHwgH
	WjmQ==
X-Gm-Message-State: AOUpUlHcz8fX+0/RODdzVBuW0HcGBuLXjFiq6Wn0kp7A0p5T801SWhxv
	4Sl18oNd23Cufq9rXKECA6U=
X-Google-Smtp-Source: AA+uWPxDzTwugDp7WJ9k783cx0ufk49fFQI2F3dqm6eyvyrl6L+qYc3suIRg082OIV29NBer+Nxs3A==
X-Received: by 2002:a17:902:82c7:: with SMTP id
	u7-v6mr3044711plz.83.1533742528868; 
	Wed, 08 Aug 2018 08:35:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:00 -0700
Message-Id: <1533742522-24357-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 05/27] binutls: Security fix CVE-2017-14934
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:27 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14934.patch         | 63 ++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14934.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index fb4ca64..765813d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://CVE-2017-14932.patch \
      file://CVE-2017-14933_p1.patch \
      file://CVE-2017-14933_p2.patch \
+     file://CVE-2017-14934.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14934.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14934.patch
new file mode 100644
index 0000000..57733f0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14934.patch
@@ -0,0 +1,63 @@
+From 19485196044b2521af979f1e5c4a89bfb90fba0b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 27 Sep 2017 10:42:51 +0100
+Subject: [PATCH] Prevent an infinite loop in the DWARF parsing code when
+ encountering a CU structure with a small negative size.
+
+	PR 22219
+	* dwarf.c (process_debug_info): Add a check for a negative
+	cu_length field.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-14934
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog |  6 ++++++
+ binutils/dwarf.c   | 11 ++++++++++-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -2547,7 +2547,7 @@ process_debug_info (struct dwarf_section
+       int level, last_level, saved_level;
+       dwarf_vma cu_offset;
+       unsigned int offset_size;
+-      int initial_length_size;
++      unsigned int initial_length_size;
+       dwarf_vma signature_high = 0;
+       dwarf_vma signature_low = 0;
+       dwarf_vma type_offset = 0;
+@@ -2695,6 +2695,15 @@ process_debug_info (struct dwarf_section
+ 	  num_units = unit;
+ 	  break;
+ 	}
++      else if (compunit.cu_length + initial_length_size < initial_length_size)
++	{
++	  warn (_("Debug info is corrupted, length of CU at %s is negative (%s)\n"),
++		dwarf_vmatoa ("x", cu_offset),
++		dwarf_vmatoa ("x", compunit.cu_length));
++	  num_units = unit;
++	  break;
++	}
++
+       tags = hdrptr;
+       start += compunit.cu_length + initial_length_size;
+ 
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2017-09-27  Nick Clifton  <nickc@redhat.com>
++
++       PR 22219
++       * dwarf.c (process_debug_info): Add a check for a negative
++       cu_length field.
++
+ 2017-11-01  Alan Modra  <amodra@gmail.com>
+ 
+ 	Apply from master
-- 
2.7.4


