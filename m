Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id EE8867FBEE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:17 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g7so4361583wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3oGXuvUIU90C4M3Rklcng/hCYJMhZJCqdKliFjBkbkw=;
	b=q+59mE9QnzKTsZVWmucov4KF6q9IGMsagegb46EyPcqfWu8U8d4O7bdai6cBX2t8Tx
	+6ElyvXqlGU+Vms06bPxq/kDVjA/tpCznmVn799/8j0SDMyhECgx7FUyUN0q5/6o1a8Y
	jkj1ooNh3SN4zfJjoXuWIy8Ry+Vyn8Cj945YJA+822hJIS6XybQVZaa9Vrr+5EKgAJNz
	XBH3E43/H5PzeMhLHGC8uQDzisuV+4zMHA/W/nj3qXbiE6cMqXVEGxRbi+AjoylJwMv/
	027JIiyKl4qP1fSNXcE6aGUHrL1+XDbCd1gbG6GzWpm/Fsc2jaCjEBLwC5eJ1PoOprAM
	suWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3oGXuvUIU90C4M3Rklcng/hCYJMhZJCqdKliFjBkbkw=;
	b=i9FI3a2olLUjj0MiSkRSCeV0ijfTQgea2kh88X48wzABKtPsM/pvdSJ2eFIIW4zod2
	D8FZr+kRoXSBuyJu77ctYcIKGXu94G4fdcO/6hEtB3Z3xZqTKjpt+TYVrKIXkrvWzNvT
	WI/wcNZd4EXiQ/77EC3anEvqDLM9MREHTBCHawDSEgTZozU9kB5Ujg4dC2xwNXj+QBW5
	ywiOWcU1OmKlxBuIOw172S0VUU2W+C4Fttubk7lU7AEHnWzsho4tzAUQf2iCGNnS/Kda
	VM0i0pl53q3LyyiQiXhwrcU8cFJUUt6ytphQLUP9oazxMZJ1cB2ErvTJA9de611vo1bb
	zuyw==
X-Gm-Message-State: APjAAAVg8wPVJhECuzLwv7vBz7jVbfiUAYmtVdDjC6r87ymmCxcxNW3Q
	euUQ+FPPxohQFWm9p5fQ1gKA+qebXck=
X-Google-Smtp-Source: APXvYqxRXqm5Fwn0pcItKpODbPqKjHMt8FxOCXozWYkVt75cVvvzE4qqyX1lPoecib+teydzlFGvTQ==
X-Received: by 2002:a1c:1d10:: with SMTP id d16mr7039033wmd.14.1572072618395; 
	Fri, 25 Oct 2019 23:50:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:49 -0700
Message-Id: <82c4fb091199b737722a60d517b694860b6e6ba8.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 17/28] qemu: Fix CVE-2019-12068
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:18 -0000

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81b375ac7851088a671317468a8e2eed69d4a827)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2019-12068.patch                 | 108 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 88ae68a..bb444b6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://CVE-2019-15890.patch \
+           file://CVE-2019-12068.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
new file mode 100644
index 0000000..f1655e4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
@@ -0,0 +1,108 @@
+From de594e47659029316bbf9391efb79da0a1a08e08 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Wed, 14 Aug 2019 17:35:21 +0530
+Subject: [PATCH] scsi: lsi: exit infinite loop while executing script
+ (CVE-2019-12068)
+
+When executing script in lsi_execute_script(), the LSI scsi adapter
+emulator advances 's->dsp' index to read next opcode. This can lead
+to an infinite loop if the next opcode is empty. Move the existing
+loop exit after 10k iterations so that it covers no-op opcodes as
+well.
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=de594e47659029316bbf9391efb79da0a1a08e08]
+CVE: CVE-2019-12068
+
+Reported-by: Bugs SysSec <bugs-syssec@rub.de>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 41 +++++++++++++++++++++++++++--------------
+ 1 file changed, 27 insertions(+), 14 deletions(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 222a286..ec53b14 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -186,6 +186,9 @@ static const char *names[] = {
+ /* Flag set if this is a tagged command.  */
+ #define LSI_TAG_VALID     (1 << 16)
+ 
++/* Maximum instructions to process. */
++#define LSI_MAX_INSN    10000
++
+ typedef struct lsi_request {
+     SCSIRequest *req;
+     uint32_t tag;
+@@ -1133,7 +1136,21 @@ static void lsi_execute_script(LSIState *s)
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+ again:
+-    insn_processed++;
++    if (++insn_processed > LSI_MAX_INSN) {
++        /* Some windows drivers make the device spin waiting for a memory
++           location to change.  If we have been executed a lot of code then
++           assume this is the case and force an unexpected device disconnect.
++           This is apparently sufficient to beat the drivers into submission.
++         */
++        if (!(s->sien0 & LSI_SIST0_UDC)) {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                          "lsi_scsi: inf. loop with UDC masked");
++        }
++        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
++        lsi_disconnect(s);
++        trace_lsi_execute_script_stop();
++        return;
++    }
+     insn = read_dword(s, s->dsp);
+     if (!insn) {
+         /* If we receive an empty opcode increment the DSP by 4 bytes
+@@ -1570,19 +1587,7 @@ again:
+             }
+         }
+     }
+-    if (insn_processed > 10000 && s->waiting == LSI_NOWAIT) {
+-        /* Some windows drivers make the device spin waiting for a memory
+-           location to change.  If we have been executed a lot of code then
+-           assume this is the case and force an unexpected device disconnect.
+-           This is apparently sufficient to beat the drivers into submission.
+-         */
+-        if (!(s->sien0 & LSI_SIST0_UDC)) {
+-            qemu_log_mask(LOG_GUEST_ERROR,
+-                          "lsi_scsi: inf. loop with UDC masked");
+-        }
+-        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
+-        lsi_disconnect(s);
+-    } else if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
++    if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
+         if (s->dcntl & LSI_DCNTL_SSM) {
+             lsi_script_dma_interrupt(s, LSI_DSTAT_SSI);
+         } else {
+@@ -1970,6 +1975,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
+     case 0x2f: /* DSP[24:31] */
+         s->dsp &= 0x00ffffff;
+         s->dsp |= val << 24;
++        /*
++         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
++         * instruction.  Is this correct?
++         */
+         if ((s->dmode & LSI_DMODE_MAN) == 0
+             && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+             lsi_execute_script(s);
+@@ -1988,6 +1997,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
+         break;
+     case 0x3b: /* DCNTL */
+         s->dcntl = val & ~(LSI_DCNTL_PFF | LSI_DCNTL_STD);
++        /*
++         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
++         * instruction.  Is this correct?
++         */
+         if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+             lsi_execute_script(s);
+         break;
+-- 
+2.7.4
+
-- 
2.7.4


