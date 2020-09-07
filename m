Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.1713.1599498183100449738
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UA6Qj0zH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id x18so4698387pll.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=48Qm98taUXWV+y/thCAhZZ5SViSn28BYirSTCcbJR5s=;
        b=UA6Qj0zHY+rDeK4EFJW6psVlUONfXdIBwtfu1UCt0Vlsvca/qG7fQ1Qt9Tdjk2jpYF
         QZ+kCdfd0ENA1Qtmec2ObdoaxYcICXNfV8Rt5NO3+Xnu+dgp9HKr/eu4aXPMSSwkM2wS
         whfHe0sddO8RIsV4A9/G/IwXNwaqlKIqBKRnn5VXq0UEU2t2RSwEHHsL0xIKjj9C6iU0
         3OBh6P+7apAp8/wwfHsnZrUg7IUWHZp7CYFb4U3dAPrZScyoI7KQ+GDnn017wN1Ja+44
         ICnjgRJtUfgmnaMUPcUkYRoDEqdYgvdseK9idLGIOvODdXFFUB33B1tjvZvcBeYJQJnk
         QnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=48Qm98taUXWV+y/thCAhZZ5SViSn28BYirSTCcbJR5s=;
        b=HCcqApuGqMcJ15Gwgx5aVjgcGTaoHuCVpgCMQhwLvZlcjDl926PRFauHvuQ9TkUQmb
         dCG9FN+lQohDby3ZhfBWdbLzPmlkepYxtz3VjVhJtrYgVJOw+XzF7U/j79kc1z90tcTX
         uwxgKahxesHBqBJBj91w6b1IKqfPhDkPK0aOHIuJzkKJWs0ZWHKb3sJs3776tHWdf8o4
         PPHVVkLjJNXLR+1qFV7Q9660dH99AoGk6Iih2Ns5ThFCGHcDRKc0+GgSyMXIo32Jc8EN
         6Rp2s2YtoGQcVqaVYnQt+V/dwhPwuxJP7nHe9XfFOr/bk0AkDw4cmt6n1O41Xt2DMVUU
         RNXw==
X-Gm-Message-State: AOAM531+PsZscC+mpbCa0NmtkbQ6kDYMT1sSPYbMhHWjvMZY861+90rT
	9LvMNphUXPzJRODBKJHBmxUW5aKCdohEX7bJ
X-Google-Smtp-Source: ABdhPJz8ugyw0KPUwwgL4d4WOURLIvxTZccdJywtQW0kRA0HvOkeuiCBYdjQ+3szxXjnPfW+Zhd5SA==
X-Received: by 2002:a17:902:b48b:: with SMTP id y11mr20250021plr.185.1599498182216;
        Mon, 07 Sep 2020 10:03:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:03:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/18] selftest/prservice: Improve test failure message
Date: Mon,  7 Sep 2020 07:02:14 -1000
Message-Id: <86eb281069334020c5fd93ba6fce69c67d7c8056.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When failing, give more information about why exactly a failure is
happening such as the PR values in question.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bdd3abcc210e8f58b7b411da6bbd9c5314819908)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/prservice.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/prservice.py b/meta/lib/oeqa/selftest/cases/prservice.py
index fe1f24ea6d..85b534963d 100644
--- a/meta/lib/oeqa/selftest/cases/prservice.py
+++ b/meta/lib/oeqa/selftest/cases/prservice.py
@@ -63,7 +63,7 @@ class BitbakePrTests(OESelftestTestCase):
         pr_2 = self.get_pr_version(package_name)
         stamp_2 = self.get_task_stamp(package_name, track_task)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
         self.assertTrue(stamp_1 != stamp_2, "Different pkg rev. but same stamp: %s" % stamp_1)
 
     def run_test_pr_export_import(self, package_name, replace_current_db=True):
@@ -89,7 +89,7 @@ class BitbakePrTests(OESelftestTestCase):
         self.increment_package_pr(package_name)
         pr_2 = self.get_pr_version(package_name)
 
-        self.assertTrue(pr_2 - pr_1 == 1, "Step between same pkg. revision is greater than 1")
+        self.assertTrue(pr_2 - pr_1 == 1, "Step between pkg revisions is not 1 (was %s - %s)" % (pr_2, pr_1))
 
     def test_import_export_replace_db(self):
         self.run_test_pr_export_import('m4')
-- 
2.17.1

