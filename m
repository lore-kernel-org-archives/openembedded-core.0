Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id AB7296D6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:22:26 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id k8so11988967lja.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 19:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CWyxDlRJV0cuSzxdned7OA9XPkQ020jhB8Dv8o9ZdA0=;
	b=nN9MOiqU78uHVgMaoeJXwLxGisd2EngwdHyMFGjLEiDJTAwqk/NizwmG8bULB2DO1l
	2KJS/jwZQ6cND8YTta2oM3y+dSgKc5tWifHnoJMDRGed1ZlaMu4Zes5Opt8mnq5V1nKT
	JOrdDdeBXOYsj4V6WHxxDa3lLJbKY4/DxDKgU+gnskgtqiWVBP6kRuwuYIbWnnM32hqd
	/1w/nMbv5tr3YFLw+9uDwr/F0f03nfd7r+UwX6Xrp8qxM4LjecJW/rccBSYf3CgMW+K+
	ycXqzHfMxO4e96+NarbACefGz9hE1YaWy8otbsONvrSdyQBUL90JDYErbd6HtcSdK5dq
	GE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CWyxDlRJV0cuSzxdned7OA9XPkQ020jhB8Dv8o9ZdA0=;
	b=sXpXSwAqS8xSWn5Pr0bHLocO8e/M810RYogGNETbMuN+DQZq6Y9cXospzCpHX7yqNX
	Yh2wE0QYzBm6qfo5BG7j6frmU/535aLl6Fyflg56anaXegLzBtlb/pCPlK1+Os0xm0oN
	CpsteJFYz8pnunQVI53r7R5nx94mnBzVUAz1MPSnAu3f8DkOO+eKHaNWK4UYINhLsiEx
	4hH5g/b+482BZ59EiYilQly+GHuGANkA81987fTiVL/oXx8NlkDIbrjg9Lhxr9XbsZ7h
	OC1d4vYuCtC+sKwgw0W1km0pxMKG9uEoXzcSyepBpyDD6z5IZcBoqmuU7xT3N3oaXowr
	imOw==
X-Gm-Message-State: APjAAAWrOPQSylIxl5cxhB5kl+VDzPx5DG8/y4ehJS5GIz87OWJ/lzBJ
	23BFv+HKVVFb8SaARvhM7GbsS3svxns=
X-Google-Smtp-Source: APXvYqyRoienxACnDz8oJYozG1uXtlksgly3wksViqqszrn6/Ix88w6UBiAISjQAyxUTfWKh5C3NDA==
X-Received: by 2002:a2e:7c02:: with SMTP id x2mr11615891ljc.176.1555986147080; 
	Mon, 22 Apr 2019 19:22:27 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id w8sm3374588lfn.95.2019.04.22.19.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 19:22:26 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 04:22:17 +0200
Message-Id: <20190423022217.21556-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] lz4: update to 1.9.0
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
X-List-Received-Date: Tue, 23 Apr 2019 02:22:27 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-support/lz4/{lz4_1.8.3.bb => lz4_1.9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.8.3.bb => lz4_1.9.0.bb} (94%)

diff --git a/meta/recipes-support/lz4/lz4_1.8.3.bb b/meta/recipes-support/lz4/lz4_1.9.0.bb
similarity index 94%
rename from meta/recipes-support/lz4/lz4_1.8.3.bb
rename to meta/recipes-support/lz4/lz4_1.9.0.bb
index 125836f7bf..744a1bf470 100644
--- a/meta/recipes-support/lz4/lz4_1.8.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "641b453d9db536ee020851bfcb1dc39f61006f0a"
+SRCREV = "131896ab9d4fc9b8c606616327ed223d5d86472b"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
            file://run-ptest \
-- 
2.17.1


