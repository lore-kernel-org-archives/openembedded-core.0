Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5EA46010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:06 +0000 (UTC)
Received: by wmec201 with SMTP id c201so223561724wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d/xFN2KYBWz8LgKptpP3YQKnergS+/1yVgPCJLj6Djg=;
	b=oaJCNMBSYpMIA7D8HYkVrUiEptzAzdJnnwI6JQw3U8zRrLNUyLlXFqcsSe8n1heNv8
	fk3MryaEYl87O+rWPtLgFF22Tg88kVTF/p1TAkzsVr/pj9UscCw73YlppiGdThsXCMoc
	/bOOtasDQ3UonwqxUv8yBWHkDXR0XMaUebbQktL5qi4/+FuSxVSR5e7wghTyBgvVbUTW
	xwFHPC3fgpshzHMtDoOOcjdYykcAMXwyY6+uxlKz6sqygL/aF1lgab5NOzie8/Z8ILlT
	zWSikyX9Za3bUv1lXOKK3ZfsOdEt7FJ5BI9LqO9pqlek9VrFwGZDqEJO46vleRHdQmN3
	CQYw==
X-Received: by 10.28.55.212 with SMTP id e203mr2334962wma.7.1447761487513;
	Tue, 17 Nov 2015 03:58:07 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v4sm30039769wjx.18.2015.11.17.03.58.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:00 +0100
Message-Id: <a8929ed114d4ee9d441615409cad08a61019da7a.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 08/16] gst-plugins-bad: improve FILES variables
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index fe9ab97..9bdf9da 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -146,7 +146,7 @@ export OPENCV_PREFIX
 
 ARM_INSTRUCTION_SET = "arm"
 
-FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/1.0/opencv*"
-FILES_${PN}-freeverb += "${datadir}/gstreamer-1.0/presets/GstFreeverb.prs"
-FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-1.0/presets/GstVoAmrwbEnc.prs"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/include/gst/gl/gstglconfig.h"
+FILES_${PN}-opencv += "${datadir}/gst-plugins-bad/${LIBV}/opencv*"
+FILES_${PN}-freeverb += "${datadir}/gstreamer-${LIBV}/presets/GstFreeverb.prs"
+FILES_${PN}-voamrwbenc += "${datadir}/gstreamer-${LIBV}/presets/GstVoAmrwbEnc.prs"
+FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/include/gst/gl/gstglconfig.h"
-- 
2.6.3


