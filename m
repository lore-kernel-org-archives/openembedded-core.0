Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C788C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 18:23:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.13062.1645295003030085311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aGoqSaul;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id c192so7168090wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VY2ywFVpn0p4hChq/A4cpxGbB6BEf1JSYxOWGPmRUV0=;
        b=aGoqSaulVNd/UHmmEXZEK3Slp3v9/ZWXcjaVkm4a6bckt3of3YnDHOBHwTvQdI1n9X
         IrbaEdYy8v1XN+k2CxVf4I6LmCmrmB66jhpWOPLkUTas9GdPTY6cKSGz3qOewqJhTErU
         023kmKamNGLN5ixYkoGd3+Xv6gN5+wXoFg1+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VY2ywFVpn0p4hChq/A4cpxGbB6BEf1JSYxOWGPmRUV0=;
        b=QMac+m12CHmNcUEvsNlStnjKNYk8HEkmSHNZKQZdDXK22uSHhpegkpZLsU/2pXzwWJ
         SfLfO2voCTjKca1eZl+n98mSjGuYbgujuspYGJVIcoUFOgnvn5pA3GM91bLphwr4js+J
         X2Avujq0riAIQjiwNQLzcuA4Ww7W7P2DOPjsGS9M41vdCDtaa0aYvGY+ZxV4elh8JpMi
         q18+vGCcrYpYv5pwUUrmhQJ/xvw3DSo/Ay8EAY1CQkAucndA0bLlgEZ7WGcg2gW4M+9f
         Y8i3Wgsquq7Y4/FDkZwR0rgg0qrzWVaaYnrXSlb1tEn81n+Ky+V8eX3US/I6t/dUwvf6
         Pb6g==
X-Gm-Message-State: AOAM531t4APSsySZ0mw1XVXOQwtvyEIXev3uu1mazCYVpcHJOuHWhmIJ
	aRJkhkM0VeycHT8nYXWsH1oUZ6i0WqVkulQl
X-Google-Smtp-Source: 
 ABdhPJytNxy+FMVOuu69EE7C5ehs5WVRm1etX1nSuUlGIsJWfHaSAPmS9LDlTfCJnGptMfDv7PyGzg==
X-Received: by 2002:a05:600c:1e8e:b0:37b:e97a:d4c8 with SMTP id
 be14-20020a05600c1e8e00b0037be97ad4c8mr15241127wmb.189.1645295001166;
        Sat, 19 Feb 2022 10:23:21 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bf04:d486:cfa0:deab])
        by smtp.gmail.com with ESMTPSA id
 f6sm26152921wrv.116.2022.02.19.10.23.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:23:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] oeqa/selftest/bbtests: Update after license changes
Date: Sat, 19 Feb 2022 18:23:17 +0000
Message-Id: <20220219182317.3083591-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219182317.3083591-1-richard.purdie@linuxfoundation.org>
References: <20220219182317.3083591-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 18:23:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161964

Update the test to match the renamed license in the recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index e2b9290200a..ce72c4bcc69 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -228,8 +228,8 @@ INHERIT:remove = \"report-error\"
         result = bitbake('selftest-ed', ignore_status=True)
         self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         lic_dir = get_bb_var('LICENSE_DIRECTORY')
-        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv3')))
-        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPLv2')))
+        self.assertFalse(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-3.0-or-later')))
+        self.assertTrue(os.path.isfile(os.path.join(lic_dir, 'selftest-ed/generic_GPL-2.0-or-later')))
 
     def test_setscene_only(self):
         """ Bitbake option to restore from sstate only within a build (i.e. execute no real tasks, only setscene)"""
-- 
2.32.0


