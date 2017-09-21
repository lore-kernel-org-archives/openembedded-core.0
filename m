Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5335677F38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:48 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id v109so4067932wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UK8jDhsnnEChKvs6MxGa3UqtsqlbqjKb4lM90nqfdF4=;
	b=QIuSjejWmUE3i7fjsH1zkFI5nAirCGwZxODASeCwJZrhPOY1tAlz6A3o2M64EAgKeM
	iq/89QDJ7rNyffE8ZAlFDh1gjL7BrWvQTOngjQfZwwflFF9QidyUYACOYDV5cSIkpU8E
	MLF8jnh3qstYXY1hc9kLcyAg8f4BzSDfYkUU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UK8jDhsnnEChKvs6MxGa3UqtsqlbqjKb4lM90nqfdF4=;
	b=sR7H8Y9FvIG09VNHino39/SETFb1pAayToV9LW22KPP/TYj3ZxC2BhepqkKrXwlp1E
	BC8/rQBYWCc7Iv7S9WIQMMkRE77aQAYrPlsB0IWK7Qw7IIYi56p89GuDEBz0MMI/vCG2
	TgmsaGfYnMhlsMSyu9FA+VSjspEcMcNbkbpJyVs5+tcnUjgqLZRJ71LJkbSqy6zkUHrm
	zvBFY0vUaCf2MJTdtKU1t63PtgprqJTStp7yXj0+RbnrbtDwVNTHv7QZL2a+L2tAZhG0
	zSgwHRFfVXrgwUULYytKcUnk3PZ38YaPnuCNx6CrVEICDzLdOkUFqfJAojB2DNT5V5jC
	Z4JA==
X-Gm-Message-State: AHPjjUhvDD9H6dwZcCGV4/vBTSMDZTXZTm6AI21ZYZ9Uw5ukDpSCGQdH
	efPsl9t5S6WwHQgj++hHK2DmF0NQATg=
X-Google-Smtp-Source: AOwi7QDIDz/OtAFTivi9q9MZnNWYH1Isr67/1N5RKRuT766cxF2HSYgGkUqPJUIpxpxmLaNcgNxVig==
X-Received: by 10.223.185.5 with SMTP id k5mr1261996wrf.189.1505985709625;
	Thu, 21 Sep 2017 02:21:49 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:48 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:23 +0200
Message-Id: <20170921092131.25537-3-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 02/10] gstreamer1.0-plugins-base: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:49 -0000

Bugfixes release only.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...1.0-plugins-base_1.12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb
index 5de0b8b50c..04abe8cc6e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.12.3.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "77f5379c4ca677616b415e3b3ff95578"
-SRC_URI[sha256sum] = "5067dce3afe197a9536fea0107c77213fab536dff4a213b07fc60378d5510675"
+SRC_URI[md5sum] = "e69d41472a9b08eaf9659cde5dc0a4a4"
+SRC_URI[sha256sum] = "d3d37b8489d37fa0018973d850bd2067b98af335fef2fa543ee7d40359e3cea5"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
2.11.0


