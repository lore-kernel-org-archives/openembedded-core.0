Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id D471A702A7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 12:19:15 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so4323886wes.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 05:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bbcUJTfsUXj9aomaIg+Jewf8oAFt6wn/4zl0xLwYHtk=;
	b=XCt9gdrYR2cea2cRKacSmTi5Wh23WVXFLteb4Z5M3M6Dwzj52Oh6Xl+WGHeyJqljzw
	1+aHUe/Aa8GxfmSesNDHD0vuB1sPqodUfagqKPl32hPxOL99ggfJwBTNq5Ly2oxud0F9
	c53sZhDQOWBtKEEo4I28DC7zH7fLcCWizyn0CbN12eAWp9RBdgoegD4tUHimUZZ2XwVH
	HTWUT22Utlo+nHTIFYGhXV0nlVf4fyCqcqBlxamASQp7qgXnK/iJhuCc2Rx8WwbPU/oC
	7obOKNpm8qoR43FHvKtGHRvjOlzcf2LYsrHtW+qzeUBV720TRHTU3DydcgZq4q5Pvyu6
	NlTw==
X-Gm-Message-State: ALoCoQmKoywnld0OfBOn9FH4GepqwDQ1tnFPFudiha3MERX0RF8XrxDbDWj2KJaikaVnNJUXv/B2
X-Received: by 10.194.61.47 with SMTP id m15mr32701569wjr.63.1404735555766;
	Mon, 07 Jul 2014 05:19:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	pj4sm52348708wic.12.2014.07.07.05.19.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 05:19:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 13:19:10 +0100
Message-Id: <1404735551-27757-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] xserver-xorg: add PACKAGECONFIG for libunwind
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
X-List-Received-Date: Mon, 07 Jul 2014 12:19:17 -0000

The automatic detection of libunwind causes non-deterministic builds, so add a
PACKAGECONFIG option for it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index b9b9ac4..48ab347 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -122,6 +122,7 @@ PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86dripro
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto libxshmfence"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
-- 
1.7.10.4


