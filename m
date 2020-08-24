Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.197052.1598282117926084546
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XE5UjP9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id x25so4981183pff.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BmKx/gQhLRSKLr8xaHTUovlTmXYPYF09NVCtfyo8egk=;
        b=XE5UjP9O1YXtrr3pIQ2cRtuqQXTm5kTOujMUr8XqfdIhbfbUcCtb5YBn7yFQwlVI5z
         oHxjICamsqe5bnPVXQ73nz1AqxOUQxkq6LBOiiXUFqc5O263Nr+mZKpLz/+KYBBV+Mh8
         GcbuSpetl1KWHC7BP5RT+SmIwNPuzoI9kZmzGTQ0DakrXBk97bfRUJxVlSwQlV/oDnaf
         pzCaVoKJLPvxhZnNkww8U/XO2Xze1EcH3vMMnhL24MM+Nm4WUVjU1+yBqcjtTVCcw6Ug
         k3bZjgEB/TZcCuw1f8e+Yx+DnQdLjHg+kN2pyjjeXxvzOXc3HVQ5HQ+7zKbEVh6tFJN4
         m0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BmKx/gQhLRSKLr8xaHTUovlTmXYPYF09NVCtfyo8egk=;
        b=OiTXbnj2jgDtAJVFWul/ib6sTXVpmYw+bSxbR5/ma5sMty83Ymc7fFv5vjyifcTEES
         ULez93ygRS9/BbOoXUYwXk9y6fTjQI3Al3JcZE+shgsrHKAqXtDwZYT0BPbNr5rH3oGa
         zAW72VfZJRiAZZ28orLC0M/HP2TpxyxPKx6o5w3uQOef0pU0hbUgU57p3IxKjXs03THg
         GKPMrzklMxP43/+57WjvsXRX62OB3NjycTmdrOGz/Qdws9WAJ3hArsOxWTCFbAZvjN7s
         uYvdAMR1Hlu/s0a4YIJ4Xs5O7hJU6m/aLcy0ONkdvQ6mk07OhmjzzG6TI7ivdcNaFz/C
         p7Sw==
X-Gm-Message-State: AOAM530U6+Z6Q332vJylIjBBDZ9wnwYh/MvUPrlPl3FBFRxG6BZaM9qc
	H4FV8K6q9XaQiP7lsQ02x8PF2ALdxtJ12DqnE2U=
X-Google-Smtp-Source: ABdhPJyCAlym6JETr/NKmqS6GDbl4ie/7BLf6kdfzUyRQI+5av+Od0/KIM2kh9C6RLStqSHIxjXmtg==
X-Received: by 2002:a63:2a89:: with SMTP id q131mr3649259pgq.330.1598282116592;
        Mon, 24 Aug 2020 08:15:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Mon, 24 Aug 2020 05:14:49 -1000
Message-Id: <cover.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 553a96644957ca6ad0f13b75a6e3a596357d1d52:

  linux-yocto/5.4: update to v5.4.57 (2020-08-13 04:47:52 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Adrian Bunk (1):
  librsvg: Upgrade 2.40.20 -> 2.40.21

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.58
  linux-yocto/5.4: perf cs-etm: Move definition of 'traceid_list' global
    variable from header file

Changqing Li (1):
  libffi: fix multilib header conflict

Chen Qi (1):
  fribidi: extend CVE_PRODUCT to include fribidi

Lee Chee Yang (2):
  ghostscript: update to 9.52
  perl: fix CVE-2020-12723

Mikko Rapeli (2):
  alsa-topology-conf: use ${datadir} in do_install()
  alsa-ucm-conf: use ${datadir} in do_install()

Richard Purdie (1):
  selftest/tinfoil: Increase wait event timeout

Vasyl Vavrychuk (1):
  runqemu: Check gtk or sdl option is passed together with gl or gl-es
    options.

Wang Mingyu (1):
  xserver-xorg: upgrade 1.20.7 -> 1.20.8

 meta/lib/oeqa/selftest/cases/tinfoil.py       |   5 +-
 .../perl/files/CVE-2020-12723.patch           | 302 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |   1 +
 .../do-not-check-local-libpng-source.patch    |  37 +--
 .../ghostscript/CVE-2019-14869-0001.patch     |  70 ----
 .../ghostscript/ghostscript/aarch64/objarch.h |  40 ---
 .../ghostscript/ghostscript/arm/objarch.h     |  40 ---
 .../ghostscript/ghostscript/armeb/objarch.h   |  40 ---
 .../ghostscript-9.02-genarch.patch            |  38 ---
 .../ghostscript/ghostscript/i586/objarch.h    |  41 ---
 .../ghostscript/ghostscript/i686              |   1 -
 .../ghostscript/microblaze/objarch.h          |  40 ---
 .../ghostscript/microblazeel/objarch.h        |  40 ---
 .../ghostscript/mipsarchn32eb/objarch.h       |  40 ---
 .../ghostscript/mipsarchn32el/objarch.h       |  40 ---
 .../ghostscript/mipsarchn64eb/objarch.h       |  40 ---
 .../ghostscript/mipsarchn64el/objarch.h       |  40 ---
 .../ghostscript/mipsarcho32eb/objarch.h       |  40 ---
 .../ghostscript/mipsarcho32el/objarch.h       |  40 ---
 .../ghostscript/ghostscript/nios2/objarch.h   |  40 ---
 .../ghostscript/ghostscript/powerpc/objarch.h |  40 ---
 .../ghostscript/powerpc64/objarch.h           |  40 ---
 .../ghostscript/powerpc64le/objarch.h         |  40 ---
 .../ghostscript/ghostscript/x86-64/objarch.h  |  40 ---
 ...hostscript_9.50.bb => ghostscript_9.52.bb} |  27 +-
 ...{librsvg_2.40.20.bb => librsvg_2.40.21.bb} |   3 +-
 ...-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../alsa/alsa-topology-conf_1.2.1.bb          |   4 +-
 .../alsa/alsa-ucm-conf_1.2.1.2.bb             |   6 +-
 meta/recipes-support/fribidi/fribidi_1.0.9.bb |   2 +-
 meta/recipes-support/libffi/libffi_3.3.bb     |   2 +-
 scripts/runqemu                               |   3 +-
 35 files changed, 361 insertions(+), 861 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2020-12723.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/aarch64/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/armeb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/objarch.h
 delete mode 120000 meta/recipes-extended/ghostscript/ghostscript/i686
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblaze/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/microblazeel/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn32eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn32el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn64eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarchn64el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarcho32eb/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mipsarcho32el/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86-64/objarch.h
 rename meta/recipes-extended/ghostscript/{ghostscript_9.50.bb => ghostscript_9.52.bb} (87%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.20.bb => librsvg_2.40.21.bb} (92%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.7.bb => xserver-xorg_1.20.8.bb} (89%)

-- 
2.17.1

