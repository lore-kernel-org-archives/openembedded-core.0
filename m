Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3758.1794253686954455223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ewXR4vex;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6aa9606ddadso694174eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253686; x=1794858486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=ewXR4vexress13mExhd+g/oH16BTVLTKkmtyS3g2Ml5ZKzZDcQIRpldJ1mQZGXD92H
         r5xwS2GM57rk0jK7qE/VnPuZyXLsD3TNDBASIQincXOspQ9blg+2SDs54kQu4MgqW1mZ
         HoAvjnIXNKc01uDsEb92XyCujgBPYPfVU8B7unA3CB7xWH9yvmfM9i5FsCJDp8NvLGAd
         2O3Mw0mWzJS19LMZEJUplZi7o9YHpo6QMBL1xHeJmniY1zwxYZVPZdf0uleydAclaPLg
         Ddx10DxngjhX2S6kh9hg8Btq4vozkMsAHxBMzLoxNVqF9xGiVTYuWOJwYUHaLClKSwZ6
         jXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253686; x=1794858486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=llZSM8KjQN6jKLyJA6ydq3Wwf17I9+0zlif1Mt26hbHihwQ0SkiO7huX75FK8lidww
         pE1/yR+VDDubK6Xtg1k2MJlfXldkbtDpS/+MyV7HpFS8iQbkk91Xor2nzV1jogbZP+i+
         DjjHF00bxQt1LEUohPfimGu4ru2L91BogKPLHSukdkJPPsjWGioDLHtZ2cO9yhTnihls
         J4kMAKoIf2qUBrutraSAmYVyKii9KVLO09rflAEwYkmZfG8KH08s6w4/xO4i66ZpzHPk
         Kitq7mM2vVy6oKHeRuLmp4ns2GVOyaYkmO8BJJe+v39d1iKc2mBIOdpEEucxz0KgyIAT
         0s7A==
X-Gm-Message-State: APuU4Z+823Rx5TU4H0lvJ9NdhIgiQq5WA1o52+K9wiTLW4CXIdXNP8JU
	+3qyhGqCY/Q7oHTgToVpK7nGqa/jjEQJBycmUUamglveld+4y7m3IrFT/OE3JA==
X-Gm-Gg: AYBFou0XvaxAHTsTQqG71BVavh1HE1Yq5yM4kQEQOL+XIxYrsbOHCvQxy+YQn8Bi19G
	jHCsqU6qvQa2CLe7EqW27wzPAt5flo81yLok5WsYH52tc7uacnfgMARap85Jng5zOqy63exFeML
	MkvjQk1JAS7/h76J8uxWZdE3KmfXW8nH5eY8qPL/0wDh8wn7kMG6C2A+CNKReWEh6CtgJghD+pK
	rHK98xJ8WtiRUrx8Bze0I+9/Mb/2ty4KuiHCBmWXQTwT9h2ss/XR1jXdMkwdnoTTw7YSSzm2QAb
	OKSGiOf56of35rmeqWOvHAf+MfgtsnX/M9lPFONirHmXJo/SSI9qlLnGSQ34zBRe3FK8xUOGDUE
	NaagbVogV35oJysmDTybA9L20w/34qhRBhfsxJTnieiAXkkeiyDIAy46sbHsr7HU8va/LQYd3pl
	hKvQOjISPZ5voQSaNrTHRbbsjfA+iE6UFUYN2ECeOB5UVYNwVkxaByQP4KeOmAVCBwSacbZP5bs
	A6r+dgqoAazvyUvMsGh9/dVjvhYZbS/DF+vqkNP4r9dwvBYVpDFXc6tYF/vnWXctLWpO0HLNiG1
	msu6IaLma7NKR10DBAy+Gy1jeVw=
X-Received: by 2002:a05:6820:5717:10b0:6f9:59ee:cfb7 with SMTP id 006d021491bc7-718a499ca38mr72828eaf.23.1794253686095;
        Mon, 09 Nov 2026 11:48:06 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:05 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 5/9] classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
Date: Mon,  9 Nov 2026 12:45:41 -0700
Message-ID: <20261109194759.550935-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249870
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

