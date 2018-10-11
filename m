Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE5578E49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:21:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id e187-v6so10656525wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=5I6PYVN7aLs3WQqq0TLSfVtOlkSgdyBj44WlyYkfNaY=;
	b=NHAN3Y97OCL93TNE8ghDO5aK3K2HkWZ9fVwnAPQFXoM4isq/dQkHB9tjY2Yjveqhpw
	E+ng6WygLFNbJgJoBwqXAT1yGXJFY3iIr5nk7HZc2hqqYJAPQ2B+3aQcBIrYryVAgKqu
	rAKjjqfU/SCNGRSl27MI2U6XZzrWrUPbdh7SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5I6PYVN7aLs3WQqq0TLSfVtOlkSgdyBj44WlyYkfNaY=;
	b=oExptEih8aS9RJ7RKw12cjtUH2DMgwM/hudF1FHmPs5dRbcT2IdWcXW3EJOR94R+YM
	lhbzXBPI1/AIXQVe/4Qpg6M1x2LJsXjQbD/cbywW6OlNAGUA9bxvVJBA/DhXf2myukMH
	Hvi2XxMdQZE1UfjF49XrDD6YcncXDD6qCPVuP50fFqAyLxmLJar951Wx3PRF8Jeg4ZQ2
	ve762wcDURwIUxnnDjuvtw+ZKAlAv2Qq8ViIFIbupPUfwg3m+xGEeIRNCDd+OvXv0vdC
	e3Rc1BBBeDw82A4yjCLLLKRkd4GJy6eyJVAfZM2OMZalcUJoCWWOlQxzmC57Rr+SV2fd
	O+tg==
X-Gm-Message-State: ABuFfog3KwvghyHvXz0iApFr7BhoDkUolVyTYSbzmwvtwLtdgKnpeytP
	eRFN+171M2O02y3CbeodTQy3+cGzu64=
X-Google-Smtp-Source: ACcGV614ywwNO05jtsM/ryDBHuLeuXh2LjomG1ptoZ/NOwJHA9G/H6nOfngIEZFX1eNAd/PDJiMGgw==
X-Received: by 2002:a1c:f53:: with SMTP id 80-v6mr2675671wmp.58.1539285679037; 
	Thu, 11 Oct 2018 12:21:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	203-v6sm11408363wmn.34.2018.10.11.12.21.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 12:21:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 20:21:15 +0100
Message-Id: <20181011192116.30034-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] oeqa/manual: Remove bitbake-selftest execution
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
X-List-Received-Date: Thu, 11 Oct 2018 19:21:19 -0000

The autobuilder runs bitbake-selftest already so we don't need
to execute this manually.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/manual/oe-core.json | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index 3e2f321240d..0e8f01a9123 100644
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
2.17.1


