Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.2739.1605917655157618674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 16:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CBIqhW77;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id i13so8699934pgm.9
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 16:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=a41S7t6RTJjZiQvooe96tlXaCxMljtd/H+W26dbyUsc=;
        b=CBIqhW77W5pG2rUlpml9Eo3cS5d3VPxlSf7lmU+Sq8LNEAsdpHAM+SRokXiJSwE3W7
         2wZKUCjwDmVONCJ0jm0XO0SQXrFDIST2iBE/jdf5CYaVpvEUtqqjvSejZCu+TvjZUy98
         C6RNAcI8w/r0aJxk7wDnHK5QOtDWaucMZWqPy4N+D3u4SgHKLejKnG8+8p9MzbAV4dWU
         bS+ZgBuRSS8X03Lfs5/fAqJEZrx4aTjqDLQUxFP7Kjf+fTs9xrMbMaEdaBjFUjLqgv5O
         HX8r4Lx0VAEd8DSc1YSwMXQghIX43iY39hp/iONgJMnpmIYg7/49DqSOtJMbYyYyzCuj
         aoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=a41S7t6RTJjZiQvooe96tlXaCxMljtd/H+W26dbyUsc=;
        b=ETd2ZqMDvjei8/KL4ZLj5FRTHoQFNJklDyQ0iVXald0dSPpbh4a9fkQ18Kvx0UJv+s
         ndXtsWlHdxPfElCIiiBHCbfy2J+4i1TVpc51EHGpvuPLHsrBNtoVscl9WSLi8X2AlK6c
         5MWaU52H9/JfIF6/k2ZZrGz7su5g6ROtT1X28hb74YKNLsZ0x8l4/GDY7qRZaWEtJ1jx
         wivolBXuGMCxL1zlu0p6mIsdgd8t80nfYUHHIFDGbcx4zLxGeIsqPCZg58pjbA6cOinN
         TrpNQnOHJe6lwStZAYQsPKUfXL4K5Ahq75nqBv5dP1ymKWYjoKYM4TFJ3SxdkzvVwxGF
         MZUw==
X-Gm-Message-State: AOAM533nMFQ4StYQDit6OM+nhfrvYY5OH/lBZuu5/IRSk/P4MHSJI56D
	qIOAgig1+Ew/KzaiYIKEBEufpJkaEr1SmhCn
X-Google-Smtp-Source: ABdhPJwPejkPz+8av6HPLh8F6gMadDJ2TjD5bIIZhR70O27LofAc5scfjMRNSvAUNCVqBkJ27qE/OQ==
X-Received: by 2002:a17:90b:4b02:: with SMTP id lx2mr13517779pjb.49.1605917654155;
        Fri, 20 Nov 2020 16:14:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d10sm5302419pjj.38.2020.11.20.16.14.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 16:14:13 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Fri, 20 Nov 2020 14:13:59 -1000
Message-Id: <cover.1605917505.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1611

The following changes since commit 84e1a32096db9deb98d282a652beec95dbfe80f1:

  python3: add ldconfig rdepends for python3-ctypes (2020-11-17 07:34:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Lee Chee Yang (5):
  libproxy: fix CVE-2020-26154
  bison: update to 3.5.4 for CVE-2020-14150
  python3: whitelist CVE-2020-15523
  python3: fix CVE-2020-27619
  qemu: fix CVE-2020-24352

 .../bison/{bison_3.5.3.bb => bison_3.5.4.bb}  |  2 +-
 .../python/python3/CVE-2020-27619.patch       | 70 +++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |  4 +
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24352.patch            | 52 ++++++++++
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 7 files changed, 227 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.5.3.bb => bison_3.5.4.bb} (94%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch

-- 
2.17.1

