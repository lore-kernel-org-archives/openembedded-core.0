Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b49-0003xO-AO
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:58:45 +0100
Received: by eekd41 with SMTP id d41so619839eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:50:24 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.130.208 as permitted sender) client-ip=10.14.130.208; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.130.208 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.130.208])
	by 10.14.130.208 with SMTP id k56mr1164709eei.123.1330012224078
	(num_hops = 1); Thu, 23 Feb 2012 07:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=cz4AsQKtd5jEP55HGYS6Ku4pNbVtkrBvzQ26/ao60tc=;
	b=OLM4UqZiZH0cXPDCWd1i7iUopHUWtckECIrIzPBQgl1sTRn5kiNK24PRf+hbps92+i
	1v+s0K89ofbtjLzGeLrXqLN9xRTvgNMxsQ35vKTbAX466VYCJCrbwNyklYJ2ORNEijRF
	vnAcPqu7xamuw3iMFibt5Vu9+UxzAH9ecwbEA=
Received: by 10.14.130.208 with SMTP id k56mr916382eei.123.1330012223801;
	Thu, 23 Feb 2012 07:50:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm6626037eeh.9.2012.02.23.07.50.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:50:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:50:15 +0100
Message-Id: <cover.1330012029.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
MIME-Version: 1.0
Subject: [PATCH 00/11] Pending patches - added few more patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 15:58:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First 7 patches are the same - so not resent

The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Eric BENARD (1):
  gdb-cross-canadian: build gdb with python support

Martin Jansa (10):
  wireless-tools: remove ldconfig call from install-libs
  bitbake.conf: use weak assignment for BB_CONSOLELOG
  sstatesig: add pointercal-xinput to excluded machine specific configs
  python: add Makefile to SSTATE_SCAN_FILES
  bitbake.conf: introduce SDK_NAME_PREFIX and NATIVESDK_* variables
  gdb-cross-canadian: use NATIVESDK paths as it happens to be here
  e2fsprogs: remove ldconfig call from install-libs
  sstate.bbclass: add *_config to SSTATE_SCAN_FILES
  apr: add apr_rules.mk to SSTATE_SCAN_FILES
  sstate.bbclass: improve performance of sstate package creation

 meta/classes/sstate.bbclass                        |   41 ++++++++-----------
 meta/conf/bitbake.conf                             |   16 +++++++-
 meta/lib/oe/sstatesig.py                           |    2 +-
 .../wireless-tools/remove.ldconfig.call.patch      |   19 +++++++++
 .../wireless-tools/wireless-tools_29.bb            |    5 +-
 .../e2fsprogs-1.42/remove.ldconfig.call.patch      |   28 +++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    6 ++-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   23 ++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    1 +
 meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
 11 files changed, 112 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/remove.ldconfig.call.patch

-- 
1.7.8.4



