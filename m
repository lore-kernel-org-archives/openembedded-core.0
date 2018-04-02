Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1EA74819
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 20:39:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i3so6091598wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2018 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=PiEWrixmHa6AL2ZpKayBbpjaFJdl1IBGoUGeJfuqX70=;
	b=MfPsMeTOkjpBZ8aOdkipDUxbGnf0lzjabyjvAsKIjfzgMvi8iAYZem3HYv160ed+OJ
	RjX8NEzu8VGvAy7WG/dEif/EdNLl/FfJ16vvz7jf1AKHikrzFB95t7GxTwwu0lFBtdsd
	ItRBS8OgwTqPqjFnSWrLyaVQEUqVgi3aMqX6rKFkozHlUdKB5mH7CDKJdRMVeI23fXDn
	0T7wdgriiKl9UmccdwLv430dd/psh7BlFelOtLoasauz7vo0zejygV97sG6R30/d5fAm
	QvmQRHwNAY3cc3HfybCL6KUHTiz4M2ur0gRERZemiQSZ73xref+R+w7klv+2BRbqT5HI
	Bwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PiEWrixmHa6AL2ZpKayBbpjaFJdl1IBGoUGeJfuqX70=;
	b=CFsCrW0NLP2mxmSeh7VxRp2DXV1J3F+/pRPM7XjnehX9FIKAiSoXOjhHDi5+mckOJV
	lsCimJSS0TKdYIxKMhEcl5XjY/DuEJJdpm5qTKSUSchssnz+BU+52W3NOrVc94xHO5uO
	t7aRnCBtbfLYgI9okEo6RBX8dhw6zYYReik0vLJgiVsUZfxUCsFfFSxkIbV7HDaDER96
	xEijz+b9Cys5QFvQos4GVd/6+9SbIfFGyIJK0m5eGBKW046IyelSeqqkehKeQp1IVaYw
	ux3Za0TdGd5qq/orG71Am5S0waIlqtFSNx8WIjNHeAlrDU1myjNmhU8vTowzGNHRInlJ
	83Uw==
X-Gm-Message-State: ALQs6tC14Y9B5GZA4XzxKhHifoyBJAMbdUrIw/sslwK2HnOtz2qAMN7F
	MJyzG4sjSjC/t7li7TO1SrYizA==
X-Google-Smtp-Source: AIpwx4+mCwAzlukr9C72NdxmNWvCk7+Cztpo6DCm76dXNl7iNFOSUK2nWfo41t42uSDfs2+oV+P7Qw==
X-Received: by 10.28.163.5 with SMTP id m5mr2005011wme.33.1522701589528;
	Mon, 02 Apr 2018 13:39:49 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC1FD051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:fd05:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 33sm849693wrs.74.2018.04.02.13.39.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 13:39:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 22:39:34 +0200
Message-Id: <20180402203934.8813-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180402203934.8813-1-schnitzeltony@gmail.com>
References: <20180402203934.8813-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] mesa: Prefer dri3 for x11/opengl
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
X-List-Received-Date: Mon, 02 Apr 2018 20:39:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adresses [1]

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12642

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e4da81f7f..639eb35f6b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF = "--enable-shared-glapi \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
-- 
2.14.3


