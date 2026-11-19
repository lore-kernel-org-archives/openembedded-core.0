Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.89.1795101860301604873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=OsYefO3O;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so22926825e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101858; x=1795706658; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AJ5MIiDfw6plURD921Kam4bUKM0BmKBsUFsaTEwB8c=;
        b=OsYefO3OnRLWplwqzLJ9cMNztYe5e7eCrIqsTbfkp54Lg1ePMsYaL36M1V3tGvH3uU
         +q0KS2jHWHSQMbJ34h+qEvosOQUx3WhLu5bcZs7oLbeIxA0P9VPjPJsX26ukOOIxLnSW
         A1FEy8Z6I5tTz9SwsR5V510VsVrqOsLkyFXMgCJLv/ZWOCecOnlt1qIRlK6M8kajUeCg
         bJn6J/7dbhGqGe2NGgPAjC6vlA6l6wmimbptlCLlPInHU2Yn/KkLMjGIFx64QsH27CbW
         GG9M5j2Di/1YtdudwikdvE0Klma3ucX2+4Qu1JvgW1M89qUa7dZ4FmS2PRi7IvMgLFjq
         6FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101858; x=1795706658;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AJ5MIiDfw6plURD921Kam4bUKM0BmKBsUFsaTEwB8c=;
        b=J0Juf1aS4pT1p6Kui2YVkz5s4FAFKoN6Bv1JeKGUbWsWAD83PNs30w9kzKPcIEsnzk
         lJPSIPUBLXQNJL6Ip22lJ/86KC+rphPDwhyV+1K8pS802cf1z62S7M6zyIP0jh/dCOBr
         mpZQsZQl0qfE2FFan3rwldNqyvoSvU406zLlw8LsbLu6fQHvhI52/jMe9mplB8bdCqih
         M405c/WaxIm5lzgR/TLVnmtAvhxYvszIWcybTIR0sXIVfz/ndZT1ECmdgbnOTNRLWlAK
         rkyy3tWUl0QFf5yKBYK3rqEQFR9zd+pBJFzk1TSVWe7vL4wjAvbqaHj5lIb1TnmhN87q
         Q0jw==
X-Gm-Message-State: APuU4Z+guqXB1G+uMCkBvQf5nqKg2SKBp16eouLR4k+5WuFPE0smc9S+
	SEDABlu+nOtsaaK3BPgGCLNQtaGQSb3OVHB+/YN3aVTxoUlnuqA9HuJVM460rgje1wNrLY+xDDY
	2cRHZD2g=
X-Gm-Gg: AYBFou0/ljeV65jFADqoLhieuvxB2QVJoMqzFCcEeqFIus4gRaYsiV43mmtbEjiAiR4
	5dH1s67DhLTKGVF7K7BHOXHglZmZ19Q3jRSNtQS9XG0Nf6iiXKEZJt0s71tJOKyTJbeso0Rqm2f
	GAzqJSS+bhudFAgXMIetpmFbnbC3zepj6mRmjSSgKptaUzndG4OdfitlhYSNwzBcXzAmQvorcPe
	PgT20Amgi+QDladx+OZfNcNs6UFuMj85U7WaKJCUZtYqoFGIrI5+aXfa6uNgA8xDa7yKPSFq663
	NjtWcobXK6rbPyhe9gWEN/mN91bmbXxwmHBl2GpE9JSBpPs5QBMDHObgXq4D6yp67LOsG/OM/QM
	PqNRiOLhK4SE+1c52SLw9UFvtWm0zEKpl/c0wUa1QHIrrjuri/wKwwDU7/Vu2BVlM68x19RAr/1
	dCBtAVvDhsf9jzyh6Z9n7u1QOHnLMFzE6nkEVonCvVpyh8F+ePAzD5bSeSpUz0UaPZpC4WyLlHP
	NB46xrbZkjogDlHb4cxsxLjV0AdVslytawKMfdRdIus7g73utRxAhANZi4qQy7xQKWME2DouxNy
	RE2y5F0BoMm7akKKtbjjYOmx+y1xMp9uFap9ZEzFuDkrFjgiOilF48VZTxzA9Rv7ViSPE7L5ulb
	eEh2bSbN9w1Ysn1r+3om85+E5Y+PakF6q1x3pNakN2kclM199I8WAuxI=
X-Received: by 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr134375485e9.19.1795101857806;
        Thu, 19 Nov 2026 07:24:17 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:17 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/19] Patch review
Date: Thu, 19 Nov 2026 16:22:26 +0100
Message-ID: <cover.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250683
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for scarthgap and have comments back by
end of day Monday, November 23.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5152

The following changes since commit fc4316861becc9f0d41857b49f6438929ab4c291:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-10 10:47:42 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 4dec16113d0fdd009bc78d75bcab843454367c40:

  aspell: upgrade 0.60.8.1 -> 0.60.8.2 (2026-11-19 09:16:30 +0100)

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

Yoann Congal (2):
  pseudo: Upgrade 1.9.11 -> 1.9.12+git
  TEST-pseudo: test patches

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
 ...ree-tests-when-the-function-or-sysca.patch | 157 ++++++
 ...-t-generate-unused-_int-paths-with-n.patch |  59 +++
 ...ts-linux-Don-t-require-linux-mount.h.patch |  67 +++
 ...004-configure-Require-GCC-5-or-later.patch |  76 +++
 ...erialize-path-changes-across-clients.patch | 339 ++++++++++++
 ...ath-lock-in-create-and-metadata-wrap.patch | 182 +++++++
 ...ted-files-under-the-path-lock-before.patch | 248 +++++++++
 ...s-Add-a-parallel-create-rename-link-.patch |  87 ++++
 ...Add-information-specific-to-file-pro.patch | 216 ++++++++
 ...S.md-Add-to-assist-future-developers.patch | 113 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  16 +-
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
 39 files changed, 4087 insertions(+), 200 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-19667-2.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0049-CVE-2026-86805-CVE-2026-95818.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-CVE-2026-102010.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-1.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-2.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6068-3.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-test-Skip-open_tree-tests-when-the-function-or-sysca.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0002-makewrappers-Don-t-generate-unused-_int-paths-with-n.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0003-ports-linux-Don-t-require-linux-mount.h.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0004-configure-Require-GCC-5-or-later.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0005-pseudo_client-serialize-path-changes-across-clients.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0006-ports-hold-the-path-lock-in-create-and-metadata-wrap.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0007-ports-check-created-files-under-the-path-lock-before.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0008-test-parallel-ops-Add-a-parallel-create-rename-link-.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0009-README.security-Add-information-specific-to-file-pro.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/0010-AGENTS.md-Add-to-assist-future-developers.patch
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

