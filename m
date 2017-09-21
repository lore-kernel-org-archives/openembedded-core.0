Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E760C77F38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:57 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 13so13687580wmq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XKjj1c35bumuWhzUBPhODQtl8SIOoPoKKtm0xfTyQgA=;
	b=ZhIZtrYvyXOKiBlX2J+V68rWT9zxMCf8gpcP3YT4V8h2rwIHVXzQgH3uUw1pFxGGpT
	AdpjC7ZJP9mfiDcbnF0nmX9v5sZwdgjWq/v2cZvc33fJntDhbxFYgCCoeresKTQf9NHl
	jNbfMmNcMKlxuLEHhBjb+JQPiWtqMo0bm91sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XKjj1c35bumuWhzUBPhODQtl8SIOoPoKKtm0xfTyQgA=;
	b=Qo2cgnrPjI+npDk8ZoXjJuCKlrw9LL9BpRxj0m7Oh3gXJ0N9gw95Zo/d6aoDJ3P6UX
	2x9cTd2ClwQcXEJtNP9Pvl1aLWMbc4ZFm49qzyqaRpzBG11D4FoJhoXQ/on32ekmon5x
	ykMYNIoJniNUVAXmZgGVcLZuwyEYKrGbu8CAyAim7Lb6i6bQeF2qRa2tPUFJx7eEzym3
	7Jg3C8TNu82kRTEP2YJoWOr3JhJO0YIwg9DNSo7GTHRdgMklehBlaGEzL8bynATbON8l
	QUpH6BkexjZE+3bNbvR0Djbe61i9p09Da8HLOpG30jB/IWrKhM7hpa6EUyz8cUqNN1/D
	oR5g==
X-Gm-Message-State: AHPjjUgv7ZuHHO9RHoWRnBtgdXBTLWejHbBP8MdAluTbLF25ZcTgclMB
	1ahhDujLTdRLLbeM2N4IiqUxEgbrG18=
X-Google-Smtp-Source: AOwi7QAlhpK9NJTY3n1xvetm6BmYd7X7+93JSwNW4BkJ7hEgM7hLkZOxHDQHVj9WaPBBi5bu9POc4w==
X-Received: by 10.28.92.136 with SMTP id q130mr384695wmb.104.1505985718136;
	Thu, 21 Sep 2017 02:21:58 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:57 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:29 +0200
Message-Id: <20170921092131.25537-9-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
References: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 08/10] gstreamer1.0-libav: upgrade to version 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:58 -0000

Bugfixes only release.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 .../{gstreamer1.0-libav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb
index 6c5f779ebf..d24ef86530 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.12.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz
            file://mips64_cpu_detection.patch \
            file://0001-configure-check-for-armv7ve-variant.patch \
            "
-SRC_URI[md5sum] = "8788aecc032a287227b4bd239d1b998a"
-SRC_URI[sha256sum] = "5bb735b9bb218b652ae4071ea6f6be8eaae55e9d3233aec2f36b882a27542db3"
+SRC_URI[md5sum] = "81f62d58279108698b321209fc6696ce"
+SRC_URI[sha256sum] = "015ef8cab6f7fb87c8fb42642486423eff3b6e6a6bccdcd6a189f436a3619650"
 
 S = "${WORKDIR}/gst-libav-${PV}"
-- 
2.11.0


