Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82BAC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 11:15:58 +0000 (UTC)
Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5218.1790248541075736530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 04:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r66DsoXj;
 spf=pass (domain: gmail.com, ip: 74.125.228.151, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so243078366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248539; x=1790853339; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFg2zwlaU0UHQvh4lRx1fRsanuseBUAxMgXeRPNztoM=;
        b=r66DsoXjOrDfrrJTh+ZRLsZHRRa33ZWPAifvUQNkwn5xFp7h1c+Y7oZSDGUXCWRASA
         BB42/tXrPiAVZO4TpvFlf/ok9AHgZodf3uMt1Ua/pkqz6Skl8vg6Fz76OG2xaqh8zVnb
         ar5et3a7F9iSbpM/WI9Z0aU60WZ57U3fTMT1kZaaAcVStmlaAflQHu1+oPXVer747dg5
         jwjBztN+etbpUHunn0xrE7wZtKqM6tPbqjT8yB6Ttg2bxfysSvMLEFmrQC5V5VSjhfm7
         bY8i/R7LCcCdjy9NjkCIaQIKj36SPvty3wrG+ZXT+WLi5VeptwWtNEsdd85faggiMfrq
         lhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248539; x=1790853339;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yFg2zwlaU0UHQvh4lRx1fRsanuseBUAxMgXeRPNztoM=;
        b=APL3nsTAxQr5+lHV5hE+xHmwF+2ixQz5DA5y715ZR+QAvomnvUTSxJnXEMBK04PN9t
         O6g7fYUjC8P0vroaPrbnt0MoTyRO4Sf/gbxzOj/oil8K9noHmDxijLgZPSDLGTag0SLD
         iFzzYATxZo/7cwRGpOi4haBomz7Vmy8h1wmcp452TLIOu8aisf31DlthXaKYjqzgDepy
         /lveHNnxJ/WrtdNCWKZhb2B7fUKYxX6J9KN2opND709vH1RvczpSBUX91LqIkM7bXQt+
         lLfx3hUlXLj2KhajNipgARD+FJuoNoI2aTDhEJwKHKahzxewTmHkZX0GzbzusCeG4+OK
         kZjg==
X-Gm-Message-State: AFuF++m6alLey7Cxk4QFxedSBD2xDwe/5jCo+UN1W0oyfGnhcY+gGQOs
	egUvy95EtbLEDy2OB5WAmYN+V2Q3Q9CJSOy8i8LapVX33DKSYn0PvIi1
X-Gm-Gg: AYBFou16WtGrzAWfjHMj1aT+at8jzvKrOEbgWGSViySU3O65prX5x2ktpzHyiMKnkBD
	EoLvmKApb2ub2sZ+3bKUTGhDwiyVZdUTVWMG7BV9aEdXk8kOWxEEpddbiKMMGX+7msea2hKd1ax
	BDuzxLP+X6RmPPDtvtfV3UxbqdlwLitL7qI1MIUnD2jRDDMW8lSkScs1Kt3+6o2MZ/qym3nim8D
	jy8ireZxEBnQs/aS6UrDRBJ0mgykgDKGcIbtjT2E1Hbp2N7zbVpqJLUYlHFNEGmI4FfeBoM0m4K
	k7GCvtJhquS9cemkh06Y1tMnilU3qG4xIYSBET/RKis7/3F+yJt4ShaF6Z1OB10j8i1yWVbyLYQ
	p25pMVKb7i3cfIz8B+w1JIB4YKn9VcUmELQPFzQ7dRZ9e3Y5wQDPrgzeQz8z/Bgq/nwdoEo599Q
	bOVPplSdUtT0uOm5bKstv5q0we0mw29nGYtRbgOEhDknqeVQMAisX9NmAzH0sUg/VCIze6+EB7n
	+LqjuekhsEq
X-Received: by 2002:a17:906:ba8e:b0:c29:4b08:79d with SMTP id a640c23a62f3a-c2ac5396f8cmr144692466b.26.1790248539114;
        Thu, 24 Sep 2026 04:15:39 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6c14acsm296486666b.52.2026.09.24.04.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:15:38 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Thu, 24 Sep 2026 13:15:08 +0200
Subject: [PATCH] go-mod-update-modules: Combine env with fetcher
 environment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-msieron-proxy-go-update-modules-v1-1-da2b698dc73d@nokia.com>
X-B4-Tracking: v=1; b=H4sIADsGtWoC/yXNQQ6CMBBA0auQWTtJKaYJXsW4ADrFMdJpOtRgC
 He36vJt/t9BKTMpXJodMr1YWWJFe2pgug9xJmRfDdZYZ3p7xkWZskRMWbY3zoIl+WElXMSXJym
 GjkLrOuN6MlArKVPg7Xe43v7WMj5oWr9ZOI4PQVxA1IMAAAA=
X-Change-ID: 20260924-msieron-proxy-go-update-modules-f3ef163069e0
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 11:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246581

Running do_update_modules from behind a FW fails with `i/o timeout`.
Compare that with do_fetch which propagates proxy related ENV variables.

Add `**bb.fetch.get_fetcher_environment(d)` when constructing
environment for `go` invocations so that all proxy variables are
present.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/classes-recipe/go-mod-update-modules.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go-mod-update-modules.bbclass b/meta/classes-recipe/go-mod-update-modules.bbclass
index 3a0f0a3377..435e7e30ff 100644
--- a/meta/classes-recipe/go-mod-update-modules.bbclass
+++ b/meta/classes-recipe/go-mod-update-modules.bbclass
@@ -45,7 +45,7 @@ python do_update_modules() {
 
 """
 
-        env = dict(os.environ, GOMODCACHE=mod_cache_dir)
+        env = dict(os.environ, **bb.fetch.get_fetcher_environment(d), GOMODCACHE=mod_cache_dir)
         source = d.expand("${UNPACKDIR}/${GO_SRCURI_DESTSUFFIX}")
         go_install = d.getVar("GO_INSTALL").split()
         output = subprocess.check_output(("go", "list", "-json=Dir,Module", "-deps", *go_install),

---
base-commit: efa6b98ee50bd0b115fb7d1395079cef008d246d
change-id: 20260924-msieron-proxy-go-update-modules-f3ef163069e0

Best regards,
--  
Michal Sieron <michal.sieron@nokia.com>


