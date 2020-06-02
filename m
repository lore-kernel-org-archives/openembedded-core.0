Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.51568.1591056787000286821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=koIL+Ljz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id d6so570836pjs.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=7KkzHi/piHtYNABwU28JHqhZgWPZ2rzJa4Hec1JpZU8=;
        b=koIL+Ljz6HImXkFxda9n0swW52DHbgRSsP8uEbRE1V40BzoU0g7U/0X3XPSUg9E14q
         HhZbOZqyJevUTrDB9IRysD6f859stuNNsP7lOsbf7vidAkp+v9EBSx6UNpqJGglJlIvv
         OBHUxJAeSdlh0ej5Ev6Xi7cbfGXBx+69SPNa2PLUD4c5uGSrMxfhw4P9nkIJeaLCnwup
         zDncshf09HhTyKH2ajxSqvGrFncH2eRC3PiBgaY+6uNyXTPWrZ+3MGuK0cUIjYoHkzPq
         JkE0Bv2rLrahiIV7RQukO7aA25vcdr+JWWtQtg1pz/9FmT5yUiQVJKmFAy2o7LNe3dp2
         pOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=7KkzHi/piHtYNABwU28JHqhZgWPZ2rzJa4Hec1JpZU8=;
        b=XvUhfbZpaLGrtPMhXxMJxs+nSq9DsSPmVkkNMZxKEo78hsv4hojrZf7MaGjRa9vIR8
         8nQnXxwWEtPj0OKGAD0AUPbTwEBqWh5Vd2v2qw8m97hi77eStZBHrDf8fBLdQX9TBBQU
         IHisH9b1T5Y3okuw2gH+oGuJbKAVNj8YD9tP+f6VHtFrEorze4uZypcNkSb5vBiPn5jJ
         WeALPIDZCzF38Z0cNeED0PfBXDLLuzlbs5gqWb+Q655uxEkVALrT1NUiccLylOiGuvZ1
         bUkp6TC6FUptOmMIo+5avzsbTT6DSis0s9p9spYm6t7zgz3ix/iRV1+2O9Uk8RvAdnEy
         wLlQ==
X-Gm-Message-State: AOAM530uPosjzEFslMCvP29bRwqquxV1GuCjswoy3yn5ymY6Sfhucy5M
	G75Px7JgRMVQeVjAciB5TTHolSWYim0=
X-Google-Smtp-Source: ABdhPJwd5VeVeA5+iBqyV123dpkl72J7Loaurm+cmSsFY11RcXg1YpDUIQZAx4Hraq27G7Lf297Egw==
X-Received: by 2002:a17:90b:882:: with SMTP id bj2mr2046766pjb.186.1591056785801;
        Mon, 01 Jun 2020 17:13:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Mon,  1 Jun 2020 14:12:38 -1000
Message-Id: <cover.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Passed a-full build on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1029

The following changes since commit e2658a7d73b6f21939e644e533718cd05b288766:

  qemuarm: check serial consoles vs /proc/consoles (2020-06-01 07:02:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (8):
  linux-yocto/5.4: update to v5.4.38
  linux-yocto/5.4: update to v5.4.40
  kernel/reproducibility: kernel modules need SOURCE_DATE_EPOCH export
  linux-yocto/5.4: update to v5.4.42
  linux-yocto-rt/5.4: update to rt24
  linux-yocto/5.4: temporarily revert IKHEADERS in standard kernels
  linux-yocto: gather reproducibility configs into a fragment
  linux-yocto/5.4: update to v5.4.43

 meta/classes/kernel.bbclass                   | 15 +++++++++++++
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 4 files changed, 33 insertions(+), 18 deletions(-)

-- 
2.17.1

