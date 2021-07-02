Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.11001.1625238832235638386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CHgZFPA7;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id q101so541753qvq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MApLyZxMxtu7rdNmdXPOVNwfbxKUUl8k3LOCrk139OY=;
        b=CHgZFPA7cMwta0E4sP7sEIb8Mr2Sx0+qE4+nRnSjtEdanoIrhOCnjM+zFYDPTnAgsY
         AjrsnDtLGW2facnQUwgDSr2F9jH0Y24ElFTMUMivZQ9nRgPjmECNt2cKw+1pUHxy2U3g
         9jGgD8uNOI2QV4nwrMb5RAUisbtoyEvTSHkmrVP+t8ZJ3g5wE3QDoxWeYII349smjr8a
         nmqYkwDmUzAO1jl/AxPibljkAL1W5+1B+kHH6DVL80elRPQcPP/7rODu1YQKXkw+AvFt
         dHpVcUeiYHaD1Gz70GTb0N5bUx8T8rFJXkFanQ443KAhIygVJHj9DsQh0D4GHJzDnObt
         0YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MApLyZxMxtu7rdNmdXPOVNwfbxKUUl8k3LOCrk139OY=;
        b=rxAGyIQbyvgoYzgI1Ldyv1sjun4OYMh/VhjMp+stUfnXwsTxYPT5nsPfbTVZ1R0xOA
         89k5/Co2WvnD00SSa5rkD2T3XqZSKl0PyHhrs9V9sRC1MkUsjOI/dNsPRekuCeSiYm+W
         UYkLo50U03sxc3BZpHOajeVZr01l3hucFLEiagDKBDYY9baYm/U3/Ec2KlcPWVe30CBV
         mb7zBbvS0w/mVrWuu1505ERsluokqmAwWSAHrcP/fR5bqG7xrH/fgmglINAgWrCJ9JmS
         oX92HgJXG0LdW23+LjwpezitLWvrwrtj1PWntvMQyGFHA+cpfBchFmuufckTKzL9P2W/
         hU5Q==
X-Gm-Message-State: AOAM532H6n6beNVukL4pa06jkjdNumsOTyRAcyH11O4YdtCECC23s+5d
	5kZfjBFqGUhRFo3B4LrCTk8=
X-Google-Smtp-Source: ABdhPJzWbX7zRO93WewLeqaOTmw+Agyh+ZnlkX0EI1483mhAuiQqznMxoi2RQGSgHJ4bUGktx2WfcQ==
X-Received: by 2002:a0c:d805:: with SMTP id h5mr5718830qvj.53.1625238831390;
        Fri, 02 Jul 2021 08:13:51 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:50 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
Date: Fri,  2 Jul 2021 11:13:40 -0400
Message-Id: <cover.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next consolidated pull request. It has two normal -stable updates
for 5.10 and 5.4, as well as the first steps in bringing 5.13 in as the
reference kernel (and then dropping 5.4 from master).

I've built and booted 5.13 as the default for qemu*, as well as building it
against both musl and glibc with the 5.13 libc-headers. I didn't run into
any issues, and neither did my AB runs (I'd like to think it is all the
other patches that have been sent as linux-yocto-dev moved foward that made
this relatively few patches now).

I've also ensured that AB intermittent fixes are in place for 5.13, so it
is safe from that point of vew as well. Folks without exlcit versions set,
will get 5.13, but it is already sane and fit for that purpose.

Obviously you can pick and chose what you need from this if there are issues,
and I'm around to trouble shoot anything that pops up.

Cheers,

Bruce

The following changes since commit bc164bd86aadf981bb29807ab95265f79a176f8d:

  releases: update to include 3.1.9 (2021-07-02 07:24:21 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.10: update to v5.10.47
  linux-yocto/5.4: update to v5.4.129
  linux-yocto/5.10: scsi-debug needs scsi-disk
  linux-libc-headers: update to 5.13
  kernel-devsrc: fix scripts/prepare for ARM64
  kernel-devsrc: fix scripts prepare for powerpc
  kernel-devsrc: powerpc64 add scripts prepare support
  linux-yocto: introduce 5.13 recipes

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...e-inclusion-of-sysinfo.h-in-kernel.h.patch | 12 ++--
 ...ers_5.10.bb => linux-libc-headers_5.13.bb} |  5 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    | 24 +++++++-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.13.bb              | 45 ++++++++++++++
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
 .../linux/linux-yocto-tiny_5.13.bb            | 32 ++++++++++
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 58 +++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++----
 13 files changed, 204 insertions(+), 48 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.10.bb => linux-libc-headers_5.13.bb} (80%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.13.bb

-- 
2.19.1

