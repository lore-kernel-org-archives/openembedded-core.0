Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id C82DA60119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:57:14 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id us13so408951pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 18:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=mkVbjcX4Sy3/MXj5HjzoMnDh7qCFgt1wo1QT51l8hbk=;
	b=zbftFOQHOi/1ezSt2sQ167l+yuGC6OFtbYrlxo7+rSPOzcFyxnMoDkbsM3esfzraa8
	Udd+qb7Ir+/RkkwabROWmLXhU+aSC3PJalLrTj9qfwbCgRjpWAkonlax7Hzk/7BSd5IO
	+BkZalGSdv0/23bB0uWwekpWbl4NhKwSBrLPoqDvLXg9lKhHXc7Xv6B0ONjVWwsWZ8i0
	gU70K3spfIHJro1Mx+ud3+VvbQdM/+hooucjyllB4wi8BcyWLN4czhi3MaECOq2zNVHd
	xhOjYD65AJVWItUyXVRij/3S80/tYdNIcA1aGtyPRA+DiF1ACWfPcB5gGVemAGw58173
	75/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mkVbjcX4Sy3/MXj5HjzoMnDh7qCFgt1wo1QT51l8hbk=;
	b=BrRAz3JLiG7fVcrbYZdteUAAWD2h20xa9DTmjseEWhc1KGRIYOj/HSSRazvMrpSpVQ
	0ZA7cU2h4sAW4oa5m5U+IOyDzxP1KEVnQgFhY384Gjaj6b3IZcqc8JW5HphRQUdy9vlB
	ZWeQEuKVT9z6AXHQlQweFtHA9yUS8oXx8/54HsXCyCDUvFdQ2RpxdshYwFrtz3KraJr+
	CF3AtgQj0DbXjSMDrEnueRL6DYXIz+yE2itMNE3F6QQpqsjdCa+Sl8W2TQejRmbveVFh
	ICAXFHGTQ5yLIduWuvcdYCVVaRYWbMC+ybYUsa/VduOZGd8mXzTZ12cs4SkORP1L/Zc5
	s3Mw==
X-Gm-Message-State: ALyK8tIlDagZYXWsfHbhiXBw8jSP+LayeXpUNgjzjQwo03+H2kDxuLYuWpxF2nWl2xwQ0Q==
X-Received: by 10.66.83.35 with SMTP id n3mr47305738pay.124.1467856634924;
	Wed, 06 Jul 2016 18:57:14 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by smtp.gmail.com with ESMTPSA id
	b185sm225145pfb.55.2016.07.06.18.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jul 2016 18:57:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Wed,  6 Jul 2016 18:57:11 -0700
Message-Id: <1467856631-29679-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [[Krogoth]PATCH] ghostscript: update SRC_URI
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
X-List-Received-Date: Thu, 07 Jul 2016 01:57:15 -0000

From: Armin Kuster <akuster@mvista.com>

ERROR: Function failed: Fetcher failure for URL: 'http://downloads.ghostscript.com/public/ghostscript-9.18.tar.gz'. URL http://downloads.ghostscript.com/public/ghostscript-9.18.tar.gz doesn't work

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
index d4222c7..aa39345 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.18.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
 DEPENDS_class-native = "libpng-native"
 
-SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz \
+SRC_URI_BASE = "http://downloads.ghostscript.com/public/old-gs-releases/ghostscript-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
-- 
1.9.1


