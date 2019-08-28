Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 873347F17B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id t6so1869783ios.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/kORgTOglnTpg/BORRDkqIr6zWrTTOqkxZpoPk2RK8A=;
	b=ZB6wDqtUEPEwBULYLh/pPmCBW0WfxecI1rCzmX4+a3KRksoKp/qi12rtbifXvRPXLr
	xqkjQX8GW2g2jIy1NPqtH4uVeRSRSCwYNeFyk2d8Cl7JChCQt3v+SpBWWTu4hIoCApQL
	CJDKPF8Ql6zE58NE9OYUt5tEbZ9DOHNkrcKAs1GWjCkp6dmGALa9eu+udrm/g7m5gG4L
	MeEs3DloZNlu4TtVCQ2pTXnjN4kBg6STDWwYMRiPn6TimzuPtaznX/BHuwAHWX8mqoD0
	1jX86FAbgSrH+nNOLqCOOUqvFx5DYZktLa5Hkxmak3M2cEYYMZ+gsxzQd0JtXXEKdALx
	Nb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/kORgTOglnTpg/BORRDkqIr6zWrTTOqkxZpoPk2RK8A=;
	b=R7B2gfE0Rw1BWzWMNVuyp4siRceV++thMwFrBo79O6HkqTGmojkUt1MkKEAPNdyiEQ
	RuCWsP0uOJuWcoMv5euoHcirk5778n0dmqqPFd2rFHKcHWVba3e30MBRzLbmZGW5Iu0d
	09Q1d1nCR0vZ3MT5EjYPcn9j5bAyLtV/TusXgAqW9Y9zyN5vKluaWggiswoTMl0kpkKG
	7O/BO8MOONH6MprfeP4ceQ+Pk39ctRgz/L3ko19fMSyDAb9f11U7ZQpAClkvdqGp9inW
	gLdkYzECJTJIT/zHWbcB6ahuGs1mD0UxvVirCF9LoLXbGe7Eg5A8qHyQ6FaZFzvvsHTv
	tztg==
X-Gm-Message-State: APjAAAXRb2pzJVxrbxps0xyI2++Ntz64DHIUriVDpHCWkU1/UZ1d9yC+
	D6R3Vqw9xlFfZhVbBy6qp3w=
X-Google-Smtp-Source: APXvYqypu7fnc8KKTK5mkAcVTV55e6tnu6Jo/pCQ0Ze0e2v8HIw2e2lGx43ruYMsMVSZoIkg/nXU/w==
X-Received: by 2002:a02:9f19:: with SMTP id z25mr6102047jal.107.1567020524907; 
	Wed, 28 Aug 2019 12:28:44 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:34 -0400
Message-Id: <cover.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel/kernel-yocto: consolidated M3 feature pull request
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:44 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Sorry for this being slightly after the M3 feature cutoff, I ended up having
to churn through a lot of extra builds keeping up with master, dealing with
header issues, and working through the python3 changes at the same time.

With this series, we get an update of the libc-headers to 5.2, the introduction
of the 5.2 reference kernel, tweaked 5.2 kernel configuration fragments, some
misc build fixes to deal with the headers and the removal of python2 dependencies
from kerneldevsrc and perf.

I have some follow up patches to meta-oe that fix a couple of build issues
with the 5.2 headers. As well as some changes to oe-core to drop the 5.0
recipes (once we get the reference BSPs updated) and also changes to poky to
set the default kernel to 5.2. Once we get this set stablized, and the
reference BSPs updated, I'll send those other patches.

I've built and booted all the qemu machines for 5.2 (core-image-sato,
core-image-kernel-dev) and executed unit tests. I've also built and
booted core-image-minimal for musl for all arches against the updated
headers. I'm sure that I still managed to miss some combination, or there's
some other package out there that doesn't like the header updates .. but
I've done the best I can and this needs autobuilder coverage now.

I've also built and tested python3 only images for core-image-kernel-dev and
haven't found any regressions in functionality. As a bonus to the python2
removal, I fixed perf scripting (which was broken) and headed off some perf
v5.3 issues.

Cheers,

Bruce

The following changes since commit c17113f1e2e7bd8ab019169660718fab81df16fb:

  quilt: added less to RDEPENDS list (2019-08-22 22:48:27 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-libc-headers: update to v5.2 headers
  linux-yocto: introduce 5.2 recipes
  bluez5: fix build against libc-headers 5.2+
  kernel-devsrc: remove python2 dependency
  perf: change dependencies on python to python3
  perf: v5.3+ build fixes
  devsrc: update arm64 scripts/prepare for kernels 5.3+
  qemu: bump linux-yocto preferred version to 5.2

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/conf/machine/include/x86-base.inc        |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-build-after-y2038-changes-in-glibc.patch | 68 +++++++++++++++++++
 ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 -----------------
 ...aders_5.0.bb => linux-libc-headers_5.2.bb} |  5 +-
 .../recipes-kernel/linux/files/0001-foo.patch | 25 +++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    | 15 +++-
 .../linux/linux-yocto-rt_5.2.bb               | 44 ++++++++++++
 .../linux/linux-yocto-tiny_5.2.bb             | 32 +++++++++
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 54 +++++++++++++++
 meta/recipes-kernel/perf/perf.bb              | 20 ++++--
 13 files changed, 255 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Fix-build-after-y2038-changes-in-glibc.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.0.bb => linux-libc-headers_5.2.bb} (75%)
 create mode 100644 meta/recipes-kernel/linux/files/0001-foo.patch
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.2.bb

-- 
2.19.1


