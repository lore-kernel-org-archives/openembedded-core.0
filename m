Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393BCC433F5
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:38:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.10678.1652193472586085842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dMmXZV+W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id g8so15104052pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WQ6KEzHqCaNWiJkGMkoesgnXsqTQa2/NaK1+80CQ/8c=;
        b=dMmXZV+WwFGcHLRVwETQAZNvwyquBI0sUaJIq/z0CKrLwX+ZBk2sZTYIhYmC32spaI
         Nc1OO9qn1VDMXkV3hdQBXLtnDGjEJiBvo6U9Ka9deBlHXC2HEiPfqdpeuzUkef4EWiLj
         vlHrO6J7aJAI2IPS/18SgFV70q2VKyGbY52PkWRQn7BHrddWpLvU/RSyUx9HumkQ4hXp
         S7nYYCv5OfI6lHFtAyR254hoVeHVRqs+hfa9I+vSZiVsFCc6ivjeJM8B17bkz+EXqy7z
         7pWrKJJEjd7tQUMnlCFZLnYEjRJlpqpYbQY0st5QH5669k5bnKODfNbXmXSn4NxfJTFf
         s2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WQ6KEzHqCaNWiJkGMkoesgnXsqTQa2/NaK1+80CQ/8c=;
        b=J+SUoBj4YcechvTQ7jI8EOwC/74ckMLhUHYlbAkhue9E924YLFwrqWKqTlvWhA0ocm
         avlQ39VRQT9Nb04Nja2D3mfGCMu5RuvnRlJUUTvX4S5a0HSiyaCkHxQ39eMaj/wyqo40
         oZkD6PZMRHVID2nVVaJNlf+MF3XJOdRHzsYjPZCE3EF8axH3XDgJ49Mg7ap9gkzGNRvZ
         UR6iMBBUSbZnWRTSsvx/FeFomPrzHZhPSrUOrUfx8XtY6E+Wcl4w6Jng/xA8BpYSg0ZL
         xavRuMgCgZej8wdb4EaP8mYJ/7bVzgFFWtFNdd4MRMrtKA55EmBdGBq9PU1oPbWoZ70y
         laHA==
X-Gm-Message-State: AOAM530SRWKAsfHQCj8KbjFj86ERrO+rQkZJ6a+lIQs9em5uZ2ssump0
	KdvULqmKX0GE1gXrAyBTWlkdMf0fSRnvvv5T
X-Google-Smtp-Source: 
 ABdhPJzRlYue37jL95m92veSBTd3FnTGV/T+rrv+qsmA50lejsU/SuZqLGqgWNk96HDIVraFOLtr7g==
X-Received: by 2002:a05:6a00:1590:b0:50d:f473:c346 with SMTP id
 u16-20020a056a00159000b0050df473c346mr20982447pfk.27.1652193474181;
        Tue, 10 May 2022 07:37:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.37.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:37:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/40]
  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check for
 phantomjs and optipng
Date: Tue, 10 May 2022 04:36:45 -1000
Message-Id: 
 <1063525be9b040ece8636c03ac8bab13952eb561.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165423

Use of those tools was removed in b5c131006e3fad0a15e6cdf81f71dc1e96647028
perf-build-test/report: Drop phantomjs and html email reports support

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33df447affa7a3a360b1da028e6b12fbcd388db6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/contrib/oe-build-perf-report-email.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index c900720f6e..7192113c28 100755
--- a/scripts/contrib/oe-build-perf-report-email.py
+++ b/scripts/contrib/oe-build-perf-report-email.py
@@ -27,17 +27,6 @@ logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger('oe-build-perf-report')
 
 
-def check_utils():
-    """Check that all needed utils are installed in the system"""
-    missing = []
-    for cmd in ('phantomjs', 'optipng'):
-        if not shutil.which(cmd):
-            missing.append(cmd)
-    if missing:
-        log.error("The following tools are missing: %s", ' '.join(missing))
-        sys.exit(1)
-
-
 def parse_args(argv):
     """Parse command line arguments"""
     description = """Email build perf test report"""
@@ -101,8 +90,6 @@ def main(argv=None):
     if args.debug:
         log.setLevel(logging.DEBUG)
 
-    check_utils()
-
     if args.outdir:
         outdir = args.outdir
         if not os.path.exists(outdir):
-- 
2.25.1


