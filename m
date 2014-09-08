Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 21477713C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:59:25 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id m15so1351064wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=BtoUXigzYx47xCSRrjTtgJ/YkDlUTdQpXddt0dA88LM=;
	b=iTjbW1KsC80pnTNi5th58SxNO21pDhc0G69fkOM0sXmiJPDO1k6SEEStWGdwc5NtqO
	urKyYpO4bNw6d9gQzJTc8Rfm8fH4TE1eL7kBAiq0wyIeBAeuyXdsWpAbGHnMmk16OWcn
	BI37SgEU5nO5uFcKWZu2AhTPrTBARRnchlxuzLpQ2ox4kt1+ZqQnYPcfurcHGIzO+GNt
	FqLw0pU6E1mzoL5F3Nnu5jotSwmrl0h5qidH1HzqiqM5hEZoYUmz0O0gqMrKOxuGAppi
	ciiuwgQ1ZteLSJSZNYUe7Qno469lAbnRFo3OfVDZQBDTQP9dtBtlq7307wpWnJ6EJ7Vy
	x0bA==
X-Gm-Message-State: ALoCoQmnQNdd82bhdodzv2XROel8J2m1r8u3K77NZkxGGno9Wmzyy1qX+L1Mx/fzt0TuKSIhmKxg
X-Received: by 10.194.58.83 with SMTP id o19mr35051522wjq.20.1410177566692;
	Mon, 08 Sep 2014 04:59:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.59.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:59:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:45 +0100
Message-Id: <10bd19c2bde21e4e10615548c682c2001741eb19.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 27/27] alsa-utils: hard-code alsa-utils in SRC_URI
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
X-List-Received-Date: Mon, 08 Sep 2014 11:59:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This recipe is used by alsa-utils-alsaconf so don't use ${BP} in the SRC_URI.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index d6b24f1..2d23482 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,,udev"
 PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/${BP}.tar.bz2 \
+SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
-- 
1.7.10.4


