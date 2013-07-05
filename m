Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 030206B025
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:28:58 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so1042326eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ibXUzKLWOZ2BV0G9bjhaFCeymG99HKS1xZ5oriPGiVE=;
	b=xyUnsGFTRdYJtHf7q4++vwkd+xjaUITyV8XFct+liLzTB5SIhIbOYKo49lyDOtg4q4
	euzXcCxZoPjDA438jkVt7qSp4Mr11dzveEGIOR8rGMNdVLgKwWtxH5BRfNyHdo4lzp/2
	sM9sFtou9coRpVih6vkeb7c8hOL/NaROOPaJk3FDLwODOQsds+suIjyNnn7HcnCfSzz6
	wZ3uh+uWRJFlGBL/shFkP8BbhZxheEDkdjs7iMCq8AQXQNJfDfm+FdzCM0iZgvRoSvpE
	2S8QbufOgj2xg/LHgNgmR5a66iMN19UU6O2qUyYeMzSNIwto4UVhOHSUhwWTUfi3ig6y
	Q5kQ==
X-Received: by 10.15.31.198 with SMTP id y46mr9359460eeu.135.1372987739532;
	Thu, 04 Jul 2013 18:28:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm9587907eef.16.2013.07.04.18.28.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:28:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:54 +0200
Message-Id: <274b14e76eebc0c42e75ba80926920d812df7ee7.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] gst-plugins-bad: inherit gsettings
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
X-List-Received-Date: Fri, 05 Jul 2013 01:28:59 -0000

* do_configure fails without native glib-compile-schemas:
  | checking for glib-compile-schemas... no
  | configure: error: glib-compile-schemas not found.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index a3a1204..7e80ce4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -10,7 +10,7 @@ DEPENDS += "gst-plugins-base"
 
 PR = "r4"
 
-inherit gettext
+inherit gettext gsettings
 
 EXTRA_OECONF += "--disable-experimental \
                  --disable-sdl --disable-cdaudio --disable-directfb \
-- 
1.8.2.1


