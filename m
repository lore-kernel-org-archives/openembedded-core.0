Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.13147.1595513738040230771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 07:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WFowxHUb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id w2so3163476pgg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=NLNjiAcLqMy/ShumercbjxKFgZo3uJAOEI+LXoW1/fc=;
        b=WFowxHUbsHlvJxeJII+gZ3IPk3R/ynSQcOlAPMR8I0lgifcGnQxy/Ch3PCI5yj+e+9
         4MAHxTsfMwG5IkBkLKUVKSW09sJEs4jD3lUCjFtHT5e1xAM0pCKVcA0IxsFBq5ogxT13
         Gglz3PyaaUHURFxOoShamABRXlgmtctAwaQnOfrBiwMm+ZUyokQsn1CxdWdu+RkFbxyr
         gggHKARkHOuuXpC/Fz0Ng1BlYNn1lWhXZPf2E1cyBTZnkHRXuhOR6nR3n9TlWFkPK3yg
         yV4PURqrsPuzRgfILTZp5F6Elqae2tDIuBmAYN15zLaLpI8R7CzOB9RacvP08OPHq34Q
         0TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=NLNjiAcLqMy/ShumercbjxKFgZo3uJAOEI+LXoW1/fc=;
        b=CIqWVjdaFpGStBM2iN1yhC9NNVE3jzK5DC7TgkA1biIPdhwArP4xpjpNJqgCOyOx3e
         Bh+OVzB4gjTjvuydOkAIvjOOCf/TNJ98F+L5StcOu5nWg6CF0aOlltNurtbHzsUCEsYP
         DOgnKtzBG8NQj7t7t9HNYtezRh2CvXTIBbM3CtA1/0qcajOH948NULwYmbmPXVfME2Ak
         g1BDkO5mUPlgq3s65T/BBbcT+bOa4xtZcPj2L808hB+4vCbngMmwloX99dMKHczLG7TI
         SwnCzzKyr9IhljFts7jHL0lULJ19zPLxZbzuIwp9ZcPZUteym5uzYqhBl44Dm9NnvO1H
         +p5w==
X-Gm-Message-State: AOAM532GD4OjhSgrqUrvPSCQMyfRpbQ081c3guUqjDn7m7vZZj24oVF3
	MaPD7XpNxYxjjINCH6wzBl4o/VGtjqM=
X-Google-Smtp-Source: ABdhPJzfilPtKczTgpzQChgFOLzTDRLsRDZtoYMHVHrQUqJVqpUU0j6w0xRF1ARaSpFl2xhCYLhdSg==
X-Received: by 2002:a62:2b85:: with SMTP id r127mr4108982pfr.239.1595513736803;
        Thu, 23 Jul 2020 07:15:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c1sm3240818pgi.52.2020.07.23.07.15.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 07:15:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/1] Pull request (cover letter only)
Date: Thu, 23 Jul 2020 04:15:20 -1000
Message-Id: <cover.1595513571.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

One final change prior to the dunfell 3.1.2 release build

The following changes since commit e8de5271aeebd151b3fbe47d47a1c5f6969320e7:

  glibc: whitelist CVE-2010-10029 (2020-07-21 06:52:40 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (1):
  kernel-yocto: account for extracted defconfig in elements check

 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

