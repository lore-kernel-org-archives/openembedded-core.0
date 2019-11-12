Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1EF7FBE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:47 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q17so10965245pgt.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ELlJ7LwD3lt2Q/AqVoBe8r2ShbTSHX7ejqqG4p4b4AQ=;
	b=c1fdfG0UVDWRddTf1bYJ++DCB63lWQmX8TRpE8huB9r5WgmIC7YTAayJ5AQkAtpw9m
	eREqa63o4X7E4XWVa/K9ICe6opmLpGdAXTnS/lsiSMwnV1cL+s/3BhngOe8vmKX9VFLc
	Uc+EqkViDibH0jXX8aHCOK32UxA3iljbqjRDQCyzSGrfIqWAquwudXvP8tXI7E28KEWF
	UfeB9R7SqCShZfY8PH1sZkmj5XTbj/GoEURKehCxADImhp6SKHVznrG3C4fxYjKNclZ5
	qKLykWYfRg1hrWpBNj3AxVNvVQG4gHu8bxVxW6XjzgLN0cexm2OEBfkd2wMDKtIgqcui
	HCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ELlJ7LwD3lt2Q/AqVoBe8r2ShbTSHX7ejqqG4p4b4AQ=;
	b=l1W1m5Vb44papwu5515iqJcjIQWw2hKhq7Q+dNTUjZnLgIa6NBnzvSqajQSgTZJYt4
	HpyCgTZX/KCRTUGQFIDWqmzjLJ20SjtqHaWArk4hPdLV9XDqbaOLeUQjDkgOgMkOpFXQ
	/WHcD91eggSFA5WKOmMesQdJEN6TkP8ilh4XqnA92Qfu/wi4RhmmT9FFtFF6kDbmMZHR
	z7LqmRA53xLlbZnWUIYiVYhMNObku3kgusjm8GwclEcwqDpGlBNu2JV3HpMoz9Tu/hVO
	izrvgyt1MzKhycrGvtobYnymr5m8RvLCTd+wxt6aYGKjQmve9FRrFPN+zYTj0ilb+aND
	W6Sg==
X-Gm-Message-State: APjAAAX1pI1BUwVsxadBsdMrdksC1Ah79KK74f2S5499HCMF6wfwUNsG
	UTkceUQ0vDFwJRAkaQdjsz+DjUSZ
X-Google-Smtp-Source: APXvYqxvJO+PpgH+gwSZ+lvD8AtzujCnqZPvi/K9Asw1lVeZL1YfP7PHwOrx5nTdFvsuHdWW4V8a+A==
X-Received: by 2002:a63:5f04:: with SMTP id t4mr30050110pgb.73.1573533228117; 
	Mon, 11 Nov 2019 20:33:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:25 -0800
Message-Id: <1952ba9dd1297d7b7dcb308c2b78725b493cc7f4.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 06/20] OEQA/manual: remove crash stress test
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:48 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/compliance-test.json | 48 -------------------------------
 1 file changed, 48 deletions(-)

diff --git a/meta/lib/oeqa/manual/compliance-test.json b/meta/lib/oeqa/manual/compliance-test.json
index 367a416..e374c5b 100644
--- a/meta/lib/oeqa/manual/compliance-test.json
+++ b/meta/lib/oeqa/manual/compliance-test.json
@@ -1,52 +1,4 @@
 [
-    {
-        "test": {
-            "@alias": "compliance-test.compliance-test.stress_test_-_Genericx86-64",
-            "author": [
-                {
-                    "email": "corneliux.stoicescu@intel.com",
-                    "name": "corneliux.stoicescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Bootup with core-image-sato-sdk image",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Execute the crashme test with below command  \n\n./opt/ltp/runltp f  crashme",
-                    "expected_results": "The stress testing should not make the target crash. Check CPU usage and basic functionality of the system after the tests are over. "
-                }
-            },
-            "summary": "stress_test_-_Genericx86-64"
-        }
-    },
-     {
-    "test": {
-      "@alias": "compliance-test.compliance-test.stress_test_-_- crashme_-_-Beaglebone",
-      "author": [
-        {
-          "email": "corneliux.stoicescu@intel.com",
-          "name": "corneliux.stoicescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": " Get crashme from http://people.delphiforums.com/gjc/crashme.html",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Follow the setup steps on above URL, build crashme in target",
-          "expected_results": ""
-        },
-        "3": {
-          "action": " Run crashme for 24 hours",
-          "expected_results": "Target should not crash with the program."
-        }
-      },
-      "summary": "stress_test_-_crashme_-Beaglebone"
-    }
-  },
   {
     "test": {
       "@alias": "compliance-test.compliance-test.stress_test_-_ltp_-Beaglebone",
-- 
2.7.4


