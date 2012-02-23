Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WGJ-00069N-NW
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:50:59 +0100
Received: by eaal10 with SMTP id l10so473597eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.26.20 as permitted sender) client-ip=10.213.26.20; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.26.20 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.26.20])
	by 10.213.26.20 with SMTP id b20mr282548ebc.19.1329993758524 (num_hops
	= 1); Thu, 23 Feb 2012 02:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=I2YfMwbUSu3tQDm0S7kUTx7kLwRtp/X27ZMD8P6q1pU=;
	b=o8I4QR3BWVmbnxBmVlwE17lbdvpDPBCALXlvTzYGg3qDgbYPenVPkriJqWbv4AdwxF
	Niq7J4GA0eLarjoQ7lsf8G9R1uHgFKxxeBxGuSiPpm8ISQVy1XETE2fcv4mLnoGsO1Qa
	0/06xFup3drlg376Cvjp5Uo7ovkqAl30mmgTc=
Received: by 10.213.26.20 with SMTP id b20mr222453ebc.19.1329993758422;
	Thu, 23 Feb 2012 02:42:38 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm3912557eem.11.2012.02.23.02.42.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:42:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:42:29 +0100
Message-Id: <cover.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
MIME-Version: 1.0
Cc: fcooper@ti.com
Subject: [PATCH 0/7] Pending patches
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
X-List-Received-Date: Thu, 23 Feb 2012 10:50:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

You can consider sdk/gdb-cross-canadian as RFC and sstatesig.py will 
be probably better fixed by extending SIGGEN_EXCLUDERECIPES_ABISAFE

The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:

  texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Eric BENARD (1):
  gdb-cross-canadian: build gdb with python support

Martin Jansa (6):
  wireless-tools: remove ldconfig call from install-libs
  bitbake.conf: use weak assignment for BB_CONSOLELOG
  sstatesig: add pointercal-xinput to excluded machine specific configs
  python: add Makefile to SSTATE_SCAN_FILES
  bitbake.conf: introduce SDK_NAME_PREFIX and NATIVESDK_* variables
  gdb-cross-canadian: use NATIVESDK paths as it happens to be here

 meta/conf/bitbake.conf                             |   16 ++++++++++++-
 meta/lib/oe/sstatesig.py                           |    2 +-
 .../wireless-tools/remove.ldconfig.call.patch      |   19 ++++++++++++++++
 .../wireless-tools/wireless-tools_29.bb            |    5 ++-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   23 +++++++++++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    1 +
 7 files changed, 61 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch

-- 
1.7.8.4



