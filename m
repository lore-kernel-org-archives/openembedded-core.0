Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE92C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:15 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.19651.1640182394481708105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tAxxeZVU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso6027132pji.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GSqd5nN4v21ujHvIdzhidpFjhxrLrmXUtnGfw6dkaTk=;
        b=tAxxeZVUFYQiIJ55y0ta1nbRPm+6gSb4y3azHRxHhz5zQVNTQHoXaOZF56OrDqkbqU
         V/t1Z8HdN09x9RxNNEEJUXUj5M5qJAqs4EtMG1m9RNOft8djkP0IHFQcD5gN7CEkWxOQ
         /cSJjp6rL6W7xnYRp6FFKasKBbvS+jr1l2GoVynqb3JxergAv/FijKfGCLtMNNwsIs6T
         wQr1b2PEw0E3+D/CUsJZPHbK7jP5c7hlkVQyxcsQ6pknGV0izf4oD/FzomJG13GZ9ou7
         sNYNEf+mcrupqMXKMeYdwKjy1oIZwlxVs14e/UhZsr3rSmvo0wZhCBX87YaHwkTsS7Uo
         8vUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSqd5nN4v21ujHvIdzhidpFjhxrLrmXUtnGfw6dkaTk=;
        b=6NJSb+08IRWbFwXqwel9XPQROcMvY5Yj3/E8wUy96ChDb9EppFqcIQw4xq6Oovb/S8
         uXIuPayUlhnW+g+FJ5kbV5QJL2AQ2tqQaaNd8c/T3E9pFqRUUrCEgMr9uzK4ppCeFgbx
         eN4cCK5lQ5Q+7xUBckIgVPNhwyaOMh9bXxxQiIEwWHtOTDP7DMP+mRPHGMJHlOBKN66u
         967Kf8Id07g+R/AhumJbFVTVvAGUSuebKIfeAC2dMzKhBTgqoKIRrUPqtPZlIhRrxGWd
         1iWd+0BCkvAQPnzxlJUSk+6Kn3bXhJFl6mY+OOuFaqb6Pr3Nm/WtBhWpQyFtLgz2FyxY
         /NAQ==
X-Gm-Message-State: AOAM532p4UAKM02kUUy636CWMTj5hYnUJya4AoDclZc2+F6C2vxbcYCA
	BDFX+1GFdu92NMP7SIlbrDbIhmjwtsr2mEOZ
X-Google-Smtp-Source: 
 ABdhPJwTeBdOibvQu2hV5ZPgRGzIl/hWEfWIlaDc3SAGGRLv0D/ENur3/wagHzk1NTDHQS3wtFFEZA==
X-Received: by 2002:a17:90b:4a01:: with SMTP id
 kk1mr1571177pjb.142.1640182393512;
        Wed, 22 Dec 2021 06:13:13 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:13:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] selftest: skip virgl test on fedora 34
 entirely
Date: Wed, 22 Dec 2021 04:12:27 -1000
Message-Id: 
 <5930e54a9e0c6b023e46b83c4294d6293cdf3f82.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159959

With the sdl frontend, qemu isn't able to even boot fully,
so let's skip the test early.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 9e5c3f2878..f5b3ba27a9 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -181,6 +181,8 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Centos 7')
         if distro and distro == 'centos-8':
             self.skipTest('virgl isn\'t working with Centos 8')
+        if distro and distro == 'fedora-34':
+            self.skipTest('virgl isn\'t working with Fedora 34')
         if distro and distro == 'opensuseleap-15.0':
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
-- 
2.25.1


