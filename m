Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYxKU-0008T9-Te
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 12:09:54 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so602715bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 02:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iONtsL4WKMoHJk5PMVjeC3IdC0bXUdBnKngp2j6VIUg=;
	b=zPlUW8SBH6lxogxptxfQBSit/BQQh8m3trdqF+V6oa9o5joAjEVloXXvY8y6EKeqpe
	B+xrR6a2lMGea4/oYksinAjjgmQ4HIgmyUc6u9eGbJ9o4J9bHDGZOAlQHmhSDaMyYSEC
	shS3zrVENvOK70repathVaYiBjTTYlyAg/WF4iLAae2ilc7F0eJBxVYuwjqr0nOw7NXs
	GLmauU2/ykTmvJoq8LQQCzmzSTUf40tTmHDKQWpNMYefdn8FFOLHfi8fe4884FjXOfkh
	Z5IJCcKEA+gWFP5cy3AWCtKlFnr4bs2wHd643KtWIjoFqG79gJw5pnQ/RTxaVn5OpVYB
	0cJA==
Received: by 10.204.5.205 with SMTP id 13mr211314bkw.111.1352976958355;
	Thu, 15 Nov 2012 02:55:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gy18sm9800276bkc.4.2012.11.15.02.55.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 02:55:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 11:55:32 +0100
Message-Id: <1352976932-4150-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1352976932-4150-1-git-send-email-Martin.Jansa@gmail.com>
References: <1352976932-4150-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] opkg: drop PACKAGE_ARCH setting for update-alternatives-cworth
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
X-List-Received-Date: Thu, 15 Nov 2012 11:09:55 -0000

* there is warning about update-alternatives-cworth ipk being
  overwritten in "all" feed when opkg is built for more architectures
* see https://bugzilla.yoctoproject.org/show_bug.cgi?id=3390 for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/opkg/opkg.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index b3d587c..250eaa8 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/opkg-cl.c;beginline=1;endline=20;md5=321f658c3f6b6c832e25c8850b5dffba"
 
 PE = "1"
-INC_PR = "r10"
+INC_PR = "r11"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/opkg"
 
@@ -36,7 +36,6 @@ RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
-PACKAGE_ARCH_update-alternatives-cworth = "all"
 RREPLACES_${PN} = "opkg-nogpg"
 
 PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
-- 
1.8.0



