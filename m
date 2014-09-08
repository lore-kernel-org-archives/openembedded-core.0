Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id AFCB762252
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:17 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so3108473wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=qRHdraESQQWJqXJB6alA7Yg3GThzvVFqsgUFhKHNaUk=;
	b=gelK2QjwJfQoQRcQGwb2nL0uWrqGpvjYwTnf2GMIM7+z0332gGztoZk9wGEha2D96F
	VO1fFPDVXtjWyjKMMuqIhO4jVQE+ppRtxtxiRRAO3DTwR1NYspmG7kaRa3Dw2h4V6JIJ
	92nc1Hz3ZiOMYSuyGvw4/q4NG4c1LZ/2jEFiudJHTtb/XHQlaRjg1CBjRnIv2sWSvxkk
	VzdeODZXngG42y1CDp3ATDRnODZW6OqURy/KKORJWiL6OACKu4QQl/CGPK6Q2g15VscH
	uQsUGmQyUrNK7RfZWa9itb9qVubRX7nr89f8reKd2Mxc88m+7BpopgVDYRnDREohhmi2
	40eQ==
X-Gm-Message-State: ALoCoQkVQ4nhckDqKkTeYKZ+rf5zTKoND+ZgygXH9u/pCBRXAgoskyWWS5cpIXWqswhqAjOGx5/0
X-Received: by 10.194.95.8 with SMTP id dg8mr34896605wjb.1.1410177558677;
	Mon, 08 Sep 2014 04:59:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:38 +0100
Message-Id: <95f7feaa16a7249c65ae7da1930014b8601f5e90.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 20/27] alsa-utils: upgrade to 1.0.28
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:20 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.0.27.2_v1.0.28

0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch updated.

(From OE-Core rev: 5a3331b7ee8bb565ebb3823fc23123120ccd653d)

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index 2d23482..d6b24f1 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/${BP}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-- 
1.7.10.4


