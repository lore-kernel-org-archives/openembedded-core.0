Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24C7974838
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:34 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v18-v6so9786844ply.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=99rTg+o6D4+5Ai561shQ9+2IvihqnmoeqoSgnQIb3Yk=;
	b=kdSfuxsOfKmUVxgqKQOoVP09q2faYaqEs209yetQXqIypJPunF3f4gWrCKOPAOS2LW
	TB4VMMfCQY86uOBo1y364JDOqre7U7OLVmL++0YTXXl5Z9CUxrMpQVQV1HllcWzNaN3v
	7Z5owc9RRaqhTY2YfAskhlTcJlIDZD0bYftPLhEQfaszHwsOzXFnJQWuFsL82Df2bR1x
	s+3dRV5OxXb9jy5e4utTCyBmFRIk+y+KTAS6oiNfcXBgYDf8MPXM/DBec3mWzabBdErN
	6wT+ZE3YQv11cPrumOoCAGzIhYT5wGqnN8lYo33O3weZoUVPFq+SD2gKl1Uendj5Ctfx
	w/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=99rTg+o6D4+5Ai561shQ9+2IvihqnmoeqoSgnQIb3Yk=;
	b=SWpbD9Ahgynzgwwc9zs752dH64jmata3uEciyI3Dc+LuILauMLVwWsSy2fyCxkEbda
	CkHjwR3iMynmzKwBZJXfodukL03xHhkIUsTB1xvfjAYr6teXGbT4nTOZL6hZNtNUcWfq
	ly0ov9xuiU6NzGtFxDt7YL4jPl8EIiQADBb1ztzTSolOh743Vb8Y5RUsIRT397tDWLPE
	0RfNBQ9kICcQRTvEg+5dPmAdPSCiFzirugAFxIC3TQvSJbwzul+94PSUZ433guQtsovx
	wdn+PFauWbKmHtd2zLIUbg+3GJv/IJTF5ctVzNXKjGHBcOs74DBvY6oRR6vPWLKhmUln
	wAWQ==
X-Gm-Message-State: AElRT7Fs5l+Bl7XOWEB5NWqaCsvq8MrSmnR2shkzPHa0qvIhv5NhrPII
	fzYz1Y/FTGPY6N2bFReccOIK7w==
X-Google-Smtp-Source: AIpwx4+TjoTaCsAU0ww02jMusYSia+om8O2EwhMLYtZonJxBf8g+dev5MWCmIKlTCEDikGLasyaPgg==
X-Received: by 10.101.96.47 with SMTP id p15mr10647664pgu.430.1522806575357;
	Tue, 03 Apr 2018 18:49:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:11 -0700
Message-Id: <653002cfdfa8de4e3d3d4d62c5229d45f2ff2a54.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 12/21] curl: update to 7.59.0
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:34 -0000

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


