Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.220.1792511569537091032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bMa+fJDf;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so24326275e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511568; x=1793116368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+NfEF8PiniF206MNppPf87pN8Cemstj8PTbXDQ0v1k=;
        b=bMa+fJDfbYrg/pH06HBW3uDGlIbspv85GCt7VgYVhtnxMXBIDKa2gcLkup8qXN0MCT
         VPjCTEH5BVpxrTcFFO/a+Wfw8TlgAJ5V7Yym9ok1akub3IVmqySVYzQzlA/V4eMYYK1W
         S8Jn0M5sawcclXRUBYj7z7hRXzXg1+W0rFvUMuf9N9KrSfMDvtCaNMfwVmzpwLunsZvp
         AKnRfHOWumsP4FXqEWpmpRZP1y1pk0oyAUas9ajHJ1yqhGSmJt5vVGDxUvc367UohNP/
         HdXFcmotoa+YJab7jLFqpRhw7VgqqzeE0hVZi9wFiU0LJtk4PF9Q14KYSS3VR092drks
         4bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511568; x=1793116368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+NfEF8PiniF206MNppPf87pN8Cemstj8PTbXDQ0v1k=;
        b=f39XzfeVUtzLKj2phRTTNlKo1/4PXp9OQucPmaDNufTzeKYMpikIVQCTKpQCj7NgxF
         t5ztUOuNcrBcJn4pnC2eYgi/4cL4PBiq4rJ9flAeD79I/kONVgCEQErkhDemp2ahyH/h
         hyCpGMNFIJw+6gUkz0bH3beiKshGRH1kxgVZrJQn7WSMYkIMMZZLIaeavZG2tWxvHlP1
         YR0MQQQLnFRZUuYfdu67IwN0jgEoz8TK7/ZDmmEs5aarrujTc4sola91r3fblGZJCwLr
         ZTHDh8ehIYC1tfqOMuKkeY1cI3pNcAKDHzLlqPL/Jy9eLSPJBtBfhEMt7M0HZ1gAvJAJ
         sc0w==
X-Gm-Message-State: AFq9FYLO4DR3bsUvL2OvKcEVs1rISkqml2jfr5s+yFo5Fh+ulKaaRY5Z
	NSkQS8VC2wYmQW4BgeZuIfHjNHFO9i75gXt0W4Xgp2VMMwepFTzqA54og6cL+fh7dwL5hw==
X-Gm-Gg: AYBFou2bnlXu9M5uBPbnz1uiZOvHFrKocx+YxTTSdPnsSZDITPdqD+ljOhAdVpBT+st
	FzZXRMavKENQC5kotxCp9JYkjPlD1A6YQK3X4fhGZ6sbR7oY6SN0A3mvp+IZOOrHpTsgP3U/0m3
	La6pOvELDX6d8dPLq1bmfVWBaIFMo3r1oY8MRNeimHJyUcpoWnKI497sjPdU/CBol5WMznP+Su3
	ftS2wPID1ShlZA8gTrOVwc9L0YW7jR4ABIP+yrpRi+vxiICVyOTfoKFvxwpmHRciMm3rYXj3r/3
	bxO7nIvFX90YW3yrHPIgkw9FMKn4snJ4tWWEFlEhTk0RpguLgIRabxRW+ik/dupgXMhBlIm3AfQ
	BbbfcUIIVpgLgq7ChmQAWMXuGG0v8qtSGKDm4uwhysvl/M7kk2yHlo8iRrwt56PEHanowXvRRxj
	PalWIonBCqcM+8qqwR4ZF9ZdfDEBsxKdR/86n2+Mq8x29P7ySOIafoVfQpxkFUTKSG/4/B8TlQG
	jHhdoVBwC+NirjZjOIPj+DrQYayLdRN
X-Received: by 2002:a05:600c:37c4:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a1d7621696mr220661545e9.32.1792511567540;
        Tue, 20 Oct 2026 08:52:47 -0700 (PDT)
Return-Path: <oo.hehir@gmail.com>
Received: from hp-z640.fritz.box ([51.37.195.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm307375725e9.5.2026.10.20.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:46 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <40183643+OOHehir@users.noreply.github.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	ross.burton@arm.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v3 2/3] tcl, tcl8: skip binary-40.3 on RISC-V
Date: Tue, 20 Oct 2026 16:52:37 +0100
Message-ID: <20261020155238.1923076-3-40183643+OOHehir@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248317
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

binary-40.3 expects a negative float NaN to stay negative when widened to
double. RISC-V returns the positive canonical NaN instead, as the ISA requires,
so the test always fails there. Reported upstream on the matching MIPS ticket.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb    | 4 ++++
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
index 483722c0e3..a0a908e19b 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
@@ -82,6 +82,10 @@ do_compile_ptest() {
 SKIPPED_TESTS = ""
 # Assumes locales other than provided by musl-locales
 SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+SKIPPED_TESTS:append:riscv32 = " binary-40.3"
+SKIPPED_TESTS:append:riscv64 = " binary-40.3"
 
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 07f3ad4592..5e296cc7e6 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -83,6 +83,10 @@ do_compile_ptest() {
 SKIPPED_TESTS = ""
 # Assumes locales other than provided by musl-locales
 SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+SKIPPED_TESTS:append:riscv32 = " binary-40.3"
+SKIPPED_TESTS:append:riscv64 = " binary-40.3"
 
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
-- 
2.43.0

