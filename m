Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0367D787EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:29 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a16so7578171pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=99rTg+o6D4+5Ai561shQ9+2IvihqnmoeqoSgnQIb3Yk=;
	b=BmzIogj6EBF8jl4zs8PcY/fP7QJLe+CcK3kH45HtHg549QVlfI2d13p0m5kyFpkSuv
	EBhbjW1f9B9WDPtaABW1rhfYqFo0VZsHXyR9QCMBocwpM8hTkiOzxpx+inlJe2U8KX8f
	a0GK5hxMh3/IXH5nLnjXBTm0mPr0rrFYTDqIcIGIGMpgeJD74uffXlFRvzcc1QjsMaPE
	bF8xpaTG7UHcY+4PU250wKWT+4A0dIsOq6XQ2E5dbVfGKFhIaoRbRcnODFZD8l9Acwej
	lVtsgOWJ6jawOobgwma7XSaL+kHb1VW9HgQ2tbLc2IHfHiBH54Me8gIndta14q2BcLk4
	FLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=99rTg+o6D4+5Ai561shQ9+2IvihqnmoeqoSgnQIb3Yk=;
	b=PDCVDmQFhI+rvnhn89xJbCA8CRwTezgkU7Rm7m/FKuy534n30Qg5LkIpyu5GaQSas/
	h3i+o2DnOoQeVuHcwT97VNMMeyGYAiOIWSEwWeMZRC2w7YFm4EvNQOwXzx3UTslFtFgp
	ix+n8aEbo6TAx5JL7dV/noYHc7bOPjH6xJg04QCkdDKvf7dI643SEEA/GXO9wNSmKZJ+
	lSPNjgqek37ckGVOO43/sgIznlTY449W/O3UiGA1PiIyxUJYNH0pIUCZ24WgUowx0qwT
	CKwOxz4Zu5jTc/bYnvxFkbzafhh8GT232QVlH7kUlFegRgTPkS4xVH+Dbg0L+gQFP9uS
	w2bg==
X-Gm-Message-State: AElRT7F4KK3hlM6xum4NZ7kRSNm5hJx6/77upO6VnEZ3Y8bnn9OzJVed
	rMVDB4cxk4WDJzPa8O+Sz5t3hQ==
X-Google-Smtp-Source: AG47ELvtaovC/npoOdVzEU9PNAlhd6kOKiQaShkTfJPsGEUu/sdZ/BY4HKXBtQm6JnUEAD4Sm1B72Q==
X-Received: by 10.99.160.25 with SMTP id r25mr24780485pge.95.1522074690140;
	Mon, 26 Mar 2018 07:31:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:17 -0700
Message-Id: <c2653a667dd8126109925c6868b52a4746ae5351.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 14/21] curl: update to 7.59.0
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:29 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.58.0.bb => curl_7.59.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.59.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.58.0.bb
rename to meta/recipes-support/curl/curl_7.59.0.bb
index 5535a56..e356fdc 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.59.0.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "fa049f9f90c1ae473a2a7bcfa14de976"
-SRC_URI[sha256sum] = "1cb081f97807c01e3ed747b6e1c9fee7a01cb10048f1cd0b5f56cfe0209de731"
+SRC_URI[md5sum] = "a2192804f7c2636a09320416afcf888e"
+SRC_URI[sha256sum] = "b5920ffd6a8c95585fb95070e0ced38322790cb335c39d0dab852d12e157b5a0"
 
 CVE_PRODUCT = "libcurl"
 inherit autotools pkgconfig binconfig multilib_header
-- 
2.7.4


