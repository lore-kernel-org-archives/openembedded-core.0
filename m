Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A12C4332F
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 21:47:31 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2990.1651182446167603629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z8oxvWB0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id s14so5490140plk.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 14:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Td5p42OazpTYQgEhP72s6RFxDvo1/7PA2UUMD9lGQlk=;
        b=z8oxvWB0K0kScN4aNXfTO0lqWwGugLgAztFeByYmW45j2Y7+FiFAK4+xOWVfjRKicE
         z9C6G0utOyb+daCKI0w4jDwOUul/7rFakqIjeYT8zsPRs4D+0qzv8TlaF2jVLqvZFLCe
         5P1LCimZjQBnK/fi4aeXKPFmKZ8R8Kp/qLwQlV5oASZXN9maQm0vUIrUP9Ry/Q9VAVnh
         TPrhmrFyw513o3OJbldnwXWY5Zl/VgsrlYQRj7XnRrRSRg1oDARlmOg1GaDIVyCISBX2
         ow0pBWmUqqK8ZjTNPvRbbe+7IMQHAgTsfoLIIo9svWjmWuaE4zRm85zNVCFEPYFOl/tF
         u77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Td5p42OazpTYQgEhP72s6RFxDvo1/7PA2UUMD9lGQlk=;
        b=YDJOdUK98TagWIO5ZmZVH3w4e9ZYbm+FJ6A0sgGiTORQLiAV86YeF6o2ujB2qvABVW
         gxlPtUZ2cwBfsa7vizEVi0aLxzKG3r/ISJHPVAHy+UHF1HBruAjsq/fOSH3CZe7c19s+
         0Ttq6mbVNCfyQKBIRkgqyVR+flJYUd0T3i3sbCoFwEw6f0GSIsqtpi4h79erXgG1Aj9s
         BvBTHvMK2elY/dRThHToeCDeAXi4ZK12wPJGK62Pa8wGoyhHHT9w/AxpcvdeiLK4YRMH
         P/EoiPE+a4lTg0SsXv9Tn/07nRmCmUx9NHTjJ3XILYZAiZc8Pe5rInD5sruqId01eB+e
         tFbw==
X-Gm-Message-State: AOAM531XmZXQ5OyNRAHc+DE2lStzV+2638MC4hXlk7ohollU47DEGeNq
	AAoQZ+hJeArQBcea1m/jh2UBznv65cqLphNHlFY=
X-Google-Smtp-Source: 
 ABdhPJxOQDjJTEE8NuLsv5ohDFCz/3ojgfWUHzXXyLN9gUG8BBSBDaCC/ModryT7P5q3D+HTyWXzlg==
X-Received: by 2002:a17:902:e5d2:b0:15d:9e66:b3f7 with SMTP id
 u18-20020a170902e5d200b0015d9e66b3f7mr7591887plf.141.1651182445119;
        Thu, 28 Apr 2022 14:47:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c138-20020a624e90000000b005081f92826dsm749742pfb.99.2022.04.28.14.47.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:47:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/6] scripts/contrib/oe-build-perf-report-email.py:
 remove obsolete check for phantomjs and optipng
Date: Thu, 28 Apr 2022 11:46:36 -1000
Message-Id: 
 <bb3fc61f0d7f7bcd77ef194b76f4fdd8a7ff6aa5.1651182153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651182153.git.steve@sakoman.com>
References: <cover.1651182153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 21:47:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164984

Use of those tools was removed in b5c131006e3fad0a15e6cdf81f71dc1e96647028
perf-build-test/report: Drop phantomjs and html email reports support

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


