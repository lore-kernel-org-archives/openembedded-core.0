Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B496731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 18:48:06 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id j37so3559325qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 11:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=RqpxGLbwQEo983yP76ofNNPWwu90ieTJSmTGpexc59k=;
	b=LedU82V4t5bXBa1ZjJR52scy+UTsHB8Qq6WeisLICRCyMi6a+Z/RPTgPyh/Epcal3/
	Ns4fZXueuRm/5H38T7X3w7Lx/mGwgfLPYYW0bo2ErXPYLRlSuFQZ4MzVIWyxyAlSBbnx
	oPv0TXfHUZtbe2kL9Z9jVkNmGslJxru5q4pcM5ByizcCQpeBKbp6GQluy9+BnsMApTsz
	aKdFkVkdzOXExgzv8VMFWBruKlAL4AG2dT9uc12KOZA5iyCxwFO8GkVJsa6wT7nqSBCv
	6Dfgj9f+v0MH5R4PiwYeEEbVvozFCXRq6GIKqAVhyGSeJWIgUpNXZt66/f4ZrvOeeOMR
	bpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=RqpxGLbwQEo983yP76ofNNPWwu90ieTJSmTGpexc59k=;
	b=hw5Ddbx7eB2EoRqQMNuX6GuX0oM6wu11YXaAC09kRjLLM/7K1EWBMQHMWu/jQ6zuvD
	DMlCvagOLNTRb/AbocRbj1i/OhB5cB4cPoRNNrvPUMFneaAuPsd9qWfphfp9BQRzrQJe
	HQqLmsMVpvOkF/sFext6YDODR3HIFPSLqzI5ps2tl/fJaw+EcWNX5lj3MABTpcndfsup
	qdcZllDtsZiNngq4BJUlTIm9PxmeeEvcR6K1QTQQMvdfB+vaBojC6lbIrNHvbWhmdd+P
	gGJZE2OPmYvVRhooAW8bSV8dj8B6lzWt6vF02K0triyBJtenojyhQLJo+YluiPKtPVbu
	sv/A==
X-Gm-Message-State: AEkoousLm7flPdTLP2lGCnT/O7cFw+UF9xQaS6aJiG2x1gnk0be2RkScls7DmKIpxGPGEg==
X-Received: by 10.237.55.225 with SMTP id j88mr40792412qtb.131.1471373287702; 
	Tue, 16 Aug 2016 11:48:07 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	b142sm14498350qkc.43.2016.08.16.11.48.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 11:48:06 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 15:47:28 -0300
Message-Id: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] python3-native: Change code style for rprovides
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
X-List-Received-Date: Tue, 16 Aug 2016 18:48:09 -0000

Use a more readable code style for RPROVIDES and sort recipes
alphabetically.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/python/python3-native_3.5.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb b/meta/recipes-devtools/python/python3-native_3.5.2.bb
index 061b595..3334cba 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
@@ -42,7 +42,14 @@ DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native s
 
 inherit native
 
-RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native python3-importlib-native python3-io-native"
+RPROVIDES += " \
+    python3-compression-native \
+    python3-core-native \
+    python3-distutils-native \
+    python3-importlib-native \
+    python3-io-native \
+    python3-textutils-native \
+"
 
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
-- 
2.1.4


