Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id B72E977F38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:51 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id m18so4048594wrm.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/rqX3zingdz8wG/XK0J18JrPLzdLdp07bQiMX2g3M+0=;
	b=fuRmctHcTZ1LLmUel5mFqRvs1i4JxUZ3fjBUiCC/BkfMMbB99qmMYcAVnHgpSh+lnq
	bFYe9h/e71IuVRyQK6zuy9zL+qCs71fLKsWwIzin4PbfI7xvPO2PKyhc6w3AWOhinYr1
	JPyFfsnt0PQ3padTgsCQJgobuoy9WMHXHKVu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/rqX3zingdz8wG/XK0J18JrPLzdLdp07bQiMX2g3M+0=;
	b=gAKr8bYMBAoNougOD9UOwgHoC/nJlNESUdGEyI1a04QBR5qeAaxKUxt286AL1h5PQf
	zLG4nOBWo20bJU10NALvUTx0pP9XtnaUv7VGSu1zxZG1N16wubbR7TMEDJAUwubPcLku
	5QBQjFMuLtugpA9g8gxrjGzhYdS8fGS74/R7UHAhRTEYJ2upfq9GYchKwmqK5YVSiAM4
	PGDLlFAhOCHhSVcAS1lcM4h8T2I+8z/ahDR3qNnEjHsZbIKpzPWRCHDuu8CHLYivyeop
	hINtp48WtYW2aRL3MxavmZYYQ3qmQJLPI2i6dOj8AerBS+z0Du8ebKo3FKvJPA3N/OMw
	/zVQ==
X-Gm-Message-State: AHPjjUg1lJyK5kYbYTFNZ+8W7lKDGJwSlm3vbE49kczQ/3ScyUfnEH+k
	q+lV+qcC3wF+4ahZClNS+l5vx6clbc4=
X-Google-Smtp-Source: AOwi7QDE545H8MZs1Nbau2me3mA8idwQ4S5dJrHNoA1q5NygTIHdVJmj4kT9X4KgIqjkss6J1hXxkQ==
X-Received: by 10.223.157.203 with SMTP id q11mr1226951wre.96.1505985712131;
	Thu, 21 Sep 2017 02:21:52 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:51 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:25 +0200
Message-Id: <20170921092131.25537-5-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 04/10] gstreamer1.0-plugins-bad: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:52 -0000

Bugfixes only release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 ...er1.0-plugins-bad_1.12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
index 8321da0c27..90f7f24b21 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.3.bb
@@ -17,8 +17,8 @@ SRC_URI = " \
     file://0001-vkdisplay-Use-ifdef-for-platform-specific-defines.patch \
     file://0002-vulkan-Use-the-generated-version-of-vkconfig.h.patch \
 "
-SRC_URI[md5sum] = "5683f0ea91f9e1e0613b0f6f729980a7"
-SRC_URI[sha256sum] = "9c2c7edde4f59d74eb414e0701c55131f562e5c605a3ce9b091754f106c09e37"
+SRC_URI[md5sum] = "594a818b13fa89960b6e7c414340db38"
+SRC_URI[sha256sum] = "36d059761852bed0f1a7fcd3ef64a8aeecab95d2bca53cd6aa0f08054b1cbfec"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.11.0


