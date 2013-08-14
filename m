Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id CA41560593
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:17:56 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so4715145ead.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6XaVZhZI46PhL/5voofBtmc06ZhX7t4KKLyAgxUcGhQ=;
	b=eKqDVpAfVY8f80DfXTtBXt1PbshvXlyR1C8pFZM6A+RWstqLZf8tbR/QEm6C6ihIp+
	DnT7vcN/4PLAjIdEEKBzfT6Ya3JLtKJMdXEUT1bEkkQbpqTQVtY0VZbIPa7SMDZZb3lv
	3RZZ4Wtt8BHCJ+sNtz76/TZQCgb2Zlx4NnLOAFti5/74HcQZ6UB9L0800U1rQs06CNpy
	Gx9btQh3BoAGPKvCylaAJRub9GswYWWRZUeBQbdWbcIir4MzuS5y8DFks4IWYBOxEjnT
	tj8cA9U9XBD+a5+kEgLXnZXnW01GuEWLwQXm/w3jSfhmYeGVBKLh8PeBZHb5pU4sI3K3
	4pgA==
X-Received: by 10.14.202.193 with SMTP id d41mr380784eeo.83.1376479077157;
	Wed, 14 Aug 2013 04:17:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm68607993eec.7.2013.08.14.04.17.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:17:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 13:18:45 +0200
Message-Id: <1376479125-26055-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1376478834-12858-2-git-send-email-Martin.Jansa@gmail.com>
References: <1376478834-12858-2-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv2] gst-plugins-gl: add dependency on glew
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
X-List-Received-Date: Wed, 14 Aug 2013 11:17:57 -0000

* fails without:
  | ./gstglshader.h:30:21: fatal error: GL/glew.h: No such file or directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index 213e799..4474e1e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng"
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
 inherit gettext gconf
 
-- 
1.8.3.2


