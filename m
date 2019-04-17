Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B158F7D088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 16:00:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id w15so4234101wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4ZnIEGvgiqOyfrwAvFzKhW09/QxSVqscTOluaNnAP8w=;
	b=cdc6FkEK+QoTApatrlAVtNkYI6qduLMlRz7mN3fv0J9NJ/5SzZcIB2u88cEHJ0kCja
	ruIpBqQqYrUIA7q1yqPbwIqRNWK7cFnIBlYK9kwQRsuUR28QDPhVJfeGocDIZIg7pzhj
	/PGh2xfh7QaXb52xnVwGI3S78vGHxvrYuI2CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4ZnIEGvgiqOyfrwAvFzKhW09/QxSVqscTOluaNnAP8w=;
	b=FkAub5dPxOFMZtGWMOdP7708+ryDxrpdbSDzzX8sN+gCkLNsOC6c5laKrdFUZGfwcC
	SQK2sCmOHUSsYq7c5yOvkqIqfbsC61/QmKagKufufk955+CPFjBJheaTAzM3YeQfHWLG
	GSHH3b4PdqhR7lVWcW8LEwbm8ecUrXt4Szt8upvfyYDDkQIPVftuUb9s7facO4VARV1j
	g3B+5XUuNT6n+fOg5pSSuppQA8CHZ9pINA/w4Bl+FpWtVg7anQZdZITtkBpowrChW/Az
	bKSB8wd2Ys32ibZhHEWsc0FWxxaBLziXMfMW37sc5amURlVeDK2YPEjrHhnF7E1R3gqZ
	aTQg==
X-Gm-Message-State: APjAAAUNFw6zp3dIrrxkKWrT1ft+m5fiuc6JQF4O2HebRnspcSuhIYb9
	Wly4cl5pJ+S4ruNLA/FX8k6EXFfhCqQ=
X-Google-Smtp-Source: APXvYqwTWS3atiHjtWA8mvTu3kXRVM5h7qb7CDXJC5/Mgj67XJiA2HvJfaVhZH8e6dIz0fjB+50xQA==
X-Received: by 2002:a7b:c94c:: with SMTP id i12mr29717333wml.115.1555516808029;
	Wed, 17 Apr 2019 09:00:08 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t81sm5290330wmb.5.2019.04.17.09.00.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Apr 2019 09:00:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2019 16:59:47 +0100
Message-Id: <20190417155947.24890-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
References: <20190417155947.24890-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] core-image-sato-sdk-ptest: Move to drop SDK components from ptest
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
X-List-Received-Date: Wed, 17 Apr 2019 16:00:08 -0000
Content-Transfer-Encoding: 8bit

Move the ptest image to be based off core-image-sato instead of core-image-sato-sdk.

This gives a better test of the ptest package dependencies and reduces the overall
image size so it only contains the things we need.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{core-image-sato-sdk-ptest.bb => core-image-sato-ptest.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/images/{core-image-sato-sdk-ptest.bb => core-image-sato-ptest.bb} (95%)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-ptest.bb
similarity index 95%
rename from meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
rename to meta/recipes-sato/images/core-image-sato-ptest.bb
index 61cb9c6626c..2fa5178461e 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest.bb
@@ -1,4 +1,4 @@
-require core-image-sato-sdk.bb
+require core-image-sato.bb
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
-- 
2.20.1


