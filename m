Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D20377BCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 13:00:17 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id 88so107474706lfr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Kp8lxGWsht/B9opifmlg58z1TPuChqWnA2GlCgO7m6k=;
	b=YWk4gzFfS8P8uDiPHKXDFvN0AED7AiIiHpDXZFo3zxKD/CUHqVebFgI11LQESymX3v
	Bjvo8v0zZjb/cITjTffTaB/uaafGytQ4NsHpckHzV3KFdQ1Lvgb2AcxMIRSCLWgesnic
	YpVX1E8jTktdIbUIdi7k6INPIO40apeEwVBjc1U31jpClo+hN64nVk9ODpBonff+v1Cr
	gzPjeBYBlA4dKN+He2kRJphRKs8+4OPT5B5K7mT1E1eyv1/rwyBKxPSM3BPZroGx1u91
	KZNlcAkTvyQYgh9WH3iQ6CAL0aam1dioRGy6TSDsnsdErG93GUS6JZX6x9z72tW5wnM+
	OBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kp8lxGWsht/B9opifmlg58z1TPuChqWnA2GlCgO7m6k=;
	b=ip9EsieJzoZe+SVzGPKKSeoXxCCge6ewiHs/pfU5/lOB4/I/lA2qbbM1dXurCBTmIO
	JSoJr686V8rMhULPKivBFWNy10DYq/4YELTENxgHdZenWdFskYy86AvLOmCciLM6CUrm
	d4W4LhLOqfOxzN6GRD0Wu8f6G2Mw0pJkoF3rI5QTqtZil1yJakLRWswUICw6JAGI8e4T
	KpYPE2merqsZyvpJ7CKp8j2GJ/XMh85Z4UBF+PTlJfIexnqU9cD1Oq6ztpivtwQcC7T2
	7gPxXM8GzgUkyBcnSzPOyFxhdx7KGT2V7UStadCyUGJJIGak8SIoMFEmMdkBqKRLVlCF
	Fhvg==
X-Gm-Message-State: AN3rC/4KbSwhgfA/HIpxq6JjTponppVDbQMMcfmjvwXq1KIb0/cjrXlw
	9kZ+sO5zUZGubA==
X-Received: by 10.25.209.20 with SMTP id i20mr10675704lfg.49.1493211618084;
	Wed, 26 Apr 2017 06:00:18 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	d190sm523816lfd.23.2017.04.26.06.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Apr 2017 06:00:17 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Apr 2017 15:00:16 +0200
Message-Id: <1493211616-7356-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: Fix typo in help screen.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Apr 2017 13:00:17 -0000

This was overlooked when f6a064d969f4149b was merged.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/help.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index aee2451..d6e027d 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -721,7 +721,7 @@ DESCRIPTION
                      bootloaders.
 
          --exclude-path: This option is specific to wic. It excludes the given
-                         absolute path from the resulting image. If the path
+                         relative path from the resulting image. If the path
                          ends with a slash, only the content of the directory
                          is omitted, not the directory itself. This option only
                          has an effect with the rootfs source plugin.
-- 
2.7.4


