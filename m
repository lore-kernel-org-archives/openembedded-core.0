Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11933.1793806543738734323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=QGQN5x4N;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-48e94879f02so316813fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806543; x=1794411343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=QGQN5x4N2ZmjuHLHrelAcURX5L3D9Y3BK1CSmM9AvVbwIb4XPxVQD5i0tWflufuV3Y
         biRoS9TRrLJ+FMpan06uxrgkNQlHWaBTURVTFA3HLq2Sryj2WsCHjMx+Aj9stprbwUgw
         4ZYuCLxcyBFHMoSfDHCqpAiYPLLv4RD4wXowdBwtEw7geMDL6qa3dmrn4BfYejCWBWIP
         mvT7ldQk75cGVAVI5a+1oINO9BvCnyZWqhLOjQnUY0tUiYKle4et4XYxys/8MoGp5ENT
         9rX9pyjia22sgziuqKs6QM5HMw+pZK5oAigBvILFvvuiRZqNjsR+Knxgkgr1rM+sTi6G
         rVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806543; x=1794411343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=Ja0nypdblUZy3ndZiurHszNK+TA9YP6wONYd5CpVyQQJICBByJ9LVoo7Djes/OISbI
         oKRSGfAkE2uaSoEQH/4LvaQItj6/8wYoJYu1VmZVlaWEaA8GmwWZpa9g9bzXS+YUtbVA
         Tcj0uqAzUIeHW6ttc2eY9qx+U55BHgi5PTXclr8NxVFzYH/KP5Nqb7gkFeu5rtkHvZdX
         COsE7XCadmAMoJohcRrCZ7GPDO68Qf1iYZtQX3MsHBu7ydJE4J5NfRH2YiDJjVaANz//
         M9W41lHH9ZEzC1/Xyy6lFyXUmRVmcZJ1QzZWvNYprFHuNBkB3MbjGsg6rw+F3WU1RSbF
         9FaA==
X-Gm-Message-State: APuU4Z9T0bU4zLeuFF+kMcxk21EdnEihQjvRcT7UdiS25wo2clQeNFuA
	TghzcLbbQRmXrN4Si3r4+QpeC1dISOOyo/5Q6FpDKvyhz/lKqyPZUwWhJQRL5g==
X-Gm-Gg: AYBFou3QW+A97CiwKvankEBsABPFyKsXn1rdW9eJteKDluXYfSGoRTyp8HWjXrhbebA
	MN+FTXFiCXrw7kF4AokU5hKg40L9qP0N8xT1UbrKv4Hc1zpeOY2hF7Opk1WYLOvmnyumshjCCjk
	vEadMeuaMAjI2bEF45aeXTieETl8Ts5aOEchz+E5+obECks/Qczzkg5OXyeO0rwS2hq2csuEFRE
	C60AMlAP8QkULjRdjkMLrxBRiCuFUYWytBXd5yZ+vmaAJ/4IynV0wrEmUTfEzke35tUi6JyPPC5
	HQFVyEdXZxFJ2pUnCnLLbfaaoSUZXXtod2VC8oR8BD9RXCM3KHyYmlQgJjhYPUBRHOwexd1LYF1
	VQxf4BFE14sfdvxRcjzFPQg6Y9xb/3r6Lhg43fN+B9Oj7EGwr9Qyfyej4/sW9yY41VHbU/exihD
	ZASPk+wV226WCqUlOljsTLRS9RdYc1uIjtP6xMwQz8kT9bpvxtkae9HEeog2930JjJirQqK02Ll
	tccwPE434pEiYOe2KUZ081u3qYgGmU0Kj0LWosyO/4of/+j5ybst6Ll+QOeZhjZQt3W6X/SZh8P
	miMx1W5WipLakpMfNO6rnl9KZfo=
X-Received: by 2002:a05:6808:179b:b0:4e4:86b1:f7a0 with SMTP id 5614622812f47-5640de57e3fmr10724240b6e.53.1793806542816;
        Wed, 04 Nov 2026 07:35:42 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:42 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 5/9] classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
Date: Wed,  4 Nov 2026 08:33:58 -0700
Message-ID: <20261104153535.3184146-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249399
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

