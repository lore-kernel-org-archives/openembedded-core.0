Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0C4347865C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:54:29 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id t46so577324qtj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=G3hh/x8grXjFcPo+fPqEjqcfW6wjxtAPMZnQ0/mLU60=;
	b=lO7nyB0WqiowVLrGOyByudA6YnGbXfwir1MwMTOQj7npQFn5lNZNgljHubIsD5TLyw
	U1sRcWeiOv2ULGrbq35MXEYhHDK7OFLU+r3qob4Os81l2rX0L0Vt58K5gifsvFsETZd0
	WBp+MJfaGNcThILi01ECMYYpM+53L4obyF0nsP++HmulO8Z6Ja/NyNYb6VQ410nS0dwC
	KSDKliADCzTaxgDMg7MZIuohG6lToRG9oDttB+XPYKAaOUFIsY0q6jQjwdmqsk9069Qi
	kueFXR6QhjaMRsuJuqBtbS2eHr/JrS5FZI6XjQ5QjwPiA39icrz0KgaxmuZQsxCd4mT6
	E6Rg==
X-Gm-Message-State: AHPjjUiZlqfFNo7FORQAhITWX4hjMtSwBbBE3QV5k4OZBjTMC0GPekSn
	0JYmOGaFo7fDPpSH
X-Google-Smtp-Source: AOwi7QDWEnsaix+OYM+jRPMHzBgQhL9rApJpvUfoA7GveYQyv/lXdbhd/nRfHzxeIw4deSiqWZMDIA==
X-Received: by 10.237.44.194 with SMTP id g60mr12899936qtd.92.1505325270582;
	Wed, 13 Sep 2017 10:54:30 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u23sm9785084qki.24.2017.09.13.10.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:54:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:54:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:02 -0300
Message-Id: <20170913175410.23041-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 1/9] go-runtime: extend to nativesdk builds
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
X-List-Received-Date: Wed, 13 Sep 2017 17:54:30 -0000

From: Matt Madison <matt@madison.systems>

Missed this when addding SDK support.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/recipes-devtools/go/go-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e3eddda837..3775e86b06 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -1,4 +1,5 @@
 DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
+DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
 export GOHOSTOS = "${BUILD_GOOS}"
@@ -56,3 +57,5 @@ INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.14.1


