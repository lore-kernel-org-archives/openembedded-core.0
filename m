Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAC76F5B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 05:41:06 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lf10so4341802pab.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DD2zQgtiJS/2mUuxDdjGS8UELIs2/qB1pAQj7Gy4Dlk=;
	b=o1RT7Jhe8NGoaeV8n5+xawQ4ufUEjcs/frzEwV0yeUp+0Q5wOI720POiFoXTevAj9g
	2YRNYE68xwKhO1n+uNKpxfW3MAUfy0ZJO20ive9i5DJlnc34E9dlmA24Rf9rzyCsamvH
	CF4vKN2T96JYdIEG4H8Lz+okU0nljcoB/f+cpvpPwBKBlXKtlcBoccGR5w4QWsCgkMFw
	QZor4Kjlzihc/UrjaZBeQmDH1zR/o/A2Vl9F2uVHdyHXCie+1BJYlHXSBhTY9UiCcfR3
	6a/hW0bYyfwsgHAH18fIzgiRqLzTJWg95BPty3h3wPI7an9+b9CGJGi5gYClO+kJYiE3
	Qb0g==
X-Received: by 10.68.197.8 with SMTP id iq8mr18831329pbc.124.1394948468080;
	Sat, 15 Mar 2014 22:41:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vo1sm51397193pab.32.2014.03.15.22.41.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Mar 2014 22:41:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 22:42:27 -0700
Message-Id: <f945b196d6de11e47ed9b807949be98387d1b903.1394948105.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
References: <f781f5c6b9ef505eb86992a27cfb6e3e480db408.1394948105.git.raj.khem@gmail.com>
In-Reply-To: <cover.1394948105.git.raj.khem@gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
Subject: [PATCH 2/7] uclibc: Remove iconv.h
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
X-List-Received-Date: Sun, 16 Mar 2014 05:41:07 -0000

We get it from libiconv on uclibc anyway no need to
transplant uclibc one

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index e2de53c..e00de62 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -155,7 +155,8 @@ do_configure() {
 }
 
 do_install() {
-        oe_runmake PREFIX=${D} install
+	oe_runmake PREFIX=${D} install
+	rm -rf ${D}${includedir}/iconv.h
 }
 
 # build ldd, ldconfig and friends but only for full uclibc
-- 
1.9.0


