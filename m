Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.13161.1611672143008262990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nHX9/J1N;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id u4so2313607pjn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iGiNLx7spXOifSl+EEnDRzVqqy8pschvw8i+9LnSAOU=;
        b=nHX9/J1NK8jjM4hfV2KkM+OLUe2YBsUNPcZKHAS2EtZGo0lMcEOt+dA5z9vXGl4uQW
         oMkssrGA49ruQcSQKkzouOm9TJW/s6eAFWdLjwB6a+DIJPkSAHzScgEcNW7GmNgm2jBa
         9mztNq/qTmoFPzUox448RYSH00gSg+d2mh0CLQsXdJlz75F03z2pjxs2mJMNT6TxGM6t
         QP1hkHhP4c+kDOgI1uiA59NsbxwQmxi3p/0OAs1YeumEqSXoBJCZQHqP/HQz4yL2jKCT
         PZgjgGlRGj1+0r1J250pVhfXzwru3mgCx16XULCoDh3ceWbfYFxIsabszLeCHd/biPqA
         Y7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGiNLx7spXOifSl+EEnDRzVqqy8pschvw8i+9LnSAOU=;
        b=ectpyTgWInbn/pyJthblPYrqERxkutzbJ+FcyaiQ1K88iXtK7cWUzBT1qdQyYjhLoL
         VZoRpiCf+AFEt4GymsFQDyY1zG67SRGjxrWcX3Avmb+NgCl9BxaAsfVMCyZczL41tzZH
         2he6khDuRrMUaHXZOyIT4bE50G4wtUjTcziFYwzpZvyP7niabQocEfUFY9QYJ4ALJ7B9
         L8UwVPnNIkcuxhL6jNIjlbif4PqpaVLqERWRJcfvPy1wHZA/7OXXysub+znyOUyxxbRz
         /iGyAtS4omLuCBpBDIsUlnH5hYdQhJW/EuyH3vBN/r3mo0VOFWzUgbynmQ3igrsWDOLT
         l3WA==
X-Gm-Message-State: AOAM530VuT++ieYaHDX4382bf/69Ug3YD1ZmreSJOBgJp/oHNC2cfUYZ
	q+0Ane/x3dNQ0zwqY3woU1XBdfnnCYAj5QCWyTQ=
X-Google-Smtp-Source: ABdhPJzbazleRiBUfz2q6aUuNDNyNR4HaFCsxphzPlnFHBZGOAdXMq6KtHZLdEKZVkwDewEMM0eKWQ==
X-Received: by 2002:a17:90a:d188:: with SMTP id fu8mr77518pjb.77.1611672142137;
        Tue, 26 Jan 2021 06:42:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 03/46] pseudo: Update to add OFC fcntl lock updates
Date: Tue, 26 Jan 2021 04:41:14 -1000
Message-Id: <ef59a988f9c742e92fc2cf1cf75f1695f9490c89.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This adds in support for the OFC fcntl ioctl lock flags, removing
warnings on some more recent linux kernels.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 234168f803bee2e5b0955aabaddb1d967349fb82)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index fcadfd96ac..9a22304bba 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "067950bd9415fafcafb2bf32c0e10df4f2ac936c"
+SRCREV = "8efb082863ff0ceec7b7e46f9a44750e12f48039"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

