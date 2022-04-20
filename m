Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BA4C63684
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.8041.1650463746981079332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QyZRq3F1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id q19so1718446pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=57D1BwVTmFgEsB3VMNEQIy/t80L9OntW3CsrI6USxR8=;
        b=QyZRq3F1/q1M+UsisaleSZt4nQCGfXk/VfjcgXLng6f6h9NAYRKQxZTzFDyOUyDJnM
         O7TsIL4vj5k21pYIpzsjtAT+MegOHbCwS4OG3YB7+IeIkws4JH05DyKq2Z6RGGrtCCHG
         v3/kYYbJ7qh8qFfpZ5RW+3V9yZZL9PN1z1CyuunI6BC8O52vNhBUyTVfJU61Oxr90Fjj
         irxjCxMsZETYRgB9M5ik64B10ghFik4/8+xXGVp/sK8QhCbQbsasiKV+5nvQIVic/PXv
         fLBBZA0zIaOuP8ysLNOlxQLGJsqVjdAhPOhzOZconkGoFzCmplsDqkgqSTuHomnr+9ve
         tbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=57D1BwVTmFgEsB3VMNEQIy/t80L9OntW3CsrI6USxR8=;
        b=YZCXY/5EszBqy3nrp89CSl4K7f+Zahb4pQNAOmNDcwlxgRH+Gt7B8H+bndU7pulgX5
         AsT9sgpe10J2iB9Qvu8KY7w5rzYfzFt0lr1z/C1dIUAANr8xfhw0/9q+2qyDmSaTh+L+
         ntkUxUWXjyX0gvxHwDxV0oyxjz9lo4fbo5cNJq5DngIgDvxKVA3wG17WYwdCWdAKxSc6
         lvN1/uKeAoLWhALkMOU2Uu2q4IJkh3/7q7KtQQ9yaIKE9DIGxwV42e0CVwoKtOPj+zgj
         bL3nhvxib+sIZGGipOgA3r6wure0woWraIVm4pgclKdUx8wO9BCJ5PeZfuJZCpjZMScv
         SfPQ==
X-Gm-Message-State: AOAM5326Elcjh9m/gCstOUuQi7MrevVOG472YZl6LeIIsnEeNGMttzGZ
	4m6Ax0qz4br1ZdIiwzgwq6cgDD51xfCsXUBvoYA=
X-Google-Smtp-Source: 
 ABdhPJw0Ih0mES6dmH6Gpkwp6G5S0fln61VHd1ca0I8+yydJFqrMrqF0/oSQMc2Z+gk4tJiozR7txg==
X-Received: by 2002:a63:5847:0:b0:399:3452:ffe4 with SMTP id
 i7-20020a635847000000b003993452ffe4mr19544020pgm.406.1650463746026;
        Wed, 20 Apr 2022 07:09:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/27] git: correct license
Date: Wed, 20 Apr 2022 04:08:00 -1000
Message-Id: 
 <d67ca67d1f3422942a090a1206ebfefad8920b64.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164680

From: Konrad Weihmann <kweihmann@outlook.com>

by default git pulls in several code fragments not being licensed
under just GPL-2.0-only.

obstack and poll are licensed under GPL-2.0-or-later
reftable being BSD-3-Clause
sha1dc and inet_ntop being MIT
netmalloc being Bosst-1.0 aka BSL-1.0
regex being LGPL-2.1-or-later

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5184e651651ed949d198882a10f406cef5939b7b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git_2.35.2.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.35.2.bb b/meta/recipes-devtools/git/git_2.35.2.bb
index 9812549221..fe137d94af 100644
--- a/meta/recipes-devtools/git/git_2.35.2.bb
+++ b/meta/recipes-devtools/git/git_2.35.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Distributed version control system"
 HOMEPAGE = "http://git-scm.com"
 DESCRIPTION = "Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency."
 SECTION = "console/utils"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.0 & LGPL-2.1-or-later"
 DEPENDS = "openssl zlib"
 
 PROVIDES:append:class-native = " git-replacement-native"
@@ -14,7 +14,16 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
 
 S = "${WORKDIR}/git-${PV}"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
+LIC_FILES_CHKSUM = "\
+	file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1 \
+	file://reftable/LICENSE;md5=1a6424cafc4c9c88c689848e165af33b \
+	file://sha1dc/LICENSE.txt;md5=9bbe4c990a9e98ea4b98ef5d3bcb8a7a \
+	file://compat/nedmalloc/License.txt;md5=e4224ccaecb14d942c71d31bef20d78c \
+	file://compat/inet_ntop.c;md5=76593c6f74e8ced5b24520175688d59b;endline=16 \
+	file://compat/obstack.h;md5=08ad25fee5428cd879ceef451ce3a22e;endline=18 \
+	file://compat/poll/poll.h;md5=9fc00170a53b8e3e52157c91ac688dd1;endline=19 \
+	file://compat/regex/regex.h;md5=30cc8af0e6f0f8a25acec6d8783bb763;beginline=4;endline=22 \
+"
 
 CVE_PRODUCT = "git-scm:git"
 
-- 
2.25.1


