Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id EE5A87F301
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 15:51:58 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id t14so3042278lji.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3jBR72MWb1I9CnFQilhu+bb8iSRtb5+8U83iNoqaMqk=;
	b=TWN2f5tW3jCldn6ZmOr/aNxbHkyhPj7vAVgBLtnzC/v14S3pY8TtQqIedzpT98/CZF
	KRl5I3fbe5MKueuiPxkYFw1gHkvSpdUS/QDvIm4S7fWjPvlRX4T9h/1v0mq2jMZFg4xH
	DoKmq7Umsb498Zqq1koLxTt0O/aQoGkLIpMjChKcUBjeBs7vaKcL2m7XvR6XGYYMnPQc
	vVf9RbeeIl/JB/2gM1oPTqRHRMrCxffrpshzkWpXAHEjPCYUaR1KjtbZ0VsCSgtBA8xZ
	sGBmHbHw00Ko/DIMOZoWS3E6Uqz3pJVTPckOVsnN1eTkG9e+DIrGS9wd+SlqsL8zCE4n
	5F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3jBR72MWb1I9CnFQilhu+bb8iSRtb5+8U83iNoqaMqk=;
	b=IcAJ4CUXD4Mqv+wBK715hXxGUVy/4aY0xe+ax0nHSmlRqPetcAN/BIDI6OAgb7qE+C
	ChWpjf1iQOnxnCDi6yAPPQjbuqttyvP1S6DbaYSnFJ3eyyIOGImlndhUOnbmcUfdnAbB
	3PqaUhhRDCCdIlOiP39uswWDq0kE7fPnQSSeE8NwTpUtyU/XIwPnBC7IBAGg8qIeilRl
	8BwfbAAYPLxsPIK4Y8SRPwU82ZGYKaO6U1fdoZW4Hx07O21Lu8LHoiDSFwyqcmPnIktG
	6MNE2Epfypl3hIQMYBtW0AiP9miaH7mSDWEhW7PUQ4YWGvVc/xESI3DITc1UWNScJtzj
	cCsw==
X-Gm-Message-State: APjAAAV5RmqZ2mnY9Yi/XCSQr856pB3HLmMOdXdnfV9x3iEYIJ46q8ZA
	o0C6xzsR2ARiNheYRq93OMl6Rz1JZSo=
X-Google-Smtp-Source: APXvYqxwZeO3kmcutXEF401FiSKI7iX0C2uSE07XjTvq/ZMxv/xMtZr1D7QO5842tU0hbM6j/B/I9Q==
X-Received: by 2002:a05:651c:113c:: with SMTP id
	e28mr2170160ljo.184.1567698718497; 
	Thu, 05 Sep 2019 08:51:58 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id h21sm439530ljg.34.2019.09.05.08.51.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 08:51:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 17:51:52 +0200
Message-Id: <20190905155153.30625-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905155153.30625-1-open.source@oleksandr-kravchuk.com>
References: <20190905155153.30625-1-open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 2/3] python3-pbr: update to 5.4.3
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
X-List-Received-Date: Thu, 05 Sep 2019 15:51:59 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/python/python3-pbr_5.4.2.bb | 5 -----
 meta/recipes-devtools/python/python3-pbr_5.4.3.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.3.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.2.bb b/meta/recipes-devtools/python/python3-pbr_5.4.2.bb
deleted file mode 100644
index d59e744e61..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.4.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[md5sum] = "ea90e1118a0132da752d45e68d10b2b8"
-SRC_URI[sha256sum] = "9b321c204a88d8ab5082699469f52cc94c5da45c51f114113d01b3d993c24cdf"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.3.bb b/meta/recipes-devtools/python/python3-pbr_5.4.3.bb
new file mode 100644
index 0000000000..e7835e7a97
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.4.3.bb
@@ -0,0 +1,5 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[md5sum] = "477d2aa285ad97250a172b199f4060b7"
+SRC_URI[sha256sum] = "2c8e420cd4ed4cec4e7999ee47409e876af575d4c35a45840d59e8b5f3155ab8"
-- 
2.17.1


