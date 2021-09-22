Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.232.1632333236680729624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hax0cz8G;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id e16so3426630qte.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+uBVaLpmUsu5yDBJ2voKS6xfPZJqlY6jcnOEPqxtSM=;
        b=hax0cz8GmvGY7xojFXApuKQ4TDL/puhyMW5CGcDGf7eiFYS8AaM+5YXWv99Ots/keY
         zXravXDp3/Bdi7SIykZsI9NZvJ4uyiqXJxeyX0xreedqT2+vsmmnCl3Amx+Rv5jaGVfS
         707K55YoSImHUQGq1A2V5Wb1yQQPa2zEx7rzOXNAh19VyshTTl+y8lxLSnmFm42ENKCb
         C+3BPHJGlYnF0fb6qB3PBGuyySpw7WmdrUtBh44exzTfDgi1DSfmQQPtGcZ9M4GCNW0y
         ItRA8yBgsLY6pdZ9Ry4O7DQ/P9+aKt99reHKfmx4xyGLitJUzBEgdRPw7yOv7yx4sa+t
         qVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r+uBVaLpmUsu5yDBJ2voKS6xfPZJqlY6jcnOEPqxtSM=;
        b=DIx3CK/W4kMSNE9hhLAgATpqqiJGp3EUaKXn+QoFhCaEdee9CAdhaBnYES3k3lovdA
         wHRAyjt4Bfyh4w9N1irz4M0XhFukO+10N3Y2g1k6cDkQcQclu78An/niWKmqS//9ARNk
         OvEUNS+/M/eXujtkEKzOEI6UE2TupRMwD9Nup/HttI4cEVrGHxngqPlyY1tuzthiuGi0
         3xGQOCiV7exdzZwHzNAsZoBa3XRdRPJCjlTGfFAGJgIM3p1RjlRpWtwOjb7axFNHvMLK
         ol4XuLtvJMLO+xyAAzPC2Zn6fIBQNLAEIsRTeUo0OFPoBITPsHo7BPtUfIiWlcCnJgSw
         K3hA==
X-Gm-Message-State: AOAM530TzEjOIZ9bnoMjcgQfU6mxyj66TfbtXGVNjYDtchCLmVPa0o8U
	BnwsFHNZmKREsK9SAuw3WDc=
X-Google-Smtp-Source: ABdhPJxm3+bKMEOATCT6lSpMZt0kzF8XVyUGJ1I/LC7OI8j5Vha/VHbGqEFcnyzHi6FVC+9BReaovQ==
X-Received: by 2002:ac8:4d48:: with SMTP id x8mr488241qtv.415.1632333235732;
        Wed, 22 Sep 2021 10:53:55 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:55 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto/libc-headers: update to 5.14
Date: Wed, 22 Sep 2021 13:53:48 -0400
Message-Id: <cover.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As discussed in the Yocto engineering sync, we lost the EOL lottery
this time around, and our previously proposed 'latest' reference
kernel of 5.13 has already be EOL'd before release.

Although late in the cyle, we have been doing testing on 5.14 via
linux-yocto-dev and most of the issues have already been solved
(lttng, on-target build, etc). Likewise with the libc-headers.

All that was required was a systemtap version bump to get a green
AB build with this series.

I'm sending this out so we can pull it into more testing, if it
looks good on that front, I'll send additional patches to remove
5.13 from master (and once we have the h/w reference boards updated
to 5.14).

Note: this is a unified series, and not the normal oe-core/poky/yocto
split to make it easier to handle for pulling into master-next and
get all the default versions updated.

Cheers,

Bruce


The following changes since commit a0a9df0e8b5f62e69b65fa9f7129ac0954a45691:

  rust-common.bbclass: make sure ccache exist (2021-09-19 11:33:14 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  libc-headers: bump to v5.14
  linux-yocto: introduce 5.14 reference kernel
  systemtap: update to 4.5-latest
  conf/machine: bump qemu preferred versions to 5.14
  poky: set default kernel to 5.14

 meta-poky/conf/distro/poky-tiny.conf          |  2 +-
 meta-poky/conf/distro/poky.conf               |  4 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/conf/machine/include/x86/x86-base.inc    |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 ...ers_5.13.bb => linux-libc-headers_5.14.bb} |  6 +-
 .../linux/linux-yocto-rt_5.14.bb              | 45 ++++++++++++
 .../linux/linux-yocto-tiny_5.14.bb            | 32 +++++++++
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 +++++++++++++++++++
 ...8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch | 26 -------
 .../systemtap/systemtap_git.inc               |  3 +-
 11 files changed, 156 insertions(+), 36 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.13.bb => linux-libc-headers_5.14.bb} (80%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/ef5a8b9eda402e4e96c4e3ce01e7ff95d3e10470.patch

-- 
2.19.1

