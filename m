Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA5B60069
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:41:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so13654080pfs.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4UMmu3yC+anjwnefavbQJ2otQnd1S8LIGzu+BQ6ZmJ4=;
	b=WlMqI/hhGAyTq1MWdvBBsUfVRxb+2Op2FmENdY37KGef+Vc9YkYcK+m85lFGgxXI1v
	FYLHrXPIhv3JL3xccvAhNHa1zl3XaWDNEVItDnoHl3wgrMv6kzFViD6IWXp46T8TAteo
	kwc9XqmsOtyM1nWoA6YW2n92JUSN0DWfUcXk0a7Rvd53qvYtJaGuhWXxqzp/hV6uDuIV
	/v7/D056b32739XaaKaOcwPIytPCDAKYJgSHHZBumm5McmtyW1JQeAyJ6dbnXLkVSiZj
	iai3fkjI3yhVjryzlHoFRyta+ONeThRAIan44BY1VoLSNdG5LYVePNQ1Bxc1WG2s95Si
	qXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4UMmu3yC+anjwnefavbQJ2otQnd1S8LIGzu+BQ6ZmJ4=;
	b=XID6IwOEBwRgcLe02Qpc+mvxWpsTSG3bimoPbhxwhhFg0TniQ1diLw0g9KFLgwhkyK
	9x9op7Yxh9PCy/Oc64lGIEVc4gk7nu0AtujY4bVMZqS7GMHn2yOnv4sMWZFV1VeSJLQ3
	DSfYdJAZIF9zolK43mKgkTh41lei8lz+77Oz8pKxY8h0V6C6hMRbIvC01FqeD8QNcYsb
	m3nmNAhOhkPSP/cUQA+R6rU6R3PlTGajfoxY0GTcEzoGDrb3Ty0bYXwg066VoSUuHPNJ
	x3SN9LQeu/AMuvHw1R/i5QjDfiUs9m3jqicldNf/5bTHMenEnjknD9x7RrE82NDZJh2y
	+Tzw==
X-Gm-Message-State: APjAAAW5Rl2iVDpIhMewPn+eZxRlDxCYHrTsFIx361YKszHA0kI4miwn
	dvU42JmXkJqwyt7c6FYuFBJ3ec3qUX8=
X-Google-Smtp-Source: APXvYqxB778jbvjca2z/HMu/k8ESgI6z0rp9cchT+PNX4u1lDH1Kl7zGGvuWxrLHrfr+jqBrLj84yQ==
X-Received: by 2002:a63:f403:: with SMTP id g3mr52745905pgi.62.1579376471676; 
	Sat, 18 Jan 2020 11:41:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	a16sm31934374pgb.5.2020.01.18.11.41.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 11:41:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 11:41:10 -0800
Message-Id: <cover.1579376298.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/5] Introduce powerpc64 LE architecture support
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
X-List-Received-Date: Sat, 18 Jan 2020 19:41:11 -0000
Content-Transfer-Encoding: 8bit

This patchset adds base support for building ppc64 in Litte-Endian mode,
the linux-yocto changes and qemu related changes will make it buildable
target out of box, but that is not yet made available

The following changes since commit ecbf203e34484731dcb6acc5e75df79cb86e55dc:

  sstatesig: Improve debug output if getpwuid() fails (2020-01-16 22:33:09 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/ppc64le
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/ppc64le

Khem Raj (5):
  classes,conf,lib: Add support for powerpc64le
  gcc: Enable 32bit powerpcle at multi-arch for powerpc64le
  openssl: Add powerpc64 LE support
  tcf-agent: Add LCL_STOP_SERVICES for powerpc64 LE
  ghostscript: Add powerpc64 LE specific objarch.h

 meta/classes/libc-package.bbclass             |  1 +
 meta/classes/meson.bbclass                    |  2 +-
 meta/conf/bitbake.conf                        |  1 +
 meta/lib/oe/elf.py                            |  2 +
 meta/lib/oe/package_manager.py                |  1 +
 .../openssl/openssl_1.1.1d.bb                 |  3 ++
 meta/recipes-devtools/gcc/gcc-common.inc      |  1 +
 .../tcf-agent/tcf-agent_git.bb                |  1 +
 .../ghostscript/powerpc64le/objarch.h         | 40 +++++++++++++++++++
 9 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64le/objarch.h

-- 
2.25.0


