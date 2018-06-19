Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 145537526F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:10:13 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id w8-v6so5498168pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tvHu913dDnUOIZuVIDDYkvDldHZM0oCoWykwvP/Bjd0=;
	b=g7kn5QsJQd2ozG4CjGjT57wfr/AgkRDUaQSV8WtTFEePMoB3wJUWecoZoijsSqBjvf
	ak9qzNmIKvakmLj0QHooKXPDns/WJGD6ECwTfMxfImd6IwcTafMmzc4eTLyCLr1nh+SZ
	LtFhd4T0pgZ4Kn1KUyFjB63GKzkNM7iaZG0byR0m55OCZSEzQpqkfpj6+gBGDyLfRHeO
	q358/MpLbk6GicWbP8spxggGOPHYIyj0XfdwS8b4dfK7ZqRx/TBLCTI/bIe1HUWhltJq
	pkHZQD5pvLjKeaRArKZVxrMYCfqWYu4jbDrKMlQ1vs+pdTA+Q7/tl61L+zmp0NiTv+rK
	VbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tvHu913dDnUOIZuVIDDYkvDldHZM0oCoWykwvP/Bjd0=;
	b=q7pghPfB6t1tQJ1Jl6fYUb/dZi/gDWRHHp3qYlR3vvIczDw9g/tEy8OMmcsKcQJoQC
	9YNU6NGdCBUfODYY2hj+P5If74yTB999yJ0I/1jePNRl70DXDgnL+2sxCRYtG8Wl9/oQ
	+ADSPD2a4f6XF32hNG7KXTEWz0wN7kAnaRITmLbVNWCVsKyXUzbOp4/BZVW2ZvPoSQ2R
	Mpm+/iVGenT21fHkYBQ9kWVjBqQG9ctDbhUuX4pj42th/cGxHwaYvwS9SgNwse2GP6ZZ
	cY24RhAcxjb4srGxWzZts9nien+kE9SuSCCRs5Zp/G24XSM78XdCRyD1WKD8BlLzHRdq
	hJ8Q==
X-Gm-Message-State: APt69E3Le+BNcBO7mLRZWhP6M0AWRriCZ9OFnrQTlSdtj00qATIgL1VP
	ZDgCwIOGcrOOMOnnf0KeiCBmOg==
X-Google-Smtp-Source: ADUXVKJDEI9BnHSiFHGeENPJ5x8Sa+0jPr2z9nb+N3+0WKFbI99SdnjxjdSeKXmzmHHZDPqSCvmkRQ==
X-Received: by 2002:a62:d712:: with SMTP id
	b18-v6mr16405691pfh.70.1529381415159; 
	Mon, 18 Jun 2018 21:10:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	f3-v6sm23326731pfn.149.2018.06.18.21.10.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jun 2018 21:10:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 21:10:08 -0700
Message-Id: <1529381411-5045-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/6] xf86-input-evdev: update 2.10.6
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
X-List-Received-Date: Tue, 19 Jun 2018 04:10:14 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{xf86-input-evdev_2.10.5.bb => xf86-input-evdev_2.10.6.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.5.bb => xf86-input-evdev_2.10.6.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb
index 96b220c..60e325c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.5.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.6.bb
@@ -16,6 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "94c2c8354c74ab1cfbbb0a222078b9c6"
-SRC_URI[sha256sum] = "9edaa6205baf6d2922cc4db3d8e54a7e7773b5f733b0ae90f6be7725f983b70d"
-
+SRC_URI[md5sum] = "e8bd1edc6751f92e425cae7eba3c61eb"
+SRC_URI[sha256sum] = "8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0"
-- 
2.7.4


