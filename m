Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 243B775762
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 03:31:18 +0000 (UTC)
Received: by padjw17 with SMTP id jw17so20219888pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 20:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hQUWJfPe8yeK6F1ZG/w4voc34afrgW4tZDfGsPrnmVs=;
	b=qzOaLcN7jCc6y2fvOhXzKyHBZJvwo5oqae2iLy91vAOSD1Rxzgh8jdZ3EiuEUP2u/f
	HR/G7rfe2o/8gF21KEFd2UPwwhKVVcX/G3nURj4pWDrB2bHjJ9+VcFKcbfSGk5QGleZs
	LZQvVAKNm7jDXI/EOLrHtIbcag8xcSJyQzb5zyChCHfnXkglyUFikulu00ukuQgI5RBi
	0ffQ6p17GkR5weajWyOVxsCjpshLRoCrbrSUngroVi1y+NK+UKeGZogMMDYiOwtkE9PH
	AW8E/5ltpwsf7Y+vLwF0y7FmJhQeYn/S2iGV0/jR90UdOmeAHh+P6JXiZyGKnuQwOxw4
	baXw==
X-Received: by 10.70.32.164 with SMTP id k4mr65591664pdi.138.1433388680044;
	Wed, 03 Jun 2015 20:31:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id ms7sm2144901pdb.11.2015.06.03.20.31.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Jun 2015 20:31:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jun 2015 20:31:04 -0700
Message-Id: <1433388666-8923-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] gstreamer1.0-plugins-base.inc: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 03:31:20 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 06eac67..c9abc85 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -38,3 +38,4 @@ EXTRA_OECONF += " \
 FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
 
 CACHED_CONFIGUREVARS_append_i586 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+CACHED_CONFIGUREVARS_append_i686 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
-- 
1.9.1


