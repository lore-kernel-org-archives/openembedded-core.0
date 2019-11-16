Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC327F96A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 23:38:04 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id a18so7300387plm.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 15:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ELlJ7LwD3lt2Q/AqVoBe8r2ShbTSHX7ejqqG4p4b4AQ=;
	b=RKQ2FlzwoNfdA1txjDeR/CNhRggAITNHDGDBqlIwwQWWDwxPOtsdQpe1AqSh3YKZ/1
	nXqWeszPiW2deXQSm/4d7w7NftYee8FhUI6mlzOjwcIPzCGr3PvYXO43m7+oHI6y2HDU
	5midiNAu4OTeSoRHEF/deoNgYuuf5C9mRgAPZZhOWWZlJstIrTZ+j7Uh/kws/qikxdjp
	/BkIX42kGRaOh4trXjMWZkp0t3zai8/ZzqwTamUaNNLzYcFCK+pNkQNM5NrIuJZE0Ufp
	zbtPlZeIHRCDEYSO5FFKjL3xegQ2ncwfnvFNFFEbgkJ6cKFaCHg41i9sWD+Qxm03A2oK
	vOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ELlJ7LwD3lt2Q/AqVoBe8r2ShbTSHX7ejqqG4p4b4AQ=;
	b=k/o91vAFd6QiLNWEtg5FJLSwbVpDywPUPLNtffjrxdJyrn91gNBX8XsiH6aMO+mhG9
	K17Nj2Ll5AM+ihivn5XBNeo0R9+kZyap7GnVnn29of4SSJpbdLzs/BFupUXtV7usrZZl
	xORws948BIxJW1qahVdzPZygJVWNRKY4QOk1JKdubI8wDI4TzGtp1Z8TWwdHkcmX1xJp
	umSGHmTT6Ey9Q/2HejIIZSe08xmxzGO94U8uihEW3QtHHuS7grD+DhPm+rdYUiK1VoLq
	bvwZjACLKqjxTiVGvMPDmFO2e6t8l665t4NjQdrzyN75/1o5lHaK+yG3ppHklCIpOZ9g
	fTTQ==
X-Gm-Message-State: APjAAAX1XSpZyKDjT0+R+QBZGKWZHsbKvEhVerDRWKJLspWMoAjga5sO
	u801FJtsdbeXWCsL+AVGPH3CXVZA
X-Google-Smtp-Source: APXvYqwyczocLGSZKqQrgXYAsXvXH9T8VDuAT5xmDyBdmbzqBhei4rOnLbu+l9m6oUW2VrChMzG7Sw==
X-Received: by 2002:a17:90a:8903:: with SMTP id
	u3mr9825793pjn.137.1573947485124; 
	Sat, 16 Nov 2019 15:38:05 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:994f:cb85:728d:a91c])
	by smtp.gmail.com with ESMTPSA id
	j5sm15929538pfe.100.2019.11.16.15.38.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 15:38:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 15:38:00 -0800
Message-Id: <1573947480-31325-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573947480-31325-1-git-send-email-akuster808@gmail.com>
References: <1573947480-31325-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] oeqa/manual/compliance-test: remove crashme tests
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
X-List-Received-Date: Sat, 16 Nov 2019 23:38:04 -0000

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


