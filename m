Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3485978275
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q76so2059397pfq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ueiDlD1t3Aie+/jhA4dQidlymTABV1nxOBbxQrMzxdQ=;
	b=uzx/DMfpfhjjWK+k3DhfKEJTklz5cVKnzE+dLlxTYeJ0a6fcdvORwm7LFftYNMi7xF
	+AitEFIO4GKyZ0YMacQCGs40Rr0ABh2RHqP4aXTUhMdTsUxqWpHb+z80Rhr0glO3w2Td
	+MPgS4c5bqZenXTX+4GP0RkujekATf9qWkJZ+IhJzglE9pVaN9tY0KFLkGY0zXfkxzah
	O9Hw1BvhfIzYnEXNtN8Fyfi8MMREJ8A45nyIS73yz5QLqtxzhTrgO6tBDnMi5vRR9haq
	JVyY3R8EG/P+r9seZkJ14cr/nXnl8+lqEaGed2I85AwKnJq7hgpso8FeKFhwh00L89zs
	bosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ueiDlD1t3Aie+/jhA4dQidlymTABV1nxOBbxQrMzxdQ=;
	b=ftQCNXnZ5SWgj9Cl5Eun+5oFLD9/2YCMx3g4WZWhm4crB/Ij3YVjWcM5Iejh4tsqFh
	Eow5fUMO+RX/ShqJvtpSaKufKBjXbBZOiX+TV7Iqg4OgMh0CvO9nMBBCSF2sNonE45BM
	VZ/Mavy6ZOjrjmUBgHOVjtEBU0p0bJ7FY38HLasDFBRDfvUVOHS+CEQhYSxv7SUyzMc6
	eME9y+MIBsP8d5y5hpVGB+rfMKBmd1dLb/v/J6h+3gHNNfv7XxIu9vz+nmKOrmMOpVJq
	Va00tEkcv/4a0vmbU6uPwCmarZaZy0Ti+LiHPju2f0XCLF0j4uODNwXs92wCTD3qTJ5U
	u+GA==
X-Gm-Message-State: AHPjjUjnSGTEJR955nPiKdoK+AilpKhNyhJHLeGeWneYyosa8ECVRu0y
	U9HZZw/P1MXcmIsp
X-Google-Smtp-Source: ADKCNb6O760vvR80Nq8C5JYDux+arzn6bTLKUH7cfRsbANCoReVmEc2kGqP7Kwzu+RchVuRSPdhq7g==
X-Received: by 10.99.123.18 with SMTP id w18mr4678747pgc.27.1504912947172;
	Fri, 08 Sep 2017 16:22:27 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:45 -0700
Message-Id: <1504912911-23120-10-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 09/15] pigz: Update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:26 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream have released a new tarball and removed the old one. Revert to
the Yocto Project source mirror instead, preserving the upstream version
check.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 839b17ffd96abff3e9cf47fb4a6d680637c865b1)

Tweak commit to apply to older pigz v2.3.1 recipe in OE 1.6

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/pigz/pigz.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index 355fb2a..5a9f982 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -7,7 +7,7 @@ HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib"
 
-SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"
 
 PROVIDES_class-native += "gzip-native"
 
-- 
1.9.1


