Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 01CA66C202
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f10-v6so2193248wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=SmJlowhjrluWYYA5965WWx5VX20RhnlEmXOHg4DCOew=;
	b=MhqpYmmkjZw7162ZXYrBjNSTRFEZlIssdlHruf4fSx4uk9uSs79q/gPKwplR7+RlrC
	DGbyTF1rvJoHk8Or+SwA19Nc+6uFNI/CrVNX7HyNW3dPsGMptz2fTQuVpYmF8xQCxHZ/
	DfojQI7HSXqYkaFf1YdA5BQNWGsVEmqtU7zc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SmJlowhjrluWYYA5965WWx5VX20RhnlEmXOHg4DCOew=;
	b=Lsg/qI2foTwlunPaKf5z5cYZTfT/2ZjwowV5wyBb1hhCZBIFT3gHXAk5mYpIXwjuKA
	fx+44MaIVFQhQ/nV03ehOHXU/1lNp5eRgVZzQ1PMbd095NmRBZ5ofKe5ufZJleYHxlyf
	ZWP7a7MXLSBccOpxHJH6/PoM4GydcYiTyIOwl9JnY9rpPRhyqIp8JtMi2nnow3/VPze0
	6EyTxb+R716RON97Na1LSFh5xHy54MBSP2OUrGNQXBt9cHge+yhtjFyGE0/0GLaduNYB
	f4Of8880ggbLJw6YCcOUbvb67kWC53KB8+agrPu8dsE1FAsoHm1HhxYx1N94u4RNnJLJ
	oJMA==
X-Gm-Message-State: AGRZ1gJEsoed6DMhTr82h8u2JDA3CQSI50w+uaPtOZ7GYAbpZYLjVpOr
	RCfuru5P+49LT7wxlvnfn4IHuxhfmpU=
X-Google-Smtp-Source: AJdET5dfXRetkJ7fhN7gRGZS6piCILJ8q7wqRDcfz8bzHJBOKrA/X21uuTjF44uxxzPijLvxlj8WuA==
X-Received: by 2002:a1c:1f4c:: with SMTP id
	f73-v6mr5326095wmf.56.1541773754907; 
	Fri, 09 Nov 2018 06:29:14 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:01 +0000
Message-Id: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/12] build-appliance: Drop test which is already automated
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:15 -0000

The nightly-build-appliance target already tests this particular build.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/manual/build-appliance.json | 26 -----------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/build-appliance.json b/meta/lib/oeqa/manual/build-appliance.json
index b8f89275d08..70f8c72c9bb 100644
--- a/meta/lib/oeqa/manual/build-appliance.json
+++ b/meta/lib/oeqa/manual/build-appliance.json
@@ -1,30 +1,4 @@
 [
-    {
-        "test": {
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
     {
         "test": {
             "@alias": "build-appliance.build-appliance.Build_core-image-minimal_with_build-appliance-image",
-- 
2.17.1


