Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 10626607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:50:01 +0000 (UTC)
Received: by wguv19 with SMTP id v19so134600761wgu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JctMvXeeZJMtRljOfFXTRZFXMlvQ9JllWpB8GSUK/D8=;
	b=mC22D6c8Pm9JBNwuDMoa0APrAKjfFioE/EEZziZGzL7Uo1c4lKpDRIuyn9Q+sRUU1y
	/iUYlDoRbxNV24k7WbHmezX4O6W6EA7N5+eWSlewXvxIiPFBEp5PcNBbWcBrD927LbWU
	CW1HdItClLDgS7dr/hlkzSYxYi96hMSc0k2zGkKN4X+TpwvAZoV2RRFXbJo5vq2prkwY
	OJC27yNmBvUrYuxqHkgwlbBHXTMQRFBx5jvyvB53lIIknsLCx5Ndg4pVqGwHR67JcSic
	l8tc8cW8B1uUd/6nbv8XeVymAwzySOHJ9BODFQCROJj1LG2yqi+meiMK8u28Kh15dd8X
	4eQg==
X-Gm-Message-State: ALoCoQkitocPznItBinCVm56GMQEdHSUT/A2+sZp40qlrXvFyEj4j/G5lhzvk80fVrJjzHsqLYpB
X-Received: by 10.194.206.67 with SMTP id lm3mr46441937wjc.58.1431967802355;
	Mon, 18 May 2015 09:50:02 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id y7sm17725705wjw.16.2015.05.18.09.50.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 May 2015 09:50:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 17:45:25 +0100
Message-Id: <1431967531-25163-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
References: <1431967531-25163-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 07/13] randrproto: upgrade to 1.5.0
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
X-List-Received-Date: Mon, 18 May 2015 16:50:02 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{randrproto_1.4.1.bb => randrproto_1.5.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.4.1.bb => randrproto_1.5.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb
rename to meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
index 601de05..b59e525 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "51ff4d45dbe8e1098740d384971805ee"
-SRC_URI[sha256sum] = "543dcb2ebb0622d8a506dcef6470c6dd066f3e3f866552a5060b91ab6129e1dc"
+SRC_URI[md5sum] = "a46765c8dcacb7114c821baf0df1e797"
+SRC_URI[sha256sum] = "4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468"
-- 
2.1.4


