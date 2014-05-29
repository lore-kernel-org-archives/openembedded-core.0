Return-Path: <ticotimo@gmail.com>
Received: from mail-pb0-f43.google.com (unknown [209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 233366FC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 14:27:15 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id up15so462400pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RjGAM8ugPYXNXLnpOASeZrF+6dNbBJbyLrEJOKDs/ac=;
	b=jMIHpGqSs6CABYAbYI/OYpcx07ZA87SmNBpUdYRDGWcV39X/jH7MjadB96IAyCbvnj
	Knp878G9YVTxB4BSNWSyPnGT1UyWZOMCL/eOTdU7rgTSQjDbrLM3JYdZBCWxQSt8X7iO
	PMf2wXFwFe2rfSF1AD+UlawPt/w54SPicvIGTqwxG+WldDkiwZQhombRmsPgoo+TqAjI
	DAGxZLUwHYQdSLS0Ow0rajANz+TREA9zgNExcGtWXWZWcDf4eIcQLoCHBhi0b72bBZ4Y
	hMtpKO3GdJaXQ4fsufYtAbifo5yPpjZwnDlf/OYUv0Fjst3vruxfntIPRuLhgHvVSa6l
	w7WA==
X-Received: by 10.69.26.103 with SMTP id ix7mr9063748pbd.41.1401373636685;
	Thu, 29 May 2014 07:27:16 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id gg3sm1548710pbc.34.2014.05.29.07.27.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 29 May 2014 07:27:15 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 07:30:07 -0700
Message-Id: <1401373808-24609-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 1/2] weston: drop superfluous --disable-lcms
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
X-List-Received-Date: Thu, 29 May 2014 14:27:16 -0000

From: Tim Orling <TicoTimo@gmail.com>

Thank you to Henning Heinold for the catch.
"Is this needed when you use PACKAGECONFIG later on?"

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-graphics/wayland/weston_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.5.0.bb b/meta/recipes-graphics/wayland/weston_1.5.0.bb
index f6ae8c4..6a79e32 100644
--- a/meta/recipes-graphics/wayland/weston_1.5.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.5.0.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF = "--enable-setuid-install \
                 --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor \
-                --disable-lcms"
+                "
 
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
-- 
1.8.3.2


