Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE76972DAE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 18:10:40 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id a1so5191700wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Jxzl/ZVoTY3K5q8vc8wdM1HgEZ96GFSTgTffrCuozPM=;
	b=CqSitK+TVRBf3BFJdycvb8wbNi9zGJXFr0WgGfUhqiRf2mayEntm2WGRZslvsNNVZq
	Kj/hnP4ojEey2GcRXq5LE8Zwkr6qSVv8RFG0v3XjM4CTdJc0OqqU2cQF/s5N2Qanotnl
	UqaYu1TsjAmWhr6daoEu7MtF5t1T5DfNIdCfS3SUbkNpLMDSNydkj5xLeYI28BleffqQ
	89H1w80AwQEPzGaHwK9t4dhD3RmMz80WFy8Z1nxUu8lZeuLZr+a5aRANyoIOS8gmu8FG
	rkqBEIjWAv80CjPPelt2wCwvZibz/hm4TSFnfKMg14lQjFqnZFqlH0MVxx09mEJzbL2e
	0hRA==
X-Gm-Message-State: ALoCoQkri8jk/1RPlvlNUUwDUxt0DoGj6ohpTkPvALwbH9gOLa1o+knyS+7KlKmCkALpnMRV1KV3
X-Received: by 10.180.78.4 with SMTP id x4mr22100609wiw.86.1423678240391;
	Wed, 11 Feb 2015 10:10:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hn2sm2309857wjc.5.2015.02.11.10.10.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 10:10:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 18:08:29 +0000
Message-Id: <1423678110-27633-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
References: <1423678110-27633-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] gst-plugins-good: ship equaliser presets in right package
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
X-List-Received-Date: Wed, 11 Feb 2015 18:10:45 -0000

The equaliser presets were packaged into ${PN} which was rarely installed, so
move the files to the right subpackage.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 495bb17..85f2196 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -42,3 +42,4 @@ SRC_URI[md5sum] = "24f98a294a2b521e1b29412bdadae2e6"
 SRC_URI[sha256sum] = "7e27840e40a7932ef2dc032d7201f9f41afcaf0b437daf5d1d44dc96d9e35ac6"
 
 FILES_${PN}-gconfelements += "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
+FILES_${PN}-equalizer += "${datadir}/gstreamer-0.10/presets/*.prs"
-- 
1.7.10.4


