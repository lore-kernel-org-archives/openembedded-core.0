Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfzYD-0005QE-Vl
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 21:57:11 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 12:42:39 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so3459293lag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 12:42:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2xwp9tViuNrYbCLZbW1FjXW14TswyJ1hTHJlJB+o/C8=;
	b=dMWf/YDk7MYv4Yde4G6yZTRvPYBCG1iCTBDNxcGHw2QcujsC12iVsbULzkR/Iz1fqw
	zsjDGyR+6KbLALP9/XriJIg4COxx317hCwoV8y2yZRIF7/Kfp/3lsTxdIbw4iWHgV773
	kloREHCkbohvXbrQ8bAIWKokj7YGtWostnGThKjAvdPfftv3SB8ZOGetLr+q8oPjRZpT
	i6LsPOpDumyfSrxuwKkYZe+IXZswo0mPTPameskP27WapCmc2vmpUc0dTzvTHecdZl6I
	rEo7GoRlvnSrrbQDD6nNfv6thZZUCxVq34lscsgXU14in3/AT76h31U8Kr9ZqxzxTAbc
	0n3g==
Received: by 10.180.76.203 with SMTP id m11mr6698176wiw.6.1354653755846;
	Tue, 04 Dec 2012 12:42:35 -0800 (PST)
Received: by 10.180.76.203 with SMTP id m11mr6698162wiw.6.1354653755573;
	Tue, 04 Dec 2012 12:42:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bd7sm3439677wib.8.2012.12.04.12.42.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 12:42:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 20:40:59 +0000
Message-Id: <1354653659-15812-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkrrzvbk/mE9Xl3ymNL4bxAmvrmJWh315GB1kW2m8Jk6WMx9p7IpIZ90RQ00kHsesgfYixNDmh5TeOgFi2OvSiWNrpOt8PoOeUsyRlWaWyMEWPl9Ow08nlJbcmLWt1qtH5i4NPgwI1fSBqzQwWk/slwSzUdDn1sr/BWM856X5jifEiA+tqw7boCxRV2nEY6cVYIpOcG
Subject: [PATCH] libxkbcommon: make the build do something
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 20:57:11 -0000

In "cleaning up" the package I managed to remove the inherit autotools, so this
recipe didn't actually build anything.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
index b8229f5..e8d16df 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.2.0.bb
@@ -13,6 +13,8 @@ SRC_URI[sha256sum] = "74eb0a121ca3998015fd687591426bb15c524645a72cf602831b2e7291
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
 
-PR = "r0"
+PR = "r1"
+
+inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-docs"
-- 
1.7.10



