Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C30B76D8C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:14 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id y10so5410096wgg.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XZxHjl/0g9j6drHJjF0sbPDKaQK7tN5n7jkliSIRr5Q=;
	b=jEvi6JrmDzPm3LMxSlMEEWVLTx1/9RmMy7oVR9XJGSFgG/g05QFzOdCUlLxE53Epwz
	cMayhHKrjFwWafImMRtCKQLryFH1C0Ml2mALFAGPTiFeCqMI1u+TC1ZLLYXIsVE7utp0
	nl90kOzRRFZ1LkU0CRv3AZncNFMrZhZUkCDrjCLLIKQgkFr+5Hu7NeXSA1MPKx9v1sx4
	mCnILNRKTfHGn0Frd568LXGvD2vDlg8AJkPypRGgZFgjmcKRtVBLwKjIfFKZ82Mv7bV+
	FTugBj5KS2MQ2K7qvKTPoR81fdAbzC0t1+bKd9Tvhx0UX0/bx34cmGnJKidsbzsZvqEf
	rUpA==
X-Received: by 10.180.82.161 with SMTP id j1mr23789823wiy.23.1385575633728;
	Wed, 27 Nov 2013 10:07:13 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:13 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:00 -0700
Message-Id: <cover.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: Random fixes from the Mentor Graphics push queue
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:15 -0000

The following changes since commit f991d2d60b74f5ebd990f77aecd3324b1a4533e9:

  libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git random-fixes
  https://github.com/kergoth/oe-core/tree/random-fixes

Christopher Larson (7):
  update-rc.d: process symlinks recursively
  quota: apply patch to obey tcp-wrappers config
  python, python-native: fix PARALLEL_MAKEINST failure
  cairo: add/use packageconfig for valgrind support
  perf: remove /usr/local/include from default makefile includes
  qemu: handle CLOEXEC/NONBLOCK if unavailable on host
  pulseaudio: fix RDEPENDS traversal for consolekit

 .../update-rc.d/check-if-symlinks-are-valid.patch  | 26 +++---
 .../recipes-devtools/python/python-native_2.7.3.bb |  1 +
 .../python/parallel-makeinst-create-bindir.patch   | 19 +++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 ...Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch | 92 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../quota/quota/config-tcpwrappers.patch           | 75 ++++++++++++++++++
 meta/recipes-extended/quota/quota_4.01.bb          |  3 +-
 meta/recipes-graphics/cairo/cairo.inc              |  1 +
 meta/recipes-kernel/perf/perf.bb                   | 11 +--
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  6 +-
 11 files changed, 219 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
 create mode 100644 meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
 create mode 100644 meta/recipes-extended/quota/quota/config-tcpwrappers.patch

-- 
1.8.3.4


