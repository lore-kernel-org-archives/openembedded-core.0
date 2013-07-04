Return-Path: <ross.burton@intel.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5AF6AF00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:40:08 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so878667eak.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 08:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=dSI2x/0mqOgpQ+4wJ2kLJFnkql3pTsPHwopl83mYRis=;
	b=bVXGtWX5NUzb5/S7W86N5VLQAQm7lI1ecB+5+n1pkKcwxOCdGKJWMPx0XjAynx3hWX
	NnPvxBQ+hGjSr44UoJ4zCEH+nBBp9g6tNIPHaMOaH7BZ93E6HuUvAIvnWogCIEc5z1fW
	B+XefzF7y0oPt7mdgAvN4HEmF5NBMqiI35JB6kKwVlh82ThHhhCIjehH2EwKWlpxMNMS
	z3ONwvsdi5MtI/9MLmm4yQYCxE7w6IuaLwZhAmFR6NeT42VeMMG+5EG8jsXkfQ3MQ3xD
	u4leCTKnevHcrYQmXofblujfqjuKkSYX13utoPGiOab/MSQZe8v0+hC/WVxDqCaT3FnS
	zZCg==
X-Received: by 10.15.10.132 with SMTP id g4mr7371530eet.38.1372952409323;
	Thu, 04 Jul 2013 08:40:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id l42sm5769535eeo.14.2013.07.04.08.40.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 08:40:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 16:36:34 +0100
Message-Id: <1372952194-8495-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlT+Q6TRrPnqLFLUbQcp61tWDDvsP0QQO50EXr2slspu8vzHr6ZbKQW5VRW6ft6cSUBUwlo
Subject: [PATCH] pango: drop unexplainable elfutils dependency
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
X-List-Received-Date: Thu, 04 Jul 2013 15:40:09 -0000

In dafefa7bd4de518adb63ec19390b77a56cb65d8e elfutils was added as a
build-dependency of Pango.  However there is no such linkage inside Pango, and
it builds fine without elfutils.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 52dd064..80f2e19 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
 X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo elfutils harfbuzz"
+DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
-- 
1.7.10.4


