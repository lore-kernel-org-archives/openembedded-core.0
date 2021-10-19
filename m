Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B173C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:41 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.15517.1634673280649175156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=68VwuKos;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id t11so14453319plq.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=w84YQhNyFQGMd88A/nPoHO+aYmar7VTrDx9kjFh+Q/A=;
        b=68VwuKosS95jxTmaa6rrusezqJvKAlK3CYigya7wE4fKBTOOI8W/so34ZQWHb2BKw1
         wEefdMFmg4udqugeE0wWpNo+xhok0YKZHn18Hq2J5IYY2cpQi/JT1b/fYY5vFbFAcWpQ
         l2TwFVFtJBFd5y34fSEVZ5k7baaAQorsK4ikua8g1Aj2mBzDUO7U62T4FkeHLAsRlFkU
         l3PPgANeseHW19V3rh4vgmstcIlTqlcdMP4lUunonJS2nYXkEqkhI7z0UAY64qmh0GUF
         4GU6ql9ciItYR3SE1FT8rbH+2Qp362ehMW8prArHvQNv/S5FJ773Ei2mDMwxmu5nZmUo
         lMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w84YQhNyFQGMd88A/nPoHO+aYmar7VTrDx9kjFh+Q/A=;
        b=QZlhxSMzwAO2IF9iP+iXF9vAywUea9b0qpIqLyl0Cfrsc9c2sOh8kn0fe3+7VlfiYZ
         zPQbh4hPhdiYz6p+ybPCjCk6HfzI7Xdg9ugY7dRdMZXOau7jRFOH2CUrnrFP0CusRyYD
         wlOtdQHGON6t7oSjjusurlId/xq6+hHXm4pC6DanWWtynQsLT4zsvcwG3Izs51cfmZqc
         vwlZArP9VhUH12cd+CO660IyA+hTreHDQBpTJ/NdbTdG8F8kHS3lD2iPCI3BwIlXHZcy
         RVHGPeO3rop/aqqXZSetru0vdx58Stcu0KBJ2QuSCyJ79NWfoLWk694dfvl/o3ZwXAYJ
         K5WA==
X-Gm-Message-State: AOAM533y6HdmBOEnRI2MKHAidvReZLxSxQWJlZZQw1ZRhPoONHvp/Xaf
	a80PzkRNnBS6Z8dKBcaGwMQWg2SvoRXQS1dcVs8=
X-Google-Smtp-Source: 
 ABdhPJwP7oTQ3w5UEAs3rTkdg60G/CC2mcPpLhvrRjnmfqCPqQhRsqhta0rMAz/1dONUN8mb4IR07Q==
X-Received: by 2002:a17:90b:390d:: with SMTP id
 ob13mr2040802pjb.49.1634673279692;
        Tue, 19 Oct 2021 12:54:39 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/38] oeqa/selftest/sstatetests: fix typo ware ->
 were
Date: Tue, 19 Oct 2021 09:53:25 -1000
Message-Id: 
 <043214d288998f5d822da23fb56703bf00ddace3.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157219

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit c94a9ece226b1d2012f5ee966b81bf607d954937)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index c46e8ba489..f0c94c8422 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -137,7 +137,7 @@ class SStateTests(SStateBase):
             filtered_results.append(r)
         self.assertTrue(filtered_results == [], msg="Found distro non-specific sstate for: %s (%s)" % (', '.join(map(str, targets)), str(filtered_results)))
         file_tracker_1 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_1) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         self.track_for_cleanup(self.distro_specific_sstate + "_old")
         shutil.copytree(self.distro_specific_sstate, self.distro_specific_sstate + "_old")
@@ -146,13 +146,13 @@ class SStateTests(SStateBase):
         bitbake(['-cclean'] + targets)
         bitbake(targets)
         file_tracker_2 = self.search_sstate('|'.join(map(str, [s + r'.*?\.tgz$' for s in targets])), distro_specific=True, distro_nonspecific=False)
-        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files ware created for: %s" % ', '.join(map(str, targets)))
+        self.assertTrue(len(file_tracker_2) >= len(targets), msg = "Not all sstate files were created for: %s" % ', '.join(map(str, targets)))
 
         not_recreated = [x for x in file_tracker_1 if x not in file_tracker_2]
-        self.assertTrue(not_recreated == [], msg="The following sstate files ware not recreated: %s" % ', '.join(map(str, not_recreated)))
+        self.assertTrue(not_recreated == [], msg="The following sstate files were not recreated: %s" % ', '.join(map(str, not_recreated)))
 
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
-        self.assertTrue(created_once == [], msg="The following sstate files ware created only in the second run: %s" % ', '.join(map(str, created_once)))
+        self.assertTrue(created_once == [], msg="The following sstate files were created only in the second run: %s" % ', '.join(map(str, created_once)))
 
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
@@ -202,9 +202,9 @@ class SStateTests(SStateBase):
         actual_remaining_sstate = [x for x in self.search_sstate(target + r'.*?\.tgz$') if not any(pattern in x for pattern in ignore_patterns)]
 
         actual_not_expected = [x for x in actual_remaining_sstate if x not in expected_remaining_sstate]
-        self.assertFalse(actual_not_expected, msg="Files should have been removed but ware not: %s" % ', '.join(map(str, actual_not_expected)))
+        self.assertFalse(actual_not_expected, msg="Files should have been removed but were not: %s" % ', '.join(map(str, actual_not_expected)))
         expected_not_actual = [x for x in expected_remaining_sstate if x not in actual_remaining_sstate]
-        self.assertFalse(expected_not_actual, msg="Extra files ware removed: %s" ', '.join(map(str, expected_not_actual)))
+        self.assertFalse(expected_not_actual, msg="Extra files were removed: %s" ', '.join(map(str, expected_not_actual)))
 
     def test_sstate_cache_management_script_using_pr_1(self):
         global_config = []
-- 
2.25.1


