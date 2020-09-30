Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.6468.1601503930766651912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eKFpyr0V;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 5so2116618pgf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Eq9airVuoD0B4zm+n/ncicNq6toUs2IOtkifDnTLxn0=;
        b=eKFpyr0Veh6vQP0Rsr/VQm7C1FMCIAEhw82npqupuNC/fWbGsHScQqFNFbke5T5XcU
         MxM308HNQB63GlmEo+lGrs1w/VZfiaByw0TqBE9UW62Ya6oeMSRjUFh6QyHAo14CcqDu
         GPov0tlcqnguIRg48J2AarsVYoLsvZt29Cmp/7puxYA5qG9lLYY480HDnYyeuY98txhH
         bmnoBbD+qdkLTe6GguJY33evZETYV8o56qNIKJqEw2L3SYQos3zsfaVNWKekhke2ACzq
         R+gxhh9SFIjdZjAeGbB9v5LcEKgyqeTTnBFiq3P77L13NffOIO6JSjensOwUezUJT4rH
         uivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Eq9airVuoD0B4zm+n/ncicNq6toUs2IOtkifDnTLxn0=;
        b=l3gHmUOVTSRaxAswitxquv/+jL+ey5GIK5US0FIg2/HqdIeLYkrRcaO/LGbSbDhZx3
         O27SSYpc/vy9Eq9iF6T2oLWKRA391dyy02NTkJiTTgGk50Ke2fFUXLa6PO392fZlGmMG
         aZ7Dl79KJnb7Yd8PMsNL1YlJ4U28eFMCXb2Bn7KTB4NFAdLFST88JB+SOaj5VH1KJnpk
         BVz26r3Uyl7D/eF+ugWNNe/wc+G/LtfQ/HXAkJs10SJasIAfM4d6jknvAuGUMPsOPctL
         afzROhgs3lZw7+YLNAwF20Rof6UxgwLccpQlwO3FvLFJfP/f+53k0cKCZDV+fa6WJwK5
         kDBQ==
X-Gm-Message-State: AOAM533omtsl0heU06FUHgjq4X2UUFzkQnn8UBjwXvJEae6bgo5elwMW
	JkIBZRf+4s4qFzujdhIq3LcU0FgOt+cGw/vjAhM=
X-Google-Smtp-Source: ABdhPJyMCkfCoPGdIiZJQNNg9U4S7Dzyyrg7MSUIg+xMb7O6BKZhYBP/rpKh5QbmUm7c8RuAqAyWKA==
X-Received: by 2002:a17:902:c394:b029:d2:4ca:2e22 with SMTP id g20-20020a170902c394b02900d204ca2e22mr4499372plg.77.1601503929855;
        Wed, 30 Sep 2020 15:12:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/41] buildtools-tarball: Add python3-jinja2
Date: Wed, 30 Sep 2020 12:11:05 -1000
Message-Id: <5dc390658f0839911d85fe7f3f3ce8bf006e69eb.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is used by various pieces of the result handling code, particularly the
performance testing and we're seeing autobuilder failures that are
easiest resolved using this.

Acked-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc6d4d438b71365f5c6f54b8482d4f01f1d0dc8e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index edf67ce2ad..77e1fa23cb 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -10,6 +10,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python3-modules \
     nativesdk-python3-misc \
     nativesdk-python3-git \
+    nativesdk-python3-jinja2 \
     nativesdk-python3-testtools \
     nativesdk-python3-subunit \
     nativesdk-ncurses-terminfo-base \
-- 
2.17.1

