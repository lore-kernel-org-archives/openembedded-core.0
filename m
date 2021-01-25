Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.324.1611586300444878639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bXsP9jLa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id a20so5578634pjs.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fXA+3ht1d7toW90x+X1dcW+CjtoUCFoZHpZezLUBhm4=;
        b=bXsP9jLaGxSXWZpRk0unIcnJ2Z0v2ATo8b5O9BPEjYhglNH5heL6NQ2iwUC7bvNWc5
         +qWEEhyWCMFhmrKToNXPLGBBg/uzfhf5wY/jWeCe6eogM5WXcnLM/sHjrdhgvr30uFmC
         AN8sOJ30JIdZ5M8djxHQTXEPj+iGbXqqGf7LU1AJpXZHsKuWyaXtbiFXrlACPYs9LLkB
         LMwKoeDHUSCDZUp8YSbbI/0FB6TqwDG8lZe6Y7dm166EDGkkeRyiwose1LCVRNC2VWoR
         6fn4rr4U6sWL2J1f83dsWvQVyzGeMD2fTQtaF7nWNnkN9lA/3RFw5cN0nEsglIVbFANE
         mJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXA+3ht1d7toW90x+X1dcW+CjtoUCFoZHpZezLUBhm4=;
        b=BbACioVlQ7CZ5kb92zdM7Gke5n7uOBmoD5Y5jWdiALz7FI+K++kA5bRTPu0SDmADYa
         QYFYmvqSz8kw6ocsgmJOjRaTgPBKbn+NNmj+s0wGK3RkKFamCbWFm58mwfBOIamt3rnZ
         OPGoWuENJ7eTeV8GESVwCqOrhcWMk4ivs39V/0ymkiAR1Gm55aGqnZ3x4ANeJGs982Fj
         NuzoGONRjTD/jVbsWGLdlNEyCwR3HX7/BCXq1IPPx8gIlWIJDaJTLnqlD2W6TyV6VqnG
         bi8+tE9QfOSK3fhb39KfYXzxWZaQHHDE3zTFczq8da/hZEKxtj3mwT9DPan1+4wZWIUB
         KgbA==
X-Gm-Message-State: AOAM533S8pSbRXNcFa+J9Tl9BJS5lXHD16Fnvjk+zyJ1QBh2ddH4jXBv
	rpN50wmF4evuWmWi62zzM31xvqkYL0h4lwNUPSs=
X-Google-Smtp-Source: ABdhPJwBvZTHLnMb+Yd/FLJWxCpvHGMTGRFPw6k+GAQ/HaFMStr7YD5TrBBof9y4lo2QOAM+sO2J5g==
X-Received: by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP id s9-20020a170902b189b02900dc41024edfmr995397plr.80.1611586299555;
        Mon, 25 Jan 2021 06:51:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.51.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:51:38 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/47] pseudo: merge in fixes for setfacl issue
Date: Mon, 25 Jan 2021 04:50:34 -1000
Message-Id: <b3ef5623d35f560f0bc58ee1c6537640343b0eec.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

[YOCTO #13959]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18fbd28c9aa0276d110839c4282a9ab75fc9f28e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ead5dcfb14..fcadfd96ac 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "b94fa2fc81cde25865ee223ca437d07377229a53"
+SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

