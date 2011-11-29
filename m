Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVOU7-0005BT-Sq
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:16:35 +0100
Received: by mail-fx0-f47.google.com with SMTP id r15so771878faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=H0hfmQ7FXQfSkUP/tJEJkAe1L6Yp1VVDehjRPZfiPnw=;
	b=Gl45XrS4H5Iphsh16vM1hDOat/3fPWe659KRkVduOaHrRGctpCae8yCxo+AzHL3FVx
	qO9zRoDKwCBLw6v43oa0U7C2fonzDLKNhndug7C/nhYxzyMgNP3tNCpmcu/qWkQujOgc
	XgmMMXcjavWf0GVfgUI/349vjk+m1cbtDDcCY=
Received: by 10.204.157.156 with SMTP id b28mr49469647bkx.133.1322575798853;
	Tue, 29 Nov 2011 06:09:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id iu9sm3561784bkc.0.2011.11.29.06.09.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 06:09:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:09:47 +0100
Message-Id: <eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 08/10] libid3tag: add gperf to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 14:16:36 -0000

* see http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=270449

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libid3tag/libid3tag_0.15.1b.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 4faa981..05e566e 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://COPYRIGHT;md5=5e6279efb87c26c6e5e7a68317a6a87a \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
-DEPENDS = "zlib"
-PR = "r3"
+DEPENDS = "zlib gperf-native"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch"
-- 
1.7.8.rc3



