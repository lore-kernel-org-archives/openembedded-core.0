Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.8335.1599689825281674510
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=kT3N0BpH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id n18so3320595qtw.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MSbMc9N8tfZZxAbCjzeHAzFG7PzKu+vZg+pj0GOgoE=;
        b=kT3N0BpHCh1gUDp8KtzP7SWklTdeR2Uf/Zbfj9uhJBQQPqJt91vkJ1pgTXzk+zc2mD
         8M0m3ukgCmEBmZQrkzi5AGvJb8Q6fSI6gFMtNm0Y7yHquWXi4oHIvlojlv7C11k8+/Av
         McFjJN9YnbH5sAKNKOc3vmwhAg4lVPBh+RM2LI5ywD2xn5M8s/PTGc8yN4ka9EprM6cs
         6FWQ1z56dadKnW5UAa/w3kFSYbO+a8Loz+u4Bc7TlGTkFbvsfeidBl6wfHFovn8Omw25
         3eV0GGMR3Bu9mZL3H/xdtIdhnTNXN0w3YSTgA/iuo44rnuBFuI4APon5qNJ0RQ59Dn0N
         +QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4MSbMc9N8tfZZxAbCjzeHAzFG7PzKu+vZg+pj0GOgoE=;
        b=bSnFKNVC//XeRPprijmTmvY98BEadfdeCWCkD6REsQjlFLUCXkFVfJtm+WjZX5QtoX
         iN6MvV9cBbDIGR3NPqHkDKUbhc16uWkvBb9XmIL/ICbdraY0p8Q0SU8BbLnbegt4Xr7X
         /KJbQVkGQWNql/IHAFVHyM308aP4lUI4NuQdqfxz/MKucc/C5SCJdMCy1JBmaevKVat+
         jXaLm2oDpIyBSx6+yeWUrUU2EoNjJpVgxb9D067WNMZ0aBEbzx3ngzJamyF65wTJRixf
         jGw13W5p0j0jJZeM7oY2fOvV1fAkO9+ijgtqP9vfwtVB0OxEkYOsHe/PGlbPAHUexTyg
         4DGw==
X-Gm-Message-State: AOAM533mBwCeoOeRCGQssmOytsyAZxkvUTNWOQvqIX0zCme3sFtIcJrZ
	U6UVRvhmBKGOnAs1FgJwqBbCZ8Ywa7ZKyXXr
X-Google-Smtp-Source: ABdhPJz3CN/miKB3oQZECbQH3tBWSYwycgl/s3u5E+qCes1vY5sZ0IJ4dlgZaaWqUHLkz7ravoXsDw==
X-Received: by 2002:ac8:411c:: with SMTP id q28mr5362257qtl.254.1599689824151;
        Wed, 09 Sep 2020 15:17:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 196sm3843604qkm.49.2020.09.09.15.17.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:17:03 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 0/4] Arm Tune Clean-Ups
Date: Wed,  9 Sep 2020 18:16:48 -0400
Message-Id: <20200909221652.6750-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few clean-ups and fixes for Arm tune files found while working on the 
follow-on series.  Since the changes are needed and not necessarily 
part of that series, I'm sending it as a separate series.

Jon Mason (4):
  cortex-m0plus.inc: change file permissions
  tune-cortexa55.inc: clean-up ARMv8.2a uses
  tune-cortexa57-cortexa53.inc: add CRC and set march
  tune-cortexa*: Cleanups

 meta/conf/machine/include/tune-cortex-m0plus.inc       | 0
 meta/conf/machine/include/tune-cortexa32.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa35.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa53.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa55.inc           | 4 ++--
 meta/conf/machine/include/tune-cortexa57-cortexa53.inc | 4 ++--
 meta/conf/machine/include/tune-cortexa57.inc           | 2 +-
 meta/conf/machine/include/tune-cortexa72-cortexa53.inc | 2 +-
 meta/conf/machine/include/tune-cortexa73-cortexa53.inc | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)
 mode change 100755 => 100644 meta/conf/machine/include/tune-cortex-m0plus.inc

-- 
2.20.1

