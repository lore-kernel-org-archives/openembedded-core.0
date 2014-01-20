Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id BA7096CD4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 21:07:39 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x55so7253124wes.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 13:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4c8JhccQswdx4CYErU1C51zh05sfXXyyt2AK08q2PMc=;
	b=inTX8obWOMnzOnpeErEHuBa5GUoO3FWnnNUeAuj6LBFE+p9wsBIMAuFl8eEdI2dNBr
	syq70MhE/0dkf/XaJTOAaLJbNfDBgSUXevq4R0JpfBaOQy3Is1TReZp1N+1UN1RE3zh8
	NYUzg5aSEj4BCol3XsWGckzCSKz7/G2E3Gi4GVAtzhAQRWggkl1iSZcPakJvoSJH21V4
	yHkgC+NvaVhJthx2h1XrekURTdEd77NC1GaglMetEyopOppP3VN3DvWlpozshme6vN+q
	k+PP1c8RJcAs4ZZp4qInyQ8q+dEG70qu9vO5SVVO3wTbKx4wRVzVpM3hdYf+1eRjI1y9
	vbhQ==
X-Gm-Message-State: ALoCoQle62YYhenm2JgkacRSfGzLLAnfDOn8gCfUGywvjgYFDiz0XtIJQPD2iVinBJdY2tAcKDt3
X-Received: by 10.180.188.141 with SMTP id ga13mr11427393wic.55.1390252060326; 
	Mon, 20 Jan 2014 13:07:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id n3sm5061547wix.10.2014.01.20.13.07.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 13:07:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 21:07:33 +0000
Message-Id: <1390252054-9399-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1390252054-9399-1-git-send-email-ross.burton@intel.com>
References: <1390252054-9399-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] xcb-proto: upgrade to 1.10
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
X-List-Received-Date: Mon, 20 Jan 2014 21:07:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{xcb-proto_1.9.bb => xcb-proto_1.10.bb}             |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xcb-proto_1.9.bb => xcb-proto_1.10.bb} (60%)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
similarity index 60%
rename from meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb
rename to meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
index 617501d..0b67b57 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.9.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.10.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7 \
                     file://src/dri2.xml;beginline=2;endline=28;md5=f8763b13ff432e8597e0d610cf598e65"
 
 
-SRC_URI[md5sum] = "311817f844c45c0c3d76dd72e6560c10"
-SRC_URI[sha256sum] = "895afe21793e6e26c5ce999b1900c02a5984c201d96d55cc42c182d3c3bde43c"
+SRC_URI[md5sum] = "ade74b8e9c870dc7515adfa209e66063"
+SRC_URI[sha256sum] = "7ef40ddd855b750bc597d2a435da21e55e502a0fefa85b274f2c922800baaf05"
-- 
1.7.10.4


