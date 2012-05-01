Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgd-00012x-3F
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:24 +0200
Received: by qcso7 with SMTP id o7so1986060qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=I/3qvH2a7afDNXx1DX6wmzizmEDlplsdcYK5qmUIOrU=;
	b=g+6L2fhbY26ZcbG5qDDDyuiNXm5WlcjwtsfTu1hXR2Y0iMKEP/BwqJCTUE9hJKZbmx
	5j8C62eSxVVUIY6Lo8cq+AUlVV1XK7YYC9nemgaO2CxlQYAxLbVV9vGSV79fG3O6q5jY
	ihHLaPpsNpkJ1BhtC5cNhxxKasND+G55jACSTAFKOoIM3mN+JlTjAL62RES/Y1719u7R
	zTjGBCxCTXyPDoATYE/9uTa+xmyVezEEjaCGlwtWnyjuqm1gygBXpzztMAxL64JaJCqh
	qgXBtjsWs5KrCAkEMMWqbUqFook3klzOoQQ/P6Z/HogpyGIwN+6zrK7KSTwvTQCuMCdx
	bCPw==
Received: by 10.60.14.166 with SMTP id q6mr2858365oec.17.1335888128903;
	Tue, 01 May 2012 09:02:08 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:08 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:39 -0500
Message-Id: <cover.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/6] A few misc. commits I had pending
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
X-List-Received-Date: Tue, 01 May 2012 16:12:24 -0000

Most of these are pretty simple and obvious fixes, but this also changes
base.bbclass to use isinstance instead of bb.event.getName(), and also shifts
the information used to display the build config summary at the start of the
build into bitbake.conf as variables, so it's possible to easily add to the
list of variables and content to be emitted there. As one example, I have
a change to csl-versions.inc which adds the external toolchain version string
to the summary.

The following changes since commit 26d822ad059dd4839cc6fee2a65714e73cc146e1:

  nfs-utils: don't try to unload nfsd module (2012-05-01 14:28:47 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core misc-fixes

Christopher Larson (6):
      mesa: add missing flex-native/bison-native deps
      distcc: use PACKAGECONFIG for x11 distro feature
      libpcap: use PACKAGECONFIG for bluetooth distro feature
      libsndfile1: use PACKAGECONFIG for alsa distro feature
      bitbake.conf: shift build config summary control to here
      base.bbclass: use isinstance for base_eventhandler

 meta/classes/base.bbclass                          |   56 ++++++++++++-------
 meta/conf/bitbake.conf                             |    7 +++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    5 ++-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   14 +++--
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |    5 ++-
 6 files changed, 59 insertions(+), 30 deletions(-)

Christopher Larson (6):
  mesa: add missing flex-native/bison-native deps
  distcc: use PACKAGECONFIG for x11 distro feature
  libpcap: use PACKAGECONFIG for bluetooth distro feature
  libsndfile1: use PACKAGECONFIG for alsa distro feature
  bitbake.conf: shift build config summary control to here
  base.bbclass: use isinstance for base_eventhandler

 meta/classes/base.bbclass                          |   56 ++++++++++++-------
 meta/conf/bitbake.conf                             |    7 +++
 meta/recipes-connectivity/libpcap/libpcap.inc      |    5 ++-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |   14 +++--
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 .../libsndfile/libsndfile1_1.0.25.bb               |    5 ++-
 6 files changed, 59 insertions(+), 30 deletions(-)

-- 
1.7.7



