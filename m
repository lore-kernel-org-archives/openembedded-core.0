Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3C4C41535
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 02:18:13 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.13126.1703038687600135557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 18:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XIbZfuhi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d855efb920so4140627a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703038686; x=1703643486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak0pUh8Qh2QSEPEI28qU1yGJlAU6Ctpv6Qs9yyiHRQ0=;
        b=XIbZfuhi+N0cy/PMdrgvpLGcUBoX28W6wYsgct3D0HnT4//S5jB7F3cvLRPzxClM0C
         lMgZ/HAHaneH4p24ie+9r4+sYd8dGlBQ0FaqC7S+SSk+o6g1j7lLD7svlyu1xqV6ffRD
         ipJLlDXN4x8poTgb8Ox7jIqoIoXU8eJfAaVVERrlF8waw1zTi2bVkgaMIW1nrSmkWKwi
         /24b1+aqsIOtTJqed2FgVDNiRaOvkDi8rYWHOz4Y+PsPbzxQ8fBbbYZY6BKOrE+I/Qhl
         t/Cy7z28zwW0eMkoiICK4/9/mt+4flv40TDwhZ3uj7HkZ2kGew/3z1/gcA1hvYg7+VcP
         JyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703038686; x=1703643486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak0pUh8Qh2QSEPEI28qU1yGJlAU6Ctpv6Qs9yyiHRQ0=;
        b=QjFbX9NXSiiCCQpW9Dux9IzGwyvaCTbJuUGX2I9g+8zbeLOQzZaGMNwiRs+kH9ffg6
         CETv0rhqK3L17dGOvfeclS9FjO+9UiluoiluAQk8l+WTOvpouVKKkjct3WCk+11XmR74
         4kxIUK9CKlsTeqvjUw3OAokzgnNQVvqPXFPhILcRIfKzxYN17QYjJNA7use7JJHi58zM
         3+ty462U/k8h/vz6ucv1uR7MSpOXTQYiGwwvrGPKknzbnyAumQw2lrsUI89r4koj1/mk
         1NzRDvX0Yy4v0yELy4BDoq5e73M7C8Xm6yaSetb+Yt6+S397ckC877liDMB0YnZtfnEL
         UlYw==
X-Gm-Message-State: AOJu0Yx+94qkh95kVggyg48IOv2RYWLAiZsKtYhaNVHQLprN3z7mjjno
	EgG2yAkq8k8OV8H39J22Pu+6/F5IR4A+JLCI7DJxzw==
X-Google-Smtp-Source: AGHT+IGj40ch7PlOMB/1llDH8NI9lr1UdYfvc2buOX5fyY7YuIWeaBQoG2ZAHVomXC3BCp1xMPxs7g==
X-Received: by 2002:a05:6808:320a:b0:3ba:9d:9b54 with SMTP id cb10-20020a056808320a00b003ba009d9b54mr28954500oib.14.1703038685861;
        Tue, 19 Dec 2023 18:18:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d6-20020aa78146000000b006d945660076sm367103pfn.59.2023.12.19.18.18.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 18:18:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 0/9] Patch review
Date: Tue, 19 Dec 2023 16:17:50 -1000
Message-Id: <cover.1703038443.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192759

Please review this set of changes for nanbield and have comments back by
end of day Thursday, December 21

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6350

The following changes since commit 427c43d8e3315fa6872feaa71d135de60c810de7:

  sstate: Ensure sstate searches update file mtime (2023-12-08 07:15:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/nanbield-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/nanbield-nut

Lee Chee Yang (5):
  avahi: add CVE-2023-38473.patch to SRC_URL
  grub: fix CVE-2023-4692 CVE-2023-4693
  curl: fix CVE-2023-46218
  perlcross: update to 1.5.2
  perl: 5.38.0 -> 5.38.2

Rasmus Villemoes (1):
  perf: lift TARGET_CC_ARCH modification out of security_flags.inc

Sundeep KOKKONDA (2):
  glibc: stable 2.38 branch updates
  binutils: stable 2.41 branch updates

Wang Mingyu (1):
  ghostscript: upgrade 10.02.0 -> 10.02.1

 meta/conf/distro/include/security_flags.inc   |  1 -
 .../grub/files/CVE-2023-4692.patch            | 97 +++++++++++++++++++
 .../grub/files/CVE-2023-4693.patch            | 62 ++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 .../binutils/binutils-2.41.inc                |  2 +-
 ...mt.sh-add-32-bit-integer-format-defi.patch | 28 ------
 .../{perlcross_1.5.bb => perlcross_1.5.2.bb}  |  3 +-
 .../perl/{perl_5.38.0.bb => perl_5.38.2.bb}   |  2 +-
 ...ript_10.02.0.bb => ghostscript_10.02.1.bb} |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  9 ++
 .../curl/curl/CVE-2023-46218.patch            | 52 ++++++++++
 meta/recipes-support/curl/curl_8.4.0.bb       |  1 +
 14 files changed, 229 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4693.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_pfmt.sh-add-32-bit-integer-format-defi.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.5.bb => perlcross_1.5.2.bb} (86%)
 rename meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} (99%)
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.0.bb => ghostscript_10.02.1.bb} (97%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

-- 
2.34.1


