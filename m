Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF2877EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:11 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id b1so3143335qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=NdIGZApNeVO/uVjybQ/HQ7SpwAzrZ+wvk+FXVvaWCYQ=;
	b=jgcL8OwYhP7t3/KMUyTfcRMN9RGk9PKB0qPtwMTddzsIllEIuIcHxzhpadrS0ihInc
	Q6gLPI0yKanY/Hk2JrCbzzea8MWzB984Yg7hNAcd5RPU95vGMUfDWwj39n4bhw8ML+bY
	IyNvPaKUyXkO/stQ57XYFm7KGlNpymkDwaxRKxbYBzXxWjfFcG9vs+Fzlq8HEFPhoOiE
	99068jzV53kR4zXGj0Iqikvg1WtHYCUYdK2TQ4hyDekLpmkVRHaUCEZ2QOBWKjyi0GZ7
	IPyvOXp+fM7EaYs9S5U1knYa86hR3D9tpgLS24YpRFO0WHmBnEdnYhi6erzlHWXiQWwR
	Kp5g==
X-Gm-Message-State: AHPjjUiPGDrdQX3rVmLz2WHAM/4+jJHE/OTp5FdmGu3ApVjASz7N4RNT
	ikH5H6jdEj+LeD5y
X-Google-Smtp-Source: AOwi7QDxdlCGjp7Lrr8vY/P6METGZ1KhP4hMV/EkJg/Wbtduo8fv6zKixOiajBChmR1lgCGiJ2106Q==
X-Received: by 10.237.33.102 with SMTP id 93mr16899008qtc.267.1505134092390;
	Mon, 11 Sep 2017 05:48:12 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id y15sm6282484qtc.4.2017.09.11.05.48.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:11 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:53 -0300
Message-Id: <20170911124558.2863-22-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 21/26] go: rename go.inc -> go-target.inc
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:11 -0000

From: Matt Madison <matt@madison.systems>

to make it clearer that it is only used for building
the toolchain for the target.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-devtools/go/{go.inc => go-target.inc} | 0
 meta/recipes-devtools/go/go_1.8.bb                 | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/go/{go.inc => go-target.inc} (100%)

diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go-target.inc
similarity index 100%
rename from meta/recipes-devtools/go/go.inc
rename to meta/recipes-devtools/go/go-target.inc
diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.8.bb
index ef8bc14383..08ab793f86 100644
--- a/meta/recipes-devtools/go/go_1.8.bb
+++ b/meta/recipes-devtools/go/go_1.8.bb
@@ -1,4 +1,4 @@
 require go-${PV}.inc
-require go.inc
+require go-target.inc
 TUNE_CCARGS_remove = "-march=mips32r2"
 SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
-- 
2.14.1


