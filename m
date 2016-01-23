Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B56C7708A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:22 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s5so3896907qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=/9iZ5guWp6Icab86blNAql74QqnFrWoASRdy400ZFbQ=;
	b=KRrlUGmtJeZfuW1LEoZUqo1jS6KkBlOj59HQ1NDvsO3yeK/HkUilBXShi2zVbFGwLZ
	tArjwbcTCsqwZXPDWXjSuDoqzaVw+M1e22DAuznY4qeesofp5SLG0wYwEnXD9ozR9ZrR
	TefIWYPWAxXMyB3Xkv3h6mpSJEcAnJlsSMG8hWU5kKq4hqfye4J/AxtS8cuSzTEk59eH
	+gUn6a9U/rS8eO1wz3PTPhfvXVyZLMQnj2qh6Ci2u+36wFQ16I8ieJiXlHgIqFRJNfQ7
	1Tveq9L1iADhUPBWekd+Zxox4Wq/oT5f/Uxn3mM/pd0xigh6ybmpir94/sdnx74SegYb
	QL6w==
X-Gm-Message-State: AG10YOQwvOTVRT1T0vNLI9mf2E2B4I5sYwHIMuqnIckDByfUrjf/Zjmj8ara1dA3PNTmLw==
X-Received: by 10.55.207.152 with SMTP id v24mr12562233qkl.100.1453590623390; 
	Sat, 23 Jan 2016 15:10:23 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:22 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:10:06 -0500
Message-Id: <70a7f529873d88c7d2254c2625577dbd9b2e5687.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 09/13] python-certifi: update to 2015.11.20.1
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:29 -0000

---
 .../{python-certifi_14.05.14.bb => python-certifi_2015.11.20.1.bb}   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_14.05.14.bb => python-certifi_2015.11.20.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
rename to meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
index f1ebf1e..1485d15 100644
--- a/meta-python/recipes-devtools/python/python-certifi_14.05.14.bb
+++ b/meta-python/recipes-devtools/python/python-certifi_2015.11.20.1.bb
@@ -2,11 +2,12 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
+HOMEPAGE = " http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "315ea4e50673a16ab047099f816fd32a"
-SRC_URI[sha256sum] = "1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69"
+SRC_URI[md5sum] = "e04b512009401603f1485380ac879cf5"
+SRC_URI[sha256sum] = "30b0a7354a1b32caa8b4705d3f5fb2dadefac7ba4bf8af8a2176869f93e38f16"
 
 inherit pypi setuptools
-- 
1.9.1


