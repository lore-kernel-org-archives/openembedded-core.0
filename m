Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2479E6C117
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:42:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id c73so252963pfe.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 06:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Wx1p9RgvO7aSIt5gchPToDmqXH58zPm/JtgMBdz3BGw=;
	b=Yrr2JhXPfsS/etpmiTVEcVfYwwIGP+x7yqcmr5uF+NtTriZlkzURR0oaJzg8qhGc5x
	quzsw+1ut+pF6DAhbp/k8g4tQ0F7KtAxUzHIkFQOUGzKYZmd5KZjWDqNLXNNQ7xo28zE
	Vsh2UFMdsLCVxU6x1QkCSkAQLPeOsATJIyx0j6iGxrV5TRoxp1LLXq2XH0nJL3DdE8Z4
	NJFIgZ6L9ClRd9wBJbOXYjLM4VrTi/171+ag6f15lKSoFb9NCGju/FRyQGnASd0bBb5W
	Fb7VxU1TT7rO86p3R8t8xTsZ8ebacV4L0KTTWpEPForRhM5PPLcNCznky7I1DUg0pe3h
	u/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Wx1p9RgvO7aSIt5gchPToDmqXH58zPm/JtgMBdz3BGw=;
	b=O5eMX6Q/jlu83An207ajZeKCKLa4oJaww6gsLjDKXefGVehft48qkSgmnQP6+Lfgl/
	Wdp7OchDcVdfHm2FjZau5pQYcpUr72V/3fbqdiZ4jldMYjBb8NAAApSaYVO+n7Q0ZiQE
	sUtdZ+dzSa+3upnqmMpCuVXShmh4lTDophSKv7LDdzRZLMoTdUcAgDxoWJMe9RsP6Kps
	dCGNpXKWVcaJXLZFLrWJy82ox7aLnbTS2XF9GvcuNIRVibrFJjDcJBEHu7FvhPRvz821
	66TLQHkpFv/Ia6MDFMNWWZHIndfKthJsFy0eVWFU4lvKYoTt/gY295ratVL/OUqtCwNr
	heUQ==
X-Gm-Message-State: AGRZ1gL0SbDxLa3/+3DH8QRznHdUlPQGa0ma/1lYirkkTedZ3+VD/nrP
	DL/Ysbq7eCqP0zr9ml/mVEg=
X-Google-Smtp-Source: AJdET5ciyXLc7cAFNnCc2vUVVsnvZAYo8lmMQDFaSBLrOkFKqzzKDCqkdcdOBJwK9H4IDaPtITM2BQ==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr20436626pgg.159.1542638521133;
	Mon, 19 Nov 2018 06:42:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:cd6c:2c60:eff2:335a])
	by smtp.gmail.com with ESMTPSA id
	w136sm26777300pfd.169.2018.11.19.06.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Nov 2018 06:42:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2018 06:41:55 -0800
Message-Id: <1542638517-19735-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
References: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/5] libx11-diet: update to 1.6.7
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
X-List-Received-Date: Mon, 19 Nov 2018 14:42:00 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-lib/{libx11-diet_1.6.6.bb => libx11-diet_1.6.7.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.6.bb => libx11-diet_1.6.7.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
index a4ba4e5..0bc08fc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.7.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.patch \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "6b0f83e851b3b469dd660f3a95ac3e42"
-SRC_URI[sha256sum] = "65fe181d40ec77f45417710c6a67431814ab252d21c2e85c75dd1ed568af414f"
+SRC_URI[md5sum] = "034fdd6cc5393974d88aec6f5bc96162"
+SRC_URI[sha256sum] = "910e9e30efba4ad3672ca277741c2728aebffa7bc526f04dcfa74df2e52a1348"
 
 EXTRA_OECONF += "--disable-xlocale"
 
-- 
2.7.4


