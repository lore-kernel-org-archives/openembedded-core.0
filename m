Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 02C5E7FCA9
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:36 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id r67so4304890pjb.0
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OO2TFFWR/ZqoPXo9A+xgYdodvCCMeeC2tjf54f9yPRs=;
	b=mIP9FWreU1Stf8rUndAiLbyLlxtD79bJQLdKdB0Nu+OOymdbGsH/+sqXl2yX8FwKIP
	KHPp3uGWMgEU7JteqdxAR4/xNMp+LwTRNIJPaTt2UT6x6pbYToqJonTpT0WcXxShfgWA
	gRt66yeryGo1dQfOht8e0Sy99rnnipy8rZdi3IXJJ1XbjYtUTNlf1XSvr02xg/oyzJ2i
	k9414e4IfWyCLTkCBIhmcvaIXynyRr8e25uCWFCTPF0SHlTOJnVDh1Bm98Wbc1iNUEiz
	EcrlWmMG0v15ouckTGOt8sfRXEwg3GrUkaRIED6IXWcWgslttNruAayRnqpYmJShaIxz
	Lo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OO2TFFWR/ZqoPXo9A+xgYdodvCCMeeC2tjf54f9yPRs=;
	b=RECO2npKaqz38bNyo+Nty3+cuU3V8ZXpHJBTqJLrjsslnA89gEKbgEmmx+QUrGn7dv
	0zbEEO3H8eXX2AKSDkkNrUreaO4SxDq/rGVxImUa3ejihFKxtPm+ap1bvl6sWQweatgI
	qmWMDPc14ZG6CreUG66jgwr4RLiO+fqcH5R6eN87omYXrG3SGpG8bKcyuib2ZBOt7D/1
	wpORyrsLFKDUsxwB/TS9Xq9OCg0wZYA1t1BwBM/4q7eJZXOpwLVRjeZFCA0Vg7aWqbLW
	n2pAdtkvYYQpq0EViL+HDEA3SwCtr2M7oYDI2EFiaGNxdZMrksEHTzv74tt4FejrqpjV
	rsVg==
X-Gm-Message-State: APjAAAV57KU0g6JJmwz5cUGkRlmGJe+984k066HjSTT2TIgiC9DosUzT
	4ZOKijUHv/uF5WUoGrZhatJqjh+x
X-Google-Smtp-Source: APXvYqyOkyi/zjAzqv3QBCYmud56Wqv3uMpwmLDV42fBzYcia/JWCQdWpwf+A1t1P6ioB+LkpPYgPA==
X-Received: by 2002:a17:902:b7cc:: with SMTP id
	v12mr15168885plz.213.1578929437914; 
	Mon, 13 Jan 2020 07:30:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:05 -0800
Message-Id: <e8ffa02f3efcf5303b8cf57eb29e498e816e63c0.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 06/28] boost: set CVE vendor to Boost
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:37 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Boost module for Drupal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c2e2cbb352..f385541653 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -2,6 +2,8 @@ SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
+CVE_PRODUCT = "boost:boost"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.17.1


