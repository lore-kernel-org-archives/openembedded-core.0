Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVOUO-0005Gd-M7
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:16:52 +0100
Received: by ghrr13 with SMTP id r13so1717911ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=OH3RnMYNs/oCE0kaU1AGxaO2gi7liFBlwR+lmFmVprM=;
	b=CfT9bh1m2Bx8fJIXCMGAg9JBr5geY5z2NBzyeNk6hGxFksj42NCC2P/Fjivx1STFYI
	dGatiu0nYIlE6RSN4So/9A4Aj2fyadem7WaMj1OBJUC4g2S0//o+rTRAyB7sQ4j6Uijh
	/E+HsKb+5Qpbgcgcl+23j7xJ9E96i6QjMQTWQ=
Received: by 10.205.126.130 with SMTP id gw2mr50461720bkc.59.1322575809420;
	Tue, 29 Nov 2011 06:10:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm37270164bkb.8.2011.11.29.06.10.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 06:10:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:09:48 +0100
Message-Id: <d0f9182a8ce3305f1fbafe5c5789cd97fe9373a4.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 09/10] gst-plugins-ugly: bump PR to rebuild after libid3tag fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Nov 2011 14:16:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
index 2a79c2a..26bc0ba 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r1"
+PR = "r2"
 
 inherit gettext
 
-- 
1.7.8.rc3



