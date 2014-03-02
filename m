Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 64D5F60D9D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 02:53:34 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so2342382pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 18:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0yd7I/SHDa9LM5UxCkLGa+s8RDm1qNl52J8WLQoqYcw=;
	b=VV0uT7b0rr+sJhS+sSTYPO7qdlsixMHrF7AslHeoE+aisoTTeqRbyv5NFl0EsPk4WB
	YjWCgkDMFRLttEfMZFDb+6Kw7RpCUZyh0jsmE0/ZMjrBiSYnBN6A1VaqQdphdLQ+b6J/
	vGRTQC+VPpg0KNMrSpDWk3MAhAFKf5ZkvBcpDmvKmUIVuWjv00DaRymPGsmwh7vwDGLv
	r9rxcpBpPBuSuywBrw8MfyFCemZ0svFC0mK5e9K3FqYeJOeTKO70FcBwJy1SYPT2ML0b
	s5uY676tWb+2zKrVevb4wF7HB72w/yIp7C/EedX7dqZKpCm1t7XplomQGYOy8+h+KKNs
	rDkg==
X-Received: by 10.68.112.164 with SMTP id ir4mr101950pbb.153.1393728815866;
	Sat, 01 Mar 2014 18:53:35 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	af1sm50891042pad.12.2014.03.01.18.53.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 18:53:34 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Mar 2014 13:58:10 +1100
Message-Id: <1393729091-12840-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH v2 1/2] qtimageformats: allow empty qtimageformats package
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
X-List-Received-Date: Sun, 02 Mar 2014 02:53:35 -0000

This fixes installing qtimageformats-dev with opkg as it depends on the
qtimageformats package which wasn't created.

The qtimageformats package was not created as it is empty and BitBake
avoids producing empty packages by default. The installed files consist
of source files split into qtimageformats-dbg, CMake files split into
qtimageformats-dev, plugins split into qtimageformats-plugins and
debug build of plugins split into qtimageformats-plugins-dbg.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtimageformats.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
index 1b4bb4f..f90e58a 100644
--- a/recipes-qt/qt5/qtimageformats.inc
+++ b/recipes-qt/qt5/qtimageformats.inc
@@ -1,3 +1,4 @@
 require qt5.inc
 
 DEPENDS += "qtbase tiff"
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.0


