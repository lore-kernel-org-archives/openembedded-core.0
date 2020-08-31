Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.47179.1598851216909629775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 22:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PknWLtgg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id j11so2467767plk.9
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 22:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OpdttxHl26pdEEqwZgvCl4Xgl0RF6K+vnte9+q1cnts=;
        b=PknWLtggHDX9sSaal7v2HV7uwp0fEsi8eMYUIJWQnrVLfTs+3hI7Wo9jUYFh9En8mz
         YGKXO6sYzIts+T4kVYbzvRpJMcSo86X/E8i1VMYFM3VM7G2+50qZL6jFPLl7LtMkPxYs
         unMwUQgFqxheDOMwOUfq0au5Kn2iutyPKdIybcRD4iJ+01eqIjDRfiZWjWmKmBEyzBJD
         eSrAXGw1w5FnGUR6be7O8ulTVTu779eonZiRU9szBzRfLBh2CLSOVOraF2OU54dyyUwf
         APOJloEu6sRpljhQntjdYMq2iYSOLvrUj641IR8yHzfomIfSTOBOe200btevuAewPelj
         A8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OpdttxHl26pdEEqwZgvCl4Xgl0RF6K+vnte9+q1cnts=;
        b=bvcv3aGiiydarA7KO4FS7NfDOhS+5OvW4W5fLUgfZ1rRRq+UFzM/fbgg/UGwoYzWe4
         F64ui1wMwWG9W+109yveFvYPylrv6Da0iTlcBJwjc6NnWmHoquRpl0mF9Fs6pLw1wBit
         urfrlS/JECga1qNZ4xNY1N5Z6ZmRARRDqY5CxkdsdjoKADadPtQ0aajRyOHmQEQMBn8r
         YqxWIvdsyCUre6Kn0Wk9t8DFQyMtbAlAOkt3rJqKoojywRKkDfppQAwF387j5t3HYfaI
         MCzLeBOQ+Xh+c3zhQLpaA4nQh7bOJId1kcOqQIJgITjid8aDBfR2x2Bsi+ZOFdY4pBsn
         XltQ==
X-Gm-Message-State: AOAM5329h78HeFN50BDhd9Nrgol1TT7MoC6ZjKtsKCPE4lapFFr/HYWP
	QcnomCL95fkVNUZCiFqWARRQ4Rr9O2EhuA==
X-Google-Smtp-Source: ABdhPJwL2NL9UQ9SLnStsS69AVqQHkXnDE4YRLsqaWjq/kkN+AxgYrR8jN9XGHsmgUq41Ta8eobq7w==
X-Received: by 2002:a17:902:9a92:: with SMTP id w18mr7464077plp.169.1598851216067;
        Sun, 30 Aug 2020 22:20:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id r123sm2779674pfc.187.2020.08.30.22.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 22:20:15 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] lttng-tools: lttng-ust works on riscv64
Date: Sun, 30 Aug 2020 22:20:10 -0700
Message-Id: <20200831052011.955722-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831052011.955722-1-raj.khem@gmail.com>
References: <20200831052011.955722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
index f7e6ec2cba..0787e04d19 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.2.bb
@@ -164,6 +164,3 @@ do_install_ptest () {
         esac
     done
 }
-
-COMPATIBLE_HOST_riscv64 = "null"
-
-- 
2.28.0

