Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F3ECCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:12 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.28263.1658155863059189276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8MLqCEiH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 72so10828374pge.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hFK0q7DhGAW2Z18u1V+1pM8knEKcCOWfUVv9QY9YS20=;
        b=8MLqCEiHN0VffU+HhJudVuVWFCT/xxpMlLv03Ub5Dzyr+8G/rMaUy3IGdIxK4uDxlO
         scXs+5AC6IsREPnCdao9mbbT9QOQ7oXwdQlyxd2K0Qn12zTj67CLypuSOiAEHaNnIs4q
         JMHtlQ1VHhKN0BcVahEO8E8VbB/ZzcoPQJFTZ+TkA80ZGbDOnHwXfjPrvMJuW3oLQ8y5
         0JRG+nOH2DRHmMBDLh+fGceD9CkM9hFcy9GPYxs8kZ/5BDg+JimJtsXwC1EVZeOxF7uW
         Q0YllNndVNRGM52lW8bmlPoUglaHbbisquCrj6yvYFfqHX0/v5s7k2+XEPeUTRhhP+2p
         K74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hFK0q7DhGAW2Z18u1V+1pM8knEKcCOWfUVv9QY9YS20=;
        b=zxYYp2oVP9LpQicqEAOYuDQ3+Bb9YN30qFq8OPSm9QO5LAYLsn3A1bfPRSlw0d5xgG
         LPpaQnkaOjLf0JOaelYl81sQ62XwVubvQtiNhN8qP3+8Ah6GxhR/r1/jN4qD0WVPcC2X
         sYbPxtzIPxJ+IBRx6EGu+4CqPH79h2EHCSiZmC1T2ji3qcv6kk2+VFBbjNuOWHOzpFfU
         kGNaDXYkGFRM6C/CWOR6sdtMShQVXCntrOCXZlxS4oe08YXY9IYaZzWffwFDi+vjEyvb
         TVV7SXv1bEXR0Eh0B+2Irl8wMi9tZ5tEFeOBYFu0g5NvzWbODhlNewfrQDn4uG9SIA3A
         S1pw==
X-Gm-Message-State: AJIora9Untj+7AJHx/MtiSKp0RdE0ggCvDMiqI1Zl3E2NfFOS6V5wbFK
	5s1w/q47XpCLN6D7r4Q7qcbFb5puNxStn9hO
X-Google-Smtp-Source: 
 AGRyM1seIFLa+cxxtwpTNj1wVOtuce9YUvD+KuQaHj8dzLR+Vk6iztIaaOZYYFPmVs1ZUvZa0uc6Lg==
X-Received: by 2002:a05:6a00:2282:b0:52a:e79b:16e4 with SMTP id
 f2-20020a056a00228200b0052ae79b16e4mr28446616pfe.79.1658155862006;
        Mon, 18 Jul 2022 07:51:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:51:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 32/35] selftest/runtime_test/virgl: Disable for
 all almalinux
Date: Mon, 18 Jul 2022 04:48:57 -1000
Message-Id: 
 <b418b969b4d44e347d95c6ed8c86703b977d90a3.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168232

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We can't support vgem on RHEL derived distros so disable this test for
all almalinux hosts rather than specific versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e921f3c1b917072e4c5a110c7dfeeadd2e571bde)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 8eacde40ad..857737f730 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -252,7 +252,7 @@ class TestImage(OESelftestTestCase):
         import subprocess, os
 
         distro = oe.lsb.distro_identifier()
-        if distro and distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5', 'almalinux-8.6']:
+        if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinux')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-- 
2.25.1


