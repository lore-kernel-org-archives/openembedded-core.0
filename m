Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14BE47C9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t15so3645845wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FibMovxJp7W6kkmOWxVHqpsq3Cdia2inau5FQMCQrXs=;
	b=GmHJnba9Ku40IbV+Je7YsqEI8GUYed9IQCs7mlSEnyuvUaCR1a1xgSx8Y93UtCyh++
	Nl3Z1Lf2q+2XgGM1SczAdfL9jwZX4F0AEDDCOph824YX7LSgB17TQ1hoJHnQkkVveAGv
	8S2lq6iu7oqQRoKu/bVGQ4KwYwlpFOy1OQS7Q2U/ZiHLbxXfoR+YoA9Ff9y15t4PqXBj
	aRN5baxzcb29XUdOPBAt9Qex9AaRR9piAiH4RFlp1JsH4dQ1utJMMWShgP2kfmzejJEW
	DaQmxfuX8wInyUWpomQtL/IEFzYIMfRQQLvi1oynEARFWnWPySDLCZ+7macwfu3SGzHk
	LW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FibMovxJp7W6kkmOWxVHqpsq3Cdia2inau5FQMCQrXs=;
	b=OKs5kB3S9A6xVWdGZ+B1YyCns4azYq8bH8VuE/xqCafKRxjVwwOjcIv6dOJw9awgbn
	Yg6hW7ILTG1VrLhaels5UPZznS+w79S6UYpg8v2UDHMaWSCi+OKtXq/l+RPDsazlPqQr
	uCE2unL82JVcCqgb7QIcDI4bpa9fxQYBlJ0MTjXrUmpqWbvViYIA680xnY8V7Wa6K3rO
	oA/sC0LtRG00og+Nn58nT2oZwneqPzaxmI0lkMTeYc8Uo4dAJDqIFixRuYrjdeO58Mds
	xArG8MXVYk+cAmWOB8CRu2TZeVwcQc2ZN4JmJitBXlfe+i2WsrhCM7aGQlJkUpBJnyWf
	aQGw==
X-Gm-Message-State: AHQUAuZ7QE9X+sSQt7REbPW5IyzZJ9KdJRwU2jwDcE9HF/mfFh8d1a8J
	dKSIFDHsPsS/FmA1qjTshEp3ZicL
X-Google-Smtp-Source: AHgI3IYj6tGhuAzi3XI9TzrsT1QaL/YP1DFLF+7Zmd0eVio1e1L4KTjXBMHzJO4wafrJafgWb6WR5w==
X-Received: by 2002:a7b:cc18:: with SMTP id f24mr2692825wmh.42.1550598449014; 
	Tue, 19 Feb 2019 09:47:29 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:47:00 +0100
Message-Id: <20190219174712.60694-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/20] iso-codes: upgrade 4.1 -> 4.2
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../iso-codes/{iso-codes_4.1.bb => iso-codes_4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/iso-codes/{iso-codes_4.1.bb => iso-codes_4.2.bb} (92%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.1.bb b/meta/recipes-support/iso-codes/iso-codes_4.2.bb
similarity index 92%
rename from meta/recipes-support/iso-codes/iso-codes_4.1.bb
rename to meta/recipes-support/iso-codes/iso-codes_4.2.bb
index 1761ded44e1..15130dd7c44 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.1.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
-SRCREV = "164802d5fd8c7a8167816fd86a62b286680619f0"
+SRCREV = "58a4f20f8e6f4d8f9545333f3eae4cfe5678de16"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.17.1


