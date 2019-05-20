Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 513BF7E05B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y3so13497337wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zho+xkwaFapAQnWhnA+/O01w2ciMq33OVkNnRt8Ez+0=;
	b=uZQj5y/ynnySCozviCTswf9V2kkshZQhWSTU8mHwLRVK22/oRbZMJ6jWW/+j6l5OfZ
	PnVdao9crILdDazSrIfjkiwwOLfdgByPQntVuqLNxtz7eFe6YDoejfD2W1G9S/ihaCzO
	YXguMYDT4TMPVfq0giZETNNSHapGwQ+MMlIieQ44XEgCqxj8daU2zRZiHjix6I6eQXE9
	wHyX1m9fjpnYonDvnAORd0rrVqnFISRenC3QTVfn5SSEL+d5OWxh8tEfsF7DCWox4C12
	eS/6W7Jj89PCvOKSEkPtM/hm2SDyl5Rc/Jpsy0xkYUnlYF/4JRs/Ibz39985T586y00d
	Rgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zho+xkwaFapAQnWhnA+/O01w2ciMq33OVkNnRt8Ez+0=;
	b=FVOgURf+z43jeeAEN9nSpuEXyRxyQ0cqrj3j/WSkE1GFxLYvKwQtn9hTwHpdKP5LdC
	50pQgz9baDD5Q461BZZWJGcRF8AmCagI6WmG6gkseG6AsSs72wSj3CFo11q+B3dZJzqJ
	NrZ0yJQlHxqMHOuew6W5l6n5HGV1ujXeOIElaMRZaIDCAJjjRMGHCVaeFFjqHzm+J5I2
	VNlBicWVuW3kCFW6jsKQM8aNG7jKMdcd08dShIlwMgq7xQmKLGJAJk9lnGJQBvmuGanU
	p3OZVhcyV86Ml77eVJp9d7lPjKNrrw+DB97ahJR19bt/fSLQuzzs1yg3Aqh1SGW/Szv+
	GcvQ==
X-Gm-Message-State: APjAAAUCb7NqQKde1DvMkTTPc1bfAPkQOP+zUBYE+Quu+Fo/nk5j7Id7
	rR2zsy+5IMmeCjQnAP7Uq+oBBirH
X-Google-Smtp-Source: APXvYqz0iqLWFpIf9qKWa3Sq+sXAo6A1L+VzQyQ4ZsX4cjRw9JpRFIGg9L2g7paO62NrAp3DhbeEWw==
X-Received: by 2002:a1c:4c9:: with SMTP id 192mr10623939wme.134.1558361509873; 
	Mon, 20 May 2019 07:11:49 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:00 +0200
Message-Id: <20190520141125.10805-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/42] alsa-lib: upgrade 1.1.8 -> 1.1.9
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
X-List-Received-Date: Mon, 20 May 2019 14:11:49 -0000

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


