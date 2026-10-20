Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3659.1792534602688472025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 15:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eum/3oy3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso465465e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792534601; x=1793139401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRsxtapGQhdk4lsNoDYwuu5u7rvmPxsAtGetN5nyIpk=;
        b=eum/3oy3UR6lzBGGR4z1v7h15lIktu7iYhGsBIEYRiG9YeituBe79qaXJKKzmjCY5S
         s3ELg6qg99JjiUSVsk+qHPVW0259O5SeHlGhhQ7EWCbOns7BioIz79hLrB5AZrhuNXWx
         GTDcw4XNTQbY5HfWJWzQwK//ppbYbtPbCv87A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534601; x=1793139401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YRsxtapGQhdk4lsNoDYwuu5u7rvmPxsAtGetN5nyIpk=;
        b=q5le31RE23reiIGDIdFDXZ7AsRJJGucEwCrsUwXxSUbEWpvQQS5j237lNy3BU6Y+im
         nbV9g7CdBCUVIiyKeMzMMpcgR9t1qiZY5K/qMzVv9MD+wK50+0TL0LM2LKFLaGX6tWOp
         6DNmI22D0/HShWor8Tx8SHbWIOD/qY6a5k8drKstyoPh87H9BY+AwOHzWSSdmU0kRN8n
         XqE8yEEedjaO6BE1Cxq7HBfkf67/bM0TJ8MuMVs5Rmt/wwJYNTJ08lKfAsUlmdwlNB7N
         rFxxtsRBPbgz9bLaQtuVlUlBrvM7DuXzho5k10kDN3afeBpMFK9/l/6SjBStzgy8QGEy
         34yg==
X-Gm-Message-State: AFq9FYJqYD//GoT9nV057KKbQh0gqaM9R88c39Ou67MUostvVBwYautU
	aZmPphnIeyQ7eaqY970Aot63e7Rq4topz2ynzjzYPiU8y1kccav63pbRp3FmJb/rTO9CQVGmPiU
	px2ysw3Q=
X-Gm-Gg: AYBFou1yNEhURVscC0YU4PvbsdIMy2gUrbgJQOqir925tIalc8u2RtrwT5BuZl2c5WI
	EAF9/7vjCj67lH9y/Jq1ysrrUBdbrFcV+xKfVK+D5fIPLxOYj+10gakQZw35CZI+i6iWQ5rBcz+
	rEZoFOsO06HpaUUfLydFzlE+4ccT3WVIapxPfolW8A1/v6wH+P0fFWjuZ2ElBXC/HTr66pYMzM5
	ZwukgoyhraYc+8/ENhOrvjvdnAO9JQtEifhNzK768p0e/lAmyRpwk2da1wgRkJMRwh3EmPY5yK/
	3+I0ytdOxyMdRxoVQAIGPKenpHJC7z6GaN+t1fenxz29YSuOJHOzT5cPip0YMSCb1jYS3iLjgRg
	qZlEsx8Bu4abadnGRtbawJtTTNwuZZN/FBJw8lujxYGn5KrNI58UG4fx5vsIGzc9he3nqz15UCd
	CzaxLRE1iXMc/N2K5sMGiZ2NuhWm+p0v3eh2yIa2bZA/T8jtu5SpnZ6AQmB7LteITCQpX5iwqbm
	GRo5bUkk0sgL62s7xjzLqKeLQy2DX+hvhKyKQ==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a1fdd483a6mr1106685e9.24.1792534600479;
        Tue, 20 Oct 2026 15:16:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1d5f:153d:6d27:f14e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d569d4sm107100345e9.10.2026.10.20.15.16.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:16:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include a header fix for ubuntu 22.04 hosts
Date: Tue, 20 Oct 2026 23:16:37 +0100
Message-ID: <20261020221637.2188605-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 22:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248311
Content-Type: text/plain; charset="utf-8"

Add a missing include so builds on Ubuntu 22.04 hosts work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 15d90b4acaa..c0332dc9e2a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "6347db607e9560421a75af6bcc246179eea428b1"
+SRCREV = "75222afce8836d12e58b7e85c2dd6057518257a1"
 PV = "1.99.0+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
