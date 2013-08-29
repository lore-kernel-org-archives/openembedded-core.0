Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4765F6BE81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:01:56 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so346475eaj.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d7nzo6a+mCp5/6b+3geN/W6wu5fpeG3/j5L6dzYhUi0=;
	b=OtwTvydtamHFfn1m0UDWo2i6TAORTWQ6zDq6OyLROCRBoCZNDIyrS+xZJVEscugWo5
	VWMA299iDIQQr0PTHXhz//tf1KJOCb2JjKd0gpLxlHTqKZd07wV71mrGTKCpwvcAPOfl
	wgVuKbTnwfuB1UjZ9zfUVot7O5UPfrG93KeIgtC6p1PFzuYSqajijFRR/2uiedZgckH7
	8RqidrauiAiAvTl75Wmgyl1Hub9hV8JWsb/EKcr4TDTvGq0SLqALPYfu4rXZgZS7KIsT
	W3F5YMRUxNHx1YvVX+dpb9bO/TDYry9TlHMIFjUZAghNGCMo8bSoU0HlCkZRJwqzYKBq
	Ciuw==
X-Received: by 10.14.223.1 with SMTP id u1mr5502050eep.10.1377792116503;
	Thu, 29 Aug 2013 09:01:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm47251810eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:01:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:48 +0200
Message-Id: <9d1749b2d2d59c3fb4af9411fa4294b2bb7ef779.1377792005.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 01/20] gstreamer1.0-libav: Add PACKAGECONFIG for orc
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
X-List-Received-Date: Thu, 29 Aug 2013 16:01:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index c77a085..3d996bc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -17,6 +17,7 @@ PACKAGECONFIG ??= " "
 PACKAGECONFIG[libav] = "--with-system-libav,,libav"
 PACKAGECONFIG[lgpl]  = "--enable-lgpl,,"
 PACKAGECONFIG[yasm]  = "--enable-yasm,--disable-yasm,yasm-native"
+PACKAGECONFIG[orc]  = "--enable-orc,--disable-orc,orc"
 
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-- 
1.8.3.2


