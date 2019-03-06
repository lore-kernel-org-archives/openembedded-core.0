Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 970327CDA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:16 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p18so10733014ioh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X5wFO3PsISojoZmudnanM/YwLdZ2tDU2KKMTNk3aN9c=;
	b=SBnsptEITGgGouJbLHTJnZLu6o/X6cVipn5ku5Bz5AN9LsRG9Bo7sTwX19yT86nAy3
	SU4USbA1asC9v6og6rwScl3lrjxC1vylws/t1e6AR1P0cKWc8KWPEt7nOVXJhtsrEuoX
	EJzQkOigjGM5vIsvlRMWR8pWIZlGkpXe9uyWZuNQzAgdcUYIG3meol195tL624+7uLXO
	3W365xlI0i1jfFzGC4VU9yqHIxVxSf34FK3jnaqmpyZey5BNAgguYOG7ESeRe4AesU16
	kPoqdNYUOQoWFutcU+izRARJnuQ7judMa+2PPlMk22IeILOkn4VZCRjvShsQgskog+oM
	900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X5wFO3PsISojoZmudnanM/YwLdZ2tDU2KKMTNk3aN9c=;
	b=kaaSCNRFTJiRHFOZVv1sYo0G+X5PNty/7pD1AtJglsgpEGP9hmvVGrYLmvqDMX9XAl
	43Tz9CkP1MHw0GIVmziWBIV82V47pu+MyyWOke1lS1jQQQ+eIbAq9mgbK8lgpLfpIaj5
	4JYNjT0RAWgfMCQ+dMEWgMq8RTpz5t8SWfGH648cSn6JSGPxpVbrN+zalyRGQ3S5OjEW
	xuXzpGNkXrTI7HKVd7fL2eWAMVDZ9Ajr5AD/iQpmiyKo8N8GIEr64SZI3GD4EzNlak5V
	6VB4iW+zVr34aAmCj0K+W40D+sw/StUeLN3Ug/B7qRWnxogkUAs6L5+UUPLlu3cPMhrJ
	7vzA==
X-Gm-Message-State: APjAAAVR6i+ethdcs8H18t27GEUTvOWP1t9IvpUadQ0xh54mZxsjk8Ix
	b1qjW4bvpOIxw8zmKlLIGzY=
X-Google-Smtp-Source: APXvYqyZIvw6v6f+JKRTg8eyOIXKGq50qa2b8mTO8BIwpoj9sqIatjfpCIwsK//zR+aESYgw86kcFQ==
X-Received: by 2002:a6b:9256:: with SMTP id u83mr3656558iod.208.1551890237394; 
	Wed, 06 Mar 2019 08:37:17 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:08 -0500
Message-Id: <cover.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request (5.0 kernel intro)
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:16 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

The -rc8 of the kernel pushed this out a week longer than I would
have liked, but luckily the -dev kernel has been running 5.0 for
quite a while, so most of the issues had been worked out already.

In this series we have the bump of the libc-headers to 5.0, I've
built all arches for both musl and glibc, with no issues popping
up due to the headers bump. A few patches were dropped, since they
are now upstream.

I've also introduce the 5.0 versioned recipe in this series and
adjusted the two machines that still have a preferred version to
use it. Again, this was built and booted on all arches and over
several image types (minimal, sato, kernel-dev).

As usual lttng was tweaked to work with 5.0, but I was able to
keep it on the same 2.10 stable branch and only pull in a few
pending patches that haven't been formally released yet.

Once we get the h/w reference boards, and reference distros moved
to 4.19 and 5.0, I'll send a follow up patch to remove 4.18
from master.

I'll send follow up patches to the yocto-bsps and poky as
appropriate, but until the last few issues are resolved, they can
stay out of tree.

I captured as many details as possible in the commit messages of
the individual patches.

Cheers,

Bruce


The following changes since commit 44b28954997f62733c09c0f3261d29fe8049916c:

  linux-yocto: update genericx86* SRCREV for 4.18 (2019-03-04 22:57:32 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel-yocto: allow kernel-meta repositories to be patched
  linux-libc-headers: update to 5.x headers
  linux-yocto: introduce 5.0 versioned recipe
  lttng: add 5.x fixup patches to 2.10.8 release
  linux-yocto/5.0: update configs for h/w reference boards
  machine: bump preferred version to 5.0

 meta/classes/kernel-yocto.bbclass             |  29 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/machine/include/x86-base.inc        |   2 +-
 meta/conf/machine/qemuarm.conf                |   2 +-
 .../linux-libc-headers/linux-libc-headers.inc |   2 +
 ...kernel_clockid_t-in-uapi-net_stamp.h.patch |  49 ---
 ...d-input-and-output-files-instead-of-.patch |  11 +-
 ...ce-Fix-SVE_PT_REGS_OFFSET-definition.patch |  43 ---
 ...angle-uapi-asm-ptrace.h-from-uapi-as.patch | 289 ---------------
 ...ders_4.19.bb => linux-libc-headers_5.0.bb} |   7 +-
 .../linux/linux-yocto-rt_5.0.bb               |  43 +++
 .../linux/linux-yocto-tiny_5.0.bb             |  32 ++
 meta/recipes-kernel/linux/linux-yocto_5.0.bb  |  51 +++
 ...nguish-between-kernel_siginfo-and-si.patch | 133 +++++++
 ...-signal-Remove-SEND_SIG_FORCED-v4.20.patch |  67 ++++
 ...reserved-cluster-count-when-removing.patch | 149 ++++++++
 ...x-timer-instrumentation-for-RHEL-7.6.patch |  32 ++
 ...argument-from-access_ok-function-v5..patch | 204 +++++++++++
 ...ter-values-with-task-tk_pid-and-rpc_.patch | 186 ++++++++++
 ...ify-defining-common-RPC-trace-events.patch | 183 ++++++++++
 ...-fsid-metadata_fsid-fields-from-btrf.patch | 341 ++++++++++++++++++
 ...p-mempool-Remove-logically-dead-code.patch |  46 +++
 .../lttng/lttng-modules_2.10.8.bb             |   9 +
 23 files changed, 1513 insertions(+), 399 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.19.bb => linux-libc-headers_5.0.bb} (65%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.0.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch

-- 
2.19.1


