Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.36673.1606592394260784818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQbaZqvV;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id n137so7386136pfd.3
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 11:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rdP8WwyE9egIyFg1g8iz90UTw7Isa1IPx4yBiiuZHJc=;
        b=WQbaZqvVQmX/oGPJSP2ZgOwHAKlD+bzJoViPAhYtTO9FLZkqMJEzqtgTqAB/8hs06m
         OSHq+r83hJ0M4PKuSlj40rvqEuLp91593oXdPYBLt4YPaA5EPtM8cUu3/ZZwyV2ndaEE
         CAbOsfqa+/r1KMdxIfJfeTS+bAZGi4gkl4d84fthgfvh4z++sO1ObpYjdPE677kQFgJy
         blLbJRh8T//AwG9xEAkOO6HD4qL3UbAYUM4qq4M59mehI+QkBIQaJp6efuDqLJR6h/3n
         0nOEXQwYrkzNUEYEBJd88baoj9O/l3I87C57ohGS2+hNyrkyjIJx6xt27saZyVxTRlJn
         9LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rdP8WwyE9egIyFg1g8iz90UTw7Isa1IPx4yBiiuZHJc=;
        b=cr3F0bdS+M/Wi2AvXhz0Fv/kxW11FwYPkUKf+qCQtZVRrHaEIXcfdeyHXP6hDajobx
         5feD226vTl/dCRUcVcvvyMcJ+CZdPnQVOEre6XS9fK1lnFFSOc4NDbbgIS+xmUZ1zbcw
         Mw1UIwt2rWecefFgP1v7g4WbzP8Vp3T27WXrExPZnIzmuNHx8ygvCNVWF39UV0rhQhR5
         TgNWdsn88H5KxVwSlgvM4z+DV8onCNr7r7AEJ4kvPn0NSphLlj8vH2a/pJkYVnll9HYW
         KeiL6kr8gE2M2c6P/g7uibIqzZiiH9I+m40rLa6OE2tR6cVz+ItiiATMaJsj3Y390Ahe
         axAw==
X-Gm-Message-State: AOAM5307j1SqZIDTNd3C9hk5E6fhl+Fuue9rXv2vrHGSwuxDqZgNJPuh
	N6IuV6VobRPRpyNo8KRbXSTEnh6g3l3gVA==
X-Google-Smtp-Source: ABdhPJyn4KPwU7deuz2jVdH1/eDcTh/BOZS9igsPdjd9dyhj8z6p/bH/ZDQ6n8ySCf7XdR2RbWsN4g==
X-Received: by 2002:a05:6a00:14cd:b029:18b:fac7:d88 with SMTP id w13-20020a056a0014cdb029018bfac70d88mr12275147pfu.6.1606592393629;
        Sat, 28 Nov 2020 11:39:53 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id z29sm2629795pgk.88.2020.11.28.11.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:39:53 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-hypothesis: upgrade 5.41.3 -> 5.41.4
Date: Sat, 28 Nov 2020 11:39:37 -0800
Message-Id: <31ae1fff5ac74cfaed06ab920ee4da3000f20cb2.1606584666.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
References: <cover.1606584666.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Upstream release notes:
"""
5.41.4 - 2020-11-28

This patch fixes issue #2657, where passing unicode patterns compiled
with re.IGNORECASE to from_regex() could trigger an internal error when
casefolding a character creates a longer string (e.g. "\u0130".lower()
-> "i\u0370").
"""

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...ython3-hypothesis_5.41.3.bb => python3-hypothesis_5.41.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.41.3.bb => python3-hypothesis_5.41.4.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb b/meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb
index b7bf15c31ed..416acc8d72f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_5.41.4.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6a3471ff74864ab04a0650c75500ef15f2f4a901d49ccbb7cbec668365736688"
+SRC_URI[sha256sum] = "7ef22dd2ae4a906ef1e237dcd6806aa7f97e30c37f924a0e6d595f4639350b53"
 
 RDEPENDS_${PN} += "python3-core"
 
-- 
2.25.0

