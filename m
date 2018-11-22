Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 81CDA6C5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:42:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id r63-v6so9435035wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CiwtU4eT2AOU0rfuDaXNoAf+XzmjNIir9UgQCYTyGu4=;
	b=OrASV9iVX8OiVOqKoSIKs4yG9nE/OloS7/CfPaooVOekUlbrKw3oTbOwzVa7AzkSXx
	i9vDiTipIXNC99hn5fzm+XYVQ2M/cAqQiiwNHBvPhGv+QxR2KsJWMYDi/3rcPUSA4Ggo
	WbgH2qF05yrDAVzksDAPpSYKoB0CSvuINS3TW3UdsU7uECa3NiVWB3i1jwRl0VwL9WOV
	Qz/llgBh3fsylJpRI09qioiAvgXpgFBZy9oe2W7s+6Cq89zRvnzbpnf7DQc+4lWKzK0N
	/axR58eAmlQ9qIhcBsjcecdDTB4GLIrT4GFy7gsTzdwWm4llpmDQ2oIcfeXkFsuUpKZh
	urtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CiwtU4eT2AOU0rfuDaXNoAf+XzmjNIir9UgQCYTyGu4=;
	b=YlU/TEu8fEC2f58RXL9GMtPOAK0hkJNbpB+8i0E/om9HQwca52V3qag/G7H8mpX52p
	vzaDWNii5GvLJJPoJ8E+mgBv3BHWBenfkzxSvIqXgwfCG1+fgMDjQPn0r2lySEKi4sVK
	DKezefMKj7n9GqlGoy58GQr+WgdYUAXJ3VvbJJSUdRbrxl9p4uZY0DvdDNtxYsAw4mR9
	8yIuCZxk1P4FLpJdKy1gb95KHYzfYuuqy54g5nolKsbTHzwyKGbXdr9Crv5LLwY9zwfk
	eMUeTKHCcT5FVPJjhvKaDo3VVshitHL4piY/eTiPSd6D3VQWHdDNx7KifHfdb4j04VMr
	inFQ==
X-Gm-Message-State: AGRZ1gIfX5az96C64oetWEOpgJpYCQqWhw5fUlRB51FIuOy3XBJXKkaT
	M16H8/CNJWnOEYCc7wA2CnmlUX2+
X-Google-Smtp-Source: AFSGD/Ud3A+EZs2lsEkqAiGU0/nmyx6MDnhq3/kABw0Ay5ckxAa2Q+8r2yOdAHF2puzJSKPWbsLx0g==
X-Received: by 2002:a1c:128c:: with SMTP id
	134-v6mr10765715wms.72.1542901321965; 
	Thu, 22 Nov 2018 07:42:01 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:42:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:33 +0100
Message-Id: <20181122154136.121480-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/16] libwebp: update to 1.0.1
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
X-List-Received-Date: Thu, 22 Nov 2018 15:42:01 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webp/{libwebp_1.0.0.bb => libwebp_1.0.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.0.0.bb => libwebp_1.0.1.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.0.bb b/meta/recipes-multimedia/webp/libwebp_1.0.1.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.0.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.0.1.bb
index 1a9679f9dc8..451b0659b0c 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.1.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "967b8f087cb392e6cc94d5e116a120c0"
-SRC_URI[sha256sum] = "84259c4388f18637af3c5a6361536d754a5394492f91be1abc2e981d4983225b"
+SRC_URI[md5sum] = "ba72dfa7588c751a3a9b735a6746a23e"
+SRC_URI[sha256sum] = "8c744a5422dbffa0d1f92e90b34186fb8ed44db93fbacb55abd751ac8808d922"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.17.1


