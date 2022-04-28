Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE95C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:24:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.9567.1651148666672783090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h3hjwAoB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e2so6546646wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqh6yvGeMIvvnR2eL/74jYG7Xl2zAWDCuc6gDlq+FKg=;
        b=h3hjwAoBHjnAtwgXL4oY3GKXu7bIRVISKM7MaK/dQIbqH0RnP7467PUsXpEvGJhzS3
         7/hmKvdrwfHgUDXMSnWUPVw2bpHeLyl8yKLvoXaxXSvZFdQOjfEBOP0reQBsF6VVV468
         M2IcZPRLwVAjW2mlC7baX3mc36fqlrXfMnorw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jqh6yvGeMIvvnR2eL/74jYG7Xl2zAWDCuc6gDlq+FKg=;
        b=tx/KeKwMEx49p9Kc+NSCz0WFFepa1UJYMxnwIxuK5ckxiClKpF3CRSQRv3ECKaouNA
         56h7nQCmXAZR021wbRsUV966eSQED9HqbKovpNsvzKIwI14UwMAMVA/glFbCZnDCmnHk
         UZzUrIy5+yFP7WekTjlPLFuAU4Ce9gg1DTE/tK4SjpZPcNoKI/36pPjRITyyo8+TzJxB
         7QVauGncdt6kOblvKgor3A90u1aa4SnBhq/iOXxhTBhfeExsVogrdRA6wBjXy5gFQ8c8
         zybkIFcutA0wQ1Ng/dCjBqZnMYpdewr4SDD2qsPhO8bdOr/rlxfZhI49aVehzLuWfV/Q
         AHiw==
X-Gm-Message-State: AOAM5326JaU0xR57fbanUhsi5XNh1PEW/10rMaZJiPhWPSBSeOPBzO8f
	CxD3r39fi5b8pwIK6D6NFD1YXptnAhjwzw==
X-Google-Smtp-Source: 
 ABdhPJwHK3vGSiRa8bs4F5Pa0t7Y5LcVy76UH5GJsqefFAuj24qbCvfPJ+iEO+etDXD+XMlhzdGfxA==
X-Received: by 2002:a5d:5848:0:b0:20c:407b:4195 with SMTP id
 i8-20020a5d5848000000b0020c407b4195mr964148wrf.698.1651148664837;
        Thu, 28 Apr 2022 05:24:24 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e3fc:fa86:a530:4b66])
        by smtp.gmail.com with ESMTPSA id
 f66-20020a1c3845000000b00393e84ea043sm3997035wma.44.2022.04.28.05.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 05:24:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH] scripts/contrib/oe-build-perf-report-email.py: remove
 obsolete check for phantomjs and optipng
Date: Thu, 28 Apr 2022 13:24:23 +0100
Message-Id: <20220428122423.2871904-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 12:24:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164943

From: Steve Sakoman <steve@sakoman.com>

Use of those tools was removed in b5c131006e3fad0a15e6cdf81f71dc1e96647028
perf-build-test/report: Drop phantomjs and html email reports support

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/contrib/oe-build-perf-report-email.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/scripts/contrib/oe-build-perf-report-email.py b/scripts/contrib/oe-build-perf-report-email.py
index c900720f6e1..7192113c281 100755
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
2.32.0


