Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3878C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.338.1652841076198858303
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GXowjpNK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id a11so856446pff.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5/7NvdhcbQTeXTgOGeqQ7PbRMabIjRn6lw80+vyRdKg=;
        b=GXowjpNKIMhZ5RRy3LhqMqsetdSY02cySkoyZokMqrflifWHfOTdG9UivUF9+XFpQM
         E51ax+vZ6FUQF4sctOqzGWepraU/N6fBWOzevK4MmvvGaRyUps7JMfUltBW7esobflQ6
         yTm9CoEt+bWWbIUaJyuQAxaVspg+4DFczM7HvbFzEFxddqnq7V1pBN/hpCd78lQYEirh
         dAKQq23rxcXtu7up4PNeyDnMVoy+61X5DROnOumq1bkAdbygDvuvzKlKfqXLxIpECBAB
         8PLhclpTY5j+eBgEjvAvionNVP5xf3u4lVxp93O9GUiK+HpQbGhF2lxW+X8MWvTj34x6
         lL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/7NvdhcbQTeXTgOGeqQ7PbRMabIjRn6lw80+vyRdKg=;
        b=ZlXHfzd4kK3zoWyBRcUfdmFD3wVHT5hmx51C+ChgSDArOVw/TDW1ruE+HLGhgmSlNQ
         8N/junIggMTxW8IUfO5vGz7Lv4s5cIgveMl8gf7yi89T1BCUT8jG7PZxxbdbSFS3XEEm
         WoNxfmoCpog51upG11str/l+PfNcvonnnawFG22dEm/zwglp0VHfvp0JiuSlzGt6tdn5
         8FK2YqIEP4QKWHvyf0XHRFg58TRbUnYrq94+9vi/rBnqWIxbsKvUrlO/QeB+BcmUw6JF
         M41Ozw0O6bfJvz3mep1BAae4OocFyUY9NjOeaRWIgY75ohtB1eTGAtxusvX+0zKywrsy
         0RFQ==
X-Gm-Message-State: AOAM5300MI1iF1F8NxgboY/bIkj0hsZKcsaw/scaLdb7/ajvPS6wL8VG
	xbni2msr5sy5HE7GmQIIQJj8P68Ob4etUIQv
X-Google-Smtp-Source: 
 ABdhPJy8JdW4seYGeZgEcxK6jqMzfL5kc/D22syjDyyDul5BX28OgOa8l7fF0FZx2qpq825i8+QQ6Q==
X-Received: by 2002:a63:1d4:0:b0:3c2:479d:39e0 with SMTP id
 203-20020a6301d4000000b003c2479d39e0mr21637235pgb.427.1652841075104;
        Tue, 17 May 2022 19:31:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] selftest: skip virgl test on alma 8.6
Date: Tue, 17 May 2022 16:30:37 -1000
Message-Id: 
 <48ce924dc82aa959fb897ec36873db7dc3813b71.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165791

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 20dc1c9482..3f78a18603 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -175,6 +175,8 @@ class TestImage(OESelftestTestCase):
         if "DISPLAY" not in os.environ:
             self.skipTest("virgl gtk test must be run inside a X session")
         distro = oe.lsb.distro_identifier()
+        if distro and distro == 'almalinux-8.6':
+            self.skipTest('virgl isn\'t working with Alma 8')
         if distro and distro == 'debian-8':
             self.skipTest('virgl isn\'t working with Debian 8')
         if distro and distro == 'centos-7':
-- 
2.25.1


