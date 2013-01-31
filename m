Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0uek-0002QG-Or
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:58:23 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so1736872pad.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=CMHl05BK5ZKAsE7x4+aPoIcKmOUkw0GQgPqrQwvOcp4=;
	b=NwTKcti6xhb04ig4bCsV4C9fLoGVxSQhKrEMb5KofIIHLm7R22Coz8q14KnDIEv9Im
	v62pejZPps7MxUfl1Zu1w7KyWJVL2gg5aIF8vI0N8vWK47gw/pkIiVzhUzh9BlvOlN1J
	mkhrz6V9UeXbdHw4G+YDNdDh+d5Ge5g9Rxojt7Uy1Sbv8jf2f/CyrSHaxYOJ3ofcAzx3
	yT1NRrs1PSPMDgZeGOC9esDqbMyNTQBAiYNE4o01SKuNNeeUUttM6HqCqqpun/J70AGX
	qdq7C9YdyOKx+dBYS5xC4NtbEMVq0wWxHIFDqhlnrGObWMljAi9pnwuVXK0de17ixKSv
	T/yw==
X-Received: by 10.68.247.39 with SMTP id yb7mr22772757pbc.15.1359639759440;
	Thu, 31 Jan 2013 05:42:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b3sm2999539pax.14.2013.01.31.05.42.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:42:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 14:42:34 +0100
Message-Id: <1359639754-11925-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libfm: add dependency on libexif
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 13:58:26 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libfm/libfm_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libfm/libfm_1.1.0.bb b/meta/recipes-support/libfm/libfm_1.1.0.bb
index 87f2254..23f132a 100644
--- a/meta/recipes-support/libfm/libfm_1.1.0.bb
+++ b/meta/recipes-support/libfm/libfm_1.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/base/fm-config.h;endline=23;md5=ad0fc418c3cf041eea35ddb3daf37f17"
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native"
+DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif"
 
 PR = "r0"
 
-- 
1.8.1.2



