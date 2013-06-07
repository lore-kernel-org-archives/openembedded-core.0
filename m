Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B62BC6A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:01:59 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so4291531pdj.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=UJQtjG2IAJZEYsyFOPSTNgtEzxA5zX5M9HW2Ikt2pps=;
	b=wTExNVkoTE33VvoDK0CvA6JXK21Nb1pf7tklIij2gePcJaANhS2OeTq+Y2zzzRxwEg
	yA3Xygjt59LqhMVI1t5HSkRLBh/IJUPqE0UJPTeqNwG01mDGzTBVZKbMmEhMtZ9IbZLk
	WcMd9TJQprSxMrjbpEwMWPjUhKCJP94PAmMx1MfWzWqCxCw36OExsQVBZHfstd2yWKxS
	3wPh9WGrmhISQP/aLhaljS4d6DxWaAy4hivd8frN0puDPegnK8kjMlhJyhkcjJuVL/QJ
	EAb45DRdyRwaX5Q2indUWqaspKoio4h8sdkwQyaWb80kSGqSD4w8t2zLu/df2uiKlRB5
	l4Xw==
X-Received: by 10.68.3.107 with SMTP id b11mr42323014pbb.118.1370581321048;
	Thu, 06 Jun 2013 22:02:01 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	fp2sm75826306pbb.36.2013.06.06.22.01.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:01:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:15:36 +1000
Message-Id: <1370582137-26940-3-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370582137-26940-1-git-send-email-net147@gmail.com>
References: <1370582137-26940-1-git-send-email-net147@gmail.com>
Subject: [PATCH 2/3] classes/qmake2: export OE_QMAKE_LCONVERT and OE_QMAKE_XMLPATTERNS
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
X-List-Received-Date: Fri, 07 Jun 2013 05:01:59 -0000

These will be used by qmake_base.bbclass.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/qmake2.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/qmake2.bbclass b/meta/classes/qmake2.bbclass
index 8b9861c..6e73ad2 100644
--- a/meta/classes/qmake2.bbclass
+++ b/meta/classes/qmake2.bbclass
@@ -21,5 +21,7 @@ export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
 export OE_QMAKE_LIBS_QT = "qt"
 export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
 export OE_QMAKE_LIBS_X11SM = "-lSM -lICE"
+export OE_QMAKE_LCONVERT = "${STAGING_BINDIR_NATIVE}/lconvert4"
 export OE_QMAKE_LRELEASE = "${STAGING_BINDIR_NATIVE}/lrelease4"
 export OE_QMAKE_LUPDATE = "${STAGING_BINDIR_NATIVE}/lupdate4"
+export OE_QMAKE_XMLPATTERNS = "${STAGING_BINDIR_NATIVE}/xmlpatterns4"
-- 
1.8.2.3


