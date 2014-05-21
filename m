Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 92B5766095
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 May 2014 11:37:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,879,1392159600"; d="scan'208";a="51552491"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 13:37:51 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 21 May 2014 13:37:51 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 13:37:51 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 May 2014 13:37:55 +0200
Message-ID: <1400672277-7181-2-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libav: add version 10.1
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
X-List-Received-Date: Wed, 21 May 2014 11:37:53 -0000
Content-Type: text/plain

Using common libav.inc
Notice that DEFAULT_PREFERENCE = "-1" is not included.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-multimedia/libav/libav_10.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav_10.1.bb

diff --git a/meta/recipes-multimedia/libav/libav_10.1.bb b/meta/recipes-multimedia/libav/libav_10.1.bb
new file mode 100644
index 0000000..54e4056
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_10.1.bb
@@ -0,0 +1,14 @@
+require libav.inc
+
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
+                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "0f751b439b6a5525d4c8a214f0db6aac"
+SRC_URI[sha256sum] = "d5e04dc9adf43a467aa628f622425697d587a29cb0b997b45459f59cb00f9e15"
+
+# Options for Libav version 10+
+PACKAGECONFIG[webp] = "--enable-libwebp,--disable-libwebp,libwebp"
-- 
1.8.1.2


