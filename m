Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31668.1793141381979108280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WlfM1FGA;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso200824fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141381; x=1793746181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=WlfM1FGAXJAOCeapjPbJ3w8q6RQwEJSZ7Xex2aYpKOFBh1ddOYT8ZEjIxUmRUnkOsg
         +Dkr+Ne17CBH6PAE6Kql2NNIMovxvGojNDot8oR3ipA+gfiBuQOPd+42J49XApjGzihO
         MLCkrE5RwdnRx/FvfxcEiOWmmQcAx7Fl06+DGCi3czP3YasMAaw1iY6hgD9V2Y8XJea5
         newFY5cxfu+60K4tSa3Cywwr4q5YE7QXfoj27bd7AnrOPcDT48+pOYrh+0gNO7O1aAZL
         +vLZFIq7aVbtPqxSE8hh1PPoFwHlfR9JW7Q9uXdHp6lh93fUOnXr44kR9VPSp5tPWxwc
         Zwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141381; x=1793746181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=Q2dbZhh1tBvJHZqiEFLQWrT4RF73utpUl6lFti9jA7zR3a7yboBBLCt3t6XwIdMzIG
         8KLSZFg6dai2aT5JeDs+aBf8QLOh5QH1wXbkXEPhy9KTYdX7xmZuwT5ppLzYn965/8JD
         4xB22WCBnT8yR1XqOR9KHleTAFAXuKhjT32FOnuvKNo6l0pXV5ZyoeVgx0H2HgKOWt6Y
         TilHmI+ongdQIWD7FGqF8CFcDs7jbuBOURqpbgs6iedWx8yrucWAiV83ASlv3E3w5sPH
         MK8vyEcD1YZEN9wmUjQsxYJCLUIhqZ525+vcSo1qszlQLJCJZ+sEbBx5DJgi9tL/+ARN
         pxTw==
X-Gm-Message-State: AFq9FYLzpl9psPVqoNqCRrcPNvlwvLNrCdwh8Ais9h93/7aRv9sgSNa8
	qg14ivosr933klrNgYAbOhF/sYzX1fGSKPUIcVdreGGLNpX46+icU668vbGgQg==
X-Gm-Gg: AYBFou0lFWg2T6Klr/SjAJH0Lp9z+rhFcgKcCqNIifxjarQLC24m4nXfZe02nwD4j1h
	49LAJj47H/3SvQap92hSEuEisKwdtZ9mWoX8Vg5KULLSDAslPcX+YDWLaVpar1HT9UqDt113K74
	lEZIthh5eNYkU6u0s10WRz/+Y6R2wU13z9/ZJbnSlhjLNlegvYeg+QLUlMo60kWaOjlJ3OmrX9Z
	wC+S8525Gbok+ve0K+I9a5R5ZlOXHbOTkaD0lD1uErab+2v6qbgtYi4yZWtVcSSKr39nR0JsQuc
	UUSpFy/UBaansul3BAMEHFOXIJkTrM6aWsrMMS7poXXQL2pnwm2G+SOi8tHVYhV12uzY+IvWowD
	f1ElO7af23yymSVYXNVnhFGAjuNO//Rttub0THZ96e3U5gyVlPXpKL6sKNMXcTP3LsuqtNFIYvG
	gSVvC8gja77XysMm7Yaiuz8vLh+4TicDqaNvtZyCiI5gO66fxKKt7NsOwowvkDgZz7+7XWzv+w9
	mmiOZTJEaBi8rG1+HzbcjnAKURwDLtzMH8QzUgPQxgLB18rCcqm7Q==
X-Received: by 2002:a05:6871:887:b0:485:d1ab:7936 with SMTP id 586e51a60fabf-4a8bb4c15d7mr812218fac.23.1793141380871;
        Tue, 27 Oct 2026 15:49:40 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 5/7] classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
Date: Tue, 27 Oct 2026 16:47:19 -0600
Message-ID: <20261027224931.385138-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248769
Content-Type: text/plain; charset="utf-8"

Any recipe that inherits this class will automatically generate deploy
SPDX data for the do_deploy task

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/deploy.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
index f222a8560f..a3b48d6f7a 100644
--- a/meta/classes-recipe/deploy.bbclass
+++ b/meta/classes-recipe/deploy.bbclass
@@ -6,6 +6,7 @@
 
 DEPLOYDIR = "${WORKDIR}/deploy-${PN}"
 SSTATETASKS += "do_deploy"
+SPDX_DEPLOY_TASKS += "do_deploy"
 SPDX_DEPLOY_ARTIFACTS_DIR:task-deploy = "${DEPLOYDIR}"
 do_deploy[sstate-inputdirs] = "${DEPLOYDIR}"
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
-- 
2.56.0

