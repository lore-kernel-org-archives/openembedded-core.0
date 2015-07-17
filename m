Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id AF0A675F1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:47:07 +0000 (UTC)
Received: by wgmn9 with SMTP id n9so84143448wgm.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KYobFrlKXaQQhwfsGhMEa7mO7AqVsD4xx7SeVdEhv1Q=;
	b=dEBdWJ3zY9AuicGeKgB1Xru0cUErLan0m62rNmgJG+3gHUxtTEU08kWu6Fd7yKqrYq
	A8bR95acPT+JF1woO2TvbLbHd1G0fjzIb9bJQ+rQ/0rm6kBkjH6nb/EEACLw+giJ2JuA
	XGPbL9iy3VY0eIv7ZnCtNlWIgfxIOocMs2LEKuQSDYRd76eWvKr19JqXMh+IMAduSQoO
	gYlJ3gQo1cNi/W0UySMQTtftl2RFczClFUzom114THrTyMr5kl7sAza2RGQtlulPtw95
	O/kMwS86+ueglLmw48MUPIILMCiEPjosdVLvL/x4nXM6HPGPPzgR+VEqfp6WCvZ7/R+I
	5yIA==
X-Gm-Message-State: ALoCoQnc/tblzt9kjTxCTk/4fEXSipUsLBSY9iIgWstsGrznYiIqntdFNvlOGHnmb4cPZ7Qem6RR
X-Received: by 10.194.57.170 with SMTP id j10mr29657789wjq.140.1437144426199; 
	Fri, 17 Jul 2015 07:47:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	ea2sm8802360wib.22.2015.07.17.07.47.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jul 2015 07:47:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 15:41:22 +0100
Message-Id: <1437144082-13246-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds work
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
X-List-Received-Date: Fri, 17 Jul 2015 14:47:10 -0000

With the move of the kernel source to the kernel-devsrc, we need this package to
ensure the kernel module sanity tests made on core-image-lsb-sdk continue to
pass. Therefore update the name of the package included in the image.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/images/core-image-lsb-sdk.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index c77425f..c3b6e7c 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -6,5 +6,4 @@ headers and libraries to form a standalone SDK."
 
 IMAGE_FEATURES += "tools-sdk dev-pkgs tools-debug eclipse-debug tools-profile tools-testapps debug-tweaks"
 
-IMAGE_INSTALL += "kernel-dev"
-
+IMAGE_INSTALL += "kernel-devsrc"
-- 
2.1.4


