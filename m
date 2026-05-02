Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7DFCD3431
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9357.1777739377836921078
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GHJ627y+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so21063905e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739376; x=1778344176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMu2zTnifApC5jfiYfXFy+tTc3bCJk4+zUuMHGmkRd4=;
        b=GHJ627y+DROipt1QZZ9Os4jqUMTwqAlfskMSBKFKuGYvBYAcCuyu2Yo+JHD4ymxHH3
         q3IdKMgjceHkoNlX41AyCbgqWr7H6J8eEiWmjMJ0lnksUZL3r+ijaRE8l9opFOfSlRQm
         G+isDlBQ21OZIaGgAiHKcNfs2i/3cbaTP/YrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739376; x=1778344176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMu2zTnifApC5jfiYfXFy+tTc3bCJk4+zUuMHGmkRd4=;
        b=sRwETA4UcenrtMkmljcDx74wzdVs4jNvXO182zbKRvwZi5OLluL4JhqJkEvb7QNJgX
         bdmbhwfRXZDI3Xk1zE4o0Or+lQ+EoX4WaInSRfM7GQmYN34yQ6iZjG5u8FqKcOSmzcfg
         hg4yzHFp8ZmmgRt42exQF1aHTul3hRqDMcPrC5b/gtSlBppLbhEg/A0u+f1+4JknSJJ7
         X7ENhn7ZUaDg5KYg1jL5vMWZhDQji627ny/FwbUUC8Nv1FfdwpM2dGE+mpKpvvujdOk4
         1yYt4pTdAOI6BXAKb1PnFk8RRl69uSWrJlgN3eSpWTHsbxoLrHVo9v1R5wEy5vHYeuhC
         jA8Q==
X-Gm-Message-State: AOJu0YylJyu6Gv4q2y2VO5bUVYtmbClRdaNtgN6i/Ha6xeGvW/x3HfAN
	q9EJVRwIdYPnEmbiJZly81mqDpmlgeGXvqZFVhUh6v/lInCKMthW+RBdY3vhbUXjc0dE7a1TyUX
	t72ZzOCMxF+DfsHk2cnYsnnsTbGLuksmqoDFoa9nslNdsnocl5pFLSAfwCk8oWttGnKT3RtW9+i
	Tjbu6bXLN9pDRGdrQ=
X-Gm-Gg: AeBDietCcsUsQktgNG8YeDf0VVDSNRZqFvWnz1xuZMjhgRTs8TSYRtH1zhefeoODJam
	3vNI3ONNp7uFPi9hD7Mg39jf9JsVHu0K+FGnyclPmwBS4t/+nnaV0wXKJsejc+FaXBFCaudz73g
	/dvtG08CaDhvrAHiRB0w45CgzKiiV2kRStyOA7lZiCSVfqE7tTjC73M9h1BqP/MdmDfPUIL2k4j
	pLkw1gZTejwZG6XLvy88JvLTDIpju1E7WSeq5JTc9cFfxdSjCa05BsW+Hbm/Gl3wCXJ0ALH9yIf
	b8qnV7Y/dvB4huNqRK+Z+FP/c051nczLNNXolqszZDGVBXbuKvqHdOn+AWNIMfe/ZwnMwQsV2Jz
	KfzSYUSqsV6ky/pv2dgIh9sdNlBmW3V3tfBW+7xxSAU30+mw1b3jPnsqq9pe3huLQfQ1D2tbFT0
	BhTF07kItWInK64bJa+y/uo9nK52fUz0s9ht5IMXZKfM0cNPa2VGNZpdMKHQUjIRE=
X-Received: by 2002:a05:600c:8b11:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a970eafbemr51475445e9.9.1777739375506;
        Sat, 02 May 2026 09:29:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/62] ccache: upgrade 4.13.3 -> 4.13.5
Date: Sat,  2 May 2026 17:28:23 +0100
Message-ID: <20260502162929.1377831-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236312

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ccache/{ccache_4.13.3.bb => ccache_4.13.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.13.3.bb => ccache_4.13.5.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.13.3.bb b/meta/recipes-devtools/ccache/ccache_4.13.5.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.13.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.13.5.bb
index ec440900f64..d0e154f51f7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.13.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.13.5.bb
@@ -16,7 +16,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c149d71f47f6fe08e4f2e43db4b0b091c61e8ea3daa23aa998b094bd84ecdfe8"
+SRC_URI[sha256sum] = "2fb4896269a1ef15da99ba940ac1478b38f2c4b720797205860bf40364f37d37"
 
 inherit cmake github-releases
 

