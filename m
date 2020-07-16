Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3364.1594933711957769128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LM6PaDA0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z13so8593949wrw.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L5Zb6PjD5Ehx5OHijvS5ZoyobL/dzotTE/iJcRg+6Q4=;
        b=LM6PaDA0OCylWtwT1+YBAfh7WdWbaHANUKBcXqK40bBxmTWIiaur6KeW5T4pJGiN3V
         0EBIxWo8AZv7iAJPHonDwl6bFXT2AZVoEUn381gRzp9qIQMZ/5AnW1yCaPKsKj7nHxlW
         GyN0fo6nph7uY3ijUHoJI5c+u8v7FZmGwA9Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5Zb6PjD5Ehx5OHijvS5ZoyobL/dzotTE/iJcRg+6Q4=;
        b=rjssPwmx3WVQ8wyG630wTD2VlIkgk5vw5s5i+kH6XuYP/LeYRE8i6iR9cU8RwIHV9p
         JTp2vYfkSvXTNICyMew6bhHGX3lh9n+BYuQzK3IEpI/c9eym3wiaX+sIgpFZh0UxA4uH
         c9HR9DLOJa712RCv5ZIlKdCaDcLOFZQ1T5dqhMGm+O8JP8tBh3vdQtVgZR9GaPDk7POI
         pOiFqpE4kpVnzrz2KF5GlotZmfxTyIySf1FS9qTPKsOvgHMR/9z/BkL199Mv5wMYEEaM
         zqnl+laB+5l39uPV7N16HA3tt2Ne16uypcqFP1RIlRIJLe18RWBcSFKEb2SHabRZO5A+
         XofQ==
X-Gm-Message-State: AOAM530TS5sOziK24CWaAqnUFeOEoR77EUd8gegfolfi/cf2ylpyjNpX
	Hev9vNrmKP/Mr0bPOloQNoHwIx2SzGsYjg==
X-Google-Smtp-Source: ABdhPJyPspzcV3zYupKtcYD8pWWiFp+zA8A8pxO7+yM734LkxRY9Y4APs0joCFCZ3hN1VasL30uicw==
X-Received: by 2002:adf:8b50:: with SMTP id v16mr7121098wra.188.1594933709867;
        Thu, 16 Jul 2020 14:08:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:29 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/20] libevent: upgrade 2.1.11 -> 2.1.12
Date: Thu, 16 Jul 2020 22:08:05 +0100
Message-Id: <20200716210808.7438-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libevent/{libevent_2.1.11.bb => libevent_2.1.12.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libevent/{libevent_2.1.11.bb => libevent_2.1.12.bb} (91%)

diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
similarity index 91%
rename from meta/recipes-support/libevent/libevent_2.1.11.bb
rename to meta/recipes-support/libevent/libevent_2.1.12.bb
index fb186eb89f3..29e87081d3f 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -12,8 +12,7 @@ SRC_URI = "https://github.com/libevent/libevent/releases/download/release-${PV}-
            file://0001-test-regress_dns.c-patch-out-tests-that-require-a-wo.patch \
            "
 
-SRC_URI[md5sum] = "7f35cfe69b82d879111ec0d7b7b1c531"
-SRC_URI[sha256sum] = "a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d"
+SRC_URI[sha256sum] = "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
 
 UPSTREAM_CHECK_URI = "http://libevent.org/"
 
-- 
2.25.1

