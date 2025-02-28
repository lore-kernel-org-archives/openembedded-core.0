Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE950C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 20:32:15 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.4274.1740774731004269914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 12:32:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCFitvG5;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d1a428471fso19649135ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 12:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774730; x=1741379530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HsLk7oF+/HpGH/Js3jLChZMiKa+plP8BXWFou5PuZ8=;
        b=YCFitvG59PMNKAtXZ4WuX7dE/84mFqYy0HoYGEgrV9l2cjUCCPkh+coTQ0agLcSmd9
         DOPgCUw4CgUgA4c2UnX0LRqRSHBVTRY1jIi6BvmIP9XoSYdDiShplU6RtyLJON0VU/Mr
         RxI7BKVOn/0IbXBDTyu9lGRgMP5kKQiGYpX9zBcT9NXUniTodfQnasRt/1mdRUudOf4N
         tuYNjLZ4pnrc2zUXjI9oWRm//7YNakxh1D6QLrCjNxA+5HVCQ+OwPmj9Wkj09d0oQhP/
         HbB/E8L43Zi35EFjA6AHHgHd6hB/BVVYtVg8iut+N8PGZ5ZTYVGU7fQaxniK8lQ5pVsT
         KGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774730; x=1741379530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HsLk7oF+/HpGH/Js3jLChZMiKa+plP8BXWFou5PuZ8=;
        b=pp/AWeni2717KF7isoxaaiXo8IhcxpF1LIWnfdEV74cnsvao7yqIxkUge3s6AwDXeY
         hqUH/N4uPqBDg5SwdFJHmuw+WWTlPLojaDg++zhJ+I1gfNwtzQ5JL6hIf8nZRtz2p45w
         2EixiRESlw5wG5KhPIvfWxqYB1p+Po/74VJajnn2GsG37Dw70imRBmDtPMDvIKF/8Lrz
         ZAxg1QleLHZ9zwQ7dTV2NjvtEXI28aeCCOjkbrZPcMscYRDJw3oH5i7tmA5lRD9XfeFU
         XF8P1NVSZ9v0546nWDRJuOA/xvWPQ57OkOH08NM+mIlf+CIUHKoq1U1wjQyJ6R9N0w0i
         9rtQ==
X-Gm-Message-State: AOJu0Yy6YWsjybMmtlzTQDMDdNm8qggU+z56GnN8EhgCedyMZPmvqH1Q
	JCEtH2FkTOOcD9PMcxs6rgE1pzLbGhtWZog03uSbl6aKUNBu5PlEDDXaLQ==
X-Gm-Gg: ASbGnctPi4beJiIscYW0E3f2nxpCN0aj72p9QceDfbY3QIwvV1mQslmGRFLi/5h0GRA
	n+GLyzUMaOLtVQ4zNVoLe5FAwCi5wuvhvIbE1e7SZNY6r4um0B1NRHxqB8TcH32HSrzSigz/Z4t
	0U6df1WsDZFc4+GAnEY0I/mjnPsVientra0CkNUsbJ2im03PbxB7+os3IYEk7oX3mxllvcZa3Rz
	2ZN0SQ6RrjWnPGUjl4T3qdtS+7nRM7mMgYkTpE0T7XiksQdxiyV4cM8ssH6CD/U5f+e75vMsykU
	RScBhdKSiWlsrY+fl/s6qMdF5hKFvogkPJWAzHzihwhvllAAyO49PJW8JL2DvYR23WC7bbAqHtQ
	8
X-Google-Smtp-Source: AGHT+IHO+fGwAsvHUTWxfzvdKdi6LmeZqBjJoIgwuYbYEoPxF3Os8AyAG8kH5QHz55BS8L+NVSpHhg==
X-Received: by 2002:a05:6e02:184a:b0:3d3:e3a7:1b1f with SMTP id e9e14a558f8ab-3d3e6e90c69mr54494145ab.11.1740774729917;
        Fri, 28 Feb 2025 12:32:09 -0800 (PST)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f061c718d6sm1049005173.65.2025.02.28.12.32.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:32:09 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: install default go.env file
Date: Fri, 28 Feb 2025 14:32:05 -0600
Message-ID: <20250228203206.1979714-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250228203206.1979714-1-danismostlikely@gmail.com>
References: <20250228203206.1979714-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 20:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212077

From: Dan McGregor <dan.mcgregor@usask.ca>

The go tools require the GOPROXY and GOSUMDB environment variables
set when using modules on a target system. These aren't set by default
in the binaries, they require an environment file. Install the default
one in the target case. In our -native toolchain we always set these
values appropriately, so no need for it there.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-devtools/go/go-target.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 981c7abd313..7e4139102e3 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -34,6 +34,7 @@ do_install() {
 	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${libdir}/go/src
 	cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
+	cp --preserve=mode,timestamps ${S}/go.env ${D}${libdir}/go/
 	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	install -d ${D}${libdir}/go/bin
 	install -d ${D}${bindir}
@@ -46,7 +47,7 @@ do_install() {
 }
 
 PACKAGES = "${PN} ${PN}-dev"
-FILES:${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
+FILES:${PN} = "${libdir}/go/bin ${libdir}/go/go.env ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
 RDEPENDS:${PN} = "go-runtime"
 INSANE_SKIP:${PN} = "ldflags"
 
-- 
2.47.0


