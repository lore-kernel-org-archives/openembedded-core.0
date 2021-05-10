Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.29985.1620644305656151073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h+6eNeGC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id v12so16122182wrq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3HeEu8qSouHpsblzE9M9ef37MXh1t397jsbCoelO2M=;
        b=h+6eNeGCpgUMowtggm4jb9PpPGwtRzGEqpZ3a0pjJ3ovMRLgd9p9WAoFPVzfAcWnzK
         MvnT7e+BB7vnL7BaFTJr65lAcHjrRJMck+IiqaX3ZA9MyBZSYfltF/SVGLB0o+fFa6jt
         IXeZ/1aI7MpkX077udXAm8e8yyI7ZmZ5BCgWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A3HeEu8qSouHpsblzE9M9ef37MXh1t397jsbCoelO2M=;
        b=s/FJIP6Qxy9FzDY/ZRg0//ZrMOTjfTJEgJBDH1eKZkwH1JX9HWJt3uufrP2L3p9YCa
         fBT6YP/4lS4ypMW9BJQhrjp1NDbd3LuVV7/zaKVK0TG8dr0H5I2AKr+dy/+HTYSCDJ9h
         WPCHUagDb7Gj5AoNx12+A8cqohNsW7vdBbc1OTdhGirJg95eargai2vz2/rltrCv2Yqn
         lfSnhr+GOwiFuso+SbS/WACApAh90sLzt8eH0jVDHBVnW79sMlUIPjf6I6B53BGp+kAT
         IJ5nwIumBKACTHB5HfbLptDkiBJh8c1VLysBKp9MlH/HebNTC4bexhNuPS7tdFj5Bvqv
         AVeg==
X-Gm-Message-State: AOAM53364REnkzMh5KiedFNi+e/w9nDXXvBeIZluH7yN5Z2N8ONM1Kh5
	iYzzvvuOosOqZPgQYSuP48C2DGSEBF8g5g==
X-Google-Smtp-Source: ABdhPJwHNNQtoFYnds63mOypNRGyeTKvFiy/uLAXO/AsAAfreUoQURPlux/qvPqbWVqhOoMr96K7dg==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr29755673wrz.201.1620644303923;
        Mon, 10 May 2021 03:58:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id k10sm58365185wmf.0.2021.05.10.03.58.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 03:58:23 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Document and whitelist CVE-2019-1010022-25
Date: Mon, 10 May 2021 11:58:22 +0100
Message-Id: <20210510105822.2157436-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These CVEs are disputed by upstream and there is no plan to fix/address them. No
other distros are carrying patches for them. There is a patch for 1010025
however it isn't merged upstream and probably carries more risk of other bugs
than not having it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.33.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index 5e0baa53e8d..75a1f36d6bf 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -3,6 +3,19 @@ require glibc-version.inc
 
 CVE_CHECK_WHITELIST += "CVE-2020-10029"
 
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
2.30.2

