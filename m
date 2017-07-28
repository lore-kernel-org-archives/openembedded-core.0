Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2A67853C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 16:27:10 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id 12so157232306wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+LZW/xV3mNXss24tlm0vD9UGGcvRA6flHwUYONfq8R4=;
	b=yEy3P0/oiExsBaanvMCTY2Y+BGU5Z4R/1XR3SSZYr7XWv6Z5EhmHjeXOnfcUy4znEo
	2k9UP9VjM4wdI/mhrdsm+w13DKqyG0dqRtcdbuIFghWuFCiGp69nc+DrOUpfiqSaK9r7
	pmuS0oGFnwlFPJY4QHe9Hz9bIJzVovi+NKEBCNOUXKdp38bBEL5mogtVzDFSzJaqZC3Q
	NVLGc9tWptu4fYuPXx7KMLgnVjTS/tnl1Gh+48sE07w4pGA+w1zCzraqbLd94K8A9eso
	yKGXcB+GAqpgfnZw1jIHz7dbl9DRShf3zX/DsEk9L/NqEJ7RNeg66VadLCLIwjnfz6fI
	bAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+LZW/xV3mNXss24tlm0vD9UGGcvRA6flHwUYONfq8R4=;
	b=ob9FaURmDffDX9tNp2SnO76oacEcFRC7iH4btry4/dhd84PMf9NrmGkw6NhZfdBWVJ
	KQh8G7ni/IC0R7BYhuLH+ZDnDzR0BPtCeSL7H4vU+hBPTUPbd6+4wa/jmunZaUEF/+2u
	bF+zgJVYUFoSQPMFlL3F8PBVh/UOoO1Psk5SeRLbTf45teMcOZxoY1zV31rKUv1nbTET
	e4EZcSyyFpA9aEtw8YgRfMsfq8ni8kd+XAvFWXCW9bEzjr5sGRUcZMso+yukZj+9h42b
	7xKelt6Yd+O9IHJ1jPXZfRwVxI23rTCmz237T3S4ltnuGwh71mAo5JrVCSHsrvD5ERRu
	iA+g==
X-Gm-Message-State: AIVw110VkPYRdsn42T0luQNMaMJWrGOX7YyHOPI8qrIF77LJ/YQQO4LR
	JPxOTw3WNKdCIMoRUrY=
X-Received: by 10.223.142.240 with SMTP id q103mr6185808wrb.96.1501259231134; 
	Fri, 28 Jul 2017 09:27:11 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	93sm25815078wra.82.2017.07.28.09.27.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 09:27:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 17:27:07 +0100
Message-Id: <20170728162707.6065-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libpng: fix MIRRORS usage
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
X-List-Received-Date: Fri, 28 Jul 2017 16:27:10 -0000

MIRRORS needs to be pairs of values for the original URL to match and the
location find it on the mirror.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.31.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb b/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
index 14679fb8bc5..c96ea14c1bc 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
 SRC_URI[md5sum] = "1b34eab440263e32cfa39d19413fad54"
 SRC_URI[sha256sum] = "232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41"
 
-MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}"
+MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.11.0


