Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3242.1594933703111687628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N0Dj8x9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 22so11683810wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6PGqbMzv+JHUO3zqysOUTWmqH8cfr4Doi4PFAFZ5a+Q=;
        b=N0Dj8x9NqTkFUJmz7jkQrYHMgGDuXvVUIjVMVrjLCBNReNoGGq/28iStsDUHyjpVyN
         s7YHUiOL6rdDjx2Qf4lP+LNkWNSwPYHD+M+SWSRkv0MZb+VLl5KQsWa4jK7lrRBrllnF
         W6yql7Es+6RTg+Zva4lmthRlwjkYTJ5maMAro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PGqbMzv+JHUO3zqysOUTWmqH8cfr4Doi4PFAFZ5a+Q=;
        b=KU+/wizVN00VAbXGBOcyYxcJRL1l/p3xIUHMrZRHfQIjiQ4wzlwL1LnFGBp1kyq+oV
         vGS3Oa4GWvFlxREHE5f9QmL+azzIJ3AuGpxSCr7q3dr3io2gN7br3rhwi9t2+Qwf1vTb
         aIGM0dyQB22UbYURXeaX4tGsHUuHuUF8wW7jQZuXbbJcs0zPtjgZR31p18jVQUXA+4tp
         O6ThbOJVQrDn8r1/dQmouJjwRgHCY6G9zAnyAm/6j/XQklev97y8KqbhjG1fT4dgEHPz
         VIQK5lQlNddshsofQoOXNFWFL5mT5EsNSs66yu0cFfESutFDw+s6rN0M4hJRzE9xWmiN
         C6jg==
X-Gm-Message-State: AOAM532GfElmSJtQAGj94dlkhocP9eCdv/PLcEAULfJRuaON5iqE/sCP
	XsaJ8xgDqwmQ3Nq2zGG2o18SxOlUIoq8MQ==
X-Google-Smtp-Source: ABdhPJwU+5mcnxcZnAMAJBi72UECSuhFpDk3aMwfqcyNZu86iv6tyTcXc3l3ZgBKGxKjWr7+pC/EMg==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr5858998wmb.93.1594933701439;
        Thu, 16 Jul 2020 14:08:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/20] rpcsvc-proto: upgrade 1.4.1 -> 1.4.2
Date: Thu, 16 Jul 2020 22:07:59 +0100
Message-Id: <20200716210808.7438-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
index f2e9e3975ed..5aff2b56a6c 100644
--- a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
 SECTION = "libs"
 DEPENDS += "rpcsvc-proto-native"
 
-PV = "1.4.1"
+PV = "1.4.2"
 
-SRCREV = "e295c9a3b67752734995dfc057bfbf5313ed0d82"
+SRCREV = "6f54e54455c073d08a56ea627c6cd2355a40eb53"
 
 SRC_URI = "git://github.com/thkukuk/${BPN} \
            file://0001-Use-cross-compiled-rpcgen.patch \
-- 
2.25.1

