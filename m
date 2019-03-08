Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABF57CF50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:21:07 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w6so21544121wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AJHVHr+c4OZk6JmU4Vj3rR3DhHkGfD2qYzI+zXOtawQ=;
	b=ZNt4sWJo0eBhdNzxgYqSkxvkTGhk3oV01rLnRziNw6MxyixRrYhK5sRgLbRn4JwADp
	hTvEfQgIB8/lO2VclrHNtg8rkuiJe6AlfScx2LMpbriUcVvni5Uuh6AZ8jaslVHZgGTx
	4BOGlp8OhBtMnb3LTyIIHRVJXb1Dtxa6MpGeN/dFZMYhO1jN1BgcUX9OGJGjaZo+D4KB
	OTaTv65ylTix81L+MHIotA11GSAJ1W0NK20BpsMIZo2jDDSjvEjeBW/GbQX98KTeouMf
	mJA0HDINCrufvvfhvcCQu0MklVwlxvOCKwY46rGNQXYDZprHzZQcHCCNleCxGgRYYDK/
	qU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AJHVHr+c4OZk6JmU4Vj3rR3DhHkGfD2qYzI+zXOtawQ=;
	b=G7orycGDwyTAsmy4Ahyx2zSbAKyeHapP9VNgcelJ5D2e6zh6AXZ1e8686EHdHGAmG1
	WIadEDYlSQWHfxk3Btr5MJzEoq/O08+EZ1QwMcf+dZfivEsDXDy6RlR66/8li+pBW+Zq
	z5zdGmcBongDOfHF7D6/7dZFidnKxfhqdMoMIA4hdcI/YPtILnYVpJU/+h8Xn/zYIpXV
	5l2uQ0PQUfMspE/nrkzeF4fXdss/44FA/bqnZMZxx8u4ELwrkdU54ej5yDTuig/smOOf
	Xf7lpPcGScsb1zmXD24DlM3rJ82irJYpxpK79phozvbWMwoONoX/CnfEjFBIxZuTgq87
	rxWg==
X-Gm-Message-State: APjAAAWnvN2Re81E3515GTVKSbpLad3Yx6OLFtfel6jSwARkPUw6yNIT
	Aite8fSPDvIoCcaepTaVc64fwPfNi0g=
X-Google-Smtp-Source: APXvYqxkZ2WtvzOit1wDWhSyBfPVv0RH1h1uu81VsvWccDP71yczd/L+jNDeOXgVBxANupji+0N72w==
X-Received: by 2002:a05:6000:1285:: with SMTP id
	f5mr1759597wrx.44.1552054868506; 
	Fri, 08 Mar 2019 06:21:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x24sm4131279wmi.5.2019.03.08.06.21.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 06:21:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Mar 2019 14:21:01 +0000
Message-Id: <20190308142101.10299-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190308142101.10299-1-ross.burton@intel.com>
References: <20190308142101.10299-1-ross.burton@intel.com>
Subject: [PATCH 3/3] gstreamer1.0-plugins-bad: remove redundant jpeg dependency
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
X-List-Received-Date: Fri, 08 Mar 2019 14:21:08 -0000

The JPEG parser doesn't use libjpeg.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
index 8c7c235fd12..4987be865b2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bb
@@ -18,7 +18,7 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 "
 
-DEPENDS += "gstreamer1.0-plugins-base jpeg"
+DEPENDS += "gstreamer1.0-plugins-base"
 
 inherit gettext bluetooth
 
-- 
2.11.0


