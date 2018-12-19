Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C22A071BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:13:17 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id gn14so9817972plb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+USqDlN0PXiyngi62MyP+ZwFzYrWSvRyuGxZMHWIg48=;
	b=WWJtvcLizLQoiBMQRbmnbc7D1/pAraEpoRbksGj/XUr5E0YSzweBAti6dapkdzwO1T
	uIxs0+6oh8vn8sIqbOOtyyHzWa4XW2uKtNNe7jPVXHevJ52VeK9ASARaBKGKaH950G19
	elEOzFzLAAWNEYIw+U+RfvG7ubhp30ER/+uHnEuN4ze9tztQrxtoV22xGWicGwl4yVyh
	MOlUjWc/9UQJvLQeAEYlNAjRA2qbHpe4Xs6ypL1IFNY9BKWE5EcpGpUvWvH4aIv/G2Pr
	yyUyd/jVcmI9zhTzChCmpKrTsgu86I0xHTmegBXp/F991iMntlae+LNgVzuBkRvhfCFQ
	Dpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+USqDlN0PXiyngi62MyP+ZwFzYrWSvRyuGxZMHWIg48=;
	b=XvynW+oSP99Eog+ldDF9Qv4iqiES3zXG0G9fh16OclDPyNkNekptUl7yC50mUHgdeK
	3lV6mxe9pcVitwDJhb81TTTYusKQ/5DNxFnLoE4jfLPMj2oXjYkYauBS5N7YzHBQxu25
	/GdN2WNezueAbpTpEGXQlh+7KL+DOASH9MoaOCchqri7UbVtu3GFpqetmB96xCao/19z
	4hQM0/gH0dh7FvaGYB4LWrHtC//nHzPkIrfKxAx3WLwk/PFBw5YUntTnYL0LhTYgiIci
	BvAvS04SgXCTUm+Br+2YGYO+LAnh/u6h902oeUn0NB0pkNvu7o779FRJU10ti+YHOXnD
	AGzw==
X-Gm-Message-State: AA+aEWbqsZ8AvDZKSTwEqavH4ubBP/JBkkaIcBrF/0Rl45GxXSiXmPg2
	jwuix97/As3MFgvo33PlmDJKsKCYimQ=
X-Google-Smtp-Source: AFSGD/UB6ogCmGEKqCg9RZedd5JNSET/NNzJ41sOExnEOpuy+A4hbfXfnasy85+i7zf+DB+qn8A2pw==
X-Received: by 2002:a17:902:27e6:: with SMTP id
	i35mr20772388plg.222.1545243198487; 
	Wed, 19 Dec 2018 10:13:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	q75sm27536922pfa.38.2018.12.19.10.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:13:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:13:06 -0800
Message-Id: <20181219181309.8320-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219181309.8320-1-raj.khem@gmail.com>
References: <20181219181309.8320-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] newlib: Move away from gcc-initial dependency
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
X-List-Received-Date: Wed, 19 Dec 2018 18:13:18 -0000
Content-Transfer-Encoding: 8bit

gcc-initial step is no more needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/newlib/newlib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
index c97c7c276b..c68c163266 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -20,7 +20,7 @@ SRC_URI[md5sum] = "81ec873108b8593c586f91ca65963952"
 SRC_URI[sha256sum] = "c8566335ee74e5fcaeb8595b4ebd0400c4b043d6acb3263ecb1314f8f5501332"
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc"
 
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 STAGINGCC = "gcc-cross-initial-${TARGET_ARCH}"
-- 
2.20.1


