Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web11.36638.1598811476803642213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VCC3+W3s;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.176, mailfrom: steve@sakoman.com)
Received: by mail-il1-f176.google.com with SMTP id y2so4715739ilp.7
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1xEiOOLumgrtwq0Au8JWb2w+b77aVOq4I6SadFFlF7Q=;
        b=VCC3+W3sljdJAex7pbhNbfnXAt7PT08JByRpay5tPclNMB8I5ceiO87UOcoWsyRVoa
         /qglmgcmi8X7NoNiyce88PLEBSVg9BIHxsz2vO90p3hBFHgVkrvP4GSdpeBm24wDT4Zj
         Qxb5V/pMHAGVCZUiURxXgOrIwez7iaNImYegIG8jhUVoHk7vVDMlw9wvsg+UyCLRyiNT
         M8wXDgamLdKQQ5OrFrH8yGRSbol9UxWm35BkEu51ODzzHaKE2Vtpr0K3uG6e5jGE3juH
         JWHXGbauKzIeb9B3UNhRNMLgC/0r5q+CsEzrOKVDwBEsX7axXAPULVC2z3EfCWAu55Pv
         i0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1xEiOOLumgrtwq0Au8JWb2w+b77aVOq4I6SadFFlF7Q=;
        b=m7wDck4bwmE/EImJrnGlc1guEE23n04tPSRWYsQYtpGuZgDgj04zFrnyMI/DSj5lcB
         QXcxeWUcQ12awYqkr3r6yIRpGBw8ZdJALXgSspCbl3TvxZjaB1v03fOGLEGLS66djad4
         lyDjQayJlrPi8W9iZKuduZ7Etk10JNbKDL4czHR1zY9VR6VuEKvMGgMJ6tFF3ZEMGDDa
         xBAM+hk8euKNMIvyYzTMHfwdM0vUwwLCKNnUm/eJ6JiNB0B6BwUNXllLmtw5za7Q0Qhs
         LFxU+/gggnVpiMzRw1xzOLB8JZJzuAnekKBN05WNxWyTgQIYVYZ+hNTa2RZpgG//6ZWa
         MZkA==
X-Gm-Message-State: AOAM531YgbWUp8O3wT2wge9uSFQUP6bPXU3PdaLzxiSQkq3S/6ExZvip
	Am6AnAAnR2K9bWmpCmO7lrjyTfoQeFZ2vZS6M4M=
X-Google-Smtp-Source: ABdhPJylF9QB3vzsomx3g6mZSW82QfKSDBqK4/KYA5vmzJBvzVi3HzBloC0XVbRDOK91cT7nOU1D2w==
X-Received: by 2002:a92:7f0f:: with SMTP id a15mr219522ild.186.1598811475726;
        Sun, 30 Aug 2020 11:17:55 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.17.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:17:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/25] oeqa: runtime_tests: Extra GPG debugging
Date: Sun, 30 Aug 2020 08:15:55 -1000
Message-Id: <b1fa60c791e759f7171862db68dbad2687e83812.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Joshua Watt <jpewhacker@gmail.com>

This patch enables extra debugging for gpg to try and get more debugging
information when [YOCTO #14003] occurs

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f24d7be1fb863006b5414fa8f9c9a37bb48d5a6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 60cb2e01a6..cd03069340 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -156,7 +156,7 @@ class TestImage(OESelftestTestCase):
         self.gpg_home = tempfile.mkdtemp(prefix="oeqa-feed-sign-")
         self.track_for_cleanup(self.gpg_home)
         signing_key_dir = os.path.join(self.testlayer_path, 'files', 'signing')
-        runCmd('gpg --batch --homedir %s --import %s' % (self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"))
+        runCmd('gpgconf --list-dirs --homedir %s; gpg -v --batch --homedir %s --import %s' % (self.gpg_home, self.gpg_home, os.path.join(signing_key_dir, 'key.secret')), native_sysroot=get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native"), shell=True)
         features += 'INHERIT += "sign_package_feed"\n'
         features += 'PACKAGE_FEED_GPG_NAME = "testuser"\n'
         features += 'PACKAGE_FEED_GPG_PASSPHRASE_FILE = "%s"\n' % os.path.join(signing_key_dir, 'key.passphrase')
-- 
2.17.1

