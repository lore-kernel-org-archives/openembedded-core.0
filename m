Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.2497.1602202638473319734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 17:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tAq8tggS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id h2so3574383pll.11
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 17:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=fOz7RXW8wSt8TYyyb3MYRByZDqJ2dQ+okQzdupQ0Onc=;
        b=tAq8tggSNWFn2AS+HDPmcygpS3Um2OJfMNO4z5qkUYyBdsfURYu7/JdAcbkW+GPkxt
         Vlo40oYm3PcFZ2+vLKsTTKolYcSMwiR4UEkf+VJ2tLdmZoFPWQ0g5JPCH4vAZ7zGwq3X
         A36uOe9+DjqB69VCK1QueMsQXduhfiryL3edqCdy4NeUwk9cOYDrTEfmTDXKK0AwUbws
         0SoTbcOvCu5oBoqByYODIjOVf4/PCApuGywE0cEzAf7GRPUI/DWaTrfPx2+ICZLLKqsM
         j3RRmA2j7mmVAjdOFT3WbMTJ6pD02cPPPIiJTSZ7S66WOTJaJfIp8Ezaae/HGykV0nF+
         8iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=fOz7RXW8wSt8TYyyb3MYRByZDqJ2dQ+okQzdupQ0Onc=;
        b=Dgw+A4EErw7NM3dVAFSX7GCwJbGHa7W7rAidK9KLw1Z/ZRNtR+36QO/wXwQMixQncx
         t5HSWN2Tdbm2eca7HpdioLOuXt8csomYwBeFgmvzsXKp84oPtEZG05FWRtUMV+5pZP1T
         sy/j6aR1mXPUQJI0aIbnfw7BAzwlIDr54/OJF1AcrDE49NEibD4FHexM26eWZBrxeN8H
         7RWgJNzYlFqSKQuafAsbPPVssbnC3Pp+YgzK2o9sa1AiC8XR75LSQ7SFPNsQn8+25j4T
         3cBzjzYHUwCAIndpMlO2VaWiQO3l6j2vIFBgkOafAVKvvfkmLwlkNZYTmqoWe6zdlc+a
         XF3Q==
X-Gm-Message-State: AOAM533fYuGAkGMAtuEgfelHOSXsNTQWFCqLOPdp91l55pxJscC30yb3
	HtEFbBqK1DQKelHVsVrsYZUamZHznc5ufhIjbQY=
X-Google-Smtp-Source: ABdhPJzeRwo+Ikkm7+3hE5TwrjkSYIFn8ojput7eYiYZ4GAzOB1rRwwBo44YdCJRSBKLisQxCfT18Q==
X-Received: by 2002:a17:902:b191:b029:d2:6277:3898 with SMTP id s17-20020a170902b191b02900d262773898mr10077622plr.10.1602202637199;
        Thu, 08 Oct 2020 17:17:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q8sm8251283pfk.207.2020.10.08.17.17.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 17:17:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Pull request (cover letter only)
Date: Thu,  8 Oct 2020 14:17:03 -1000
Message-Id: <cover.1602202569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit b9296bdeaacc1dce97aac9c9bf0d70555bb36646:

  wic: Add 512 Byte alignment to --offset (2020-09-30 05:54:58 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chee Yang Lee (1):
  perl: fix ptest test count

Tim Orling (1):
  oeqa/selftest/cases/devtool.py: avoid .pyc race

 meta/lib/oeqa/selftest/cases/devtool.py               | 3 ++-
 meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.17.1

