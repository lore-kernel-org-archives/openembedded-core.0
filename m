Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.20712.1599740598243369566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OpCYna+e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id o5so6425225wrn.13
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpdQ7YNOp0q56+vn8RKjBbc3O/Wt3kLqmt6bXR9nu5c=;
        b=OpCYna+e+vWLXtyVivfhWSyxpSytcO9dkMjMpQwGZoIBEGYeDq1H2X2lbYJcVOLdhr
         hRQoKt+ihHJ3WH84fGQMnKSC5LXp0wdmFltbT9/C09En7DMVxCjKkgNm8Rf3BWdAQ3AY
         K0eL42+ZrOyyCrQC6Lo1kARm/c0Yzed6+Lq90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpdQ7YNOp0q56+vn8RKjBbc3O/Wt3kLqmt6bXR9nu5c=;
        b=FiL2K7/QiIp5Zqf7i1vET+ncK1cqS6iNxgR4q7A3TQoN1UlX/ymGiKbn6G3sIAkPZp
         rj1mZ8DOqk7+gcekzpNZqdJ6taWPQvTAqgGkdoaPRUwbtiRob49/VayDemiQZinxTx4O
         90oXAOrsgw1YcOiRLrJnSWuhgfhMosMUD/imSdgTwKP/9/ZPNeNpjPptZE8v+fDMDPAi
         E1mBF5Lgl0ji/VM5GeYze2yMo52AE38UK3o0z0mZ7kT3BFAVoGIdTdJFu8xRmZNikoEH
         fx2c0Ob9Xbui8irPUoTxg7DeuKf5TN3vBqExbF85YA0VPhot3wx747OplRpbOnu/h2tU
         D8VQ==
X-Gm-Message-State: AOAM530lWCROyENPX/MYwoOZjgkKaLvqCfsem9VxMXwVUE4ohFEoO1z3
	9Sczi6me++zx4WGc7x7sasZiOTUiAyxw8Q==
X-Google-Smtp-Source: ABdhPJzK+7b7Q40J3R7CWVDjQGKh72xxGZp1JNjTZybfi0Mkn23ysD+Aft9tti5EOG6i6hgQ2Sj55Q==
X-Received: by 2002:a5d:5281:: with SMTP id c1mr8785241wrv.184.1599740596527;
        Thu, 10 Sep 2020 05:23:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:16 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][warrior 11/22] buildtools-tarball: add nativesdk-python
Date: Thu, 10 Sep 2020 13:22:55 +0100
Message-Id: <20200910122306.2040194-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

(From OE-Core rev: 6467eb4461f3cab16cab2ba63154c92fc2adacef)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 37f97056139..32a10198c93 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -27,6 +27,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
+    nativesdk-python \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

