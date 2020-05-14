Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.14979.1589470875519738720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 08:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bqx8Q22L;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id fu13so12601351pjb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPTmT2vVbIJHxyV4svGPEVkCxUSysioBWZixaV6m5s0=;
        b=bqx8Q22LPZ7BCGF6Ft0xuPxeLrTT5+bzWT9vfBcTmj3ay5YezwwYUCUZd1q7y3xKGa
         sAt2TRO2ffrC4RrGUY0ehau4HvqFNaI8T4kT4j7kFUfsTIje5k2rAzl1NrHQjoVRLJEe
         lrbKQsl7+FhF+j55ne56CnK1g5yOedYgC2cHRskiPBRSQENxQ8jxEyVCzZjOTNBVKoLf
         LHvdVpx65sVjcxQL4iAOP9BLKMUjHZkYVc18iC75e4PLGpe6XpnlucGPNedahGXbEWJ1
         Ayzd1fh0rJkvxABVw0dtjkdmwN8qZWv6KI9yZjWLKggMiZPFgfIyE8uNk51JEjWYw4xV
         hm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sPTmT2vVbIJHxyV4svGPEVkCxUSysioBWZixaV6m5s0=;
        b=qg80ONZxXpRfCgaH+SjpohjOokj5kSXb0mSFtIeUiV5tfHNBDdQCz5QsrcqTAUX+ph
         rWRxFneqZL+XicgVPfwjODdi7xc2hXWC+WZNHyw0BXXY1lAaDRm9p6q3BgBgBLlB9Ziz
         WTU/fqvuD5dTITyKUDEDUpeXiQV7NOQnB1fwCVJPRRacxI/LQqz2H7K7TIjGT+B8DHXa
         EfxGk74EXBNljCRfpno88BEwvdGaoLHmXqsK0VVCVqijE88UhF/wUjwTcQT006R0yBZr
         ObjWziauGGsRzaPolhMR34EhNBxdvE3G4NcjH1aHIXLl/Rc0toL1ugdin8RnNTJnQD/+
         519Q==
X-Gm-Message-State: AOAM53109IxF3TGwS/vu3yFWUhZpDiL90UReWXWehW9YshM+cZ5vYwR4
	0rQjp0+o0IhBfgJ8OfZTH1UuZiXQ1nbSlA==
X-Google-Smtp-Source: ABdhPJwP8PBby/7sTAzHOD7b0qs/XcoI+kQhft+4De3lHIVvuEx7n/yhwhhm+Ki8AehYkmEbsXWNeQ==
X-Received: by 2002:a17:902:aa88:: with SMTP id d8mr4813417plr.213.1589470874038;
        Thu, 14 May 2020 08:41:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 141sm2650478pfz.171.2020.05.14.08.41.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 08:41:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Pull request (cover letter only)
Date: Thu, 14 May 2020 05:40:59 -1000
Message-Id: <cover.1589470737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 12f0cbf348d5acb0a7913bb5dc98e7fccc5ec34f:

  icu: CVE-2020-10531 (2020-05-04 05:34:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Benjamin Fair (1):
  util-linux: fix build error in kill

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.28
  linux-yocto/5.4: update to v5.4.32
  linux-yocto/5.4: update to v5.4.34

Khem Raj (1):
  musl: Remove spurious unused patch

Pierre-Jean Texier (1):
  timezone: upgrade 2019c -> 2020a

Sakib Sajal (1):
  sqlite: backport CVE fixes

Vyacheslav Yurkov (1):
  os-release: sanitize required fields

 ...move-using-.end-directive-with-clang.patch | 36 ----------
 meta/recipes-core/os-release/os-release.bb    | 14 ++--
 .../0001-include-cleanup-pidfd-inckudes.patch | 42 +++++++++++
 ...-types.h-before-checking-SYS_pidfd_s.patch | 64 +++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |  2 +
 meta/recipes-extended/timezone/timezone.inc   | 10 +--
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++
 .../sqlite/files/CVE-2020-11656.patch         | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  2 +
 12 files changed, 244 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11656.patch

-- 
2.17.1

