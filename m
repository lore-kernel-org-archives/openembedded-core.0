Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.12980.1611672235902289583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=UmDr0FS7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id g15so2323924pjd.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DOMe8+RjgOW00vj5XMx4UK1hS+Kjz90Z1z72g0mOo1Q=;
        b=UmDr0FS7ZzHLCEQomG2rssTxLmbYIUA5zhi7h/V69su5P3bJ15bdENawOTJqX1PVxR
         sOD5H9p2//vOZUrJNhBwbQgB+gUiXJ2W7o5kA6XooiP6Va97FM2485FutPoPMiQny6Ce
         VjobmE1GFyoux4m2FKGfQ3QG5zp+OWvjdRRCiOOWyDc5zpmxry2LUS2XoEGsd4O6RZDg
         UhMgW62IfUFjw9G59nO46pW3biNJUZDPNrZhUiPcKzaqXeChxqB0tYCh29VjLndmLFJl
         oc9VLHtyVN3Z3LXp1WZlfh8JQtpiHxRVC9drtclEpwTXxoFgkYHYCCNnhDvS93c6FZKE
         HdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOMe8+RjgOW00vj5XMx4UK1hS+Kjz90Z1z72g0mOo1Q=;
        b=Ntvdjr0CxZ9Ip+9Z1RV1GZ1G0VYKqlae6y/YSpDt7jzUeRNE6eBprgRpnu0xnFdeFi
         4yNuZ9UgNUi8KLGEYVUmIOkamiCfvFaTeaacEjdN7ohoWr9Z3Ub/kbbz45/yosDRzzCs
         nQqs3jzGdJqnNDBGrrtv2fqG7OYAEFUx79Eddi2FGQ0IUvlsBjiqLmSXA9EpLg/XLVQw
         JS8ZshqoZll1rKlmSbsVLiiHXIBLNMtTIOqnrS9vqo040T717ObSINYQin12ZP2f1dme
         uHG35KktdhRH/fIUg4vZ7JzCRhqMxuTgfqxuy8bkqy2VbIVljKIotqlcIJw9ooWSzErB
         n6KQ==
X-Gm-Message-State: AOAM530RtIxnmRlTUel+dbInc0Ad7ovlXJa1hNON3Ya7SKUVIAqK1pHH
	r2thPcQ7kDMNVNgz9rr/2UBEcJLJ7yHKLzGw7lw=
X-Google-Smtp-Source: ABdhPJw0e2ZChOJVSz44hFX2flRjePzo9h3b7EoBSE2w9QYQmGZu+ehaig2LIEuunhiomu7+ty1gWg==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id c8-20020a170902b688b02900dc240a2bd7mr6236584pls.50.1611672235014;
        Tue, 26 Jan 2021 06:43:55 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 38/46] pseudo: Update for arm host and memleak fixes/cleanup
Date: Tue, 26 Jan 2021 04:41:49 -1000
Message-Id: <b5b5de987279670682588b03ad2ab2289a75782e.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:

makewrappers: support architecture-overrides in wrapper modifiers
makewrappers: fix Python 2 hangover
Fix some memory leaks
Disable deprecated function warnings
Silence switch block warnings
pseudo_util: don't overrun strings when looking for keys

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11a3a9203ad595e7fa92acf442a7f3216d6e3830)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7fa11a54e7..29fa9152e2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "1ee9a1e05e200f189f6644411ba9304e8a479b0b"
+SRCREV = "f9754ac14672c4af19b77bc698a1a808b0828265"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

