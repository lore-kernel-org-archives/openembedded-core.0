Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDCA76078
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:22 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id j205-v6so6436847oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VWyBs065ZdVoWp4wAV49HWWF+Te09Z5qlFU2p8e+4qY=;
	b=UlrS9VS/WW2LiWMfpXqdTRQW/8P8cZqdV/h0uU6dWOALFV32LMaAzXOdjjU3RO6bjy
	YbLoA/vFy6fRQX3FIeUc1Qn3NrJJ6B4ov76I0QH2mthAv0yvtl7xui+jbTDIWdK30bLW
	81Hgf+vfBvXctSH+T81WotGE5D7lvlDD7MWUxn1UnC1k8eNbuji8emkq1qTWa/a4WY5s
	PdMiEQ1brQLw60kuETnsth43yxVqQuav/1vLwyWje6SPhkVeXNnDgqS9qNNNWSKO3yBn
	VPt2N95jUzOCJWivcU7WhVdLYsAenSfIACh50maW2UpqStfz1vsDPTwjVVLC1K1Dx2+p
	zH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VWyBs065ZdVoWp4wAV49HWWF+Te09Z5qlFU2p8e+4qY=;
	b=Tup7Nl3P+ib2+rlz1rZ552PRbKeSowo+DXsE9dC6TGlbNvfogq3TESYOU6UZRxGZCe
	HYf9ClPLMztN2Hkp36K/hTzSW0OJnlyr6WbepuvHlTTVAMvw4cr7ZwXFi62XwDbP6ehc
	VRUvWsqK3a5KsimsyMBaJQyr0A2a03W3evQojD09tXmAax4pELL7JhC2ptq3qafEyVSs
	Wa+KaTMhwXdPUYXOb8eJfZ4xyt+eWg1kjkkyzTKrHAOQBTUNKRB296UFI66v2mUPqb86
	iw+kPcon/kQp3S5Zm6CLeyLMzAwA709TgNCLvtf0rsxwiPu3897G+KyPT7UPuz1NMULg
	e24w==
X-Gm-Message-State: AOUpUlHJniSpzTuPTvgwo3z8U8wxeQ2dnPUNhY3wHaadYw/u1p8/C5GD
	vgbiC92PEcxgqvpGgOjQ1gduh3jp
X-Google-Smtp-Source: AA+uWPwm4hTPkXDRqeftfToIhkr3I3SadhQmii/rUOzenWoZIIkaZjekLFHQnkOgtvHkEOvJvDK53g==
X-Received: by 2002:aca:3091:: with SMTP id
	w139-v6mr4975754oiw.67.1533765263150; 
	Wed, 08 Aug 2018 14:54:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:09 -0700
Message-Id: <1533765259-10091-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 02/12] Binutils: Security fix for CVE-2018-10372
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:22 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-10372.patch         | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 8fe897e..7830b87 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
      file://CVE-2017-17122.patch \
      file://CVE-2017-17125.patch \
      file://CVE-2017-17123.patch \
+     file://CVE-2018-10372.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10372.patch
new file mode 100644
index 0000000..caaaf23
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
+Affects: <= 2.30
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
+@@ -8526,7 +8526,18 @@ process_cu_tu_index (struct dwarf_sectio
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
+ 2017-11-18  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22443
-- 
2.7.4


