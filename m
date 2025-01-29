Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D006CC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:03:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.9990.1738148588039742807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:03:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SW492l46;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43618283dedso70192715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738148586; x=1738753386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pxs5uPQUPJu29NzTWanCDXtTLjzf9Z/tUqon9gs5avs=;
        b=SW492l46XJFhzMhgQa9m9nrs/kpZ3dEWcvsSR3WA0zDBYgEwHZrytXl3NJbkujSjps
         VqRXgdc3OmX2DABnI/gP9z8ZdrFfFa40gPICYQ5iMijJcjbXUXYyG5uw0L3k+WvevtVJ
         K9mNPBk6rna40FcC4Jr33M+2vGvQYGBm58RDuVDk/KoNBaQvBTKxn1+rHAyVykwhKPXx
         LzQFigU6qxOX+BJwXbdDDIpF9Kj8D16OmSOsY2Gis0EgJqfayfD+dJ5Ka0LwDx4cKmMb
         QY4gS/zqu47KbwwlLQt0vGgz422R5wboTCRm55nQcdBm4aSxlJK2hCXz2nLWUC56F562
         60WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738148586; x=1738753386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxs5uPQUPJu29NzTWanCDXtTLjzf9Z/tUqon9gs5avs=;
        b=Qh4J1U+hvS/qiTCPtNIjKc660xnJ0Gk4l7SkcZv6Xstscjxxp4oN+6Kbb9XDbUD1+M
         Aw2zo0JLCOf0dpT2xbxzpqOKWqzkxKJoWtAr6Iqxfnqtl/wZZh9oPDKxHarjssiq48TF
         QvGVJOPzGj+gNUgFdvDjimQZtJM8nDzFxoSlVIDpM5of04sKNB+Gsj0yXCcICuAxbWyM
         7V3NUPSRJB4fqS9k6isJN0BAq1niZ6+so6lo1zSVhvHu3xWlI6vx5e7jM4HkrbOBPWBk
         GPBqvt5aVtJiYnQLL/QSX78cUAP10kNozXTsH+UBe+nZxDyHF0AXxdHVrAhd8R3ZgLn6
         6hdA==
X-Gm-Message-State: AOJu0YzXrz5Lrr53QSfW5SJ96tbCBtRP7H43Pxsb8uwIGvdCNE0dpOxs
	wLU83dEvwZJd8WHDZIqkjfgtY/9te2GLGRvDuo/nOVFA6LkeqHrQWHR+Ug==
X-Gm-Gg: ASbGnctvQ+z++5m24c5cOo2Wch/XLV4m6ln3hKZsT6ccs4XuiBlnmHLvk8vEjL9jS4s
	67umnLWS/L3Org9/s9iRorZUIOanGA3GRXaECI+vd5lDZE9Czy0J10if2soFha3vy561dAi6IYP
	+EadN++gX3Ef1aWAxcUXfRMZX2SRAsdHcM2iFOiWXO4uSAr3c0OVdLBskmbbEry4FG+2D/Madsr
	Dk/hkgRS1UN3gGhgFL9o5XHWgNTLBEGwcv4gTLWaJggbR4m9Qlpgqeebia86GELWecYAtoWESY0
	fOC/+F3WbRpV74VxLdvO27ZZbuuqL3VESkBO/oAtJ77Kgg==
X-Google-Smtp-Source: AGHT+IFmzJlak5XE/1n2y62KmZBQNWfVxBKQ+hpmG3a3zU2JdGy2j2tzuTvweyoFUwflblMJPs7Iyw==
X-Received: by 2002:a05:600c:4692:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-438dc424cb9mr22411105e9.30.1738148586070;
        Wed, 29 Jan 2025 03:03:06 -0800 (PST)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc518ddsm19211005e9.37.2025.01.29.03.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:03:05 -0800 (PST)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Subject: [PATCH] rust-common.bbclass: soft assignment for RUSTLIB path
Date: Wed, 29 Jan 2025 11:02:55 +0000
Message-Id: <20250129110255.39564-1-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210370

From: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>

As a user i want to override `RUSTLIB` path on a bbclass, lets
call it `XYZ.bbclass`.

If a certain recipe inherits `cargo.bbclass` and `XYZ.bbclass` the
value of `RUSTLIB` is depedent on the order of the inherit.

If `cargo.bbclass` is inherited before `XYZ.bbclass` this will reflect
the desired value of `RUSTLIB`, on the oposite, if the `XYZ.bbclass` is
inherited before `cargo.bbclass` then the `RUSTLIB` defined on
`rust-common.bbclass` will prevail.

Changed definition of `RUSTLIB` to soft assignment to make it overridable.
---
 meta/classes-recipe/rust-common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index baa3869c47..31331c7a26 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -13,7 +13,7 @@ FILES:${PN} += "${rustlibdir}/*.so"
 FILES:${PN}-dev += "${rustlibdir}/*.rlib ${rustlibdir}/*.rmeta"
 FILES:${PN}-dbg += "${rustlibdir}/.debug"
 
-RUSTLIB = "-L ${STAGING_DIR_HOST}${rustlibdir}"
+RUSTLIB ?= "-L ${STAGING_DIR_HOST}${rustlibdir}"
 RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??= "libstd-rs"
-- 
2.34.1


