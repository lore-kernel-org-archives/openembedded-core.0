Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E278D3A689
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:24 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.1966.1730228414235597848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EswJufQw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-72097a5ca74so811378b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228413; x=1730833213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwK2XXsicaxTY6vptF8BB6/I0DgC3YmgtXRheo9ANrY=;
        b=EswJufQwEcz+YPPxjR4EzVpBs3FevwCsEcOozFl1wTiBouX22HY/1YT11cPCVR7Apg
         AfvUalPW+kXBEsv7cRLhMmfldKLgxQHQoBhNSay/+cH4gFfpRDOGIe6ijKjgx2ihQuxZ
         PzC/edvT7X19mXn1EC/g/KxHWnUCTe4ZAL+kDpcy9JbQanuGUHey61CU+58CaCK1QhsB
         ujHfRY3xM8SoEKXm/WSeTJ/Z6Yq2E2Aza4hpKtM7drPM1s0+GkWXEekGzRbOhl5OICX6
         yE+rtRpRF29ZbihyaxNGkOvlSeFmH603GWXuSVRY7Llw6gncuEWxsZDDl122iaGmfgAO
         jBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228413; x=1730833213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwK2XXsicaxTY6vptF8BB6/I0DgC3YmgtXRheo9ANrY=;
        b=YIGIzH9fnJ5JKj4EC6cy2NyE15RMp6GAj+Ff2XWAgGLmH5Sz1rtnCeZ/xsG5VurlmG
         LR4DSUpTOfDbuEJLsEr7QZUxqcrZ193murKPUomMuwkdmnV4rnh8WHBke4czPmNLDV5x
         PsetaLGs8AP40i/tPMxIOAE/tCPLT4tnI0zSmQ3LY+mNw7yGBxuWZo/uvShnYUVD2xZV
         XOc7I83v8eT4pgps8WmxZVPCeg3LxUhu3o3+v1t4ZDmUvkuz53yiHJVQ9pfLkR+iOVjU
         8WqmNa320v4ffQ+dBcW/PHm5OV6M3C7ABPxDDepRiPg/6k3OMsWvjKI57N2fvICwG646
         o3uA==
X-Gm-Message-State: AOJu0Yx38MfOlK5csroSOfPPxhfWQb1XjE03Z1RmcBHVxdcMoWgR4wbs
	DOAAelK6vuZfwT+jdrxEvkOQjVWYrhLsBSxqIpf2GB68mp9HRu3GI6J8nciYqAkMDNBKPK6ifOa
	S
X-Google-Smtp-Source: AGHT+IFaPyWDa6uQ/ipk2CWsF/d2BFjDZbL03GZ7UzhCwByHxbH3hUyFVpfRlgEbOTZC9A4VC1yeAw==
X-Received: by 2002:a05:6a00:98b:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-72062f84e28mr17913942b3a.7.1730228413430;
        Tue, 29 Oct 2024 12:00:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] vim: Upgrade 9.1.0698 -> 9.1.0764
Date: Tue, 29 Oct 2024 11:59:41 -0700
Message-Id: <774fae9cb522683f722f3075531075be9fa36770.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206518

From: Rohini Sangam <rsangam@mvista.com>

This includes CVE-fix for CVE-2024-45306 and CVE-2024-47814

Changes between 9.1.0698 -> 9.1.0764
====================================
https://github.com/vim/vim/compare/v9.1.0698...v9.1.0764

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f0e5e63399e544063c79b0b1f9555c820b0604c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11daa900d2..582eddcb9d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0698"
-SRCREV = "d56c451e1c05310562c5282352d7bb287c16323c"
+PV .= ".0764"
+SRCREV = "51b62387be93c65fa56bbabe1c3c1ea5df187641"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


