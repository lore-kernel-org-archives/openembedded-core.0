Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.9449.1605626680670111818
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c3fRAC0e;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v11so15789954qtq.12
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shGMjocQlmlebrj2muF7DFhKVhwAM7S/VT108gelpeI=;
        b=c3fRAC0epcOOhb5zpRQ1ysdRCjWSSPUCJkesj0+NRmSraPbTUp5pO7o1/7t6X6I6FA
         aqJPfqRIstlZGj5WIEROQL8/ambEYtm3r0A5OEz6ypLBWkej65RAVMYSrWjAI1vSaKCD
         pJBZlxCKqtqpQVsVTp2ZuGsGCB+hwQMMhNGeQnAYvjtagWE6Eg/x5YplgVooLgHD99Aa
         sumfmCaJ9gbWk3ziY4KAPBfW5+ssoClXBtqFxhqi8a/OAtR805MSSEvezgOkpQromMcr
         jZ1Yuy+yJjj79pMYOlskge8RyS8j9JqZQU/oM8717+yt7XOO+Hq5V587xU72m/ZD/2dX
         1rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shGMjocQlmlebrj2muF7DFhKVhwAM7S/VT108gelpeI=;
        b=BZsbR5QYhSmfr/XvZyzxna0Uop+xqnNJlgmSEpDuTaPg62MlmtfMuNhWYGpZ6fFbn4
         SS4V3Grd6BMRTy2MAXEiACvUoexxJ9gbB5E9i6NT5Fl5tnfzbhBTmVXdB16tcycSvLxQ
         y5ilq1pyEl4h4RAskLOjw0G/B+uOr4OtYpa6yb0Cwm4srcUWTyhxjwhaPbJvDotzcRNY
         C1JQ8SBt5hyTVIk6L05bpQqMmOQJ1eHN28mLIGyeItABukZpK9mEpUqt4lubCez0Mlhc
         iSJkrP2hZVZYJwSegD4hv51ISRKYcq11BAm4eQu9UVwpkXoTnv5h6jbz74nRUFi8lOCv
         /eyw==
X-Gm-Message-State: AOAM53044rK4AKDr4WAF9Z69fTCKGABnRfbe1UF4Htop05KR2MOaf4rt
	Fx7l7WZW/fDho98FwvK2jAk=
X-Google-Smtp-Source: ABdhPJzDRN1Izhw5bStLggs1CSvMWHFzbn2ze49vynr5dqRtdtFAHN/gFrKQE6DhjkMZznnGLx+ybQ==
X-Received: by 2002:ac8:6943:: with SMTP id n3mr187428qtr.22.1605626679545;
        Tue, 17 Nov 2020 07:24:39 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:38 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/11] linux-yocto: consolidated pull request
Date: Tue, 17 Nov 2020 10:24:26 -0500
Message-Id: <cover.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I had sent some of these before, but on my latest rebase I see they are
still outstanding.

Feel free to drop ones that you already have queued, since I've included
all my tested -stable updates. I've also kept 5.4 separate from 5.8 in
config chanages, so Steve can pick them up more easily.

I'm doing another round of -stable updates now, so I wanted to send these
again first.

Cheers,

Bruce

The following changes since commit eced9bcb337087c076e847f8d9cbae95760c28ed:

  kexec: arm64: disabled check if kaslr-seed dtb property was wiped (2020-11-16 14:27:46 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (11):
  linux-yocto/5.8: update to v5.8.15
  linux-yocto/5.4: update to v5.4.71
  linux-yocto/5.8: update to v5.8.16
  linux-yocto/5.4: update to v5.4.72
  linux-yocto/5.8: update to v5.8.17
  linux-yocto/5.4: update to v5.4.73
  linux-yocto-dev: move to v5.10-rc
  linux-yocto/5.4: config cleanup / warnings
  linux-yocto/5.8: config cleanup / warnings
  linux-yocto/5.8: update to v5.8.18
  linux-yocto/5.4: update to v5.4.75

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 7 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.19.1

