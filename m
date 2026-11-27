Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1451.1795801775988262860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FoUq7XS2;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so4966867f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801774; x=1796406574; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpJ4aO4O2TCM10VbaI0CQYNJD9X02EkF7eFvQWGqcbk=;
        b=FoUq7XS2cW7NY80pt/0Ixx+9DVPg6uBXwLfotGY+wausyuCuVgu4qHKL8OO3yee0lf
         mwTYBkSqUxL1AklPSmIqMxLqHY3Y08vkkNPyF8CP902Z/EXR480r3G1DORUxQ3dEbJqW
         sulExMygHDhE4rHHg0IEQJEGi9xz1MOnno1mpzXk52wVx4W0VBcQ+W1sNomPimrmnMlI
         tWqdi/vt3KB0pMroJuzR8xwMJpyQwAErFvG+WBelo9bfUdCyNOhXJ28VRBCNxloA9+xP
         Pv9vBR0/ifsGw9+kpTei6kYWbtvitsB9/nACQhlTbRDGtziaW51WA+S6CKqKVMfOBvnD
         RXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801774; x=1796406574;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpJ4aO4O2TCM10VbaI0CQYNJD9X02EkF7eFvQWGqcbk=;
        b=YpM5d0VTxZzfCHtklUKcJLoJZJYYtGdZbPvITZFhmUGVFiHu5tOek9JXFERTOu9VqZ
         owSCfWTElQJvKhkM39Wp/SpBd9M2XVUzBbaVZgrD8Lvzy+/QmQYHYie+wDetVxUEojuI
         kh3/JeDOREDhAgd67HfsgKmxy+TlvR8RSFCm7yM38PAftNmzjUZoi9iiflwOethSRgYM
         lgqBkx07tnZ2u3wEB6xFFOq0rtvkBRrdVtK0aVhEK7s58CnR7WNHZRzEhovCJ4QyI4HG
         k5iauEbw70wXYPzMjAQlomb88SnPH2h719SMsvHDadE6ujoAMv2CCMP+1AEAU8jauC6V
         45NA==
X-Gm-Message-State: APuU4Z8Mx82uws62jb90oP1CgrDh3dF6erj8NiEpOEdDpTKf5Nx/1ydE
	vT3kxZy4NWwnT+cOSYLL2Ooum6iNwysbHg9Tc/zpxF7Ehu75WPfI5tOQUcD+sHpdHqy80+h+8Ks
	pTb5JUAA=
X-Gm-Gg: AZFdTZccsH9yC4pcrEQ76ovJ1qe2ZWkWRwuUC5NotnF/Q4XbWesoYWg465TXQVZ+nPR
	THDZr+6NcVJI9pQZ2dX9A0iZ3+fXYc4+1pn6k4B5GGRpeD069FNtsIP7TBqY1p1kv5u7Eib8ID7
	cZJF+NLTHUIbIj/M0piA8CXKjydZIL6zr1nQWde8vi8QEstKd1FeATJ5Q6UbW/ol/iClI5Vwu2M
	hyxaSAxP0SYHOg3V4FYcyjaBHRxT4fGKUIchjE9lxwVkwczA5z1gutX2fKNOxuKqwsLewUK+WfE
	xwx0yEMRVumM677V6kaXr8Yoly8MNdhJ88DaSZIuEOzLVK4X04sWJ5u4XvC3bpvN4klF5TJSiIh
	TMAOPVPAJErggt4EAoTuGgJ4roZCJouKiO83ykM/fkiRFWIaXJhbnFOa9eiSIxjAJoiVL6uGWSQ
	jJoMo9jOskLtUfela8Cw196FZZpObcLcFpr1SFQl92tOeoYuHpFlT+dkx+yNN/EpY415YTj7/H8
	A+3U0fp4zj21sfsOhddUhrVsrC83waHLbzvODUv/OKYipTnTHdek/mI7HKQ2lKPwq1ljSh+yNw5
	xhdISJTpFGes77LB19OtyYjtzcETGJqBs4X3m8whjmlwnPvhSR4pkwmpmjR7GlsAKXQO1/Z6zPD
	ocIQqXoQQfEK59Cp6dc+go/yCEbsF
X-Received: by 2002:a5d:5d88:0:b0:4b4:510c:51da with SMTP id ffacd0b85a97d-4b4510c553amr34438525f8f.11.1795801774026;
        Fri, 27 Nov 2026 09:49:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/37] Patch review
