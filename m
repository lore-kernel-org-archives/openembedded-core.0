Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id BFFB57483F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:38 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s10-v6so9791321plp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=f/MZl9VSinDemFsYZifpKIyzG4V/eLM5HeqrcGUK704=;
	b=lzJo+1yaTOz2YVsDhEqAJruX0FsEsJl61DNmhGyZc7jw1QvSukJh42bnxoOrCc5bWE
	ymtemVWU0elEpGT589OJj5APQV2+9TrLRJYocbDwKLGuufs3K3tXC0Pukis/0XOWk8gA
	snT+cV5hVAy3mGGlxHU2OABL62uhkpjwELOuO5vxVSQmHyOxHXUwXsZpGflL2w0hm0Fi
	fWeYUfBZN7XlMDglsCJ21JAtQvVjqPazDekY1LEX7vfY0e0Pgy6uBC/Z7sKQ3PqY/WGI
	0SPwYyAOPWX5Di1hrjsPtl1ufDMWcAaazvGbDGb0KXnkUA3BfDC3SeH75Tv7RfwRSiLD
	flKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=f/MZl9VSinDemFsYZifpKIyzG4V/eLM5HeqrcGUK704=;
	b=WtJq0jojLeZ1sHL427voyaay4xP/phck4GKk3+H2N3YZOHZktBZCn3vYzHVzbbUz3w
	8rt99DC2NcDWBD2+e6huMIF4l50Q23dRPw/0UdIpcuxuFu6aFuqgiQuYG7Ss4RXEKl4A
	3faDVB0a0lcIeuyizdYbx10NUz7jX3RVPNLzfyFsnMmJ7FIxSQwrkFpXoqradom3ALHs
	eZHsdKLk8qiJob8wLtqUrVUcu7SohAlZo3lTflqd68AJOltWJ7e+2Kkr1fiU/wCqUXu/
	2RfI6aeuK6tbSVd5vCwjtobfDBSP9d0qbPa5LA2Ho/r9G5ypRJZu8ZFLn/lH8cC/sKWd
	Ednw==
X-Gm-Message-State: AElRT7E4xHKYNaZYiwbGGJSDOdFCGXppFVWAXmWYijOUsysrQtz6SA17
	bRhF5BoehDIglgPtwFjB2C8Gpw==
X-Google-Smtp-Source: AIpwx49sjpPahYWqCxPYBktJm09S+mSX1ZElQrXaPuZ0UsDndcUrAdpIZCUsH57pM6R/7/YnTe0xaA==
X-Received: by 2002:a17:902:6ac1:: with SMTP id
	i1-v6mr16198333plt.152.1522806580020; 
	Tue, 03 Apr 2018 18:49:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:16 -0700
Message-Id: <77190353e2d8d1a30e5ad5bc0e59d0754bedce3b.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 17/21] xorgproto: add replacement for depricated calibrateproto
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:38 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb

diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
new file mode 100644
index 0000000..f48a22b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-proto/xorgproto_2018.4.bb
@@ -0,0 +1,14 @@
+require xorg-proto-common.inc
+
+SUMMARY = "XCalibrate: Touchscreen calibration headers"
+
+DESCRIPTION = "This package provides the headers and specification documents defining \
+the core protocol and (many) extensions for the X Window System"
+
+LICENSE = "MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING-x11proto;md5=b9e051107d5628966739a0b2e9b32676"
+
+SRC_URI[md5sum] = "81557ca47ee66a4e54590fcdadd28114"
+SRC_URI[sha256sum] = "fee885e0512899ea5280c593fdb2735beb1693ad170c22ebcc844470eec415a0"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


