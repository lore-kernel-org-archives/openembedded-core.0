Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web08.8327.1620831483486557760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nJ1UOdje;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.170, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f170.google.com with SMTP id n184so22463041oia.12
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=duGjzdhJAfOPTXl2ONDHtBerQrSpxpoCO0Drq8UGn8g=;
        b=nJ1UOdjeYj7VSMRauZNkvKuz8VNyAmeVZ60GgiDY0qveo3GLL6Yqs36J7/cZlsIcxC
         lcHpZZr5TNNEPJP7FfO4SJpJR+Ey80L4z04KC4k4Sx3L/7Tg575aov39oNHW+jgDycMd
         Llcwc/qcatk5/gPcbbkOid2ifJPBN2VV86RPi0k8ocIgR6ZnUclqPAKyLFlTrhrHMg+j
         vpmeq4ljKyNbeAJkxUtaBMgL4Bahvh1gOkKqyJQ/oiH+9G5LK7avn/LsWR9aesIJBVyz
         frpxXVpJ5Xgc6KFAhKe0+V77tYkgm7MypHNAjjhKIzK9FUGdHaFbDHVHjIacORJz0/CM
         Fbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=duGjzdhJAfOPTXl2ONDHtBerQrSpxpoCO0Drq8UGn8g=;
        b=Z4WHnjaxWIX7XAygWczSHODmXvsnYh9sQUIG+IpeGCnDJrxXA1VW1zH80TK5xH9PxP
         trSU4hsC//UHgSPLiQxgypBAWneZjchZVomKWZ6nPzcreSNVe4LNn2rC/Px6BqvuM0Tu
         5LJLep01OFZEp4in/kCe+NFT5xqZrreaPzFSilX7waZKyIC0MkgpIqIRb+9bNwe028af
         YOqB/PJVjSixUrWmjRAU6Nc0kJN+cALvwvmRAN/dXEpcl/1sgHYkpCOUuVFA+8dFcOpx
         zWryC0rRthkNL83U4fOtZtdqXdl/F+zoTWGXG5p/6DPXUk6f4cLRg1jdVTKftZLP/nK6
         R8eg==
X-Gm-Message-State: AOAM530w9FHvZemymksKEYyXukQ9z2pm6k7kPCZu33YJnz9aUHjo+DUN
	Oalt8esAVUUL7Wr/bSlRJsk+DO69jraNtD+JCU8=
X-Google-Smtp-Source: ABdhPJwXHRc4PBQQMSt/gO1yaaZAKPcWEiZUb3EvgywqEqSZarz0sVJKlFxR1rx1At+6G4AtzilOpw==
X-Received: by 2002:aca:ac58:: with SMTP id v85mr7823686oie.148.1620831482457;
        Wed, 12 May 2021 07:58:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:58:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/22] glibc: Document and whitelist CVE-2019-1010022-25
Date: Wed, 12 May 2021 04:56:44 -1000
Message-Id: <d3fb35d17b726e8b4d358f331cc9a095934d72cc.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
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

