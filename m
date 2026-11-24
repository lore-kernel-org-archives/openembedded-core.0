Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14274.1795511141355330392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Q890+nKu;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so30525775e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795511139; x=1796115939; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fbAv3KVpekwDbw8mKZC/OpWuG8bKvDsK1ps4VdWKXw=;
        b=Q890+nKueR+CHdVT0oI+9p2hqc/gMroKSJixfVQoVXT9zRzp0JSM2NNDrvbXH60jLX
         DK90sF9bQmcaprz+83m3U2HRtcrVbSE9lMbd6nUHL4VCJKg6/h5ej4qN8vkFPyIAyanC
         Iwr0XQPd/PS4+P2OP2PZGF0FerGtpsNa0prkMUCWwL87AxrrrSHQfRKZ2kXWdzV1cnoR
         o42qqpz8whs7wWsFDiNSSqDPnLdH/0UwoNVq7+Yo4ZWf4WQYSAmWBpJGLCbpQntkxqw9
         wNbe7NCosD4PblBN+eXpc0iwTS+3r46Z247lSQK7wzcA+Dmvhe8+5ipmqlfOyMt8Pi0H
         tGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511139; x=1796115939;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/fbAv3KVpekwDbw8mKZC/OpWuG8bKvDsK1ps4VdWKXw=;
        b=2s695LwAmjM/ApeTNMY2ysa2nFtJM/cqIvbAEM6g6pAZ6Xc5ycl/GM4jcNEMRtV5dq
         3iFJc2eZ7E2mec5yWoBI/0TMlNfHcE3qXcU0iiZPhcG9pRAT0h+RUNcQqp4OesQqgJkV
         vMTGsjmDbyjzTCpAvDEaFCqrZl1jS5LbB9q23eW9mxQcqBQT/FnjQd/OPwbkvNhqxdEN
         4a8dEUkNU065/P/PWD3kXcO3zCiJj6s9wPWHAJ02zP34+DQLc6lpFVXQX6HaDThJDMEg
         /2VCdiKAU+fdNqlP/6/KChPksgFaEqjvUrGviOJjtPKHr5NCIaZwtmnMshPP7QWgyL4r
         ROTg==
X-Gm-Message-State: APuU4Z8qRD8C34QGQU5DZI0Ut76hI+nhs7uJEOdyJ0r3IKeLN/FijAb1
	5s0IpFEmw1sb1yEsKzCk49UDdCZ/EibvAevt70ofcU3uyxcWCjmJ9zBrrRGKlBp4bKyw7BHnI/N
	JVi1gwhE=
X-Gm-Gg: AZFdTZeeFIGuhtKaMB2e8GjPE1YHe8SQxB1M0cIUlUugCJ1M70PmPRCtbv26uYJRvyP
	qlomDhDuBQbeHtWnGeY5X3TAnv/g4ITb6DYj01ztSD0cZiNCJkYaorRCu0ucCMO0ivuSFc7+1Dv
	hRUWb5ocrTZZu3YFQ3pm2g9Ip+m4T9Vr3l2nvd1Rn9zrpPS4+wrxOeojQweYyjUeI2a68KI/1nc
	jkL4oL+kdG9sYUdQRpFe8jKHBD8nhbxU69ZaLqS639kgQXehdxOWRCdw5W2aRrkm2sVDWJepb2P
	Dd48VDd+kDrwTlobjfqel9s0BTQfvOEWbA2yJBPiZrYpgCzQSWdTIFebE3iZDdKsFWtNX/NwAPZ
	6/NbvuD1FyJArDfOxljuKWXCbpuOArSam2Mh42kKPJSTdeTm/LGyr9hRA0aFlmMZj52LJRKYd5f
	O9PjnVmmjdVthFronH/HwnpR7C3EEkml2Qpi/H4Q1+QgpdQOTbAzN5rnFuEgMzwtHDJY91w0nRX
	hxlC3TRjWywtArZuBnxhwDI4Nw+T+72p3CwKxGTlvDJahZwLzcL+MMCrTyyNtH0pPYYt1gOSR/F
	Gr/i7RQcWs9HOmd37+D+/RanTuLeRe3ee3OoK5C1cvKXj0ra2VF7b8dV00m6RNkLByCdypX1eA+
	NCsdnNTmJ7PI8iQLh2txRJER+V8J4qBBu58LIWXQl5LMdl5frz80JFskjBAQ3QXBjjkC+wvy1lu
	IyNyPtVtewuEo/khIox4MGsZIYbfMFsQwmkDY4SA==
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr300604595e9.20.1795511139229;
        Tue, 24 Nov 2026 01:05:39 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm603279415e9.11.2026.11.24.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:05:38 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/18] Pull request (cover letter only)
