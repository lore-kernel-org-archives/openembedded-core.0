Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36852731FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:51 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id oj9so2023159obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I9Y9dN9cMBPgIhKgBBY7TRgkyOelaLXYtMWWxvGovRM=;
	b=tnXrrrTPXy36WvAxm9l8oBDpqTMpZL0gS1isUcfdmem1/DvEVqFYFMDGJOao+sGVi8
	8M5FEnA+uUU8xeYJbbbaRBfi8J9Lop+tNdDJVGGlMsKCotwwA/Iz+Lu2z7UvY18c6Dyz
	77DOKltLa2/ZKqB17Oe+6Oilb3L32kQn+KgwYwfzQ2e9KP3cu32QzaKb3CkXGw3nhoO3
	D57/+HLrvTyaritB9HR0ktgSK1slj3BJH5FC64l+ENQEEvbUoWQmyKj/F763L8iNELaQ
	6j0kB6FjSyALbkZ5K9W3O8xkvov0xGUykawI+NckBO7SS5/wEV7zVQP9d0XAHACQBlgQ
	I2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I9Y9dN9cMBPgIhKgBBY7TRgkyOelaLXYtMWWxvGovRM=;
	b=FAYMXA3bHqR0L+lVfzfW6FAg2y2cGP/Py3HCZ30xOOQIKGivzbSjpnXxQRSkTOtxmF
	mpZH/3VX/L5SImch44MjZ/IMnwMq0o+2wuCQqCMKH7LwqWgm4/HlJvkAXwzHbdROWWdZ
	I4biZE2hfdr9zkIpDBkIZjUmntAc2/6/KJZIEEnoigkSrCxf97k+2aGpVG3oTybC1xA+
	cNj7R2zkKm/w6Cn4Cr53ewEPivFPFq15l85QRPlq8qAuTzb065RjMInelk7Rb4//cpMB
	cduXbVrNNFp1ZaU8z0b/whv9YS0A1fXkaH7JILMf3Aw2tAHA4XXtJaOpo6me9SzQIk7w
	/GKg==
X-Gm-Message-State: ALoCoQmXzO/xrBBiqzGU0b9NotIS/mog+O2lyDrLs7MZROkV0o/GgN1ZMl7Hcsu6drSBZ+03oxcJ8e8576tahEbpwUfLklIMYg==
X-Received: by 10.182.245.167 with SMTP id xp7mr32184291obc.63.1453354672164; 
	Wed, 20 Jan 2016 21:37:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:42 -0800
Message-Id: <1453354610-19218-25-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 24/32] gstreamer1.0-plugins-bad: update 1.6.2 -> 1.6.3
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:51 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...amer1.0-plugins-bad_1.6.2.bb => gstreamer1.0-plugins-bad_1.6.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.6.2.bb => gstreamer1.0-plugins-bad_1.6.3.bb} (82%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
similarity index 82%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
index 571d15e..4b9143f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb
@@ -11,7 +11,7 @@ SRC_URI = " \
     file://0001-glimagesink-Downrank-to-marginal.patch \
 "
 
-SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
+SRC_URI[md5sum] = "4857adcafe41e4b9b8805cf88303bd55"
+SRC_URI[sha256sum] = "971b29101d6a9c5e3fe94d99d977a227f58f0b2d29b6ca2c7f292052542b3a61"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
-- 
1.9.1


