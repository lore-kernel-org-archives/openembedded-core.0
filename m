Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB37C982F9
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:10 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43880.1789974429552067006
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hirAi7Cj;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so36069125e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974428; x=1790579228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UAWrdXf1Ypt3+cNxOYhdCJWFMHp0tiW7yca6lqoIU2g=;
        b=hirAi7CjaZHYQec1LegTZ/fXCYrhlFASmLZyt73q89lPJK2fvcHAC6QFBeTVUBKFyg
         yw6oooffm4Za0v+mLruyBolSV/l2LiocR78HGJPb/iGGcf/GigBid0PEgr9pkj2VBhFe
         zpiaMNmJt3v/IHiX0i6AePuAW94Z34aK3qm7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974428; x=1790579228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UAWrdXf1Ypt3+cNxOYhdCJWFMHp0tiW7yca6lqoIU2g=;
        b=TsRpKi9EvWSg62MOQR74jl9ZGcAVUAeDxBQY2jyqfdbDoWd+HdOnTSi/sYNjgRxoV3
         sEpmLW//6xSURP0dMHHoZUfcW5z05HpVzxqzXXlkPfwDgaSm8Hf22u3/PkQFU/rWZfRj
         lZzmwJUqFnfaog9w8E0kHBzSVXExyNFcMBe02EeRO1YwQlpfQogz8x+ciYU8PdyumOAB
         V+iEZMrMixojjOBnZBqum8kmB3tMM9CtOcE9yVuWFdYMK5jPRzf+GzWmOdzciIvSl5HU
         j+cnM+/sEYBTNOqIpVxAEH1w1NElcXMl0OHe6U74lMzjiPWmFTfoy8DJqYLSsjuEu2VG
         cBZA==
X-Gm-Message-State: AFuF++nNW+mAplUzK+8+mBnXu78Uw9RgbJ1UXCqYKApBQxfld10tm5k2
	0ZESHdzBKkLCeezEvCElN9yh1kqcEz3o/h4t4uuCKALz/ljP92UnMl1eV9rb091vc6W9Y4eeCFw
	aZxQP2E8=
X-Gm-Gg: AYBFou0/pFYyz5/DUKRqZ9u6BM4L2OKaNeXUhCl4tZW0moBQI3u5Af0hwBCfdY/VJHF
	ZqYkJIJlVnbfm6EHwYIFrWDtrYdiZJkrp7NanOZAxmyr/oOA71WpPhLxYQWtaFMLlaXjbjX989S
	8jwMlO24p3mVb8k8RFwY0qglfksdObdjsD5w16/kLdt8xvrx5Lwbr/pbDy1MooobNaR0UmugEjR
	JOHu4jaiQJVDi5bipKdAt3a6btSiHAGr+Gw8EegcrEQMASvdPzw/f2hnv4HQ8ntlwT4P/GnZqci
	udlJcYvw3mWt0T13F/tdun8fBKLfuTSZSxooAyrG1PwlhtFyepQRjedHur+0UbrOOa9mc3n2c0L
	gHGparaDCWvzCuZ4F/M2FRDpGb2v/aQGP9PqSxwa66hspNpHv+ArJRaAGyPrUM0GdfR4aSdzIVh
	dsFSm/TpXJJIV7bLqs5kNBUh7EPVlDM9VdLtb4J2/OHLFsEsxCUDcyBwEevDcTujWgnpUw+54Tc
	/jf0PwkEOSKnvn16EhEzhlZ84A=
X-Received: by 2002:a05:600d:1b:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-49fce72e992mr70551485e9.34.1789974427816;
        Mon, 21 Sep 2026 00:07:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/20] python3-pdm: upgrade 2.29.1 -> 2.29.2
Date: Mon, 21 Sep 2026 08:06:44 +0100
Message-ID: <20260921070656.521680-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246295

- Fix writing lock files specified as bare relative filenames with `pdm lock --lockfile`.
- Preserve local paths containing spaces and their extras and environment markers when importing requirements files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pdm_2.29.1.bb => python3-pdm_2.29.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.29.1.bb => python3-pdm_2.29.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.29.1.bb b/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.29.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.29.2.bb
index 4520e677ee5..83e9508612d 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.29.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.29.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "6bb5d893d301edb2b83d46042039634bf36c96c57cc7edad22a59521a41df9f8"
+SRC_URI[sha256sum] = "bad9705e9482e7d877a53380ff25273b01e9c1d313ee6ce7b215a6562a9d8bdd"
 
 inherit pypi python_pdm
 

