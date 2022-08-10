Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EFBC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:51 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.991.1660170762195969316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GlDLZ24y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id g12so14981698pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=0P/ukSkFHARJJvIeND8ux/XdYjiDYDu4n6b+l99jxx0=;
        b=GlDLZ24yHf7uQ7EqHX7SZROgqPHdimnLvGCtXpihWX7Tf9Zs1Xu5bSETXALEmvSJLW
         gf2kBE/kja7jWZmyTECnqTdqZ+Hru0rvxczRnTX2cCSMq+sJYfldpYdj10v5qrKhsxlt
         I45MG/qEb5V58rD5vGnBFkmCj09kAcEELDSUoMQkssNZBum5GhWdRDfiPoI9vAYWZcV9
         01KIMOSODg33dcNkMzMFg6NJbw8TxT+TyaEP7OogW5SxM1Zxm9tVb4teMYcREhA19gRd
         3Ys145FZMU0xm4AVoPhgdXNUVErCeGFfyEKivdTGBGbJZfh3/R+RvUj+sJR7DDqiHj2j
         1Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=0P/ukSkFHARJJvIeND8ux/XdYjiDYDu4n6b+l99jxx0=;
        b=MdRgZQ9xgYcxxZTxDii+4LHrY0lsEqGBcjx1RISLO0EzAjqB1RTRMcN/Ko+xXwC3Ho
         olvxHn52MpI9Snrx9zIGASVTusufIfM85F3TvCuoBDWflaQIraIPgOTcsBUuw9TRfjqH
         OGfpvS099NtRLfOYAqwEA2skAx5elIhxgGu7IGCl4IeMi9fm0oH8SBTEmmCT4JkIVPtt
         JstgZXbx0/apkoZSbIWN+EBygcgiuxpqgofNH7Ncokt3oPAz+0YEp9BqJB5TJRRwuPX2
         +1C21wSXHH4YA02S3lVaL/fBYZI096EKm3MsoKu9uwI9rBzZ0+7coOQux3V+enj5gqcl
         nT1A==
X-Gm-Message-State: ACgBeo3WCYJbUfQjZJfRPQU6vBgVd673rGJ62WLsMSig1hVyE1/R9Leg
	ftWW7KkWf2FfIxJdC66hp619TdPi31MZ9mwk
X-Google-Smtp-Source: 
 AA6agR6JjlH07S5XrPyca8J+jamwXWIVbfpIQOqnmHM/Qt7sCB01aHQmdoR9TGCKpgVacLbzLoV3nw==
X-Received: by 2002:a65:6697:0:b0:41c:9d44:6cb6 with SMTP id
 b23-20020a656697000000b0041c9d446cb6mr25205926pgw.471.1660170761254;
        Wed, 10 Aug 2022 15:32:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/11] selftest: skip virgl test on fedora 36
Date: Wed, 10 Aug 2022 12:32:07 -1000
Message-Id: 
 <33d006ed8d93ea4c185d6b28a72b2d252fbb5ae1.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169222

This test will fail any time the host has libdrm > 2.4.107

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 3f78a18603..df11984713 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -187,6 +187,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Fedora 34')
         if distro and distro == 'fedora-35':
             self.skipTest('virgl isn\'t working with Fedora 35')
+        if distro and distro == 'fedora-36':
+            self.skipTest('virgl isn\'t working with Fedora 36')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.25.1


