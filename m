Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4731B7EC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:16:20 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a194so9931598qkg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3v1r0KbIq7v3K5D6mCqtrFPlrs/pjPpjO+JUVAKyRU=;
	b=Ey5YlxU6Gw+15xclALnk/19DXHJjlvsk5WFJury0mNj7+F9drKfrx1H12eJ9+OJn/a
	KznZpmvitKCz+ayUPft4VyQl3NmKExB+FLzn2pRfb1CpdLb8mel0ubIQ8fckI9jRm9XE
	lO9Jgx1Q4d3AW8Zc1m3BD4QPaf+GEUWk45ulllv3S3NhSlICL7nxXGjmtURxP9Od/H35
	rS6Pc1VVfjj7EQuPb/8UG4PlCWHDSiWlds2zKez31RPecOfW/cJb1iLWaXFYhdMXOvc0
	kutXvNhAWBbqUcGh3PmhdkUvDf789hGQUFrykZcu/64Xf+CVs5GpTYU2o7tyw2sLD1CT
	QgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u3v1r0KbIq7v3K5D6mCqtrFPlrs/pjPpjO+JUVAKyRU=;
	b=RrGoyIvf/VtupGe7JTTdQXKC3JKyvAg4XGIE0YhIwQdUfMLfNH0c4WJrpbR/4l9ATf
	mNKcZU9JSyXVrNu1qNGd9d8dRZosGOmpN9Iqe+lzvaIw9WflGkF9hE9X0EZYoHSicLWf
	H0ha3r714kHBzzToPPvV1ygIO6yOAoHCDQ0E55E4zs/aq7wV3S/EgCxJU/QiMR1AhwEM
	f8P5QYDvYCGDdsLETr4ZSP4i3NPWlbHsQ1ZBGRLvI9OBlRfgaqGZL6uYuXHsHmhjcVcl
	FUBfMSFMIPshrpVMcB1bU17NI4E1MAUdzeZu4LDuj33uSCtsKrbWvNXUbEeZLdLpDaRR
	4BfA==
X-Gm-Message-State: APjAAAVMfkzzJ0Nr6aRbXr3o+flTplnyjKSAWiJWjTslSzyipU0tNGjY
	SY0CjYmOflGvM6sGzeTS3Fk=
X-Google-Smtp-Source: APXvYqyLf13HjiIY7npy7cnalh/YtUFOyB8DaG/8fCq/s04qNBCdhUvSAGpez18N+0ifJWQLiK8YVg==
X-Received: by 2002:a37:88c7:: with SMTP id
	k190mr22629687qkd.448.1571688980705; 
	Mon, 21 Oct 2019 13:16:20 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	o12sm4666903qkk.54.2019.10.21.13.16.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:16:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 21 Oct 2019 16:16:12 -0400
Message-Id: <cover.1571688520.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
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
X-List-Received-Date: Mon, 21 Oct 2019 20:16:20 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's a set of changes that I've been testing while the release finalizes.
Now that master is open, I figured I'd send them before starting to stack
on more changes.

Note: I have more -stable changes for 5.2 and 4.19, I just haven't fully
      tested them yet, so they'll follow in a day or so.

For linux-yocto-dev, I'm bumping it to v5.4-rcX .. and of note, mips64 boot
was totally broken on the switch to userspace, I had to do the following
mainline reverts to get it working (after a couple of days of bisecting):

  932bb934ed4d mips: compat: vdso: Use legacy syscalls as fallback
  cdab7e2c73d5 mips: vdso: Fix flip/flop vdso building bug
  b4c0f7fa5308 mips: vdso: Fix source path
  1f66c45db330 mips: Add clock_gettime64 entry point
  abed3d826f2f mips: Add clock_getres entry point
  6393e6064486 mips: fix vdso32 build, again
  24640f233b46 mips: Add support for generic vDSO
  8919975b6171 MIPS: VDSO: Fix build for binutils < 2.25
  90800281e761 MIPS: VDSO: Remove unused gettimeofday.c

I'll report this upstream to linux-mips, since we'll want this properly
fixed before I start into the next release kernel. While annoying, I'm glad
that I ran into this right after it happened in mainline, and not in three
months from now.

During my v5.4 testing, I ran into some perf build failures and came up
with a series of patches to fix it, and get rid of some warnings while
building.

The update and fix are these two changes:

  perf: fix v5.4+ builds
  perf: create directories before copying single files

I also noticed a libcap non-derministic detection, so I created a patch
to control it via PACKAGECONFIG:

  perf: add 'cap' PACKAGECONFIG

And then my final patch for perf, which is a RFC/RFT sort of thing. When
fixing (yet another) set of "out of sync" file detection changes between
perf and the headers, I realized that it was between the tools captured
headers and a copy of the main include that we are doing from the kernel
source directory. I was able to drop that include completely, and build
for all architectures. I was also then able to drop some of the file copies
that we've added over time.

This worked for me, but I'd be interested to see if it breaks anyone elses
perf builds.

Cheers,

Bruce


The following changes since commit f484aa6090c5fa3f69c3aed0cab154ed1f46b7ac:

  python-native: Remove debug.patch (2019-10-19 23:18:34 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/4.19: update to v4.19.78
  linux-yocto/5.2: update to v5.2.20
  perf: fix v5.4+ builds
  perf: create directories before copying single files
  perf: add 'cap' PACKAGECONFIG
  perf: drop 'include' copy

 .../linux/linux-yocto-rt_4.19.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 meta/recipes-kernel/perf/perf.bb              |  9 ++++----
 7 files changed, 40 insertions(+), 39 deletions(-)

-- 
2.19.1


