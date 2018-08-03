Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC5178E39
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:30:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s12-v6so6913362wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+Y3Lc1MaLPMOisSiWYX4HHlgIEObf+6Q1MZYiP0HDzE=;
	b=im3+w3cGneiyANglVMBYR5ikxXafV9yxiVM8hphnbYv7WPMpl7QWi1XEUw6/w3g1iA
	47mHPX0PsZkBSYADOeoKm0n69e+kqdZm2mg2eAQVrbdyWPTJ7N624LaJjInxXnMgu94m
	CbklwNoXTyhvS5gR5g/YXvWOBK0XeJ7DkyDu5FQgCzqAvau8JXFBH3LruSzU2lxjfohm
	1IlItFcZnqYgSDWLqntWonz4oFdrSgpMeEf5ty+vch62yOlfJ39EH2qC2PNscOyhD/IQ
	L58wmPMbWOBYswXmUvsFzrIM5bvNHPaALzFv3DOhvVY2zBq6pilqVQKHpgOrU1sM3E3W
	C4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+Y3Lc1MaLPMOisSiWYX4HHlgIEObf+6Q1MZYiP0HDzE=;
	b=a4AWDRCWrRM240gPaprhOMXAwmMaEp2i/YFJc3N6zr3KtG/rYTLtvDXkidN72fL/e+
	ITC6UWEMkweYd0/ckn4yPOYdsQ8WCJrcQFj9e7kfp9evJyeVVaHnpZxIG6k5D0p1YUWS
	o3qDK70VTVMklegtpBZyRkaMzRNiuBUXTCVdcUJyODkhBdVOs4koyw57L3sV6Hr8KRR7
	+88d2TjIzsX90hzkP7aCUmcgjgWjB4UO6tQiYqYvqufALNK9b/Ac8sXX6S4MikDqOyx+
	pcJdB//QVBzColDhlmOJq06NnlQzc7HLW1VG1S6MJm3O7pv3qbJbH7ARTVK/2VtVz0gE
	tgfA==
X-Gm-Message-State: AOUpUlFTz1lcB5EHvI7r7t6rWHDJUX92Kyct2Sgym2yl83VlVJWwW3Pc
	qvqqceEaONz5GCsT7UVzV3ewsptPPuM=
X-Google-Smtp-Source: AAOMgpfF+Fm/p2gKwZOUyiIjnwzgxFQphtq7tvosdVgEVtIQlqIh3Tl7ZKCCGrTxE85If/ygYYihrQ==
X-Received: by 2002:a1c:9e4d:: with SMTP id
	h74-v6mr5774357wme.70.1533313800676; 
	Fri, 03 Aug 2018 09:30:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d42-v6sm9496848wma.0.2018.08.03.09.29.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 09:29:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 17:29:58 +0100
Message-Id: <20180803162958.18892-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] packagegroup-core-lsb: use new name for libasound
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
X-List-Received-Date: Fri, 03 Aug 2018 16:30:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index ef6347c7120..933864aee8f 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -219,7 +219,7 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     liberation-fonts \
     gtk+ \
     atk \
-    libasound \
+    alsa-lib \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
2.11.0


