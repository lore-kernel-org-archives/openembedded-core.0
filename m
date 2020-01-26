Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 47F2A916B1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:24:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id n96so1998782pjc.3
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=FPug8vlGr80pvmhTOtYjoFGGKFXvOuepd0AAYyDRoJY=;
	b=DwCfRQmwx1jwwny7iSG9zHBklQ92siyzevUUDi46fk8z2IHkjR3KBmrQESUebdewCR
	qKQQFfuMP8KsUTsNMIh/3oeVptUFRsszOn2JXf5rKqfgZIvUM8vLW6XsH+4v0Zj5LqYg
	tdovunwtCgOZeQaynIZ3ep7mxmzg2zs6i3987B7PsSF6uwROnipkaeVFlvmL0TQfVQJB
	NvoBNTlflV98jpb8mD2HDm/CgC3B9o8Avw2L+u79c6Fm+8/YWr+ChGIDMWmesOTzB3Pj
	byzgTsGv/Sf6CV3pZaHdKtcx+0csN2t9EG7g3ivBfxPUygelWAF32G9tbTq7obAe+1s6
	Pw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FPug8vlGr80pvmhTOtYjoFGGKFXvOuepd0AAYyDRoJY=;
	b=SwKsCTwx1SHMWjhJNqSPcSL7/MrhdeHnX/yDzSL5zuYYFzD5v39+wzS+3hVqGUFUO3
	nIu5ecdfx/hu0S/7sUMT3BcZ7Mq+5UiDF8hbXRzEhIWHqG0CV/Yom53eYGT4H6Z/PSh6
	FfJUzve6RqbKMSNdumRmEfaDrc6ZOfYnQuebCYCccinxQ8x4IpvH9vBYLmbmW9NXZGTS
	2fEJZTH0Q7S35eZp0YYDdypuq6axUn4CnAB0N6q4JCB4xoITgmoxqtjMkcaPKZAWTloA
	Kj5VQjnxy3pDQpju49fv4arZCsgkLbGatoY7S9ai5HqCBk+EjDXG2g3UMg6Z7nRoeze6
	Z2KQ==
X-Gm-Message-State: APjAAAX+zZ8aM+QH1uznbEcVN6sRCat6ifjQ3S7RE3x3fD5hbIMKUGF2
	1+ENc/VsBeHyAZa9GYRqwC39ExzF
X-Google-Smtp-Source: APXvYqyaWrSEyglCb6k62dnWSAffxJyRi2biwE8lN0DLGciMfVFit0pZPfTZ93cjSVBw9QUVXG+B3g==
X-Received: by 2002:a17:90a:e389:: with SMTP id
	b9mr10000116pjz.7.1580055897274; 
	Sun, 26 Jan 2020 08:24:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.24.56
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:24:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:25 -0800
Message-Id: <cover.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior 00/29] Merge request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jan 2020 16:24:57 -0000

Please consider this for warrior.
All changes have already been posted on list

