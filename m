Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id D2098608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 16:35:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y139so3151799wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qpa3yw/MIStaEcZM0PgxfuT7zmKXK+JSttlyGxLp8Uo=;
	b=EWiDCal3YwO0p0cRWtLLHuM7m/tWhRAPbNqFhWpZ9COIKUJkJg5w2dKcTpO8YirQqD
	fJyTdZkRzg+li4IH3ygLMfpM0lJS4yyBJV0MDIXXGG3n0QHHWGRjg6262137CPT0avlC
	QcPs+osGBNa88Sc5c5z5ABsSGijspIUdqqsj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qpa3yw/MIStaEcZM0PgxfuT7zmKXK+JSttlyGxLp8Uo=;
	b=KpUlwYU209QWAGmCJiZE7bZyEdOqRkWoQ86LWjWMkto9nuT+RVh2D4XY2WMFu1EEZP
	zNbWMuztV2tTicAUVz1a9Wzk/9IrYa6+c0iOmpyHUR/OakIHmHHE2eds25RrUdMAF6nI
	rvLoRgLCMUsqKQ06UZJFCAiqg4ubSIOYlZGAXUrNj5WQ0hfRUW984CmuWXcQQ7P2oGzW
	LZ2V7WkDzes4n3ei7eWqheKLAAFmGTi1sQDMXZC1vhN5tcjZ6KjRSkdljLr3qcIXXP5l
	w1BIwhGsqXvWx2VQcgTcrL8FaQUJpQobv4ECy2R/yCuq9BDrOrMl7YW9ZOS2xEee4+mr
	+ZYg==
X-Gm-Message-State: AJcUukfX8TrtpqHts4IMhkDBop5uGIWs4Ihty+pif1HhS9D660B5QGIB
	ZYh5vshXkIwuc4v86o+p2JZsJkxKnF8=
X-Google-Smtp-Source: ALg8bN7/V02QfAOss2rx1tltxASjvNb1A7BCm4y1XLnRBXybEL8Bh1zhCufRv9f9WAxxhD1fJjtihQ==
X-Received: by 2002:a1c:8c13:: with SMTP id o19mr28869724wmd.56.1548952502019; 
	Thu, 31 Jan 2019 08:35:02 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a12sm9960499wro.18.2019.01.31.08.35.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 08:35:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2019 16:34:59 +0000
Message-Id: <20190131163459.24490-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] python2-manifest: Add missing xmlrpclib.py
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
X-List-Received-Date: Thu, 31 Jan 2019 16:35:02 -0000
Content-Transfer-Encoding: 8bit

The manifest creation bug that was masking this file was fixed, rerun and add
the missing file to fix:

  File "/usr/lib64/python2.7/SimpleXMLRPCServer.py", line 102, in <module>
    import xmlrpclib
ImportError: No module named xmlrpclib

[YOCTO #12814]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python/python2-manifest.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 4fff54a95bf..81f1c24f97a 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1122,7 +1122,8 @@
         ], 
         "files": [
             "${libdir}/python2.7/DocXMLRPCServer.py", 
-            "${libdir}/python2.7/SimpleXMLRPCServer.py"
+            "${libdir}/python2.7/SimpleXMLRPCServer.py", 
+            "${libdir}/python2.7/xmlrpclib.py"
         ]
     }, 
     "zlib": {
-- 
2.19.1


