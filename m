Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFBF60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:34 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so959709wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K3+/r+EPBSKJQnrSL/IMX7idzaEEzRoVMwP4si5VPzY=;
	b=b1EHPaNmkY8wCQ+xa3GdWDyZYAVpJ3l81Tj9NGqfXmM23zrCt9i+X2K6YW2hu5KDpC
	Vcrxh4VtZyyk1NR5PlUPcsK9Wo0SoQhuLkMLu6erNN5Oii9QMEbLXA3we2PK6ULMlW9m
	tNuQxlURLAn0akO2Re4wc97tsPjV2AZE7QQUyCk1XbGlwqEI4HiGuInwHom41xoYcotZ
	6/H/h0fqCJ3KMR+JmeS90J9da0Vj4giHOzHTqMNIyDRSvKuU5xq0+nCwRwXTtWsmyZ6U
	u/iiNAg/adb+Y8VD3yD42gv4fI9ishzpcFzRcQkIUJLbhYkws8bz5lCJ0lv5I7H5U5Ma
	RvNQ==
X-Gm-Message-State: ALoCoQmHcVvd4QiUzTQIMN7EgSad38eUrI1lgjn7qR3Ck+qfsg2fohOQ0cEDtzuSMvnB8eV3f1v3
X-Received: by 10.180.72.234 with SMTP id g10mr17344724wiv.52.1406054315749;
	Tue, 22 Jul 2014 11:38:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:16 +0100
Message-Id: <1406054301-9027-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 06/11] libice: upgrade to 1.0.9
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:37 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-lib/{libice_1.0.8.bb => libice_1.0.9.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libice_1.0.8.bb => libice_1.0.9.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
rename to meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
index ce6a194..314d281 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.0.9.bb
@@ -20,5 +20,5 @@ XORG_PN = "libICE"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "471b5ca9f5562ac0d6eac7a0bf650738"
-SRC_URI[sha256sum] = "24a991284d02ff0c789bc8d11ad2e4dffe144cb70f24e28f9ce3e8b1ee08b71e"
+SRC_URI[md5sum] = "addfb1e897ca8079531669c7c7711726"
+SRC_URI[sha256sum] = "8f7032f2c1c64352b5423f6b48a8ebdc339cc63064af34d66a6c9aa79759e202"
-- 
1.7.10.4