Date: Tue, 24 Nov 2026 10:04:21 +0100
Message-ID: <cover.1795509705.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250982
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:      
https://lore.kernel.org/openembedded-core/cover.1795101267.git.fabien.thomas@smile.fr/
* I removed "TEST-pseudo: test patches" that was not ready as is.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5152

The following changes since commit fc4316861becc9f0d41857b49f6438929ab4c291:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-10 10:47:42 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to d521a7d8364fe038ce5205003170e80de218a83a:

  aspell: upgrade 0.60.8.1 -> 0.60.8.2 (2026-11-20 16:25:55 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (3):
  curl: fix CVE-2026-92389
  curl: fix CVE-2026-92388
  curl: fix CVE-2026-87864

Alexander Yurkov (1):
  oeqa/selftest/recipetool: Update create_go test.

Darsh Kelaiya (2):
  curl: set CVE_STATUS for CVE-2026-19931
  curl: fix CVE-2026-18924

Fabien Thomas (1):
  vim: Fix for CVE-2026-73076

João Marcos Costa (Schneider Electric) (1):
  curl: fix CVE-2026-86409

Khem Raj (1):
  aspell: Backport a fix to build with gcc-15/clang-19

Kris Gavvala (2):
  nasm: fix CVE-2026-6067
  nasm: fix CVE-2026-6068

Peter Marko (3):
  popt: patch CVE-2026-18739
  glibc: patch CVE-2026-86805 and CVE-2026-95818
  gcc: patch CVE-2026-102010

Rohini Sangam (1):
  bind: Security fix for CVE-2026-19667

Wang Mingyu (1):
  aspell: upgrade 0.60.8.1 -> 0.60.8.2

Yoann Congal (1):
  pseudo: Upgrade 1.9.11 -> 1.9.12+git

Yogita Urade (1):
  python3-urllib3: Fix CVE-2026-97687

 meta/lib/oeqa/selftest/cases/recipetool.py    | 212 +-------
 .../bind/bind/CVE-2026-19667-1.patch          | 139 +++++
 .../bind/bind/CVE-2026-19667-2.patch          | 355 +++++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |   2 +
 .../0049-CVE-2026-86805-CVE-2026-95818.patch  | 267 ++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
 meta/recipes-devtools/gcc/gcc-13.5.inc        |   1 +
 .../gcc/gcc/0028-CVE-2026-102010.patch        |  68 +++
 .../nasm/nasm/CVE-2026-6067.patch             |  36 ++
 .../nasm/nasm/CVE-2026-6068-1.patch           |  98 ++++
 .../nasm/nasm/CVE-2026-6068-2.patch           |  80 +++
 .../nasm/nasm/CVE-2026-6068-3.patch           |  51 ++
 meta/recipes-devtools/nasm/nasm_2.16.03.bb    |   4 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 .../python3-urllib3/CVE-2026-97687_p1.patch   | 285 +++++++++++
 .../python3-urllib3/CVE-2026-97687_p2.patch   | 482 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   2 +
 ...{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} |   2 +-
 .../curl/curl/CVE-2026-18924.patch            |  56 ++
 .../curl/curl/CVE-2026-86409.patch            |  36 ++
 .../curl/curl/CVE-2026-87864.patch            |  52 ++
 .../curl/curl/CVE-2026-92388-1.patch          | 151 ++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  30 ++
 .../curl/curl/CVE-2026-92389.patch            |  60 +++
 meta/recipes-support/curl/curl_8.7.1.bb       |   7 +
 .../popt/popt/CVE-2026-18739.patch            |  92 ++++
 meta/recipes-support/popt/popt_1.19.bb        |   2 +
 .../vim/files/CVE-2026-73076.patch            | 155 ++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 29 files changed, 2533 insertions(+), 200 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-97687_p2.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.1.bb => aspell_0.60.8.2.bb} (93%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18739.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-73076.patch

