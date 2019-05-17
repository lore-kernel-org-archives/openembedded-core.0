Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6297DF13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f8so1688962wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7XRNsv6MHh6DXeMAwnQ52XAAZaKTLlRUKirWmxR9hJI=;
	b=gMy845yIDxgnsUu1FjqAUF8dRbyL6BgGN0o2ui5Kwq5ZIZDEmh64cbUD5A8/G3nqaw
	7pV290sMciR/KGXAWk9czcCCSYbnxldGWSzwXS6hFlyZyV6PvPwPaEHuQUxi2O12etDr
	wI91a0OMPgv6084W9zog1WnUlQzR/1IoTNzI0f29m60sADgktwxf8zAIJk1CtazXPxJD
	tFVU/CUWR0UdDfVFg9qgYGdo+Acpr6dUlpWZFIJXXvPXskaiw0n1511GqmQakNCOGUPV
	zdRjy8UXj4+E4Qty9wUpYZLPiUziDDZQmLc4FyUBytcRDQjqe7O1vnAyaowLNVTAWbFz
	+32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7XRNsv6MHh6DXeMAwnQ52XAAZaKTLlRUKirWmxR9hJI=;
	b=s8TDNimklg4Qwhm4+ahJWSTtQ+sBZj+PtaIOJpcLsUSokxkLJfVk90nf90dSB3ZA1u
	l7JZ/qLGI4jzBddCAGMagA+piDfq63qPhGflksxZr/oPnkj/3HPhTmBAe5HDR2BLOK0T
	iJaToMnqT4/4uSN4t+vyyk294eRh6ZYCegsvmnJOC/lDIZAEEGbgB2HdU4tJYhFxRv6R
	+9kHg6GPY69UuwcQTWRMa0R7VuwN/uT/nT931GK487jrkQD5+Y67YPzhTCF2P2EpLFDG
	p6OaTPnpkVYlNeUJWepWEnSXd2k0v+eWum3+/uXVUnR+uILZ+2nr9McV+Q8Wcp1y5hSs
	3JWQ==
X-Gm-Message-State: APjAAAUdd2NDk8atyjf4kUHvg/HUfeUaVZhmzmlHvsziB9WlopzwwMzL
	BEcIiTNRkmvPKFj7lpXbhTDPjEjT
X-Google-Smtp-Source: APXvYqxd+V4/j8Nd7suU+ubNoO+A5R/bQxobBvAoxARWzEPrFgkVLU7eZe1IgTgEKtrsep0xE8U8tA==
X-Received: by 2002:adf:9bd8:: with SMTP id e24mr31828974wrc.1.1558116745933; 
	Fri, 17 May 2019 11:12:25 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:46 +0200
Message-Id: <20190517181151.44001-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 32/37] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Fri, 17 May 2019 18:12:25 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.28.1.bb => libdnf_0.33.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb => libdnf_0.33.0.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
index 4ff294c32cb..8915ba69164 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Add-WITH_TESTS-option.patch \
            "
 
-SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
+SRCREV = "51c7a70833a0f2e5ce7623fa0c7c10adc73bc4b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


