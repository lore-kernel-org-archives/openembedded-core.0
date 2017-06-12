Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE83780C3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 14:59:03 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s66so2077231pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 07:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lmliSnJqG1FqYSaNMf/r/CRNWHZLLcPXY/Oqdz3Uhg0=;
	b=VhBpAP7GvzYBB3Hbv24MU6C2Pfn/IcsrGBKAZ+4Ps4unoAI+J69214uXhyqq+cDWuQ
	++n5hpitRxojUWC9Grf7Rh5kI16TxrO3mBq4r/hhvCQMXWPd+LIhuwo7NnzzAhbhiqTD
	kDYjFKmTxxCeVIij5Xx34z9z9bhfWZwox+GijSnAqnScUb9TyfpIeRXoKKEldRJjobe+
	/J/WkX6qjWjtmZz5s9L3cM63WoPOahD0MckcLvX3YVcTVRpM9YwrYcTKb+DYAUvPM9A+
	rjtlqmPv8mvWQB5edzqWWrwgBZbJBKYxh+KSWKov36nEgBOYm4h1yU7x2oOVxIWlBU2P
	wnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lmliSnJqG1FqYSaNMf/r/CRNWHZLLcPXY/Oqdz3Uhg0=;
	b=n3TyR/n+gaeMEyZo8nqQqXvu0n4flIVUmhMKKGgnWYIRXkUaTeCO8G9E3vOJ6nQq2r
	NNCWJK6SU0t3awAQY8inrwKZIa2fhw8aVx+JisM/jEL1YEBDOcUPerx2k36L082YCGxZ
	Rx8KjZTGlyWBcVx10Xq58MBzjQvHEckzCJEz2xi8q/6qieSOW9XMfKjl65dOhpUs+GoG
	rrbQwAwHklu9BzCdslAy0F+qZxbIXO45uep0ilbAW43CS43kfwSI5Gu3vqj3N10wVfW5
	ZVgU6JL+97CipCHT5AY83VUhLemVM9B8VnmMMDLo+41AwCzFybP35WX004nBP9dneKqB
	EqUA==
X-Gm-Message-State: AODbwcBsehJPavL8k1xTe/Qj+vadCzz4JToW0cQOa+HcqcAWvHmW8vG7
	HgkDYNOkGfRnO+fu
X-Received: by 10.84.135.1 with SMTP id 1mr47268407pli.185.1497279544398;
	Mon, 12 Jun 2017 07:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	p73sm3587684pfd.79.2017.06.12.07.59.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 07:59:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jun 2017 07:58:53 -0700
Message-Id: <cover.1497279306.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH 0/7] Misc recipe fixes and updates
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
X-List-Received-Date: Mon, 12 Jun 2017 14:59:03 -0000

* Upgrade binutils to latest on 2.28 release
* Add fixes to recipe to compile with upcoming glibc 2.26 release
* Prepare recipes to let gcc pass -pie flags itself when configured

The following changes since commit aea90e9ee6f34e7c1c08307080b1e29646668df6:

  package.bbclass: Restore functionality to detect RPM dependencies (2017-06-12 15:24:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (7):
  mpg123: Upgrade to 1.25.0
  binutils-2.28: Update to latest on release branch
  ltp: Include stdint.h for uintptr_t
  libnsl2: Include stdint.h
  valgrind: Fix ptest build with musl
  kexec-tools: Pass -no-pie to linker
  ovmf: Update to latest

 ...g-UefiHiiLib-Fix-incorrect-comparison-exp.patch | 45 --------------------
 .../ovmf/ovmf/0001-ia32-Dont-use-pie.patch         | 37 ++++++++++++++++
 ...makefile-adjust-to-build-in-under-bitbake.patch | 25 ++++++-----
 .../ovmf/ovmf/no-stack-protector-all-archs.patch   | 19 +++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  6 ++-
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  2 +-
 .../binutils/binutils/CVE-2017-6965.patch          | 15 -------
 .../binutils/binutils/CVE-2017-6966.patch          | 20 ---------
 .../binutils/binutils/CVE-2017-6969.patch          | 14 -------
 .../binutils/binutils/CVE-2017-6969_2.patch        | 18 --------
 .../binutils/binutils/CVE-2017-7209.patch          | 14 -------
 .../binutils/binutils/CVE-2017-7210.patch          | 15 -------
 ...e-Rename-_sifields-to-__si_fields-on-musl.patch | 31 ++++++++++++++
 ...tr_tester.c-Limit-rawmemchr-test-to-glibc.patch | 39 +++++++++++++++++
 ...02-context-APIs-are-not-available-on-musl.patch | 49 ++++++++++++++++++++++
 ...rrect-include-directive-path-for-config.h.patch | 45 ++++++++++++++++++++
 ...4-pth_atfork1.c-Define-error-API-for-musl.patch | 37 ++++++++++++++++
 ...erifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch | 30 +++++++++++++
 ...d3.c-Dereference-pthread_t-before-adding-.patch | 32 ++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  | 12 ++++++
 ...Include-stdint.h-for-uintptr_t-definition.patch | 27 ++++++++++++
 meta/recipes-extended/libnsl/libnsl2_git.bb        |  1 +
 .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   | 34 +++++++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |  1 +
 .../kexec-tools/0001-Disable-PIE-during-link.patch | 31 ++++++++++++++
 .../kexec/kexec-tools/0001-arm64-Disable-PIC.patch | 31 ++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb    |  2 +
 .../mpg123/{mpg123_1.24.0.bb => mpg123_1.25.0.bb}  | 10 +----
 28 files changed, 477 insertions(+), 165 deletions(-)
 delete mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdeModulePkg-UefiHiiLib-Fix-incorrect-comparison-exp.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-ia32-Dont-use-pie.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/no-stack-protector-all-archs.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-pth_atfork1.c-Define-error-API-for-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
 create mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Disable-PIE-during-link.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
 rename meta/recipes-multimedia/mpg123/{mpg123_1.24.0.bb => mpg123_1.25.0.bb} (87%)

-- 
2.13.1


