Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F371C982FA
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:10 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43879.1789974428422333429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AfBoXlaR;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so13382185e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974427; x=1790579227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrFNg79J9G87kAJEDHgRo20QD4dOmlt9d/+mikW5JOA=;
        b=AfBoXlaRwMEZ/SkvCx5RhHHi2VIjwROhpBAUYKnjB5FB9lSJEuhBprzbdNrovF9SsR
         uEnVtAGd0hCrFUHPWefkj/C9W1sS5tEmXWHcHE5Vot4NXNvsZBXJDrrSL/s5nZEmbgWE
         L85Fii6mFkwpzsbEILBbr6drJuRD/26q0pOrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974427; x=1790579227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NrFNg79J9G87kAJEDHgRo20QD4dOmlt9d/+mikW5JOA=;
        b=CZpLL1jNTcuu/HG3tXcpdX8EUhpc0gY6UHz6lqf3Lomae8zAu4d47hLPffEWgF4YBL
         3ovbLvWjt3YnEuj2tTzBofgq3OMIt8P6fN8Vin4K8TO6FInffN/s9YTnBpRSjyZYK0iq
         Hc0as3/JHQT+I6R8uYmQyIdQS5MJRcnrYLXS5U6KHjoyWpWqZ2Inw5Wjl+YItJCVN8wL
         TMkOIW1t7Ti7maMjWJrTGXXGkHGz9i0WcHlD5esMBkyDfngjX/Oa9NAaKmHkAIKGo7o/
         5erN5HltPpjmmnBvEqODipMEhK/cpJpGj9ObOfjIk1OS9SKEgDszUtoUNX+88nZO9YhG
         GDPQ==
X-Gm-Message-State: AFuF++mFxXe9vZv820junlLabacHryxqd4sBZ8K0s3hhLDdkReDheI3z
	duq+ClbdJvMMT8GdEc79u1Lr6fJxDp8ilvbel/qmPH906uqCycij/nHp9vF3MgkVQBdfRalSZFl
	oxldrGVk=
X-Gm-Gg: AYBFou2jsnWD+4YipyIfzB5L1DQO3Fas6cgk/vEglrWWUNPE9b1khN5OVjttwQFNi1N
	ul4zStC9HRGsio4HkcLQzJsFZ0meJoRdxb+MKfKfuKMjLmxOUAuXSU+y231Clu3y/4BiwDqu0Ng
	1IPUZaRPDtyy7tlFujoRLwevqbIxHnmWcAb8h9rnq7Bs5rpv5xVG7mikNKLOGgv/sHxIuAHhdy0
	TUsk+7TBQl9XLnCUlpZUYDjHc4P65ekmMkow4VgodyUMon2IwZJIsEtLevPy/se44kVvn1njC8z
	mekCj9VLwa6XW6R23+qpGhToyKpX9PIbz+8/WkdaGR/FiT0QMcmBwCxm2eibapPuJ6YzZpKB1Qi
	rteAdpPnEVQtPmLQVHfAhn4HXb4PoomFq20MGmcT8nNFQWixCTZD9EZeNwI1d7vK5pAkFw7JgNS
	RQRNz3CfmMUhn8QXIwiX3rCeylrOcefOTZ3iHMSN4ItJ+H6Fs/5rMkFN47SIo7m6JSPPn7dOERd
	/NO7zpS7EZxlE1RwJRCAbEcdIs=
X-Received: by 2002:a05:600c:1f8b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49fc5745fc0mr128615355e9.16.1789974426556;
        Mon, 21 Sep 2026 00:07:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/20] python3-idna: upgrade 3.19 -> 3.20
Date: Mon, 21 Sep 2026 08:06:43 +0100
Message-ID: <20260921070656.521680-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246294

- Update to Unicode 18.0.0.
- Better enforcement of the domain length limit in the incremental
  codec.
- Add support for Python 3.15.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-idna_3.19.bb => python3-idna_3.20.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.19.bb => python3-idna_3.20.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.19.bb b/meta/recipes-devtools/python/python3-idna_3.20.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-idna_3.19.bb
rename to meta/recipes-devtools/python/python3-idna_3.20.bb
index 92bbda59d5a..1baa2f1c264 100644
--- a/meta/recipes-devtools/python/python3-idna_3.19.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.20.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause AND Python-2.0 AND Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
+SRC_URI[sha256sum] = "a7db850025b95ded1eae8a46181a1a6c56c92c96f0e2b005d9ff8dc0210cab44"
 
 inherit pypi python_flit_core ptest-python-pytest
 

