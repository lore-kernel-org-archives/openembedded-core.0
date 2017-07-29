Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EEA7E601A5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 17:21:34 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id t201so18391252wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=75H9Ou2DYHTGIbeR+1BS2Bc3wjR2IfqOHA06e5BR6ek=;
	b=n0k/z7Rundih63LzRGNbV4sTva5QdZhMMhzBDyqdtoNXbFT0785h1IfkrFw6nbojFo
	xyD7rXohOnDQHTX0OTKy9O7tJY7jp6+HL2coIeSIrS5HvxEfXHHpz630Jt6ICGlY6h5u
	l6l6OVECXsoRfHU2ollv8atijUSOGSGpcLDPM8fxrc/405I83qRqp5NvJ+5Bhp38wxDm
	via9BHdDcdfcfRQX4iRwOH52GwN60hXING1SXqy/6x1eBAaU9y02Yb/zOTogk3YrIc3V
	gxJrahhA4sJHgNqzXKDwTLvtjmMswQjQEnKJvoNKXh9HT0ZlFi39NOqiQqTp4UHaJbPC
	WimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=75H9Ou2DYHTGIbeR+1BS2Bc3wjR2IfqOHA06e5BR6ek=;
	b=qdH0O2ZFxr+Z3KUn5+JLZvy5ERDqOP6pSysskeBQ4qQITXBhuVJmabAP+sI6u7x4yr
	znpEsiIA0srEZZOHyBjDswJhxG+gb0NebVLHeJulpPZis/o8+fiCg6d5dPxs4/ulHMc2
	LNzBq3aUELMGmPlVDltJSfLR/XejEQMwHVgRXvOplmO5Bbchtb6Cpn3YREnI5nFoUXzK
	Y4E5/DL9AGOjkAlsEOddxbKClBirK58hV979aQdnhRHgKxLpyceYSlwWHhHlHgcAIM3U
	/CFrVFwOpqrdTISpHO/MctZVZHI5jxPanDXdy3V098s2VL6j5Ti2tNnCN5Koqagg3Fj/
	v8xA==
X-Gm-Message-State: AIVw110sHx7Rfnfqh51zcS2105GI3oLRQ2u7auUDfqsH8RzrTwh2kpQw
	Ra+uXU3xbJf64zE5Rnc=
X-Received: by 10.28.152.206 with SMTP id a197mr8112454wme.7.1501348895260;
	Sat, 29 Jul 2017 10:21:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l1sm6767394wmb.18.2017.07.29.10.21.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 10:21:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 18:21:30 +0100
Message-Id: <20170729172130.12842-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170729172130.12842-1-ross.burton@intel.com>
References: <20170729172130.12842-1-ross.burton@intel.com>
Subject: [PATCH 2/2] chrpath: use https for SRC_URI
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
X-List-Received-Date: Sat, 29 Jul 2017 17:21:35 -0000

Alioth always redirects, so we might as well save time by looking in the right
place.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/chrpath/chrpath_0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath_0.16.bb b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
index e115eb5c958..b61eef9c8b1 100644
--- a/meta/recipes-devtools/chrpath/chrpath_0.16.bb
+++ b/meta/recipes-devtools/chrpath/chrpath_0.16.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://alioth.debian.org/tracker/?atid=412807&group_id=31052"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
            file://standarddoc.patch"
 
 SRC_URI[md5sum] = "2bf8d1d1ee345fc8a7915576f5649982"
-- 
2.11.0


