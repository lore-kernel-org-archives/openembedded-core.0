Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A224FC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 11:08:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.43836.1712920121682951681
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 04:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XeITM0mA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41550858cabso5840675e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1712920120; x=1713524920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWb5mwydgxsgwS8K5Kc7c2olabFXuU/vE3lG2ciShZs=;
        b=XeITM0mAprtCTpkcdfNUSzh0npR2BKXdXWcM8i7Pry2ODo16z8hDfo/p3G8e+opfp/
         R76FO8dcauT5obY3KKHjSvjs2F8+9Zg421jCBagy1C9e22xvRqRTuu4TI7q9QJvJwwRG
         JJS/Lb3X5ayEl1C9eNLJ5G49LBwhq/KRomxSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712920120; x=1713524920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWb5mwydgxsgwS8K5Kc7c2olabFXuU/vE3lG2ciShZs=;
        b=gfEx0j2V9w0wRtl7lc3sUPzEkNrlvFvG0FCqoi58Pl3Q8EkueSALU8ScqHfYXXNEQA
         yLjBR0HqMERcV+jhL/RE5ETWP+QgLNsBP8nxEO2j1y4drTLaK0Ud46diSOaX732eWks/
         f6J5zjKz5V4/FngWf+wd13SO1g08kE6wJjFqIgDSzpOQ63q8cLc4HKZxAy29ZIwr6XWZ
         fYgJNmPEZY2IeCtIMZKDSjOTUDJFDs30qNcdkdcutasLCWDO3/KCjO7SvOZpmAvEXuS9
         nHGkhvA1rLE3VHYfIl0fQQhkEMCa19sHU6XoXzxkWg3e0OzZ3AmKsUskPBY/QhfyAR9Y
         XV8A==
X-Gm-Message-State: AOJu0YwSDv4OpvKvt+u6Qdcyk1yWEaLX5KGbStBG34mIWlj8REcZOdr9
	Bb0YZRHR17OPqRfVFWa790DabAaawYG1969ZYTUUKizmxYMfol1BTHuftS4kX4l37ajURO3UCY3
	Gtq4=
X-Google-Smtp-Source: AGHT+IHcQE3SDYfyZDU0fXAAHGuDZvjq/WJ7+MKDOAgYHEffuBHxyjS+uXkYCL8w3u+SAaFTo8TjVg==
X-Received: by 2002:a05:600c:1f86:b0:416:7071:6354 with SMTP id je6-20020a05600c1f8600b0041670716354mr1857342wmb.18.1712920119924;
        Fri, 12 Apr 2024 04:08:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:555f:bec2:a7d5:9e31])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c384a00b00416c990d650sm5362129wmr.28.2024.04.12.04.08.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 04:08:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildtools-tarball: Add python3-websockets
Date: Fri, 12 Apr 2024 12:08:37 +0100
Message-Id: <20240412110837.2253822-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
References: <20240412110837.2253822-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 11:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198164

For the newer hash equivlance servers we need websockets. Add it
to buildtools tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 6b679489fd5..a5f6bb7aac9 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -13,6 +13,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python3-testtools \
     nativesdk-python3-subunit \
     nativesdk-python3-pyyaml \
+    nativesdk-python3-websockets \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
-- 
2.40.1


