Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1296E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:02 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so76482663wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uXBkH9NobpiqhuvN8SM0ZSDF/5RdAgZf/jq5kg/BdFA=;
	b=SIggBNX2yeYPa9avwBlf+GeSak9ERJ2vS7SIF4yHVCcFMyXKTywWZpSxfyQuRTDb4g
	lkDoH1jFFA2AgeoNUVDw1wlf0zVALd4DpKx7zQdrkC5A6Lk86aw5HXmwVogO8rc+FFJU
	UceMagPPvKRPOotmaGBCdbocWP26OXxGwLYS2TlRkSq17oKNIx2u3cK+ehiZ+9O7D/YY
	VGADp5gsREuxNa6Vie08EwiKpWcUxghCRVvdNbyIRjjPm/Y0knkQmkNFrcdjfpgD9gZ5
	TCs4cLDVj79ImVtIePQ1BsKAmU7NGaJPRNKd3veat1dz3EMYrWZlJUzo9Jb1T1L3KGT2
	6uzA==
X-Gm-Message-State: ALoCoQmBzbAT8Ur/6GLBEEP+OrHrotppnFuM9lCfY7bHqGfU/b/JTDLDZfGFOauU/gyHVN5/Q9OI
X-Received: by 10.194.222.230 with SMTP id qp6mr46728299wjc.70.1431967803557; 
	Mon, 18 May 2015 09:50:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:26 +0100
Message-Id: <1431967531-25163-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 08/13] libxrandr: upgrade to 1.5.0
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
X-List-Received-Date: Mon, 18 May 2015 16:50:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxrandr_1.4.2.bb => libxrandr_1.5.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.2.bb => libxrandr_1.5.0.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
index 4df4b3a..abbbae5 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.5.0.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "210ed9499a3d9c96e3a221629b7d39b0"
-SRC_URI[sha256sum] = "caa7b31ac769be51a532343c65376f1d4df3f307afaed58e34fb5e82e8b825ad"
+SRC_URI[md5sum] = "309762867e41c6fd813da880d8a1bc93"
+SRC_URI[sha256sum] = "6f864959b7fc35db11754b270d71106ef5b5cf363426aa58589cb8ac8266de58"
-- 
2.1.4


