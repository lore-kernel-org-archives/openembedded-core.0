Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 069687705C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:31:29 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id b35so115275777qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ut8igeRZgLuHdSXdk7FQFWaap1MexfPWTpoT7ha+Cio=;
	b=FthbMFMfVFm2jaENd7U1CF4QyG0MUx+ljmrF7tbCuTsOmfO3kgR18iEgx7122tJas8
	iuJXllLNaIx4OK8UcJfv80BTKZJ7ifLs0pvmGdc/eBdGYc+ixwP/sYuGQCWdJrrHMVqV
	os4Tz9Vpn9HoUFlK6KOebgkvkfXC75EM40V3NVJn+yF1mWzCVLHUqwkoA6O6wSPYFeYc
	RHRr0Jhiel0SPM0ox4ccOe648eD0bbEZK/v/oHZ/uf3bS45SlYyOaCoS3GUWq2Zs5d/P
	CRPpLDZPoPnZ9PCEIiF4P+IADUCrXxKmKYK+Ghkj/QinQ0PXtR+1WtDJRzR3UCeDsDGI
	SFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ut8igeRZgLuHdSXdk7FQFWaap1MexfPWTpoT7ha+Cio=;
	b=bjqQhX+5bjX5Q/fPRxH6eeDBaawbYNbKQph3YxJxDaj5R8vylcK5/dGRFPM9P7fqIg
	Qv82TVpNsrfe19zfo0SiGfdtPRpsffWtH/XTp25YLgcHSW7V8gX8hgJnNXiwcjwU1pzv
	twZscaBeOTSxcC+Cv22IMGUSLywj5B2KQ/n/M4fhkRZXHTS4agEbt9JVdTEWzvwW1k+i
	0ZMLxFjwWcmkB8kIb36cEw9wHdTzU4HY4V3/4sgkTaXX3+Hbz7S9O+tJc8osJPJ5Z7u9
	ji+L0uYlyt3aS/OTfR2Xk/5dmsXaqgGfPqzy2+W5SzNBpaL0QWp2fQHKzMVyM9iBbafy
	qgaw==
X-Gm-Message-State: AG10YOTIMasOnV9YHIHvuAgtu2U5uyFzzcpDmHlyASrJfka5WTCMzqiCW3V7/gCSPQV3+w==
X-Received: by 10.140.170.212 with SMTP id q203mr24182597qhq.32.1453746685612; 
	Mon, 25 Jan 2016 10:31:25 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	l107sm9204497qge.22.2016.01.25.10.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:31:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:31:13 +0000
Message-Id: <cover.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/11] Upgrade musl, fix more packages on musl
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
X-List-Received-Date: Mon, 25 Jan 2016 18:31:30 -0000

This patchset upgrades musl to support out of tree builds
Fixes few more recipes to build with musl
Drops pth

The following changes since commit fc4209baa098caebf9c4cb75f9a6f2e85f43333c:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 10:08:25 +0000)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/pu
  https://github.com/kraj/openembedded-core/tree/kraj/pu

Khem Raj (11):
  btrfs-tools: Disable backtrace on musl
  grub: Backport fix for largefile detection/use
  elfutils: Fix build with uclibc/musl
  pth: Delete
  argp-standalone: Fix build when S != B
  gdb: Fix build failures on musl
  ltp: Add rdep on ldd
  bsd-headers: Fix LICENCE and dev package RDEPENDS
  fts: Correct LIC_FILES_CHKSUM
  musl: Upgrade to tip of tree
  libdrm: Refresh patch to match upstream submission

 ...ct-_llseek-code-and-require-long-filesyst.patch |   81 ++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    2 +
 ...-mfpmath-sse-as-well-when-SSE-is-disabled.patch |   46 +
 ...1-grub.d-10_linux.in-add-oe-s-kernel-name.patch |   56 +
 meta/recipes-bsp/grub/grub2.inc                    |    1 +
 meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +
 meta/recipes-bsp/grub/grub_git.bb                  |   13 +-
 meta/recipes-core/bsd-headers/bsd-headers.bb       |    6 +-
 meta/recipes-core/fts/fts.bb                       |    2 +-
 meta/recipes-core/musl/musl_git.bb                 |    4 +-
 .../btrfs-tools/btrfs-tools_4.4.bb                 |    2 +
 ...de-alternatives-for-glibc-assumptions-hel.patch | 1163 ++++++++++++++++++++
 .../elfutils/elfutils-0.164/aarch64_uio.patch      |   47 +
 .../elfutils/elfutils-0.164/shadow.patch           |   23 +
 .../elfutils/elfutils-0.164/uclibc-support.patch   |  129 +++
 .../elfutils/elfutils/mempcpy.patch                |   24 -
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    1 -
 meta/recipes-devtools/elfutils/elfutils_0.164.bb   |   13 +-
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  |   30 +
 meta/recipes-extended/ltp/ltp_20150903.bb          |    2 +-
 ...tests-kms-steal-crtc-Include-sys-select.h.patch |   83 +-
 .../argp-standalone/argp-standalone_1.3.bb         |    1 +
 .../argp-standalone/files/out_of_tree_build.patch  |   19 +
 meta/recipes-support/pth/pth_2.0.7.bb              |   31 -
 25 files changed, 1701 insertions(+), 81 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
 create mode 100644 meta/recipes-bsp/grub/grub-git/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
 create mode 100644 meta/recipes-bsp/grub/grub-git/0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/aarch64_uio.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/shadow.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.164/uclibc-support.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
 create mode 100644 meta/recipes-support/argp-standalone/files/out_of_tree_build.patch
 delete mode 100644 meta/recipes-support/pth/pth_2.0.7.bb

-- 
2.7.0


