Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDiUS-0001p3-MB
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 23:04:24 +0200
Received: by pbcwy7 with SMTP id wy7so9391052pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 13:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S0tJReY5ARaAz5NlD5jsLFEIGwEDu0L/9PW41PmA3AY=;
	b=W4yLGu/9ce67rg0JD5PtEMXApNViIyha467OnlYuq4CqxLEAkZfqqxz1OqhjQmzW+U
	OJmfvB7Ur43DhhTdfPm4x6a3XJNCneAkEDW8KDadcp3RQFtiElpW9ToTPROY+XWx2w63
	vcfxi85rsnO9LTVQT7hB7TuDFV7qT983z7ZWJh6CvtUwiuOlgEy2OBF/jUPXH4VR40a0
	dTm0SkrMIr03xfRLC+uHzNF5DaGIrW1zypKqm8U3+dCAUb7IdrztE091gmV+633fQkbR
	+ZkXBuuO9yQT6Mmx43GMGQX1UBChaFfRAVHVik8HPu0Tbvg4HbxOhoi7TMthwLvzL3c6
	1nDA==
Received: by 10.68.201.73 with SMTP id jy9mr24695028pbc.124.1347915104768;
	Mon, 17 Sep 2012 13:51:44 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gi2sm7490607pbc.59.2012.09.17.13.51.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 13:51:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 13:50:32 -0700
Message-Id: <cover.1347914898.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] eglibc bugfixes for e5500 and systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 21:04:24 -0000

This patchset addressed two bugs in eglibc on powerpc one where we would get
fsqrt intruction emitted into libm code on e5500/64bit and second problem
where systemd 189+ would not build on powerpc due to missing defines in
fcntl.h for ppc.

The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:

  local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-fixes

Khem Raj (2):
  eglibc: Fix fcntl.h for powerpc
  eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu

 ..._handle_at-open_by_handle-etc.-to-PowerPC.patch |   65 ++++++++++++++++++++
 .../eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch      |   44 +++++++++++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    4 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-Add-name_to_handle_at-open_by_handle-etc.-to-PowerPC.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fsl-ppc-no-fsqrt.patch

-- 
1.7.9.5



