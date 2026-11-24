Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30997.1795560773988894217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=o6zX0AV5;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3187525f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560772; x=1796165572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2hg8zAs+sJ9efEATajGMf3Squ0pHNOSlXohTqJxrhRs=;
        b=o6zX0AV543tMhJdsf39avq42L2RMRXOrvilo3uKU2LdAqVsB0p5yc2VdXE6mERL8Qm
         33VujDupCK7c6mQ5+e/33kZKeG72K9gXwby2oPveMrQF8YQdnWhCyTyK0EOeRn7ypeTw
         Y+cSXNPqRWUUYryhhldYGWuJHqg44lQXugib/kPnD/RhWmLUpFLpK26OylBOHUmJ6Hpj
         Ko7gOkRrCqYA75W2YuVHVqUUneT9s8AtgrjuEp5/K+lO1CYuzqQJPLaqg29DSqjV9rt1
         PBzKRr9Ccm7SrXxigZWHMfip4NKBj65oqiYuJgvoSw9yO53S3KPtlMEo2R/IDFoYeRxw
         D5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560772; x=1796165572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2hg8zAs+sJ9efEATajGMf3Squ0pHNOSlXohTqJxrhRs=;
        b=XXDfhDLhYGU2686u2X5N2iV3mhyTT1LgMgW5Mm4R+xM6nFcjHUU7+eQUMy1JOEU0v5
         j51uXGrBXJcxyKM0F2EaT5bppajre+X2RLvvmjn10BSZg7ZA5kZDsUlXhU1UK7iCDuOt
         9ShnOvqPH7MqsjIthj9UxC6ljqkZR6dKDoPKAdodvlj2rQCcgfl+LOVNrlAuLTXNa6g5
         1N2S8QXpUgrf+8gKhrOd9+MwVnaZ/sGGrSvdombDXKudiNpN0u6Kxln2trZyPgLSLgaC
         A0EDdJm9rDmW+ckl2hdCbAU6E6fHl3pW7NwMcR4UHqSzvaI4qi4mQscKbGv5UN7dVkfR
         OyRA==
X-Gm-Message-State: APuU4Z9MLKRFeMoYWpy/hzZ3N6qaf63hxE4u8ysgyO31mCI+wQ16D+bP
	bABxCZvsH9L4NgLcvIsEYp0RwlRxBLkiCUCcwWtuEHkmvckFmhnV1K4DVghFc3IBYin9cP71WQs
	t81rxCgA=
X-Gm-Gg: AZFdTZcPxQXyBYOV2gc/H5u3QIx3acjNcBjPDV+eH5FwCd1tzxUDm94FsKx/Kgdlj/y
	4CdzEGiyQkjTh2NaKIh/faeqlmcwsNaTxueRboF84lsDML0r/CYG9rwsbwaXtMdmyYrK2L6ijm7
	8F5zOgi6bxUWbmhcUglZooV8kb2MySquqhEJZzWMjhoU12yxrypo1g8kyQKYa8kNaeqRurrR747
	Bnxd8ZhYvsp4HVOMsnnV+res3fyePqlL4ygA0sRTcisVewfh0ym28MVtw354u2xTdRhEOmIgmvr
	M94zzaKryaPVFhSdOLG36nrRjvIGlKjsqIfnRDLF8BH3Wng/3gf4RMZ71L27I1tDeW4Rd2kPd+i
	0bBSFJWrXQSr/LK5waCHMe801TnwaCG2MqQQKfZ1i6l3M61s4MtaJN1NRhKcqPE904COKheyZr2
	FmPHi9qpdz2oQOiHSzRysJkpZ10uvPSv4VxMxwi0IRBtluP64JNldha7+Pz2uXk36IVvmWQecmi
	tlYg6u4wwQIGA5iOzPvAa1Q098+c2yz9VDHCqrQWDkPhTSksChQpZRg2hKL4iZoaR1jSgGr6jfF
	Hmh2M54ELm+0Rh37a1HAnLaXY0Ge8suuDSRjB4MnMF0JMJxQsOtZO19M3qLJlfWY2L2fe8j2Vd/
	YgOssS+yqqUsNFMy/QewsOK+DEu4j
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr350465375e9.22.1795560772238;
        Tue, 24 Nov 2026 14:52:52 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 17/21] libsndfile1: patch CVE-2025-52194
Date: Tue, 24 Nov 2026 23:52:34 +0100
Message-ID: <8ff1072d37e89936c5dbf0c80054e0f4a0480a7b.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795560372.git.yoann.congal@smile.fr>
References: <cover.1795560372.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251119
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch references by [1] references in CVE report.

[1] https://github.com/libsndfile/libsndfile/issues/1082#issuecomment-6442050313

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc20c00e9261011c175d4bb92c99f02b5773b419)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsndfile1/CVE-2025-52194.patch          | 27 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
new file mode 100644
index 00000000000..ec5da0b731e
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
@@ -0,0 +1,27 @@
+From 7ff854d1e0bd9a751a9ff52ed980c62afced91fe Mon Sep 17 00:00:00 2001
+From: Saddam <saddamr3e@gmail.com>
+Date: Tue, 21 Jul 2026 20:49:11 +0530
+Subject: [PATCH] ircam: use psf_lrintf when reading samplerate
+
+The IRCAM header sample rate is a float read straight from the file. (int) samplerate is undefined when the value is out of int range or non-finite; psf_lrintf matches mat4/mat5 which convert a file sample rate the same way.
+
+CVE: CVE-2025-52194
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/7ff854d1e0bd9a751a9ff52ed980c62afced91fe]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/ircam.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ircam.c b/src/ircam.c
+index 3d73ba44..d0780d8a 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -161,7 +161,7 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 
+ 	psf_log_printf (psf, "marker: 0x%X\n", marker) ;
+ 
+-	psf->sf.samplerate = (int) samplerate ;
++	psf->sf.samplerate = psf_lrintf (samplerate) ;
+ 
+ 	psf_log_printf (psf,	"  Sample Rate : %d\n"
+ 							"  Channels    : %d\n"
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index fb466190ab4..2c3e28dc1c8 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2025-56226-02.patch \
            file://CVE-2026-37555.patch \
            file://CVE-2024-50613.patch \
+           file://CVE-2025-52194.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
