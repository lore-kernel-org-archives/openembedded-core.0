Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id E61D66B8B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:22:55 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so182173eek.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=D6MDYolN1g9fW4jAibAjRO5vLS/WfP24IxoM+cteyVY=;
	b=ATohSwllkCDm+5Y6wVCLUtqkf/0/1OjNzzo6PJpNS+AFAni/xhPMA2nLREE9fvGC0G
	p9wJSFXkqLQx65wXDhMBlIQFRSBft8n6yFLV23dLcCuQ9el7DLATEjuIkakn39mfptxk
	10jmZKfR/mEob/uD1lrDAVO5aVH74vaP91SlbOfYp8+nkPVH+QqWUOMIsSf50JKBV1tH
	DlP+7h46uSB9GsM5NHL8e2JWCrAUp8MnDlOwJ9o6jOYIvdO+lWZWBSWy5eRt1JqWHE6L
	DMqzkr+oICLScUIzFCWhap7xoQ+w1oEGb/z/5W2w38mc3f/MtyRhKhRDojsz88auswRZ
	28nQ==
X-Received: by 10.14.3.3 with SMTP id 3mr2457410eeg.57.1376551376166;
	Thu, 15 Aug 2013 00:22:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm81972349eel.12.2013.08.15.00.22.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:22:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:13 +0200
Message-Id: <ec1c2c2cd644bb75a8017e225064051388a5beee.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 02/33] gst-plugins-bad: inherit gsettings
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
X-List-Received-Date: Thu, 15 Aug 2013 07:22:56 -0000

* do_configure fails without native glib-compile-schemas:
  | checking for glib-compile-schemas... no
  | configure: error: glib-compile-schemas not found.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 87f338f..68451f2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -10,7 +10,7 @@ DEPENDS += "gst-plugins-base curl"
 
 PR = "r4"
 
-inherit gettext
+inherit gettext gsettings
 
 EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
                  --with-plugins=wavpack,mpegvideoparse --disable-vdpau --disable-apexsink \
-- 
1.8.3.2


