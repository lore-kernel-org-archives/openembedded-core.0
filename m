Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.20465.1599740704720006795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JqQgGzsn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z1so6491024wrt.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Prs6d/xZi31p6sb0XXxuz72FfAYmDq8/ddovi7tfW40=;
        b=JqQgGzsnksGMO82b50v2AtWT5tKOE2H6GowjZg5A8hS/eAx8jckpf6X1pAKv0x48ab
         45veXP2CPdHwbz+KNzVJQbXBQ42pUdKI6nlXCvQMBu359U/Jxm8AAjtcn529ThAD7BnO
         H3wiSppUdduQ9ah5npokgjbka2hNnaj1PGfi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Prs6d/xZi31p6sb0XXxuz72FfAYmDq8/ddovi7tfW40=;
        b=i75PQAPyT2hkVejgn1y8GPebjt7xIsa8zyNLPkuKaujlw754yA3k7XRmBPxBCNE40m
         639vGbH3lNjIm2hiRrJOpx4Ljpu85VWPMUFbwMqLps97cF6COxmH/H4Vsm0KLPRj9F8c
         PS6CBAxz+hMCv2w4rOnhxGPL6J2/ro985vM9+Rg6S/54eZHt82Vwstvz0FRsvcU8SLp/
         Z5HQIXY3qr/+Sza56IP0SlFMCc02kVQR5jWaKalSybMzf74yF3ENkMGDxO8xmv7XPiye
         T3yA1EI7MmPAkzmAIycsWnk+G3tyIw5mzD0IFDkAXFQUxWTwKsCDNq108s9JMH49JjAA
         ttRw==
X-Gm-Message-State: AOAM532Ep4rYjHGqEUaWbO+VDzYbZ7wz1ufCl1f4E3JN8PoIY4EGgp5C
	s1SbnDLvtCnspE1A2qhWfMb6et81hPGqqQ==
X-Google-Smtp-Source: ABdhPJz3+VIbVFVF0I2Js8YMDtxyEaBL9iCgpuF+ubLhLDSGpTRKO2lz/uK3x8Yb2pSc8h8nP9Xd3A==
X-Received: by 2002:a5d:514e:: with SMTP id u14mr8647917wrt.211.1599740703014;
        Thu, 10 Sep 2020 05:25:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:25:02 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [PATCH][thud 27/29] iso-codes: switch upstream branch master -> main
Date: Thu, 10 Sep 2020 13:24:31 +0100
Message-Id: <20200910122433.2040293-27-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

(From OE-Core rev: a6e098e2e5932781b9c1012825bc86bc08382931)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e16ef0c2e0ec2bbb862231cd84e7650bd5789af)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.1.bb b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
index 1761ded44e1..a70513033da 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.1.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.1.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
 SRCREV = "164802d5fd8c7a8167816fd86a62b286680619f0"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.25.1

