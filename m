Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B00827653B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:49 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id is5so2010504obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8Jt1WiOOtNMzwZFi/k8oaFvb0moavjsBZnN1LY5BzhQ=;
	b=pYK9zm2veJjspmRbl5wgVuBhHA8ITQhxMfUoFDTCGonJjt2ffuLN2c1meqbj5+QZya
	tIyMH6aB+5irX6Q5zSab+g20RSFBdYWjmIKjcM8azed5CNM1oA3/4ZWu8vrv1AzWhizZ
	R3bb7Vb+wxg+QjbvNW4fI4Yy2sXbO3L0qrdwEh4KBArhwK1gKWNjzIMjW9E+WAlZJHuL
	ywTJT0mqbVmkEXYY/pMCqtESkcAt2keEPV5b507GCAtSdJapZa/MU1573oayVG6Z7813
	DC8NGJIiryDjmcC+nr0QtpPIIkQKEM4YVy3yQpBxKbsH820xap4oApOU9jcurSQ5N5jr
	KgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8Jt1WiOOtNMzwZFi/k8oaFvb0moavjsBZnN1LY5BzhQ=;
	b=gr7+RoBr3DnDW5MGEcHQTo3+t/Iphosov9OkEaXObnB0W74G1n9yR/17TRya0ZT115
	t0zTmOJFvmxQ+15o+idfq95+DH+f7RfCYJSauz7IDaBMVavQoyKpKC2ffgq4Vr/0DOpC
	nxKTcbbXBQ1pIN0DRhZUAFZCJxf+n0WPi8QbUst4xprhx3ltq37Gh3FI0sLbNguJPt1/
	FIN6wafNKwyVSzrnQNl1+CyXXB+G1fKaWcvMqrc2C1YMTHZBIUueqsHi4YTpXiPa+HK8
	EeR3mEk7F73Tom92PY56WBRPffF7SOEgJ/msZ078jJR7SIgHoiYYKm4EoSG8odqS9KI7
	ct6w==
X-Gm-Message-State: ALoCoQnh4vs9L27BxFgUIY/enIU+0eHhtLJr0UJzM/rJWhqx/fiNmNoLjmzDTEfto15YcwK2MPrNbKJRERpJZK6QnYwRAYpGbw==
X-Received: by 10.182.241.3 with SMTP id we3mr30636910obc.82.1453354670355;
	Wed, 20 Jan 2016 21:37:50 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:49 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:41 -0800
Message-Id: <1453354610-19218-24-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 23/32] gstreamer1.0-plugins-good: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:50 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...er1.0-plugins-good_1.6.2.bb => gstreamer1.0-plugins-good_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.6.2.bb => gstreamer1.0-plugins-good_1.6.3.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb
index aae8406..0b4f436 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.6.3.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
 "
 
-SRC_URI[md5sum] = "ef4f5bc4f31f706832a234b0f603967b"
-SRC_URI[sha256sum] = "876e54dfce93274b98e024f353258d35fa4d49d1f9010069e676c530f6eb6a92"
+SRC_URI[md5sum] = "a1958df7aa498b42793e2f2048673815"
+SRC_URI[sha256sum] = "24b19db70b2a83461ebddfe20033db432dadfdb5d4b54ffb1dfa0d830134a177"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
1.9.1


