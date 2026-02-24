Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176DCF55428
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:47 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33715.1771974163789433946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNoqcPfe;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-463a94f8475so314155b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974163; x=1772578963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=lNoqcPfesqjugoSewihX5qY6ugOatFomFUwlbtW8C7idzbt6y85rGkLqOsIGPL4bbK
         Fhtk9GXVTOf6hiKEXbbWjq3ckUvrJUeE65am5bpl622k8FQTqpIGGrlgwgdl76757QXx
         LRfZ+5Kmfh+Tw/N/t9jFH/Qk/e+oEemOMCk7ZCK+X4NpvBB3Os8W/7IyYja+Y+Xdisd2
         i9M4Fnxb/GeI4LI2l6HwcufEum6dilRLbF9zBe1gtd+a3jx/WR/q52+eFmXNtpTRpBoP
         qKh2eyEkDgwOW58wVmDc8LlOFKx3NO9Kk8SLGLJplFhpV4GTgEdZzSIbOgU2LNZ186r+
         gfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974163; x=1772578963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZsTCBgME1PNRjxHczDMbLqJbIl+DF2WK2U4einEvRE=;
        b=kjl/Q2ssCwidsG0qlxeI41IGy8Inr8rW0a2EIB3tW3beJKTBeFe5n9tywolGnqwKDu
         JLbb0m8eQI2Dv83A1sZ7dEAc68qxQcm7MYk3RY5aWv+Zm/zU6H2NbJzRqqoJGpxUvo6D
         OGfBzt3up6016Qex1uV99vRgip9sCp3ZFwmvMTr6v7ZZ7J104dChtkpcbpy7uulwpnUv
         NW+s/NqMT/J3Imr2EoeuY9M9KbZptYxbKwNZMXVKnq8vxfcGxHTdTEs5i0CwiFHgH7mh
         UYEo0m2GviXibhyicF4Gp/WzHZ3jhW7OiE8plYMjSHFMfXXRdym9VWLf+mIjSi1PgoEP
         ps9Q==
X-Gm-Message-State: AOJu0Yztszo5DGtN/jmjt66OaLpNDtz9CrCB6ad3zfjcGV0QGNhXzDom
	Vc2N/xHpQ2gbb5WRJtRoeE8ErDYDAbR7dnwTYy7NNivvhiaAhrWYUoGfL1rL73Qa
X-Gm-Gg: AZuq6aLdzYCY32e+syY97kxwd+aubz2NwPtOfQXEevKJaBRWQba+OuJFFSKhI8z5LfD
	Y9valZkUvBw1lS0GP3LR+3JtIuJ8jSxK63S9Xfqn2/70l6xX+PIBYFqxTMWDYRWwQaiv7sdlFz7
	ILzPJL+9H31ZPLe9fn6trji3KRFZoTC8xtzBh2dUpF0a7zV7sWr3Yx/RwGVTGbJ1S3AgWQL84uV
	q53RUkFc8dfoExfS/aIhu4gqGPhvQi8mBCAQc68AcOisqRpN0Lu3nkmNeEPS+bhzBe+rUDdGX8d
	1brFAHoLyXEW8eeN5XqJsXmHKJRf9EpwnOZg8ALk22boWHb6jvpPhFXZ8WyBDLICVe01aEXtiUf
	n0tjacOD0TjXqO40zCHMXeFlsquQ+R3OVlopdHjF3tPtJIla2SH6a1uuAG6AtUimbHarzleS/+Y
	izKDmpYrdaaC06xSBENZF7
X-Received: by 2002:a05:6808:1903:b0:45a:6e83:fbff with SMTP id 5614622812f47-4648bd337e9mr875020b6e.20.1771974162794;
        Tue, 24 Feb 2026 15:02:42 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 1/8] llvm-project-source: Use allarch.bbclass
Date: Tue, 24 Feb 2026 16:00:14 -0700
Message-ID: <20260224230234.679049-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231910

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 13e54efbc2..6bb595b7bc 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -5,7 +5,7 @@ deltask do_populate_sysroot
 deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "llvm-project-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