Date: Fri, 27 Nov 2026 18:48:43 +0100
Message-ID: <cover.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251406
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, December 1.

This series is the last one before releasing 5.0.22.

Highlighted patches:
* dropbear: add follow-up patches for CVE-2019-6111:
  This might change user-visible behavior: a Remote to local "scp -r"
  into an existing directory will now return an error.
* Sunil Dora (2):
  rust-llvm: build and install the LLVM shared library
  rust: enable dynamic LLVM linking by default
  These change how LLVM is integrated into the rust compiler but this
  will allow us to officialy support Ubuntu 26.04 on scarthgap
  See https://lore.kernel.org/openembedded-core/DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5200
* buildtools/5105 failed on what is most likely a NFS glitch.
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/43/builds/5108
* oe-selftest-fedora/5159 failed with what looks like an old closed
  AB-INT bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13827
  Retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/5162
* qemuarm64-ptest/4991 failed with 16267 – [scarthgap] AB-INT PTEST: python3 failure (test_wrong_cert_tls13)
  retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4994
I don't think any of those are related to this series.

The following changes since commit d521a7d8364fe038ce5205003170e80de218a83a:

  aspell: upgrade 0.60.8.1 -> 0.60.8.2 (2026-11-20 16:25:55 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 3948efd5497c7ad5dcb71aedc47cae6dfb72d65b:

  rust: enable dynamic LLVM linking by default (2026-11-27 12:00:41 +0100)

----------------------------------------------------------------

Anders Heimer (1):
  python3-certifi: correct license to MPL-2.0

Ankur Tyagi (2):
  aspell: upgrade 0.60.8.2 -> 0.60.8.3
  tzdata/tzcode-native: upgrade 2026e -> 2026f

Arpit Patel (8):
  sqlite3: fix CVE-2026-119374
  sqlite3: Fix CVE-2026-119377
  sqlite3: fix CVE-2026-119375
  sqlite3: fix CVE-2026-119372
  sqlite3: fix CVE-2026-119378
  sqlite3: fix CVE-2026-119376
  sqlite3: fix CVE-2026-119371
  sqlite3: fix CVE-2026-119591

Bruce Ashfield (2):
  linux-yocto/6.6: update to v6.6.162
  linux-yocto/6.6: perf cs-etm: fix a compilation issue in
    cs_etm_decoder__set_tid()

Colin Pinnell McAllister (1):
  ffmpeg: Fix CVE-2026-40962

Deepak Rathore (1):
  ruby: Upgrade 3.3.10 -> 3.3.14

Devansh Patel (1):
  curl: Fix CVE-2026-7168

Hetvi Thakar (1):
  go: Fix CVE-2026-33814

João Marcos Costa (Schneider Electric) (3):
  glibc: fix CVE-2026-84243
  sqlite3: fix CVE-2026-119373
  sqlite3: fix CVE-2026-119379

Peter Marko (8):
  boost: patch CVE-2023-34399
  popt: patch CVE-2026-18839
  dropbear: add follow-up patches for CVE-2019-6111
  dropbear: patch CVE-2026-35385
  libsndfile1: patch CVE-2024-50613
  libsndfile1: patch CVE-2025-52194
  libsndfile1: patch CVE-2026-109828
  speex: patch CVE-2026-116741

Prasanth R (2):
  gnupg: fix CVE-2026-57062
  gnupg: fix CVE-2026-105712

Richard Purdie (2):
  populate_sdk_ext: Fix locale error handling in SDK
  rust-llvm: Disable libedit

Rohini Sangam (1):
  libxml2: Security fix for CVE-2026-74860

Sunil Dora (2):
  rust-llvm: build and install the LLVM shared library
  rust: enable dynamic LLVM linking by default

Yoann Congal (1):
  linux-yocto/6.6: update CVE exclusions (6.6.162)

Yogita Urade (1):
  bison: fix CVE-2026-56390

 meta/classes-recipe/populate_sdk_ext.bbclass  |    2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |    2 +-
 ...2019-6111.patch => CVE-2019-6111-01.patch} |    0
 .../dropbear/dropbear/CVE-2019-6111-02.patch  |  364 +++++
 .../dropbear/dropbear/CVE-2019-6111-03.patch  |   43 +
 .../dropbear/dropbear/CVE-2019-6111-04.patch  |   34 +
 .../dropbear/dropbear/CVE-2019-6111-05.patch  |   43 +
 .../dropbear/dropbear/CVE-2026-35385.patch    |   42 +
 .../recipes-core/dropbear/dropbear_2022.83.bb |    7 +-
 .../glibc/glibc/CVE-2026-84243.patch          |  193 +++
 meta/recipes-core/glibc/glibc_2.39.bb         |    1 +
 .../libxml/libxml2/CVE-2026-74860.patch       |   35 +
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |    1 +
 .../bison/bison/CVE-2026-56390.patch          |  230 +++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |    1 +
 meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
 .../go/go/CVE-2026-33814.patch                |   44 +
 .../python/python3-certifi_2026.10.19.bb      |    2 +-
 ...x-cross-compilation-of-external-gems.patch |   11 +-
 ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch |    7 +-
 ...doc-build-reproducible-documentation.patch |   16 +-
 ...-list-of-object-files-in-generated-M.patch |    7 +-
 ...eproducible-change-fixing-784225-too.patch |    7 +-
 .../0006-Make-gemspecs-reproducible.patch     |    5 +-
 ..._rm_r_no_permissions-test-under-root.patch |    5 +-
 .../ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb}   |    2 +-
 .../recipes-devtools/rust/rust-llvm_1.75.0.bb |   16 +-
 meta/recipes-devtools/rust/rust_1.75.0.bb     |    4 +
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 .../linux/cve-exclusion_6.6.inc               | 1322 +++++++++++++++--
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 .../ffmpeg/ffmpeg/CVE-2026-40962.patch        |   61 +
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |    1 +
 .../libsndfile1/CVE-2024-50613.patch          |  348 +++++
 .../libsndfile1/CVE-2025-52194.patch          |   27 +
 .../libsndfile1/CVE-2026-109828-01.patch      |  234 +++
 .../libsndfile1/CVE-2026-109828-02.patch      |   26 +
 .../libsndfile/libsndfile1_1.2.2.bb           |    4 +
 .../speex/speex/CVE-2026-116741.patch         |   29 +
 meta/recipes-multimedia/speex/speex_1.2.1.bb  |    5 +-
 ...{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} |    2 +-
 .../boost/boost/CVE-2023-34399.patch          |   35 +
 meta/recipes-support/boost/boost_1.84.0.bb    |    1 +
 .../curl/curl/CVE-2026-7168.patch             |   83 ++
 meta/recipes-support/curl/curl_8.7.1.bb       |    1 +
 .../gnupg/CVE-2026-105712-regression.patch    |   40 +
 .../gnupg/gnupg/CVE-2026-105712.patch         |  194 +++
 .../gnupg/gnupg/CVE-2026-57062.patch          |   43 +
 meta/recipes-support/gnupg/gnupg_2.4.9.bb     |    3 +
 .../popt/popt/CVE-2026-18839-01.patch         |   89 ++
 .../popt/popt/CVE-2026-18839-02.patch         |  419 ++++++
 meta/recipes-support/popt/popt_1.19.bb        |    2 +
 .../sqlite3/CVE-2026-119371-dependent.patch   |  109 ++
 .../sqlite/sqlite3/CVE-2026-119371.patch      |  104 ++
 .../sqlite/sqlite3/CVE-2026-119372.patch      |   56 +
 .../sqlite/sqlite3/CVE-2026-119373.patch      |   48 +
 .../sqlite/sqlite3/CVE-2026-119374.patch      |   78 +
 .../sqlite/sqlite3/CVE-2026-119375.patch      |   47 +
 .../sqlite/sqlite3/CVE-2026-119376.patch      |   75 +
 .../CVE-2026-119377-dependent_p1.patch        |   86 ++
 .../CVE-2026-119377-dependent_p2.patch        |   59 +
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   |   52 +
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   |   51 +
 .../sqlite/sqlite3/CVE-2026-119378.patch      |   52 +
 .../sqlite/sqlite3/CVE-2026-119379.patch      |   70 +
 .../sqlite/sqlite3/CVE-2026-119591.patch      |   40 +
 meta/recipes-support/sqlite/sqlite3_3.45.3.bb |   14 +
 69 files changed, 4931 insertions(+), 150 deletions(-)
 rename meta/recipes-core/dropbear/dropbear/{CVE-2019-6111.patch => CVE-2019-6111-01.patch} (100%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-05.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-84243.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-33814.patch
 rename meta/recipes-devtools/ruby/{ruby_3.3.10.bb => ruby_3.3.14.bb} (98%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-40962.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712-regression.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-105712.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

