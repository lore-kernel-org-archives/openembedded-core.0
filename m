Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.14841.1602253141204010533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EwxHmaOt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id x13so4382760pfa.9
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=DVBA59s+ZMNUMsR11hTXoFzS7ubshG8fxs/iLwOAXCQ=;
        b=EwxHmaOtit5pPAci/is4j53x4Q0G40OC28bCFNi8Thm5COuX127GrhuuEj/Jx40AGB
         RD6dtftMJlQpDnRN1MAbyQrYdFXdhOLKuqT+2zhN1DTNI9rqy67WY0fWIU0gpzsNXHBo
         KOKYeG+IoMOcgXt8+Xyi6lG181pRK8NwcO2WGSSJib1FRVrOhqeaj+wcQ0N9L2QAuxN3
         El3/1JOkNDyYTgUVkYCZ/oWTQfZmnl2Tt5z9iN3Sz8MlEWi+HMLLWWh6h3Bid5ATDsJW
         P+UP+gkFSn1gU3je6TbTHEFDUQylvF4sZcU4j705svYC+5Bu3U1sG0CDDQNLS/XCqeGO
         ds3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=DVBA59s+ZMNUMsR11hTXoFzS7ubshG8fxs/iLwOAXCQ=;
        b=IpYZkVd3FSRkgTHrMpgbwzEgIA+nxWwNzwk87WM5xXi4CJkzePQcopgZVehtTLiERV
         W7gM43DqISFqGDh8J6xedJ4zVQru7+/NU5v2wcnY8HKP8OVBJi/UUMrwGArEANqeZ4iZ
         mrEncPtvnntOmXE9dH/LfR2OzOnbTf/cdY4lznGWdvuehHwJCBG6tl9LPGH6Q/24kMMO
         WAq/j6Sq+zFhFWOzkr8CzoNU6ey513IWl1avm6ih9WsJQbIyhVj4ox9hGyTkjICTAWrC
         E6K/iD2f5iUOowDnsf4jTVx2yWni+Rxn9j48yLhxva4LGfj+Szv36l1KLDVqnzoxEosF
         3jUA==
X-Gm-Message-State: AOAM53078srzZ7OyMLyuWCjkwLRIQFWneHP7hU2WttHUKKfo6756Pn2Q
	YBtN05Pnt0tZ15p4AUOUH9Q65gv5h/nzY4OO
X-Google-Smtp-Source: ABdhPJzRHCsiRiwD4qCrdsXCOeag/hk+GAZTX0fjrulaUfZlpoLdWPPSM1Yky+SrQg3jGR6JcJrL/w==
X-Received: by 2002:a63:171a:: with SMTP id x26mr3556344pgl.382.1602253140185;
        Fri, 09 Oct 2020 07:19:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.18.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:18:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Fri,  9 Oct 2020 04:18:35 -1000
Message-Id: <cover.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1464

The following changes since commit 552739383321bd9b4780bd0026d6107ece530522:

  perl: fix ptest test count (2020-10-05 04:29:40 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (4):
  linux-yocto/5.4: fix kprobes build warning
  linux-yocto/5.4: update to v5.4.67
  linux-yocto/5.4: update to v5.4.68
  linux-yocto/5.4: update to v5.4.69

Joshua Watt (1):
  classes/sanity: Bump minimum python version to 3.5

Marek Vasut (4):
  lttng-modules: update to 2.11.6
  lttng-tools: update to 2.11.5
  lttng-ust: update to 2.11.1
  stress-ng: Upgrade 0.11.01 -> 0.11.17

Richard Purdie (2):
  glibc: do_stash_locale must not delete files from ${D}
  libtools-cross/shadow-sysroot: Use nopackages inherit

Steve Sakoman (1):
  Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix
    kernel 5.4.62+"

Victor Kamensky (2):
  qemu: add 34Kf-64tlb fictitious cpu type
  qemumips: use 34Kf-64tlb CPU emulation

 meta/classes/sanity.bbclass                   |   4 +-
 meta/conf/machine/qemumips.conf               |   2 +-
 meta/recipes-core/glibc/glibc-package.inc     |   1 -
 .../libtool/libtool-cross_2.4.6.bb            |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++++
 .../shadow/shadow-sysroot_4.6.bb              |   2 +
 ...ownership-when-installing-example-jo.patch |   2 +-
 ...ess-ng_0.11.01.bb => stress-ng_0.11.17.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
 ...ules_2.11.2.bb => lttng-modules_2.11.6.bb} |  11 +-
 ...-tools_2.11.2.bb => lttng-tools_2.11.5.bb} |   4 +-
 ...ttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} |   4 +-
 16 files changed, 156 insertions(+), 163 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (81%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)

-- 
2.17.1