The following changes since commit 279c4da2e5f46dccfeff0c898c2205940be9e174:

  stress: update SRC_URI (2020-01-11 19:39:37 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org//log/?h=stable/warrior-next

Adrian Bunk (13):
  python: Whitelist CVE-2017-17522 CVE-2017-18207 CVE-2015-5652
  python/python3: Whitelist CVE-2019-18348
  python3: Upgrade 3.7.5 -> 3.7.6
  bind: Whitelist CVE-2019-6470
  lighttpd: Backport the CVE-2019-11072 fix
  glib-2.0: Backport the CVE-2019-12450 fix
  lz4: Whitelist CVE-2014-4715
  iputils: Whitelist CVE-2000-1213 CVE-2000-1214
  systemd: Whitelist CVE-2018-21029 CVE-2019-3843 CVE-2019-3844
  systemd: Upgrade to a more recent snapshot from the 241 branch
  openssl: Upgrade 1.1.1b -> 1.1.1c
  openssl: Upgrade 1.1.1c -> 1.1.1d
  openssl: Whitelist CVE-2019-0190

Anuj Mittal (6):
  libarchive: fix CVE-2019-19221
  glibc: fix CVE-2019-19126
  nasm: fix CVE-2018-19755
  nasm: fix CVE-2019-14248
  sysstat: fix CVE-2019-19725
  openssl: fix CVE-2019-1551

Hongxu Jia (1):
  go: fix CVE-2019-17596

Joshua Watt (1):
  python3: RDEPEND on libgcc

Khem Raj (1):
  openssl: Enable os option for with-rand-seed as well

Mattias Hansson (1):
  base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot

Peter Kjellerstedt (2):
  populate_sdk_ext.bbclass: No longer needed to clean away
    conf/sanity_info
  sanity.bbclass: Move sanity_info from conf to cache

Ross Burton (1):
  wpa-supplicant: fix CVE-2019-16275

Trevor Gamblin (2):
  binutils: fix CVE-2019-17450
  binutils: fix CVE-2019-17451

Vinay Kumar (1):
  gdb: Fix CVE-2019-1010180

 meta/classes/base.bbclass                     |   1 +
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/sanity.bbclass                   |   2 +-
 meta/lib/oeqa/buildperf/base.py               |   2 +-
 .../bind/bind_9.11.5-P4.bb                    |   4 +
 .../openssl/openssl/CVE-2019-1543.patch       |  69 --
 .../openssl/openssl/CVE-2019-1551.patch       | 758 ++++++++++++++++++
 .../openssl/openssl/afalg.patch               |   6 +-
 .../{openssl_1.1.1b.bb => openssl_1.1.1d.bb}  |  16 +-
 ...re-management-frame-from-unexpected-.patch |  82 ++
 .../wpa-supplicant/wpa-supplicant_2.7.bb      |   1 +
 ...e-Limit-access-to-files-when-copying.patch |  57 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb |   1 +
 .../glibc/glibc/CVE-2019-19126.patch          |  32 +
 meta/recipes-core/glibc/glibc_2.29.bb         |   1 +
 meta/recipes-core/systemd/systemd.inc         |   9 +-
 .../binutils/binutils-2.32.inc                |   2 +
 .../binutils/binutils/CVE-2019-17450.patch    |  99 +++
 .../binutils/binutils/CVE-2019-17451.patch    |  51 ++
 meta/recipes-devtools/gdb/gdb-8.2.1.inc       |   1 +
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 +++
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 .../go/go-1.12/0010-fix-CVE-2019-17596.patch  |  42 +
 .../nasm/nasm/CVE-2018-19755.patch            | 116 +++
 .../nasm/nasm/CVE-2019-14248.patch            |  43 +
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   5 +-
 meta/recipes-devtools/python/python.inc       |  13 +
 .../{python3_3.7.5.bb => python3_3.7.6.bb}    |   9 +-
 .../iputils/iputils_s20180629.bb              |   4 +
 .../libarchive/CVE-2019-19221.patch           | 101 +++
 .../libarchive/libarchive_3.3.3.bb            |   1 +
 ...x-abort-in-http-parseopts-fixes-2945.patch |  54 ++
 .../lighttpd/lighttpd_1.4.53.bb               |   1 +
 .../sysstat/sysstat/CVE-2019-19725.patch      |  28 +
 .../sysstat/sysstat_12.1.3.bb                 |   4 +-
 meta/recipes-support/lz4/lz4_1.8.3.bb         |   3 +
 36 files changed, 1667 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1b.bb => openssl_1.1.1d.bb} (92%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-Silently-ignore-management-frame-from-unexpected-.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gfile-Limit-access-to-files-when-copying.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
 rename meta/recipes-devtools/python/{python3_3.7.5.bb => python3_3.7.6.bb} (97%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
 create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-core-fix-abort-in-http-parseopts-fixes-2945.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch

-- 
2.17.1


