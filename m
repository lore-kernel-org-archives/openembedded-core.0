Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 03D19782A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 23:22:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t3so1891363pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HqDAi36w/mXl+jcbjmtICnXdSX0IBl93aoJ9UuIouzM=;
	b=EpJwc3q1SCCR5bMKfGGQLtPYeDfyV0Z25XUYOA21WRA7+VlJeHT0LpuO3dfhdYlwS8
	5xVOClizCk1DsBYlFEq2zMxudXLLHxivdun626fuRv6XrTzNFZHK/RtwBQUyiXP9Ou5h
	o2YCqxGKgY9AC7FevllpyFXVeOqlhp90h+vehyqH3HF8fX6gXJqGN6n8ODJW3f4z8yWr
	stmu47f4c2IVcRz4Ir2bQ3m12jKNaBi7GPed6pTXqOn5iNMrQ+QqjcSvcBqtILzYubnn
	zu6FZmRI8iPmdZA8Wd18qfZjDZKpeKGttQpSIMsACu7H55TGU9itpjVJEB/bxH2q9Y7z
	gzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HqDAi36w/mXl+jcbjmtICnXdSX0IBl93aoJ9UuIouzM=;
	b=BK8WAuoxsCkqf7Aq4smp/1zMrNW6BNHHdrf/+iob0nc//ebmvEF4DnDY+Ag0iTL/Sh
	TeeE58JFXc/LR5LezVA/h9zSq92Irax700arI5vBzPuVxdeQX3Sb1Nh/Na8wqeBhLvLE
	MLzdr4oeUNcbESf1HNZFh3kTedkAhoArK8xWkFB4Pk/cpK+n52jk+8pSYdfeis1BhWNi
	IQZCOoJ/W3JYe14DNfUG7x3D5jSBAj6x3syhZB8Oc2Qa1ugNtJs1L1crA8wL+v6t+D1v
	C6grrrnvwKecXKtI1U2UWkl6MunWVR9UYS8utxNc6JTqKSQasdCoZ917ZV7Oq1XbZ+Uc
	EFpQ==
X-Gm-Message-State: AHPjjUhokt5n5sCbkEAshiMaZeuNd60i7nGQWNT6kIJBMSbvQJfHX00R
	hJdtiCChqVh9STjP
X-Google-Smtp-Source: ADKCNb5kLyCZ1HfZOSA6hV1ZoMah+BgtrUzlQWS6w3MQgJ11LpYtGlClbSdxvnhmz+bM71PyQchgfg==
X-Received: by 10.101.91.202 with SMTP id o10mr4564395pgr.373.1504912956683;
	Fri, 08 Sep 2017 16:22:36 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q13sm5510822pfi.110.2017.09.08.16.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Sep 2017 16:22:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 16:21:50 -0700
Message-Id: <1504912911-23120-15-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
References: <1504912911-23120-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 14/15] netbase: update SRC_URI
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
X-List-Received-Date: Fri, 08 Sep 2017 23:22:36 -0000

The upstream oe-core recipe fixed similar fetcher issues by switching
to a specific debian snapshot version. However, the debian snapshot
doesn't provide netbase v5.2 so fetch from yoctoproject.org mirror
instead.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/netbase/netbase_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/netbase/netbase_5.2.bb b/meta/recipes-core/netbase/netbase_5.2.bb
index ab7ae65..65bf549 100644
--- a/meta/recipes-core/netbase/netbase_5.2.bb
+++ b/meta/recipes-core/netbase/netbase_5.2.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PE = "1"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/netbase_${PV}.tar.gz \
            file://hosts"
 
 SRC_URI[md5sum] = "3a01bfce6a28e1743412198abd241262"
-- 
1.9.1


