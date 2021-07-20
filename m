Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.645.1626818248775962282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 14:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MZnmyxT4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 21so692942pfp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 14:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nM17WXMN7jJVtxJ22DSNi5mw7fv88aRcv84shgM4VRE=;
        b=MZnmyxT4D3AFWo1LRWfygX0iUH+FbwX2rSaREn/elLJnEHhpvom9ZEyDreBOB5f+ry
         DPvyy5bqIcPg+NbupFixc5aLflVCE7VHAd8tmAOlBzCbs6rEK/TdMeJT78FiNcUijNQQ
         BBG9sVCpJaAkFlwzlPFWPwrqqGWXm2DMBO2vY9cHdR9X0ESNKA3yPHci4r5h4PkC+1A2
         YTTo0jO2fZs8xINGhqrl+TcV0mMf3gP2FBzXNfTQVrWOT1h99fGQqSby/MwDg2VKsx5C
         Ap0JpHK4DVuySK+tczfIvOshT8qruVRIb5j72iFYwiyfFR0vZINOOdp5fqRZmx29+IQF
         jFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nM17WXMN7jJVtxJ22DSNi5mw7fv88aRcv84shgM4VRE=;
        b=hkx7GirwE3gIz5QRPxWH7dQ1X+EpgDRr7wRIVmfAKnxGTE9eDoZcziGnABblvBREvC
         vl0830NKVWQvCie5R85lh2Os3atfgKBaNdqk04aJsI29PcwJz1wRS+HGmGkPLWPHT0sU
         fER5yCcG+9CfajGECOHVh8Aga/HaJWKYwqKHhgBDP64wgbMH6Tag7tB7njR27hb8OBLg
         hzW2iiRP8/ierh7EbF4kWwjVDcyB7psRt+zd+c15gLH6p3NBh2Ap2HFHsBApugg+hOWn
         oEuNmtklvgKq3Onf/yxbr7DPgXS81CgNaWAB7WrPLib8bitjGTuUo0kRkTpV0J0T7m9L
         G98w==
X-Gm-Message-State: AOAM5329pB/9VMsQ/tYRDffzFcgolk6n8AheGzLXIgpspF8xr+Ums56Z
	+cBLr9etwqWRV64IROKohWwbEFAVA4SjJ4S4
X-Google-Smtp-Source: ABdhPJze8I9M0+Ok2ow7QKePvqRfN1PqcWrxneBAOPonI2IYHNxbM7+ypRXQ9GifmVVYgP2gKxIP4g==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id f11-20020aa782cb0000b02902e6f397d248mr33756170pfn.52.1626818247533;
        Tue, 20 Jul 2021 14:57:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r7sm3556874pjl.16.2021.07.20.14.57.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 14:57:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Tue, 20 Jul 2021 11:57:13 -1000
Message-Id: <cover.1626818018.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this final set of patches for dunfell 3.1.10 release and have
comments back by end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2370

The following changes since commit 9b83aefa9c4a21d9dc1eea4a6b00af379466a288:

  busybox: add tmpdir option into mktemp applet (2021-07-14 12:27:38 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.131
  linux-yocto/5.4: update to v5.4.132
  kernel-devsrc: fix 32bit ARM devsrc builds

 meta/recipes-kernel/linux/kernel-devsrc.bb    |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.25.1

