Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B9C656B918
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:34 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so182565ead.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XU+L6A5UlG8EBMR7/04ZsYVhpuHieZ0LxfIEQCWbFTI=;
	b=hJ2qYvvbsotqIZ7jliD2X2bAJ7ChQVOVSpL7jhPOAiNSIJ5WqVObiWr9YWaIrcE+rr
	S5sLtvgQE2Zd7+ZeCvESSvg1xmOAG/2UT8l1uVlH6ykspFmARFcgzdM6N/kbZI8xEzSm
	IeU2sj37wXJai0azEVzpkbNPTRfqANq5LlNPCbZ4qRVFP0FNhs6MZLbvhD8PWDExz+XO
	o0bw/qhlU5BMnvffQfNRSzStCeiDtPnFLh8N6R1vM+CqhABSPKDw303o1t7+73ky21mI
	fJGw+QyDep33r1grx239UGiMhDVYDiZqMFdyfB2vuMCm3UJQzVqfalHQ5YSUeEy9KGhC
	WHEg==
X-Received: by 10.14.98.198 with SMTP id v46mr12038579eef.1.1376551414962;
	Thu, 15 Aug 2013 00:23:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm76297231eec.7.2013.08.15.00.23.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:44 +0200
Message-Id: <c3e36611d7db135a13ac62e2f5a0b48409cc5cd0.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 33/33] gst-plugins-gl: add explicit dependency on libpng
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:35 -0000

From: Eric Nelson <eric.nelson@boundarydevices.com>

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
index a6c74fb..213e799 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-gl_0.10.3.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "48340b6a4b8abce16344a7bc33e74a94fdcce4f57ef6342cdf2f941c42
 
 SRC_URI += " file://0001-conditional-gl-framebuffer-undefined-use.patch"
 
-DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg"
+DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng"
 
 inherit gettext gconf
 
-- 
1.8.3.2


