Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id AD0B675474
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 11:26:44 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id a12-v6so2927376wro.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Q22YrfZq6eQ3rdWzI7eCI9IBMEwjGKSZmmIXIjaAvFE=;
	b=DPbclTl3quo1MDgzOBk8reWynVnlwjTp8FVduDYJ++aTB2uXo6yl4HyC355NpTBPZc
	ps6QOffG0MFurBcqdFJ/gYHZmvRmbjSk2Qk11qKJp4XHIKSTw7NMhAQDpoaPVnYCCEYr
	zKa4ng3DPl9jsXvRJ3c0cEz8F9YSF3D99PPoYYG7ZQ+gGPzMCXeCDS2HUMSphPwbFcpE
	THhXk7aZf75RYxIPCcqyaU0/gf/BLjP/E+49TCbUYsbjhADPyXBAOvTDW3Ah3YtI7Cbd
	rxXeiZq9LEo/uLKxDVvJ4/istERevl8ItwgVVYhQ2E8afH0SFMcfobJEPTzgZjI/IbWr
	rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q22YrfZq6eQ3rdWzI7eCI9IBMEwjGKSZmmIXIjaAvFE=;
	b=E1AZhhDxhIGpefNg51yRFeNUzWg4GmFOSi0WiHMq2Jin7QoVOoDi8HPYM51CjxnJcs
	s1iuHmG4+Yv9cMnSvnOGOwcK6OXauqQ+b524ZajoM9mkQf/50cF04hHVroVZGGbO7XrO
	pqfLRoTdeZUUdJKQkApGJC8zx/fI1jA5OVJYo1SSMzEyOleEjIeQqo9Sf+XfAr770s7W
	5TkStfeofkKnWiLcqVAoFBC/oAKKKfnVyJ0QoOxOKWOS+oTjryawT9wNxK3CyOFTpNA6
	fcvYON4O7FzDRYbarVu/qBdqoNUV9CiwEIM1PPwbkCiEkZBUFvKen+R2Fl6p+OHi4Jh6
	NAKQ==
X-Gm-Message-State: APt69E2AKxl9vJLOukFCDQb8YjY28j5YhguwcRFW6s2dWKZr3ejI2V5L
	wBhZbeyZLCsFOLYlAzDYpqSRiXly
X-Google-Smtp-Source: ADUXVKJ1tkF5vA4afw8LDPZqLzmhm6q4Ldi1bEqwWas4C0moNiBr+3N90w1liNqeMxSng6RWhsYGHQ==
X-Received: by 2002:adf:cd85:: with SMTP id
	q5-v6mr16712025wrj.275.1529494005047; 
	Wed, 20 Jun 2018 04:26:45 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d3-v6sm3008241wri.24.2018.06.20.04.26.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 04:26:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 12:26:42 +0100
Message-Id: <20180620112642.3660-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] mesa: add lost Upstream-Status
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
X-List-Received-Date: Wed, 20 Jun 2018 11:26:45 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
index 17368c88fa7..e5f4dfc0751 100644
--- a/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
+++ b/meta/recipes-graphics/mesa/files/0003-winsys-svga-drm-Include-sys-types.h.patch
@@ -11,6 +11,7 @@ on glibc since sys/types.h is included through another
 system headers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted
 ---
  src/gallium/winsys/svga/drm/vmw_screen.h | 1 +
  1 file changed, 1 insertion(+)
-- 
2.11.0


