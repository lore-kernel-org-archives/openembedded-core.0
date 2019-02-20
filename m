Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 400327C990
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:31:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id h22so4485893wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1GfwD2IQ/VGWYX+fSF8QIq0wsWA/DCun48EiYobliUU=;
	b=XSNBiTnGPSiPNL5MQM9c5H65KmpVTJrQW+Vx+x7yoasUSA/4DgmhQKLwCmR795aVYQ
	DJkIHTryH3gNCG/zH4mxHELBSGffVG6XjnXMmEDFfY6C6JmF7oJZ4dvuIwFgzIACClj4
	6bhALBxmGC8djpW2N1vRwtdBk7YaCHNidMuE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1GfwD2IQ/VGWYX+fSF8QIq0wsWA/DCun48EiYobliUU=;
	b=aF7OYk8t1UApQG9d4DQ7jhYNVt/GNw47JyWtRNUl/sO94qVYpMMkHG3Gu3OwM1jZvD
	XsZ9YnPI3dRiN8DNq2BRQSMOmloN6XEcK1piVuzbDJW/NYt1GhAvEhdfX+FLhab0QkoM
	3g8WbWjdOgn6SOZpp9xWM8xQNFj5x/N9C2dWQ1FEE9vD8ZXhK2lEANbv8+Ci10D1xHm0
	eMQeI55zc3iphRWSNbLs4ZuED1FBdydg1jEOmWtLN35qMwDCITClrfK9yNUcvnCxMIff
	T5UPfsR7ZFzUlssf06IQato8q4mgcmsMHUzCN/rEW5drsEB6oIb0gFU++AzVyL0zRZ6+
	xJPA==
X-Gm-Message-State: AHQUAuanMFmfE+rCHQSVgjqPUbbO8aV+QUF598Go9oIkDwD57Vyjf8JB
	/2gQxLVyRNN0Ii6jvQJM/pxPzSiVKBw=
X-Google-Smtp-Source: AHgI3IawbMyCZVfr2O6vxYF5WjsSFkfAkcZfmUmqOShwHpJVdaVlvgw2vdDfLfkklCGUu2B607xCig==
X-Received: by 2002:a1c:e911:: with SMTP id q17mr6886507wmc.31.1550662300646; 
	Wed, 20 Feb 2019 03:31:40 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l125sm10377824wml.18.2019.02.20.03.31.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:31:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 11:31:34 +0000
Message-Id: <20190220113136.25171-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
References: <20190220113136.25171-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/5] python3-pip: upgrade 18.0 -> 19.0.2
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
X-List-Received-Date: Wed, 20 Feb 2019 11:31:40 -0000
Content-Transfer-Encoding: 8bit

The license checksum changed due to copyright year changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pip_18.0.bb => python3-pip_19.0.2.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_18.0.bb => python3-pip_19.0.2.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pip_18.0.bb b/meta/recipes-devtools/python/python3-pip_19.0.2.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pip_18.0.bb
rename to meta/recipes-devtools/python/python3-pip_19.0.2.bb
index 3fcdb8014ac..d81a60caa2b 100644
--- a/meta/recipes-devtools/python/python3-pip_18.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_19.0.2.bb
@@ -2,12 +2,12 @@ SUMMARY = "The PyPA recommended tool for installing Python packages"
 HOMEPAGE = "https://pypi.python.org/pypi/pip"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=593c6cd9d639307226978cbcae61ad4b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI[md5sum] = "52f75ceb21e96c258f289859a2996b60"
-SRC_URI[sha256sum] = "a0e11645ee37c90b40c46d607070c4fd583e2cd46231b1c06e389c5e814eed76"
+SRC_URI[md5sum] = "526fd9ec1e6ea956b3571ebfb42cf83c"
+SRC_URI[sha256sum] = "f851133f8b58283fa50d8c78675eb88d4ff4cde29b6c41205cd938b06338e0e5"
 
 inherit pypi distutils3
 
-- 
2.20.1


