Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 773E17E619
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 15:27:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g135so2780717wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NmHHT/aXjMyOdnNSS33wJIWwYFk/6+TunjT3nw5dLAU=;
	b=p6yKfD7RRVeFkP5rBYO70pTkFys4sRbYUajUcvRZiBlzVvbHuT42Jymz3Urip4YgOq
	8sTCHwkQk9KNRQm3XmaqThlJAbCc8SUZZhHopboL2A5Xt7KwJBmZbzeJjDmXm0p7Rf1C
	w0008U7IlamYk3ByYgcFzl3n4H+eRyXMeilOpzvyXFJdzzYAVKouaxp9gMCBNLtbTgDd
	ucPAZP1MU4LV5z5fVWpzgxNMDs0BASufVC/IHLKfQFcQnFnEfQtDv+hx0nAxt4lddb9Z
	C2gX7kyLUMurAcpH+Tw2Bt8vvlGA2HBSpUiMgWuXpdzNUosiYGWGCm1LgPlBrLUs7ISu
	kmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NmHHT/aXjMyOdnNSS33wJIWwYFk/6+TunjT3nw5dLAU=;
	b=fPkrPNdTbTRNNqYZT5IX1Pkx9EoH6kH3801X/LnoPjfrM2jwZnXflOHONPVLnSfuSa
	c3YSk0XqDqh23eT83TkSRhtsvo6uz2uedN92mLuY0mTpVIo54x9b+CGEAC663cxKkGtD
	M7nF4OsR9MP803R7AbY+9Ad/0vJ6Kqxr/hvI74kZbPTIsC3GOv0iN1X1VUkE2DNNMbN9
	jrprW+hAR6xjjjHj7KbfVk9oWMY9G9Lrd4XG8DJSYUrLmyAYRf/mvbh9FjiQxHdnplVV
	MiKBYFsHqwZJtucMhkEh14JET0nwKcJ2/dMKCvnltHeltFj2nf/RjgxB4+c5IO2CYGRM
	A6kA==
X-Gm-Message-State: APjAAAWdrmjVZKymD11QaYRtQIo/wT/yncDKmb2o8phSzglSYWIRy5mP
	IbhtTNiRkZZN1UPDkyNwYM6HZII7QVAQyw==
X-Google-Smtp-Source: APXvYqzDeuZoDyedLLm3ByxfhnlhTg4GaZpp2OMxnHlt8SfESli6HJHWaKCyZ6n3hzS//XVv2haKcQ==
X-Received: by 2002:a05:600c:20c3:: with SMTP id
	y3mr8738027wmm.3.1560526037663; 
	Fri, 14 Jun 2019 08:27:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a81sm5117959wmh.3.2019.06.14.08.27.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jun 2019 08:27:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 16:27:15 +0100
Message-Id: <20190614152715.14722-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gstreamer1.0-libav: disable API documentation
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
X-List-Received-Date: Fri, 14 Jun 2019 15:27:17 -0000

With the latest gtk-doc release the gstreamer1.0-libav documentation fails to
build:

| gst-libav-plugins-docs.sgml:38: element include: XInclude error:
| could not load xml/tree_index.sgml, and no fallback was found

For the short term we can just disable the documentation.  The next upstream
release of gstreamer1.0-libav doesn't use gtk-doc anyway.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
index 3f1ec99d956..d94c3215dc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.0.bb
@@ -28,6 +28,11 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base zlib bzip2 xz"
 
 inherit autotools pkgconfig upstream-version-is-even gtk-doc
 
+# Disable documentation for now as it is failing with gtk-doc 1.30:
+# gst-libav-plugins-docs.sgml:38: element include: XInclude error:
+# could not load xml/tree_index.sgml, and no fallback was found
+GTKDOC_ENABLED = "False"
+
 # CAUTION: Using the system libav is not recommended. Since the libav API is changing all the time,
 # compilation errors (and other, more subtle bugs) can happen. It is usually better to rely on the
 # libav copy included in the gst-libav package.
-- 
2.11.0


