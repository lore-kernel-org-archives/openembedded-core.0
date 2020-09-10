Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.20450.1599740689845818407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B2jdZlAq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t10so6503562wrv.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wICKzHEBZokP0QEjvARFLtBM0oZdhufXcl0tayt1Qe8=;
        b=B2jdZlAqO1/dq2AkYo6vhy2/vcDRQgfpQYebMqXm1qxIi65+LNHYj9ohjhJ8mSLeOo
         JeT3lLh7gcXFmZjmLZaN+PBcRfhW46aVl03NJIj0iCURFfCzklkY0dbWRxYQ9o8/B/70
         QfenzRriBCox93ikn2pHhM/LtCskEznqRGmGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wICKzHEBZokP0QEjvARFLtBM0oZdhufXcl0tayt1Qe8=;
        b=SedNysWlgycriGWWgiMOZzlspbRANLP8SZ+KIv9TU80bpsdUrCqAUgQxy8rzZzmPI/
         lKd5Ch2wSsMw3QLNHnCSpH+qP4t8Pe+BPEleiB5G3NX4uud0M2Eyten94+FC2x6M3S2L
         R+3lXJxdH+pGxlPTh3KkeSQpESJUS7B618PqsEJJi1d//KR7+79XT5JvWiqRIrAe9nLX
         f/QcIStSiius1aJd4Z5SqAHg7gvvI9e7R4KuxBzBFBjMSyrb6/H8KqnMDp7l/+y3xdIr
         8+RplwbPzWu3uYnQLyd/M44qJCddCBvRDCX49Gsep2F/OXo7VXipRSoWuM/o03ktzF8+
         yLfA==
X-Gm-Message-State: AOAM530eYm6MlwhNBRZAh3UKG5SqOdWsnwaL5t08TxOIxwcAbOT34Bu7
	5XFbvxYXuG8SBb/1HIDkBcBINCQFZBeNfA==
X-Google-Smtp-Source: ABdhPJzDZdbPGn+R54Kl1/u47ONPCs8IrvC9amUYnmHo0lPJHCPpTwiZAUVXgug5ad3BowdzfiwySQ==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr8621734wrt.366.1599740688167;
        Thu, 10 Sep 2020 05:24:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][thud 15/29] buildtools-extended-tarball: Add libstc++.a
Date: Thu, 10 Sep 2020 13:24:19 +0100
Message-Id: <20200910122433.2040293-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

(From OE-Core rev: 59c4a3fdbbfd5a6aaba7e0a1675dcd5866a7f3a4)

(From OE-Core rev: 152709dec03bbac582ca63b65f2efb835e0b33fb)

(From OE-Core rev: 5e3664e5f9a0dde07b0f8a56cdce1321456abaa5)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 5a781730ed7..37f97056139 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.25.1

