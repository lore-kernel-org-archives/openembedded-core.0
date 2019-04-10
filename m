Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 34D977D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:03 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h4so2874921wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5yBB3ORmU56twjf6cekX2o+WrhcHTEESS85gXq1cxHQ=;
	b=SPSncHFLh7n4jgmRNyU6GRygYlk0dYxDdnMzzVE8Q21C5zpF2/DNxRKnIhPkseD5Kw
	XLxNM+ZBpl0SIWMJd4O490LOYh4mXebARwUJIrbWXH9x+XjA4znDXL9r9eKl1mgUUm+D
	yYHV8aC7GQfoBc3Cu5+H7cwh2O1f37ygQrnl7Puye3YUC+mNvsnPDxP8GtXzfc9oPYyJ
	DJSD/vCAPmA7ojm9XDsX/2n1e4a/kC/U/QhVCkc/NZJYuZko3xpPjLYHzwGvutUGICm0
	fo/9ov7WBa63aRsIu5S/P+J5YF+vPoWor3ZoZ4v5Y9fEqsGn5SLwRLoxHh+l667i27uD
	alnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5yBB3ORmU56twjf6cekX2o+WrhcHTEESS85gXq1cxHQ=;
	b=r8ZyoPAn6pDezjFRRMZqWwltTnVDSK5gEHCEcc0+pkEpsB/IMLG0uFeiRPA2YG7xqO
	IYJtl3700k9jntZPX5bDHtCkb+F6YPvSpUNynTtaHf05hfHu0RK/d0SnF2c86ObViQ3w
	elF0swgb4LMcXj9/mE8dfpzMY4/lwMtn5kUD4xXy/Cn9hb96XUtvQKp60oVf4y9AgG3T
	GRnXFfsQGY9FbWRcuU2hspMHQRz2np7VVg5d3LkBYjGC/XBtAcIO4YrvNOqUMlbV0N+/
	Tu0rh2dmwY7Y2AlbSwI4JnEqIBTgen3VybmYNpDrQuddC9t53RcbWZR1mUUymMISNvyG
	AyKw==
X-Gm-Message-State: APjAAAW0I3EArtmCL0GxtwcMr0xvQhP5zqAge5oB1MXMLJrHYBme42eG
	GaYhnWIgVSD8eq04K2fU9TuaweMBzpw=
X-Google-Smtp-Source: APXvYqxCM0ntlvTudeyMkg+Hxd9qg52Xgd2e0R4nxCfP5Y1m877ACSRVnI+ua4t4cPuNtT1qm2UKSw==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr27970151wru.186.1554901923708; 
	Wed, 10 Apr 2019 06:12:03 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:21 +0530
Message-Id: <772b2b883249c8606b2df380f749320cb683a7b2.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 02/33] oeqa/manual: Remove bitbake-selftest execution
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:03 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The autobuilder runs bitbake-selftest already so we don't need
to execute this manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/oe-core.json | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index 3e2f321..0e8f01a 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -260,35 +260,5 @@
       },
       "summary": "test_bitbake_sane_error_for_invalid_layer"
     }
-  },
-  {
-    "test": {
-      "@alias": "oe-core.bitbake.Test_bitbake-selftest",
-      "author": [
-        {
-          "email": "jair.de.jesus.gonzalez.plascencia@intel.com",
-          "name": "jair.de.jesus.gonzalez.plascencia@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "clone poky ",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "cd poky ",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "source oe-init-build-env ",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "bitbake-selftest -v\n",
-          "expected_results": "All test cases are executed and no errors are reported.\n"
-        }
-      },
-      "summary": "Test_bitbake-selftest"
-    }
   }
 ]
\ No newline at end of file
-- 
2.7.4


