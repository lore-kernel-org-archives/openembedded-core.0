Return-Path: <bunk@stusta.de>
X-Greylist: delayed 389 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 25 Nov 2018 19:00:32 UTC
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 286996C0C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:00:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 432zjR3s6mz5m
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1543172043;
	bh=V0CerlX8BRN/x/51U5/rsi6cF61mQmDgzxbDQXvHlIo=;
	h=From:To:Subject:Date:From;
	b=Kvl3wHFOqgMvIUGgOYiMCKN4g2qeB3O/MGgFIzaZsWcE7m3PdCOQSm4xPOlcciOz+
	5IV33P+la6vsqyiQHfluc9HsDXBa+EA8IXxcaN79hEYo5+OQYGQjlMXOGLdkBUrkm3
	IiYMzaYQVoDMmKANKvy2kLKJPO48Jm5fxf3wCPYOiat6xNOwRTHj27xBKcf0Y1szjz
	9tJatjZg/P0NCkxFvsOFqJavoXHgEYJ3oBX6rFEcsFFuYPDKicNi1XsZ+EAc/g9SX0
	JhX/wStUuDFmuCq87NgdwgYaGRzLX8kCSOkh0d5qRAWwTacLXXgoh00ecAGLWSPMP0
	SKFDNNrBr9l9HMhGuA0Yg+1wlbXtQL+7lbfJGu9/sDeca7b7QOHXgBgympPL4lSG6D
	OHNTM3m5JButx5b9iwIh/nHtN37rn8yJgJaLE4S0p43SnyEiBjrSJPdMF+ADepmnk1
	eAAOckMyunk33vvSfaNHFKpFUlk5eb7BS+8AjGo98cRIA/aVEXlcQVyUf9RpMNtus/
	GWPftTBBVARIV2U8ngbBCquoZjoh2b8ikBa3fmvECF9Ivb/8UBAwpO4sDUo+aAojTU
	ERmliPiCID8HKB89n0+ITY925s4wTDvLICZT//YEzbcCIKigkEea6YNH0nIsi3I/7W
	9jTjz2OZANl9Jmzi/veet/7k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2018 20:54:03 +0200
Message-Id: <20181125185403.11603-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] archiver.bbclass: Fix COPYLEFT_LICENSE_{IN, EX}CLUDE
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
X-List-Received-Date: Sun, 25 Nov 2018 19:00:33 -0000

Setting them to empty before inheriting copyleft_filter
made them not getting their documented values there.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/archiver.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0a9fe4fd1d..e321a0e362 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -23,9 +23,6 @@
 #    COPYLEFT_RECIPE_TYPES = 'target'
 #
 
-# Don't filter the license by default
-COPYLEFT_LICENSE_INCLUDE ?= ''
-COPYLEFT_LICENSE_EXCLUDE ?= ''
 # Create archive for all the recipe types
 COPYLEFT_RECIPE_TYPES ?= 'target native nativesdk cross crosssdk cross-canadian'
 inherit copyleft_filter
-- 
2.11.0


