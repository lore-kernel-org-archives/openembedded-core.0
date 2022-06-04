Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F12CCA477
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.8747.1654338391668538044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A1pSN0Sp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q26so2916640wra.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fon2BNURPWH5Ks414UTzElBohZ5YoQNj22qxE8rbqGE=;
        b=A1pSN0SpfviI0KtpsBgBZEcERpkG4HQAZjV0H+Z66iQVy8XZk4YVCK7Dx8w0wMnZcY
         oxIN8WPdpKfruLzQAQFeeaSDV+pY4mQ6dl8bii+vcIueYUegYEQxNFIaIyUcl0ZlXJhE
         n+a9n37br36ZEcHw7dn2FDiG01T3xksDCmT7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fon2BNURPWH5Ks414UTzElBohZ5YoQNj22qxE8rbqGE=;
        b=Q/zNJXW7f+KxhB1t/8SZ+jFkNUfWo1RyMX5KZnojJreIFzaEWQLb0TzxHsDD2AEHYn
         xwckCikkOHbP8Ev/TBa1NR1sYp02zieWcISq3wgNSFnrIy32iKin1onv5nfKXhdq4jJ/
         YSTTCW+lCwcME064cCJLALQRP+O8SAIPqmO2E5yG1nFV6jBbfAPzwjuOHf9Sgi7sFP0G
         SVXuG1l1K6IKoDAOpg8FozinItniEGkpUgJLR/ebYzT93WB0jZ3n7HGbsVTzEXBpmFjU
         7FYLC9C84p1+f+xkvjFqwHpdqxcqgxmIwvvFWpPJRi7TsGmBj671uopHD0ka0/OtDOt3
         MICA==
X-Gm-Message-State: AOAM5307oYeZrbbxxfz3w2aM0W9Fw+dFHvRmcMcyMpycKdr8IqeOk1dq
	IWFuwRnnIeIl1gRpskiTywTcT1EVWaXWMp0x
X-Google-Smtp-Source: 
 ABdhPJw8LHVzhj/003juNg5HbnSJ00dSm+5B0WNltL/D9xWYt/EGM/97d1bwf69c3nizrZbnqWpw7A==
X-Received: by 2002:a5d:4e4f:0:b0:215:4fc9:f7db with SMTP id
 r15-20020a5d4e4f000000b002154fc9f7dbmr5764140wrt.389.1654338400860;
        Sat, 04 Jun 2022 03:26:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/17] gnutls: upgrade 3.7.5 -> 3.7.6
Date: Sat,  4 Jun 2022 11:26:23 +0100
Message-Id: <20220604102625.199845-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166561

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/gnutls/{gnutls_3.7.5.bb => gnutls_3.7.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.5.bb => gnutls_3.7.6.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb b/meta/recipes-support/gnutls/gnutls_3.7.6.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.7.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.6.bb
index 63157eac97a..6a0eb974dde 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.6.bb
@@ -24,7 +24,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
-SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
+SRC_URI[sha256sum] = "77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.34.1


