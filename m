Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.20707.1599740594224626701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZoDddGDK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z4so6495293wrr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GVRwOaHcuTd9GQvWZ3cW+QLmsWdmGkcOyqhFOO3oQ28=;
        b=ZoDddGDKj7ff4r1LjdaxqGJWOdtSGu8alERnpBahnIcOSv9j9u4yr11Z5AZs8S4B5c
         jmRo0pthkihwZLRTBc/u9WdFJ11P/c2znI7M+z3mH3o6HY72rp6fDnNowy/9kROpdAKi
         wwjBv+vT8N0ePOu4eBCrq2Y1pzqSf67OVMMXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GVRwOaHcuTd9GQvWZ3cW+QLmsWdmGkcOyqhFOO3oQ28=;
        b=pj9d1y7iCc5B5Vo5+++BDt1W9Dm1H6/I+qNKuYTQNEYF+dwUI+IkVAvq5+Q8HNtQfv
         9n0a1F7luRrhRdHa8KTQSIwGBXCAi4KNuys421XWGDcSwjIB/3lgVFJ5MQgAodWGh8eJ
         zT866+2iKdgPYJQ3/f2D3a87gOis4uyt7nEp/y8uSpdxsCtYY6xKmKexPm0bMNtvwuxJ
         LxYhGspqZsb6X7b7GRrdpe2lA6wXqlN1oD6CPcH2urJHAylpjPe1JHA9z19LZbzzR9eq
         Npl495tSLpJT3TY82i1P1Y6PwUgFZSQASAUXjMgetO1JnfobT5mWUiRpwp3fYOj4eKVq
         vRPQ==
X-Gm-Message-State: AOAM530BBlg7fShUVOgWGfIFHwPEnN/blHefN/W5HTMAtHcpKpVz9DiQ
	7O0s67HyErWN5d9zzZ+eH5iy4MHTIG8ibg==
X-Google-Smtp-Source: ABdhPJw0SomUm3K/ZCe5xtX+5lYWdaWMV2lN6rGt+pmptNxBaqknD5OhNERvXz82+vbsoaILEB055A==
X-Received: by 2002:adf:f846:: with SMTP id d6mr9562133wrq.56.1599740592434;
        Thu, 10 Sep 2020 05:23:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][warrior 07/22] nativesdk-buildtools-perl-dummy: add dependencies for autoconf and automake
Date: Thu, 10 Sep 2020 13:22:51 +0100
Message-Id: <20200910122306.2040194-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* For buildtools-extended-tarball, where we are adding all of build-essentials
  to the nativesdk, we need additional perl modules for autoconf and automake.

(From OE-Core rev: f0f766160663407ea7683d31bbf5f011accc9ba2)

(From OE-Core rev: e7ade58a7da52ebb40120020dd86dd3ae9b2148e)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 6a8748acdfe..ee7d7cd6606 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -15,12 +15,15 @@ DUMMYPROVIDES = "\
     nativesdk-perl-module-file-find \
     nativesdk-perl-module-file-glob \
     nativesdk-perl-module-file-path \
+    nativesdk-perl-module-file-spec \
     nativesdk-perl-module-file-stat \
     nativesdk-perl-module-getopt-long \
     nativesdk-perl-module-io-file \
+    nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
+    nativesdk-perl-module-warnings \
     /usr/bin/perl \
     "
 
-- 
2.25.1

