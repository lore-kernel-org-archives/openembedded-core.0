Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.11685.1607008185593427288
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=G2oGz3ru;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id w16so1557127pga.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=a4m4pF2ww3H7KgILLmZWrlKvItbjRx+GMUVFnAbYhpE=;
        b=G2oGz3ru4XcDkqt/f0u6BRwj6a+kjb40SRiv5tJ4msA/7vH34HSLtFqNYsSpgk4mhq
         ZD3QNV6XucRKDYIoGebR8JKm0EYBkr7uvSwBORpWOuS+4RJEFeVeg+rpqxxqPenoxMNl
         tTw89TfClZyD96b3oTKdng+xlrgrwtATpQqCYuRttc1qPgxF1mKcjMaZc+XdplOoUSF/
         FTbaDfLGmyT5d/YF9BRrFxhILPNCro0Au4t4tA4CUtJilGa0ey1xnAk1Eib0sER8lS0M
         1QzXmhP1EnARXyH+Vbj751kAanf3jmJ5zjIFKLmiowJLojtzpzFZwp3zVUU8/3t7A0U6
         I7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=a4m4pF2ww3H7KgILLmZWrlKvItbjRx+GMUVFnAbYhpE=;
        b=gk/XQvsfbIDy4vyBM/e42TDvfQqgjrv2CeDrLj/wUGwdFSJReWU2kHqYqK2ycw1Ll8
         EnBjfHKXMNJBwZkjVjbJ0A1kYvv1aH/eNQDXSeRksb3LShTNTjusT+Tp/J1oTf4GkIYp
         kKreCFTOVQJfgs86pwx083I60nu1KXh520xmZloxP4+D0MvfNT6oPPt4JdNop0S94wPm
         jm/w8HZLL0h5P+x31InsyRp94of6E3a5PkHtb3lXiapm8f1wyV+AdvxCVB4e18p1wrm5
         ZKG/+VABfCJL2UZdkdHKppfXsmMPiTdqoKpYOkXVfH7ZZe2gucAyaDiy0sKb0PjTzR9S
         XEmQ==
X-Gm-Message-State: AOAM530nCw7PCACRK0LDRkDSpGtHqFdB0Tagp/mkgDN8oqmPDYb8Kw2R
	g+QQ2A+N8LmzKWepSr5btAakiICHzHiysz4P
X-Google-Smtp-Source: ABdhPJzYdV9NJ1SE2DXP1rmtxzorN6Ui5ufse8Dh3BM+ur+pzOxtAnvYcu93eeD6dkEzqM6YCEfbeg==
X-Received: by 2002:a65:6a16:: with SMTP id m22mr3427283pgu.175.1607008184600;
        Thu, 03 Dec 2020 07:09:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/28] oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
Date: Thu,  3 Dec 2020 05:08:15 -1000
Message-Id: <e3377882ca9abddd9688de6517e536febf3e0dc7.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid pseudo abort()s like:
path mismatch [1 link]: ino 6295376 db '/tmp/oeqa-feed-sign-2mw7z81v/S.gpg-agent.yocto-native' req '/tmp/jwkivmu6'.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 189630ca6cdf7ceb6cf9b8f9d86c58997f505efc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index cd03069340..976b513727 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -161,6 +161,7 @@ class TestImage(OESelftestTestCase):
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
         features += 'GPG_PATH = "%s"\n' % self.gpg_home
+        features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
         # Build core-image-sato and testimage
-- 
2.17.1

