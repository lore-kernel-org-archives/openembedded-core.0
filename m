Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8443.1793225178229107333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Z795uou6;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-483a66818edso750798fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225177; x=1793829977; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=Z795uou630ZVhpm6tG2HdtBnKuBDlnOcXzKniStk3Au69YtzeBXipMxQzAQin8IfIY
         g1RBmZocUfeXltMvS3+brpGS44I/sA2GweoxkNPPK1/EBXW/j7WYgnNUjSEJRhbMQ2Zt
         KNKMZXkEXgclPcrAME3Sn+NgzIM8VFppBHDs2InmSdBn/md/qSAVQOoz+zcjo9tPJopf
         D0QMxTHErdAMXEb+/biGsQdHmt7sanp6dIAaGy8o2TjQPkC22ydtlKNHfH+l6ZB/iEsB
         0A1DJlBsOa3sCErMeIA4lN09jZOhKfLekzaMsnoZNXgWq8tbF++/D0kbV43WdhFbgaJX
         s+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225177; x=1793829977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWf9nPwSiawEirgLzEzSMAEs/S1YebD127It0ONYkPc=;
        b=m9vHjD2LtFaJL9MTiwVzpXwqvIOGHKXmFXoCzreEcdsL33Tnurntov/uXsSwxKzIWZ
         PR4D/j2Hcg9JwL7zlYHDT/HLIHgviWNrPGNYRSxXWh6GQQ2QfD7V8x5cca/7ClG96mDF
         C7B8Ap5M7BXsdRS71aBFKzougDCTP2bgz2R0vVmnggQFc/7vsfG5WcDL7LM56xKX9c9A
         7BLq83vTgeb8VkeMUm8Kt/ES5i5n6rjsvJXe2QUGbcgLGm0SoCyZS6TZncQTrNd9R8hC
         FDEA8yRIwoWy4AWJR9vHFAedXujgq3jHxxyJvyNIERugv2KZPC2x7O5fJ14TZpXU0kh/
         0/vw==
X-Gm-Message-State: AFq9FYJWMFCp28fEkKoGV204uggRIMsLcWAIs/xElbtxfBTRUdx4UzVF
	w53UtB5/xJBecYdzO28h9NBxXbK9MKf5ny/mi4GBN0DLwOZZ/+pBYWhZY/cJtw==
X-Gm-Gg: AYBFou0yFfTm7mGVtCmxFEz/ZZIZF7md4qM1C9nRVOM7pd001DNdxyIX563TpTgDbmU
	9ze2iXGFhQFJvOEz47cJjZfz0XI6lPwsg6EzDObr6gL9SBwyEixWcr8feHdRcpWjLDa0pKKuiiK
	b2y3DVJu8KzLC4tG5+SBjMwVFyI4FRuAYX5Q35BqdIOLSbFcymic3OFcmf1MNCwlEEr/kCuH/4u
	uLTHzF59ce1VfkpEgre/PFxwra1hoRiBSZGGElbKEh7BnzcS3b2EayaA2IUhpLtlk0kkLdsoARt
	+iCwDY6yQlu8AxZSGykPeeAyInvvOqauAfegwoUsGRrHVuEPTtGR0WdVkkj7UOc/xA+zsxTzk5b
	9KQ3CEwf8A4sdr5NJPTfRHlsjL37IfCdWeydhrYE7RlrLZWy/1+s96pU/FNayRMU17ugR8KiuRl
	8uThhNtFgzm9XjLBrHR1wszd+xCg1sJTMZRr8KM1HcYYIkz8RnpBlcgzD3JN2m1w5/v2dIjr98A
	mZl//mCnJ9N/xwcrqjYOBh0+1FKIhHpu3qbJ3a4xK16ubN3AKhUgQWk3xkjY0xHEHgTWSLx6RR/
	ecUorQaYjsJL3clKpr1pGUmJOtZBWPS1n+N+yYBl7J/v4Rox
X-Received: by 2002:a05:6871:3869:b0:494:76db:2aa8 with SMTP id 586e51a60fabf-4a8bb59ac9fmr2986976fac.5.1793225177416;
        Wed, 28 Oct 2026 15:06:17 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 5/8] classes-recipe/deploy: Add do_deploy to SPDX_DEPLOY_TASKS
Date: Wed, 28 Oct 2026 16:04:36 -0600
Message-ID: <20261028220609.1348489-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248842
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

