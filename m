Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3830A7D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:04 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w10so2899416wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GUUfqd64wQj9o7c0E4Y3kXDHY5Wrj+mNRaDEm+EeefM=;
	b=Sbgw9+9apHgxtlAvrcRjL2V8a6v5aGjKDTEWazo9pJdrgSfwYi0SxenW2WoW1JgsWb
	opSpoanrZ2YAYzqcIQxC5dl2wCQ4O2HUXauySVP4hWpBzzjBC1MKcfEBTqqTgMYcxaSl
	f78pyQZVhQOPOjJ9mOOXg02Npuo5FeQ2Vt5EXbzofXKBKYDRsljVDNZEzuUGCBATZpml
	rsuUqRSNU2j5r+K6OB+7v3ia4a+sDtnU3wqY6CXv/Obs4BWmaOAAQO4G235iNT1dOMMR
	azdKPFkDZhIUdn5Tgw+Go1R+8WvRcS0tB6ez5rNKO7m+IbUL8zPl7iPXe3+dP1ZQeJXN
	vhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GUUfqd64wQj9o7c0E4Y3kXDHY5Wrj+mNRaDEm+EeefM=;
	b=W5bdq88QKqfcM5wkFuGKfI2cWb5tf74M4zJ4rlNppo60gaC71ha7B1kS5ymLM0zS0V
	h9EK3ubegA328d1lqGD9pWH46ZVOhxscyVInj2BHiYYHHW/d7rhxY2F36wMAfMgdAEb9
	78CK05xkhoemacvlivDN0krxF4QqnzT0EW8VcW/2ed2Jl3H9Hc2g6RljhMqgYHn3QvS9
	etVAFZpDyxHBxqzaYOrB5jkInxmGVJVwpdQRisgNyGPAUpN8gDb4RJv3RhzVRA6WLPfD
	Fa8xjWBlgwfDWTbwqF10gaqoA1Uis7nXGfC/9RzQ99NoamOnOYiSN0gIo1aHChrzdKjO
	ghrw==
X-Gm-Message-State: APjAAAUJ2MYUpQBz4cLbSDRN/B9QkqXUmq0L8LnHoSEfy29jQlnm79dk
	HPjdF+E5bHCrN4DZNBh51Bj3kHA6h3M=
X-Google-Smtp-Source: APXvYqzHO1XlOU3zbrqyrP2TFQQQKxl+VqmzCHgjSUIVEhs2nF5iu1do14ALtrKNSXOERQA9qsZOmg==
X-Received: by 2002:adf:9427:: with SMTP id 36mr28164686wrq.128.1554901924623; 
	Wed, 10 Apr 2019 06:12:04 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:22 +0530
Message-Id: <90d9542900b6a941a3c3355c15dbfc2e2ac78232.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 03/33] oeqa/manual/build-appliance: Drop test which is already automated
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:04 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The nightly-build-appliance target already tests this particular build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/build-appliance.json | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/build-appliance.json b/meta/lib/oeqa/manual/build-appliance.json
index b8f8927..70f8c72 100644
--- a/meta/lib/oeqa/manual/build-appliance.json
+++ b/meta/lib/oeqa/manual/build-appliance.json
@@ -1,32 +1,6 @@
 [
     {
         "test": {
-            "@alias": "build-appliance.build-appliance.Bitbake_build-appliance-image",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Get poky source code and prepare the build environment",
-                    "expected_results": "bitbake build-appliance-image is successful  "
-                },
-                "2": {
-                    "action": "Set MACHINE to qemux86 and add the following line to conf/local.conf :  SRCREV_pn-build-appliance-image = \"${AUTOREV}\"",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"bitbake build-appliance-image\" \n \n",
-                    "expected_results": ""
-                }
-            },
-            "summary": "Bitbake_build-appliance-image"
-        }
-    },
-    {
-        "test": {
             "@alias": "build-appliance.build-appliance.Build_core-image-minimal_with_build-appliance-image",
             "author": [
                 {
-- 
2.7.4


