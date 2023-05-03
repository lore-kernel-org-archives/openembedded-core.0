Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CA1C77B7F
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:39:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.23286.1683128377150702217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 08:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Nxr3BYzl;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a5197f00e9so40139535ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683128376; x=1685720376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8F4IQS/xavFJbJgOu1u4i9OcoBEOmya6FS7OEcpVHkk=;
        b=Nxr3BYzlADzylKHqysU4nYhBv0rGWw/HabCVV/iJOPi/j3dUN0k/8zvVy8lTBkfvvF
         PWLNnB04My3h/p1Rn4FFJlEQSEUnt7fbHTic3KA2LgTjOGqj4hz43FVQHuDQr2ZUiURa
         JbdlYSYA97Hl8ZEUMwMGsnMi3rTsM4p+ar67UPDN/aC7WalOnjplopjd2TtuH4+GMcgF
         mSOEsYwIvzI135NaV4Ag6QOFZSJqlmBV0tWmi7ZEWBCLm9JYVHnO1Vm5bhR8pwWxB65N
         bTBBCWUpPema69Eh1pz58uQOocvz/w2nVlmngmWrLLfZM4Eo1XToJd0wzVFE4xyQDLR4
         m7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683128376; x=1685720376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F4IQS/xavFJbJgOu1u4i9OcoBEOmya6FS7OEcpVHkk=;
        b=gn1ptTLHSTradEzfqRvQqjEFFNlF9whEZhJCa4X2OlzUiprFCq7hRT9Ajxjl8RfYFe
         hhbkPLXLqwiRFo4tNc4pZMdymNQqSYtdIU+aU0Z/lirS2x1s2tBHlhDJrDKqW+eNkre6
         XLkf1aSiKdPHFHbk59FLFxc852p5rcxT2u5nKcXUewbppeTABL++bVdbf5Kd3sHPrLC/
         FWr5kRlbQmtzrP9Uas414t/A45Ijep1XT83CoYSROi5eaypVD7aZwPgbB1ppUJxTYcok
         u1G0NE3fqTobpoqcviFnuOtJzG01tu9V8JFYv7ePm15gAci7h8+l2VvfcjfVfLO5msnX
         QvnQ==
X-Gm-Message-State: AC+VfDyN86Sjos7wcS9Hx/VnVRj8OD525mnUjiqy7+fvfyWFh2GaHzJd
	Hn43zgp88Z5Zly9tSzjlGjteEb0T4GQ=
X-Google-Smtp-Source: ACHHUZ5n1ZDz2URrs/j+3Yjw6PxhC9512Dj540uQ9ACousghcaIHj7typgaCXGhP+9ZDsHSSLAcFVw==
X-Received: by 2002:a17:902:9885:b0:1aa:fc97:feb3 with SMTP id s5-20020a170902988500b001aafc97feb3mr397651plp.50.1683128376085;
        Wed, 03 May 2023 08:39:36 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:cc40:c941:a232:89b8])
        by smtp.gmail.com with ESMTPSA id p19-20020a170902a41300b001a95928e9a5sm18939366plq.121.2023.05.03.08.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 08:39:35 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] libmodule-build-perl: upgrade 0.4232 -> 0.4234
Date: Wed,  3 May 2023 08:39:14 -0700
Message-Id: <20230503153914.2288725-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 15:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180831

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
---
 ...uild-perl_0.4232.bb => libmodule-build-perl_0.4234.bb} | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4232.bb => libmodule-build-perl_0.4234.bb} (94%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
similarity index 94%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4232.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index 0ead690067b..b57618724d1 100644
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


