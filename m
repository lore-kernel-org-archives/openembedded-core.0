Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.341.1611586330713546730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bwRr6Jtw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id e9so7753574plh.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vyNWvAlR3ZqX7+kc4IocixC1Z3xZvTnfSDEhgkd7M7E=;
        b=bwRr6JtwaFzhy+WoygaE21IGQATAazSmsQhArCfLHYA3mOkxWCDb76N5Z+QUwkiZnH
         kIDFrMZFNtlSoiSvLHy1L6DVWWh1fCOgCvFbTk5eaOtMrHPECXzUpE3hJrw8JY3zlXKa
         3klyRnEWr/cT8uj4vGSn8Tgw5K5g205UZtA4vrOHjrVndStgmqUzdpnMTStb5Lu8DZbk
         2dIitw84MFwb14Mo3We0W5ZXUOJSIbyh8S2Ic/Ezz6bXqC76lJoEnefvn1alquWrE84+
         C5+UvQRtMK9c4T5Ceu/hynm6ibeSM9usY/Upl9uhJ/XNK5q6S+Xwf8P1RvoyJPA9N5MC
         5LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vyNWvAlR3ZqX7+kc4IocixC1Z3xZvTnfSDEhgkd7M7E=;
        b=d6dRpDkrHfA1MbRHBcoOMyI0r8Ay5+XlXSmxW+HdCD22tf6L+kC4bKM/i8h9fD97Tk
         OF0MUM+oaD0ofuMrRZNGAqoRs33jw3RXDp7V0fh4fg2hG02r2qwWcVInDq3P+pLpiPhS
         6CzmHzr1G3UkOPBMpMcLvlZ3+kqjNtlH7Ms2T6QtOjjRo7Zyc6c2EX49DjwEr+BjcOZ+
         clCAzmJXUTW957Ebg914Ysi0YpK7WKXl7lNqVNlCHaBSD6tjxZNBHs8Xujui8XHpI9/j
         B5k1YzEjMNuW0Ve8MW1HaXFvW964mW8kMNNXEDz9EjOuEI9XPycQyt4OWpp+YAv4t4gV
         zHOg==
X-Gm-Message-State: AOAM530vpVj0SsKkTh68IZohm1YzEumnpLZ388+H8TYrC8I/+06zuVd/
	pTk8UYPpFRS/q+7q5yz36GWXlMnHadNItXnkjRk=
X-Google-Smtp-Source: ABdhPJyGQHNqzWN9yW42lLNqPG9HLWTM7VLxTBiIH7Sg/u/p56jrSNNx4M39BQ5MaQTajaah3mkYZw==
X-Received: by 2002:a17:90a:e508:: with SMTP id t8mr579778pjy.90.1611586329606;
        Mon, 25 Jan 2021 06:52:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:09 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/47] bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
Date: Mon, 25 Jan 2021 04:50:44 -1000
Message-Id: <9293a306640ee6bfbda6848e744aab352cd8c1a5.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacob Kroon <jacob.kroon@gmail.com>

Since BitBake commit 0d5cdd0c0d65f2f81c3af0f3767fee86c4142c3a
TERM is no longer preserved in the environment by BitBake, so there
should be no need to whitelist it by default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72c4222b095a49d5ba8252abbae5025196519cd5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdade79abe..9e6b68b6b6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -875,7 +875,7 @@ BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
-    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
+    SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
-- 
2.25.1

