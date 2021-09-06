Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.19619.1630918556228847315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iLYJTfHK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id q14so8704993wrp.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPtQaMprZjJAxSWcbCZ/y6KxCQZKKFv4z0s3RCG4S+Q=;
        b=iLYJTfHKwapQ9mschapA/JPKE1wW08CgRUGD+aLri7iWNwECHgQ11iUdnhB44LoB8Q
         STUcSo80RfZ8FxBpKR0wC8Ke8lM5QNMJx8cktBcWdtkVsCIvQ6g4SQlx/eLTOZh3sErw
         cXQIshcsq3976REwELXTATBQNFSPAAfHgZ7Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPtQaMprZjJAxSWcbCZ/y6KxCQZKKFv4z0s3RCG4S+Q=;
        b=loe+3IzvprR5rYNYiUL8KeJEkvTa3CN+vKhc3IXu2CGZxKyLh1VnRRNHszbfWYUgZG
         dtaPJaUWEmXPpB9edubHgxpuVyhBzMcR74WisIbg3VAHJLevbdFyevS3rVBpaQ0kTc6+
         nmYH/+t0VZjyvfFrmhe87hmaMnUhW6K97hqFVe3euj4KLkdGEwibgQVWw0BUETahiOUh
         ayJHKL1NPcl2DZ8nmAsodSrfgih0CmvifPNY7ED/9I6APLJ9bxUy/aBolBk9fBO3csOw
         2UtuqQUHVI0hoq9YZwwe3/3t3plhm5DMJJzE0g8LOve++WGFFDzUorhkIha2q2tkssE2
         u+KA==
X-Gm-Message-State: AOAM532y1wIP/MDdbnclfOSRGjADW198O7wPI7kP8mR+5A8cGUmlmeAA
	CeKK1ZrpWCAOCes9ASC6eVkcScPsAwnIPQ==
X-Google-Smtp-Source: ABdhPJwXLTvPpdkCCKsog/TsFmdNV6qIPoPWhH9RvCjBVdIUwXeJWtGnNke0IYDX7iRz7MVxE4S2xg==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr12471950wrm.237.1630918554578;
        Mon, 06 Sep 2021 01:55:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id o8sm6253685wmp.42.2021.09.06.01.55.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 01:55:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] utils: Drop unused variable staging_install from oe_libinstall
Date: Mon,  6 Sep 2021 09:55:53 +0100
Message-Id: <20210906085553.1073121-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable/code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 072ea1f63c7..ab060195601 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -30,7 +30,6 @@ oe_libinstall() {
 	silent=""
 	require_static=""
 	require_shared=""
-	staging_install=""
 	while [ "$#" -gt 0 ]; do
 		case "$1" in
 		-C)
@@ -62,10 +61,6 @@ oe_libinstall() {
 	if [ -z "$destpath" ]; then
 		bbfatal "oe_libinstall: no destination path specified"
 	fi
-	if echo "$destpath/" | egrep '^${STAGING_LIBDIR}/' >/dev/null
-	then
-		staging_install=1
-	fi
 
 	__runcmd () {
 		if [ -z "$silent" ]; then
-- 
2.32.0

