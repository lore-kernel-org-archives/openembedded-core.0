Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6463471A88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 10:35:58 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id u144so113668589wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uCfAGZpLKkwUWL3JWrZqhq5lBt2LDy7+wq7GddOF2yI=;
	b=IYzfDbGe266W32TEjMM/sKR7NfBHd62B2QPfpIOhttrVGMdKKgEXqm2uQoZp5mHmcd
	ugGBbtz7LAb+QF9jwyHr3l7YiQmHwCCVYPx1y0Lgcz3TF/MzjPtK3qOeld0muYwGoMYO
	P/KriDAJKuPx5eDS3AF4hZO+Q7fm+AtN2+y7UVNN43KlCxedtvPlbgEGGWKWxVkL9eVy
	hGVQuKP464HSsmqQhQgWDpHxZ4lTJHV0OqQhuVUmfRtMnmERYfYDAzc2IFDTnHCRZthd
	cboOMQwI7mAVjNATXcdS8rSw061yNfG2+e3L+knVaIrINk1NWNWZWNf1PVx0k/80sSHi
	il3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uCfAGZpLKkwUWL3JWrZqhq5lBt2LDy7+wq7GddOF2yI=;
	b=XquSawZ+0QI8DhiK1lFL9BalHVFAkUObqtXpCfkX+QZcWDR8Sqvbm8i+yPL5TAcsdp
	05GJPZitskh3gLFyXz+jv7taZ6WvARwG+GlEu2eNciRjoLIy+L+Q7EIMFYOPa7wvvRhG
	VWi99TwSE6bXeRlSLrBGh/jowkKXvu1AQuzRba8To/8XjukfLjnTg7M/+LuPXUvvEHvw
	5IdXMMaHfH8nI201iTh0Rt760ad9rAJI4q0N9/asSyd/Qa5geGGcJl/kiPI0sqyItm4i
	wY3iJv4XD7oxf1Lxe4RhWYWiDvsGfRSTjlOdI3vP8PpibWT/8DDzNvdrLMmcZ534/MdD
	hiOA==
X-Gm-Message-State: AIkVDXIaN4aeW/iCsQlLy6oyo8ED2DvLJgEw2vsbh//B/rL7Gx828lj74MRE1G/BivSK2Q==
X-Received: by 10.28.146.203 with SMTP id u194mr59774239wmd.79.1483612558943; 
	Thu, 05 Jan 2017 02:35:58 -0800 (PST)
Received: from piotr-ideapad.elnet (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	cl10sm102590376wjb.4.2017.01.05.02.35.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 02:35:58 -0800 (PST)
From: Piotr Lewicki <piotr.lewicki@elfin.de>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu,  5 Jan 2017 11:35:41 +0100
Message-Id: <1483612541-21017-2-git-send-email-piotr.lewicki@elfin.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483612541-21017-1-git-send-email-piotr.lewicki@elfin.de>
References: <1483612541-21017-1-git-send-email-piotr.lewicki@elfin.de>
Cc: Derek Straka <derek@asterius.io>
Subject: [morty][PATCH 1/1] apache2: always use the archive.apache.org to ensure older releases are always available
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
X-List-Received-Date: Thu, 05 Jan 2017 10:35:59 -0000

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Piotr Lewicki <piotr.lewicki@elfin.de>
---
 meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb | 2 +-
 meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
index b227f19..aa26cc7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools pkgconfig native
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
           "
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
index 96f21dd..0cd762e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.23.bb
@@ -6,7 +6,7 @@ DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+SRC_URI = "http://archive.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
            file://httpd-2.4.1-corelimit.patch \
            file://httpd-2.4.4-export.patch \
-- 
2.7.4


