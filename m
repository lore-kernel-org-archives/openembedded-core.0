Return-Path: <ross.burton@intel.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD627E061
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 19:01:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g69so2066889plb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 12:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mm1MStAlhH+zmPxzdDFuQ0HhaCGHNRpqcMMZBBO93yY=;
	b=Aw2SWcy//LLQAOWJDXSpT2jaF76yX9mTN2R827fC53ZF/Dj399GClbCU+n1xcbJKs8
	Qi7mCi+zAu/aTg2lhlmG2iQreNQ5b1YU4G+gnKJppAi2b0CKEaXVJb0FEnlPVuiG2hXV
	egEi76JKjJdTmW7kowh7Ub3Y2eGdB9LtzTuR+KYov3G5tdzL5vWjimxIe6blTAoMEZ5u
	AOkDtnWwzTQ5LNw4Js/whIXe46r5nldCeEgFzSlqb0Lif4f29azzMbDZmfx3FLD8F6fl
	g9qc0eelqMKaC/JNen6iBDUz0EfPTtby/cvbyzb2xF4lc8o6rYyeL/HJHO/yLOzvHAJ9
	KS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mm1MStAlhH+zmPxzdDFuQ0HhaCGHNRpqcMMZBBO93yY=;
	b=Uko1xfzmi3+6v0aun/piWKvu66ovLXzERbFtzUPBf5FJ/OBWQwZNTowvgmaHjUb3xw
	8/2C/Ln+NuiJt5XDCkS1qgwAkNZ3u0QWujwks26L5AsWBfRwtFD6ijQh1D8FMwCA5HV+
	XBTb3okBhCi2jMJSPkI19b5848jfedVtaABS36lsrKZi/tB6N35z35n0Mt2MMgqp0bDl
	x3T5V54gq7Nak+SdUs9XUetkit6X0Hr8XXFuCKDyH5u3gY5mUxRjSuGNY8w1O3/WAnAU
	Yq+pcahis5vQVFrW55Lmj+2NxhybpT9hGQUoMlfDZz1Mbo8SkV+1SVAycIjmHfTUcjkq
	8t9g==
X-Gm-Message-State: APjAAAU5bIkDu0n1Ck1iVYeIBi3dZ076WWH898Z+u7jKKIOSuopAbdKw
	hCU3owBigiwH7EbYm6UOm+e80s/6Vbo=
X-Google-Smtp-Source: APXvYqw87nLtPRvEDJGp9aBXou6fhF+UTj2sFxhDbWxsU4KgTUA1RXpv1uV7FJawt5nMXeFX3W+O1A==
X-Received: by 2002:a17:902:2a28:: with SMTP id
	i37mr49787385plb.47.1558033271474; 
	Thu, 16 May 2019 12:01:11 -0700 (PDT)
Received: from 172-10-18-22.lightspeed.clmasc.sbcglobal.net
	(24-113-124-115.wavecable.com. [24.113.124.115])
	by smtp.gmail.com with ESMTPSA id
	u134sm10233560pfc.61.2019.05.16.12.01.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 May 2019 12:01:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 12:01:05 -0700
Message-Id: <20190516190105.2576-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [PATCH] glib-2.0: add missing libgcc dependency to glib-2.0-ptest
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
X-List-Received-Date: Thu, 16 May 2019 19:01:10 -0000
Content-Transfer-Encoding: 8bit

The thread tests need libgcc for pthread_cancel to work.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9ffc4560a9e..82107a8a188 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -140,6 +140,7 @@ CODEGEN_PYTHON_RDEPENDS_mingw32 = ""
 RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
 RDEPENDS_${PN}-ptest += "\
+            libgcc \
             dbus \
             gnome-desktop-testing \
             tzdata \
-- 
2.20.1 (Apple Git-117)


