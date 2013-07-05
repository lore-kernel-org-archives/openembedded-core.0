Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id C703B6B03B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:29:02 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so1130313eae.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3Mvb9BKEJdfJ8ZOW1aS3BaksL44FaGB+0aYetxwFHY0=;
	b=cK4Yd0IAwPaoKy/GU/9wmELl4jgp5jQIOIDeMkOkdSrCCvH3ZugVG1fIHIoxx2oKrw
	Swh+aw6IyAovEMbeq8Ny1E4hMw5joFlQoD6tttm8KBd3cqf8KwHNNnBEtZb4CpWbAQ1s
	2h8HeZO6Tavc1v1mz17/sz9WoSPQQc0MrTvZtfSTHc5lT+o+NP7CBRFOab/mmVXW00IC
	q82/uK0FGn1axj0wfcXLBFY1ALfyY95z5gnSYuD8w34ixzG4Aml1LxYCdXzMAmV0yxfO
	q0Q8Efzhkn2YGKw2oYxt04dn1Rnu3dYv5kAK3mV/ZfSxreecVPlXhO/Tj1XU7UsajH2z
	JWUw==
X-Received: by 10.14.173.130 with SMTP id v2mr9472996eel.29.1372987743569;
	Thu, 04 Jul 2013 18:29:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b3sm9667797eev.10.2013.07.04.18.29.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:29:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:56 +0200
Message-Id: <df096862c0249aff20c71fcb2935e3b8b8337e0b.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
References: <ccac3e9b6e275858355dff498555a1bdbbfb1052.1372987648.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987648.git.Martin.Jansa@gmail.com>
References: <cover.1372987648.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] taglib: add missing dependency on zlib
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
X-List-Received-Date: Fri, 05 Jul 2013 01:29:03 -0000

* without target zlib it tries to use native one:
 | /OE/sysroots/x86_64-linux/usr/lib/libz.so: could not read symbols: File in wrong format
 | collect2: error: ld returned 1 exit status
 | make[2]: *** [taglib/libtag.so.1.12.0] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/taglib/taglib_1.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/taglib/taglib_1.8.bb b/meta/recipes-support/taglib/taglib_1.8.bb
index 76d2e51..4c151b7 100644
--- a/meta/recipes-support/taglib/taglib_1.8.bb
+++ b/meta/recipes-support/taglib/taglib_1.8.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
 
+DEPENDS = "zlib"
+
 PR = "r1"
 # http://developer.kde.org/~wheeler/files/src/taglib-${PV}.tar.gz
 SRC_URI = "https://github.com/downloads/taglib/taglib/taglib-1.8.tar.gz \
-- 
1.8.2.1


