Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 04BC17DF4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:11 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c77so6287920wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zho+xkwaFapAQnWhnA+/O01w2ciMq33OVkNnRt8Ez+0=;
	b=Xvq8jQrXLDhle9x7PVRX5Rgav4yz2qaV29priA94aGd/Z8JB9CG6pNsrF9eBSrO4Ip
	ms4iLd/LzGKIxMXREyoSgUWORCZj73LD7j+fI4llk14ZxgKIPY6TiahmFAmqhzYWYkZU
	u/rP5LpvcmpHTHKnIAX2sQ5G9SRrxZ2w0RKavuaHrNA488BxHr0iKchaAB8WAUg2ARp6
	xJsLXNIEenMBG/svw75/UAeUS6nLxPyBlJjSB1qa8Q32t5FiB2s4xzd0BIARclhb63wG
	5bunWDR56GBv3Url3TbSbrIWG6hA65/5/MBl4D36L1mi2u3zT5O1VMZAYzLsbW0PjLWp
	bwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zho+xkwaFapAQnWhnA+/O01w2ciMq33OVkNnRt8Ez+0=;
	b=mFOXLuw6SWZ7lMX7fhQSAuUnP/vE89+pkB71PUEQ48rKgjAntfbbFZpqM3NbZvShFT
	q1TWD5MjQPM+f9EHQ5GUg3t5Ycw2n2Ltga1GpmLkWrIAQk0JdAQdcxGfuzi65fYAy44B
	4IVw+8+qjF9v30Kv0g87mcbthF/rHiK0QUnjCcJJcHEDKvKlb9xxa98wi9Xdn/bl7TGk
	pM5+Xi7R1pel0qnZdk8NJkTvzMJlD8Ms93L2Shq4tokAnqmZQ9YZdBQQGRTqYjmOXRi4
	Z5NQZOJ7HXegPtmiOlBmrvxCTJlYqjjM4bsSX/Wxi54ifK/HC5soZKYejNJbX2Np1bUb
	WxkA==
X-Gm-Message-State: APjAAAU3UTsL24DF+ro8Z8pNoDSxlpPgtn0Ws3uoPk7oIyxqe+uxglmt
	pI9RsCJLwnCyrT9I5aim1jlTowxI
X-Google-Smtp-Source: APXvYqxt/y3ooLdvr02pRLpcZ97nBxhf8z0bSn6wwIWtHhp0qTKstCMVn3kDEvSzva1sSPnqR4W9xg==
X-Received: by 2002:a05:600c:23ce:: with SMTP id
	p14mr18299850wmb.36.1558116732554; 
	Fri, 17 May 2019 11:12:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:30 +0200
Message-Id: <20190517181151.44001-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 16/37] alsa-lib: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Fri, 17 May 2019 18:12:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-lib_1.1.8.bb => alsa-lib_1.1.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.8.bb => alsa-lib_1.1.9.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
index 76cc9627e5b..2c63ee75222 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0eec0d657a07927795809c8f87fb76ca"
-SRC_URI[sha256sum] = "3cdc3a93a6427a26d8efab4ada2152e64dd89140d981f6ffa003e85be707aedf"
+SRC_URI[md5sum] = "e6d429dbdcfaa0f034d907fa6dc3735e"
+SRC_URI[sha256sum] = "488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


