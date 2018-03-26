Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9C75978761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:21 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u86so1805584pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uOwSGJSykhkHvjGhgdqPDsSbJ0Mn2Zx9O+ZOdEq4020=;
	b=DQX/YQzX0z/lQrd0DNZiO4G1OYINZZzxPN3L9r+3TkrTdOC3gcfYCkj4zU84hWNo3J
	CsDwcItSNL2wB67XbbMR3GRaA64USS7Y3vXGeq3B3r9l+Gx3pEm2MebRO7EolqLoqokd
	1GzI37LDfpmUUbPMtz/NxcuVkVSGSrJHPKeNwD6iCW540/ZzdBWeKpFIPfAQWS9aIxZ/
	PxZd8S+SM/9HFQD8oObPXrrjn9ec3kKIpOI2o7qCS51eSBYlp7BAsRZqaUc8+9tAN02u
	wZNa0URNHZC6U8laD40TtBOh3dilFjVRhrVZHDbdPSFEXLxgieWFsuwMgteFhZR7dudq
	LQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uOwSGJSykhkHvjGhgdqPDsSbJ0Mn2Zx9O+ZOdEq4020=;
	b=uJhJyhZk+D+gDVi6UUyjDYuebtiS7WmLYda2hrB8RafdK/haRj2/eH1aD27/p7ne9R
	d9fCrMbDSNjJAm4Y4Q+Th7ZPJ/MTh8q73ktvUG6rDgcuxtIUTFgyEKPaKqXY90/FDW/c
	wG7zLQQSMBN0LDml2dKk6rsiIRIbm29XReuZ0hYNn7ttJA2tfhFSQ5Rma2IXjWt/+fDG
	nmhyUltpkeVLwn6IdIYX9GMEnrZdz+pWJmTa4LfgXwR36kd/hF1r13Qb5HqRRzFYQskv
	oQDq/GlS2im/oFrFuZq+R5hkM0JVH6Ny2jluPR3p7tWt5iDNUG36OfVrh+Yt4qDbjyjP
	ek4Q==
X-Gm-Message-State: AElRT7Fcx8hsGaG+urMBNFficC1kGpDogp18iVVkhjGfvY/MqUPkwOQW
	To3K1XBCvl1vWEz+mdl8zhB2jw==
X-Google-Smtp-Source: AIpwx485rCV4aYhW+HyRQ592/3DIMfl1k0ecu8HfqjN+8ilnM4Im+oXO8+Fj1VPSRdjuwwaAAGa5PA==
X-Received: by 10.167.130.22 with SMTP id k22mr1140212pfi.73.1522074682882;
	Mon, 26 Mar 2018 07:31:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:11 -0700
Message-Id: <ae3ec4348d57dfcc13e666927d8726bf48081406.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 08/21] xwininfo: update to 1.1.4
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:22 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xwininfo_1.1.3.bb => xwininfo_1.1.4.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
rename to meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
index 0c23d19..1fb90dd 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.4.bb
@@ -11,5 +11,5 @@ DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
-SRC_URI[md5sum] = "b777bafb674555e48fd8437618270931"
-SRC_URI[sha256sum] = "218eb0ea95bd8de7903dfaa26423820c523ad1598be0751d2d8b6a2c23b23ff8"
+SRC_URI[md5sum] = "9a505b91ae7160bbdec360968d060c83"
+SRC_URI[sha256sum] = "839498aa46b496492a5c65cd42cd2e86e0da88149b0672e90cb91648f8cd5b01"
-- 
2.7.4


