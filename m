Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.155.1593192867654844746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 10:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UDD70E4c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id l17so9570168wmj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=n6RJEELl8kpBhkvtoHZS4lwUzPMoxHuozyavU6COAK8=;
        b=UDD70E4cjBZT4SmSziXNXGW6fh8pWqS2gFvaYV+UIPBKBSdhIaWl2W7HndxdH6XscT
         36g4eM+alQ9jRRSmzh5xMKH/qBaCv67nUBQwgKI0EOLFb5URo+8hJ2BfoTlDq8wDos5V
         RH72voZa1S5iUpBea+I7q6sV0myr6/EHvwRlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6RJEELl8kpBhkvtoHZS4lwUzPMoxHuozyavU6COAK8=;
        b=tExp8tIJetdbd3nHOPICAjuxaWSFxCCGDGKkidY/yfFybGQOLDJCJsp8R9qSbvv4qb
         PKgBFDSG8nQJNo5A+57+XhDTRv9UTzxA17/KiQ16qpZ/UZRUapz6cF0cAFVQe/XBeSfr
         hNo/1dPWYz0OXOoGaF2oskpO3qJq/urwfWUfwkEUpwkdMMv13bVzEY7T+KCb+Xnqd/Ea
         kYGPU/sU45kjaEc0hsiTIbBTNuUhyTl3BCDp+WAmqkYuZdWwyK2+WAJ7apjf9Kot+sn2
         wVA0oeAV83Z/K/ujqmtf2H8dUh+RBvdE+WYGVPXTYKdvGWV/ao8UK3+p8qiNkHW3KoQy
         p4iQ==
X-Gm-Message-State: AOAM532l0U6NptUnIXaVgzz0G+xIguaQtGJfchAVzNG7vysgOEbkGGE7
	B7ivrNxxAvh43n5qDH8LThCR4m2nwM2QfQ==
X-Google-Smtp-Source: ABdhPJzDbFTi16cVl1PKcSQx2CLoKr2wxsIq+dH2nc0yHiPOVZV2IQAunIsbhq1owEta+rMh3aLqrQ==
X-Received: by 2002:a1c:8117:: with SMTP id c23mr4330875wmd.157.1593192865884;
        Fri, 26 Jun 2020 10:34:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 22sm1662411wmb.11.2020.06.26.10.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 10:34:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pseudo: merge in fixes for setfacl issue
Date: Fri, 26 Jun 2020 18:34:22 +0100
Message-Id: <20200626173422.688384-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626173422.688384-1-richard.purdie@linuxfoundation.org>
References: <20200626173422.688384-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[YOCTO #13959]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ead5dcfb144..fcadfd96ac5 100644
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

