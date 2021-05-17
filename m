Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.19562.1621260852228330452
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=u1UrNSjd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c17so5035636pfn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=duGjzdhJAfOPTXl2ONDHtBerQrSpxpoCO0Drq8UGn8g=;
        b=u1UrNSjdvDSBqgSST8jndu2M6D1gnl6KbSpSLVkK5NydN98qie+UeifrvX3wjvUoso
         6NenVXfjO65uY2S5k9RLBfqAJ3UMc8zuhvCSaorTyrA8PwZwVG2rcshbh8Zo/Ufiiete
         b3YbrQ9myE34XZ45zSpV7AqJj1T7d+i883DuGQk8IIbZtjgJ4+G1ldWmZK8N4ydzAquC
         6do+W+iIAO5fNL8AFXMitenf4uwEsWnwoXBW6UMSIZLv2nRCEstTjbjiQFs9ZZCQuBMR
         w7CvimrxEobANEOjg9kJWditMAl+dKXLJ1kWuriKp4v7YzWIjrJIWe/BMuLVYMxre+hI
         rDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duGjzdhJAfOPTXl2ONDHtBerQrSpxpoCO0Drq8UGn8g=;
        b=aGkiKaH9iWtzfjoShNqTR4WlHYVh1wp76C8G6FA/AaiynyUXx9j8CN8TO5/HpynoFc
         AD+eMVXQLz1lRIepHvC5Tg23ljNqybY87Bn7UPobiykrtEgKV8vzM0+ozWBsbUIU/GpN
         RKTyNwH/pQRDDMkQc/kbzQd0ybtjEFe4z9hS2WAOmgIw0apwD/cGj1F9xL3LhO/6q8WY
         DBRsogyhMEQE9Qurs2HEQYM8iOcnKL1w2xP1SXySel0lpjrb8WJanF4ZAlAm9DrJh8HW
         G9WquVwTUGcsRT8avR3ySqFX1oKfHQCqsK9tSODuCJh+1dg0oXY7pLRjKeaagXldWfMJ
         3N9A==
X-Gm-Message-State: AOAM532L3/dAeJPQfjHoCAixVTDKTps3wODOKrXvYGGhSvLBuN7KZ32R
	ejDw9J6E8+R2lxJ8CmbOLd5cUXKWLW6EKkoyKLQ=
X-Google-Smtp-Source: ABdhPJwSjFwkwdX8Kmd48W+8DQZO0NoFdeoIJKXcOoKKvL0V0J/nEWclDKCyK0D+0BptaTnxB0ip/A==
X-Received: by 2002:a63:eb47:: with SMTP id b7mr33976208pgk.227.1621260851371;
        Mon, 17 May 2021 07:14:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/35] glibc: Document and whitelist CVE-2019-1010022-25
Date: Mon, 17 May 2021 04:13:11 -1000
Message-Id: <2afbfc1eb6bc7613da4a7f06ac267ea561b5470e.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

These CVEs are disputed by upstream and there is no plan to fix/address them. No
other distros are carrying patches for them. There is a patch for 1010025
however it isn't merged upstream and probably carries more risk of other bugs
than not having it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b238db678083cc15313b98d2e33f83cccab03fc6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc_2.31.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 22858bc563..23242fff76 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -5,6 +5,19 @@ CVE_CHECK_WHITELIST += "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 CVE-2020-175
                         CVE-2021-27645 CVE-2021-3326 CVE-2020-27618 CVE-2020-29562 CVE-2019-25013 \
 "
 
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024
+# Upstream glibc maintainers dispute there is any issue and have no plans to address it further.
+# "this is being treated as a non-security bug and no real threat."
+CVE_CHECK_WHITELIST += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
+
+# glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025
+# Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow
+# easier access for another. "ASLR bypass itself is not a vulnerability."
+# Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
+CVE_CHECK_WHITELIST += "CVE-2019-1010025"
+
 DEPENDS += "gperf-native bison-native make-native"
 
 NATIVESDKFIXES ?= ""
-- 
2.25.1

