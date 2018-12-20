Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3923E7964F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:40:48 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n190so2525645wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tawucSA3fYyc1TIQULj68Vw+Hxvcsvp9JbesVPBQTCM=;
	b=OYJl7mktftFCmKmk0H8gltfQ90gd7x4FgADB+xZz1JYtqFuGBsW/yMJNgkMUqSZ8ZU
	6R5G1OeTjuiGwSotmP1fd68+HnAZ8u4H+Tx7X2jl4zjYJ7TSYqfEgoaz9OZeXlI2YM+H
	wgI5tz49uY10NXdLI0+WnLXuk+uuXSkqRd662ltclJmm94GbgwDMT6hy4F2QLtDl0dHJ
	js/ITuVSD8/EjxI8r3oXqlQ/3YH2hT79DJ8DerHslQfejdfyOIoe8pQ+ZBjcR9quyI3C
	dNkh8uYph8mWOZGfJeSowIglCCQEZpEjqWRnIpD6t9tcdinvcDtCDCFitBYMtcBpymyL
	rMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tawucSA3fYyc1TIQULj68Vw+Hxvcsvp9JbesVPBQTCM=;
	b=C07FSRTHtslLkwNsp8NvRZ93vgGBwJ0Hd/m7FIBJ0lpDJ0dSUIhyzH6i3gPQGCLRsK
	ni11RiY3Ez+mZR4EoJtLz59DX3yFI4+CMm5bJlHUbp/N7jMYZPTXfm37k9XKddCrDuPH
	ty0a5eCzGMxJUfkai4DTycIo4Qj+oiNs5ziAU+0uEOQyCaawfDohPufJgaLSgpzyE7y3
	5HDPm4Wf6SRGuXeUOJewQWtTqw5t6HbDHQWDS7Xe0925mLNS6dGkFM4DNl2LxPRNe3vA
	foy7N/D0rzA1arm+bs83Zl1424kDYUNBtrU1WwuEKR1cMnnIjy12m8XPWFu8GtOpPt7p
	o81w==
X-Gm-Message-State: AA+aEWbh83Y6aiR8MNWYU2Mxl+ojJd8D4xmtZ7lJ28+tTLHt32ZDsZoy
	YMvaDDimQ+8h87W0VOUF+v3JwrfwORA=
X-Google-Smtp-Source: AFSGD/X2EzEScvIYFrXhyjefoP3dCrIANSNUpg9LF1KB7Txwtp6y2kl5BbzY0J8DLR1dfW204Sn44g==
X-Received: by 2002:a1c:9a0d:: with SMTP id c13mr2449318wme.41.1545320448504; 
	Thu, 20 Dec 2018 07:40:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h10sm8178307wmf.44.2018.12.20.07.40.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 07:40:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 15:40:42 +0000
Message-Id: <20181220154043.7860-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181220154043.7860-1-ross.burton@intel.com>
References: <20181220154043.7860-1-ross.burton@intel.com>
Subject: [PATCH 2/3] nativesdk-packagegroup-sdk-host: add Meson
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
X-List-Received-Date: Thu, 20 Dec 2018 15:40:48 -0000

Meson is growing in popularity, so add it to the SDK packagegroup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 4bf0ac04577..ae989011f48 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -22,6 +22,7 @@ RDEPENDS_${PN} = "\
     nativesdk-shadow \
     nativesdk-makedevs \
     nativesdk-cmake \
+    nativesdk-meson \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     nativesdk-sdk-provides-dummy \
     nativesdk-bison \
-- 
2.11.0


