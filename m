Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323B10775E1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:12:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18198.1773850351171554660
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M3b5gPLU;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso85285e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773850349; x=1774455149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1T4hn0lqd8Mr8z7vAGan2FS7DqVqkCkD2sE1KAZk9Q=;
        b=M3b5gPLUi0Oxvzd0JGVIhv+fQTMzATHIt44zFlBIl2Sv1B61V1Pk69eEcLvQ4Z9W8p
         cUcAf9m9ZS9rBCU2wKQPGu30ws5K6KQimhOojtFBnks8ljteLyymdnFIWXRYZ6+G6O3A
         ssc3MC0L+/RncaxFIvGXUqPHKeEybEtbbIolM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773850349; x=1774455149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1T4hn0lqd8Mr8z7vAGan2FS7DqVqkCkD2sE1KAZk9Q=;
        b=dV/XAwluTNmFxbQqU5d/YUpJ3mKN3PmeXhiA34+TPNehoksNPCgQTqh8K4encteT1r
         JHNpo3Srfve18Xv2ckS+l07RVFdAYp1YFA64NgWyCtIG8KNXGF8q8NNspkzk9ropuyIw
         XWqEdf9AyBikrbWYf4ooxLlZPKBlDDPC+RYiyVP1l+2sBODkVHUP9uc8kLXDCCMxBsgX
         UM9NjSqhCTu3OyxscEncS2+xc44ejPu0IZbKITN8TQnzO1N+SN3CfHTtakKGWLRMlUpp
         sBu6L7b628QVZS10DZ/i8r3du22b8cCZcYAQgW5J4i5AzGI13kbCUX4aerMabAjvyB/i
         GcPg==
X-Gm-Message-State: AOJu0YxgzKPeGlT+MnsZOcCdYfkgCuN0emEFTT/B+RjFQphwgYd3yYxp
	8IZ58c2TNmZGiPmImAxQjYWrBsaIzXawZZsEbuKskWHPfYPTAmAjPAQOi2U/HUjePkakTSo+rkk
	6m/Ri
X-Gm-Gg: ATEYQzzTFfFQthhQz+pt+JklPLigAuITJ6ugpw355Tie6emvS8Hzua1RVzbt2bkYSSA
	7n37FnvuUGXR0lYrRsbs+bU5+BLVRL15agLHCH52HUyZK1ae2wJVYLG/XClB8sZAbJl3ZB3/Gof
	TEPLDRq5ydZZxDwNxiE/UlUsxW06EhkyCN8mGwwjqSJBVi4m94f0AqZDaOkLuKl5RjBzy1nrf4D
	ouiu//GSSBrFa3QGp2rVknqtlwxeyCiHFdtPNCplRvbRlIocilBL4BKN26vhRl/84bi2xPUY6ou
	2tTRPdQzPLaS6pRP2cxurab8Et79T8Y0LR1meN67QRECRLmfvEv+5mkOgF7lwNw/Q4mCfP4JJ9T
	9A2NFJHfNfQRWFkVxyQcyBh0gnqIIUBGazAHhqN0LpqYjCepfTMGxvekVwYSn9IIgX9lEYEnbFy
	ws1IEBli4KafA/e3kVftmrnbtM1zplcAO2iD7f8cmB94FVzbQAcuQItN+9lWtnrGB/KeS08kmYP
	ZlJSCz+JDZxAThTTRUm+zUFrEyxUkPNGFXKsIbH1SFgVA==
X-Received: by 2002:a05:600c:4fc6:b0:485:38fc:7069 with SMTP id 5b1f17b1804b1-486f4463605mr62610015e9.23.1773850348981;
        Wed, 18 Mar 2026 09:12:28 -0700 (PDT)
Received: from P-ASN-DERVAUX.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45d8e3dsm23629365e9.0.2026.03.18.09.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:12:28 -0700 (PDT)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH 2/3] patchtest/selftest: allow passing extra arguments to patchtest
Date: Wed, 18 Mar 2026 17:12:08 +0100
Message-Id: <20260318161209.54396-2-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
References: <20260318161209.54396-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233413

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Add an optional extra_args parameter to test() and append it to the
patchtest command when provided.

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 43cccf4c85..51681bec38 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -130,11 +130,14 @@ def git_detach_head():
     return get_git_state()
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
-def test(root, patch):
+def test(root, patch, extra_args=None):
     res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
     
     cmd     = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
+    if extra_args:
+        cmd += " " + extra_args
+
     results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
 
     return results

