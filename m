Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1F5731C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:25 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j3so1562749oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U3A5d3W5KPpFJ0xUbC1h/sz653ctrunquqMlE3etiHY=;
	b=bV/fwvdXX5NlZ9aeHwCn4bjT4oOakGXUCkgEjZTm0UnOeO9iVvCd8Meq/f/jmAwk+U
	pGKojw+KlgSpHN2CudqBqj+W/EN2oC0wIO2t36WIAYwir4PASj9scOTP1y0vbKEqeFIp
	juQJznhwSJXgDdDKfatxM6teYZ9lKDCCkCxu/gq5R6975z6NkJkdx4gKfM7+Xwg/ulhQ
	06sRxYlNFma3bIjD+gjcFpTZZGDq1H3OdfAS/s7Z/xsq06jDOaQ6JEOAS+kwrfW1hxfV
	qVu8zr+xifzR0fuQcWnvz3YHfGj6CN835zGPhdslHd2Vr3JkoPCrCI4gO4hioOXkPvdT
	8byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U3A5d3W5KPpFJ0xUbC1h/sz653ctrunquqMlE3etiHY=;
	b=f6i1570xyRRNR8qBfV9IqlZrQFLGhqTKCuWR1KMcOmVEDIdFQXUqvDfcREtEfBFQN+
	OUeNpS80Pz1Eghxxc9D1nrJ2xloHn1CVHtmSk527/AQgKacwpJbOpuX90KvOHJnGX8QZ
	WfcJHM2asmnEFNGwBErC4wNkEttjG6rZ3GPhud75geh75to4t1ujEIA1TOj9tqnafUB+
	GNcNmlvesg26RaGtsVwBfoElXrVNyUiiISFT+VSSx+W3osPcDIivnKbiafAf08yM5xEO
	35YmtsRkc5Mtdfzmzndb/TEpWibP1sDFTK6YfiJVZ72CIZ6ke3KBkU0ER6DnaAqQ0pwo
	nI1w==
X-Gm-Message-State: ALoCoQnCbWlcP8dlH7/9Qmsot7EbGfyntUSs7iEJRI4DrDeskvfdPw+9tyVVFype1y1CwMoe3pYaDSWFJ49oXduLeNZ8Ivrihw==
X-Received: by 10.202.48.6 with SMTP id w6mr29855353oiw.97.1453354645953;
	Wed, 20 Jan 2016 21:37:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:29 -0800
Message-Id: <1453354610-19218-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 11/32] gstreamer1.0-rtsp-server.inc: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:25 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 65b4876..608842a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -1,7 +1,8 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
-HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
+
 DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
@@ -11,4 +12,3 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig upstream-version-is-even
-
-- 
1.9.1


