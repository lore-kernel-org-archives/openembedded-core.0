Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.10266.1619186421100600504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TspDizr9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id cu16so21155109pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vts2KFBRkwdl+MhFK+3JZRtA0++yrm3MWoCmwU9xRPo=;
        b=TspDizr9d1Zyp8QDtO8Xzns3yVAmvFMsae3W6sgg7TdAE+RmhX89gIsdotbjpb+Xyb
         C9sIexY088EZKGnhxtCxj+3T3S/SHo9LCIQyVjHoBshUxU4XNmk76hM4fVkokUTJLfQc
         urYu7+465inhqYBx7+kzGM3kTO+lkxNtqGOe9cQyJ7wS1hqR9yLGnhHdAe77o/wWtqNN
         vTLBE4HG+o8870m4GRV3j95Vd6jUgJwVhy9W7BXa+6h//jebrW9I2ZjQM+8RPPp/Dvpa
         AuiYC66vYDMNA1HW/fSlb6l1sq4HrgtKbFoUULytunZ9ZE3rARiCTC4lil1ttTa2MtTH
         ng8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vts2KFBRkwdl+MhFK+3JZRtA0++yrm3MWoCmwU9xRPo=;
        b=tIZapdUW4RohxKWe2VQswaO7s2w8fwZSL06+vBDTWF/XXAEFlWvvGhx+fggy2SYk1F
         Pk9qn/UIgkrPaTsvuHIFZwKqSe7P7fJvdQy6jiNUN1NXksJDVY6P5DbQdzCBzqLeBNnm
         f9DUn3KxfTnep2aK72WSHP2e8eCctbN7xUD2MU5/tT1W1zjUQU9338zH2REGZI9Tbi1T
         LgnfqK79rpWkuwfDiNh6e4T8wD4Q4cIw3tQIZCW2OhcDfWVotSlgkXmxfk0zowjYvcFa
         RDLkUNYvv7OHsUkh5ppbJ8A+v02Z/LLOV8+2eTB7dF9mN1GNiXdXQriyNTFrBKuEIQDP
         kEJw==
X-Gm-Message-State: AOAM532KK8Em9/jwxxqkVvm6PwthrG5oS4uy7gu0sb4Ux9Eo9AzwU9Q8
	wuYkGlQtA/TkDzCNL+czC8XuRzQBuT+7E6P5Y+s=
X-Google-Smtp-Source: ABdhPJx4I+7RtOajapZ7cyo63JYUSDHM5EtZA8U0VgQb/7VX/bWzRBxkiuzJW2UxqMpyEt+A7VTDGA==
X-Received: by 2002:a17:902:bb95:b029:ec:8ad4:d62c with SMTP id m21-20020a170902bb95b02900ec8ad4d62cmr4234507pls.19.1619186420258;
        Fri, 23 Apr 2021 07:00:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/19] pseudo: Upgrade to add trailing slashes ignore path fix
Date: Fri, 23 Apr 2021 03:58:52 -1000
Message-Id: <fda1bc10604c41904df6b859105cab68dc70b556.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in:
  client: strip trailing slashes when opening an ignored path

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9fb92bc13b8a78ef98798f14e728058feb180ba6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 17bd02c27c..4eab133128 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
+SRCREV = "ee24ebec9e5a11dd5208c9be2870f35eab3b9e20"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.25.1

