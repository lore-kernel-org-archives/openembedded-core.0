Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B09AC7EE2F
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:18 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.32984.1685293692612970968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gwqAh8ai;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d41d8bc63so2043673b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293691; x=1687885691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkxoC1IOLvbB0xeweayPuL0ZKbJ4dK2rV1RTdEbO6qA=;
        b=gwqAh8ai+njfINb3y56kDaGgZVlIhmSq4p6TeWRzkPIU6f1fNFESDuXKc4pGC56SQK
         YOBiCGsbegJ85PY/ICwA7GoSj56udbyzaOv9G42HN8I73/A+EGdHemb1q6MqYglpRnMb
         N1f/PgcBW4ftfbOmgDzClwyACHHFdlrsWAONN9FxJPJrAdm7e4vSmRs29N7+HiU4S/0N
         njsTRIVRSrnVnE/odai42qw7yQhCrEn40p34Rga+JJAIXE4+IwyKQDRvif07p4jprNhO
         zKh6W8/0DVxDWaa/r2D0sQZIpsRg4UQvLWRIedRLzmfLXXwHA/y6/gihxsnB9IQLBGNf
         AZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293691; x=1687885691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkxoC1IOLvbB0xeweayPuL0ZKbJ4dK2rV1RTdEbO6qA=;
        b=A+vJrLt9DC3/mPQVcR29xTU93d5Kzj3kZ99YJdtqy0akIWDn1LM3hWArrKbYbW3Ldw
         aWsL9I/ocITV+OjyoLXkSmXD59WQxzqBWnZWqCFmvUGN1lBwcsTcqM7K9ZUzMD0NkXMJ
         +8UwMMEcz4QO3LL5l5jenKAFfiOQIrsYf0+bzGHmmf1/PMGhesV8ipizfAY39rzu1HJ4
         oxL0fnxY94YRF8T34bQ8E8F8ClJYj4KRDijmG4bBA5SDVZfnBNlibndgwcht0oyF1JGx
         yPDhHlBoLMR3CHrxh5Fmo+bZCaMovW8PSKa/oMKlYQVkQCUG8h7VvPmIRSnTeM0fHLrz
         SnmQ==
X-Gm-Message-State: AC+VfDxzoKu+XAZT5o+2Io5gVJ2MXErtGYvHTLNgpZ2uvmpnazHFnr7G
	CiV63NCjgyPV+TcgM+AKw8J1Q1BM6qYiKe9YmxI=
X-Google-Smtp-Source: ACHHUZ4MtbA77UmYbzPYzMefFPjpHtw+0gdRHcQTD46sRYrcg2JYimSb6HMM6wv+6epRLNnQWQneaQ==
X-Received: by 2002:a05:6a20:3952:b0:10e:5c1f:660f with SMTP id r18-20020a056a20395200b0010e5c1f660fmr7556524pzg.35.1685293691484;
        Sun, 28 May 2023 10:08:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/12] libmodule-build-perl: upgrade 0.4232 -> 0.4234
Date: Sun, 28 May 2023 07:07:48 -1000
Message-Id: <ae5f966898c1ca1e308b77c4591dfa499613ad57.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181840

From: Tim Orling <ticotimo@gmail.com>

* Skip t/pod_parser.t ptest since it is for testing
  documentation and requires Pod::Parser for which
  we do not have a recipe. Adding one does not make
  much sense since Pod::Parser was dropped from
  Perl > 5.31.1 in favor of Pod::Simple
  https://metacpan.org/pod/Pod::Parser#DESCRIPTION

Changes:

https://metacpan.org/dist/Module-Build/changes

0.4234 - Fri 28 Apr 2023 10:46:26 CEST
  - PodParser now respects =encoding directives
  - Don't use libraries in t/bundled for Build.PL
  - make_tarball: workaround for broken tar on Darwin
  - Respect $Config{man1ext}/$Config{man3ext}
  - Do not require a compiler if c_source is an empty list

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3b97f6d74b67706fbbc8685e8060566b815630d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...uild-perl_0.4232.bb => libmodule-build-perl_0.4234.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4232.bb => libmodule-build-perl_0.4234.bb} (94%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
similarity index 94%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index 0ead690067..b57618724d 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=881;endline=886;md5=3027f56c664545e5
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "67c82ee245d94ba06decfa25572ab75fdcd26a9009094289d8f45bc54041771b"
+SRC_URI[sha256sum] = "66aeac6127418be5e471ead3744648c766bd01482825c5b66652675f2bc86a8f"
 
 S = "${WORKDIR}/Module-Build-${PV}"
 
@@ -34,6 +34,12 @@ do_patch[postfuncs] += "do_patch_module_build"
 
 EXTRA_CPAN_BUILD_FLAGS = "--create_packlist=0"
 
+do_install:prepend () {
+	# We do not have a recipe for libpod-parser-perl which is for
+	# documentation (and is deprecated in favor of Pod::Simple)
+	rm -rf ${B}/t/pod_parser.t
+}
+
 do_install:append () {
         rm -rf ${D}${docdir}/perl/html
         sed -i "s:^#!.*:#!/usr/bin/env perl:" ${D}${bindir}/config_data
-- 
2.34.1


