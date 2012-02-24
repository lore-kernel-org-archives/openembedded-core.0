Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0m42-0002yx-9Q
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 04:43:22 +0100
Received: by daln34 with SMTP id n34so1731489dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 19:34:59 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.132.102 as permitted sender) client-ip=10.68.132.102; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.132.102 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.132.102])
	by 10.68.132.102 with SMTP id ot6mr1896043pbb.157.1330054499223
	(num_hops = 1); Thu, 23 Feb 2012 19:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SUY7WwtehBvcvkWQrw193DQ2nyZLHG7dI+6+MsA98Tk=;
	b=LPEfb/3Wb8aYcJvj2BW2fqzru7oGoUhpu0TwKDcisleQumQaUTLtoEZiEAGV0jmB68
	zFj0zmql9oNVCGfbHG9wHyesm610LFgNM7YdMfJUxyENADGbV6v6Ik1cWs08vv2m14hR
	cQtNzmbZwEl/UZpg+uSkQw3AiFBX4+uLm8bpQ=
Received: by 10.68.132.102 with SMTP id ot6mr1579196pbb.157.1330054499138;
	Thu, 23 Feb 2012 19:34:59 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id h3sm3124215pbr.75.2012.02.23.19.34.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 19:34:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:33:32 -0800
Message-Id: <cover.1330053959.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] stash gcc-cross buildtree and add recipe class override
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
X-List-Received-Date: Fri, 24 Feb 2012 03:43:22 -0000

Add recipe class to overrides
Prepare gcc for 4.7 changes
missing DEPENDS found during individual recipe builds
Add emptry DISTRO to oe-core

The following changes since commit a1f23a7cc527afdd1ce6cc7cd6083ee78fde09b3:

  update-rc.d.bbclass: do nothing for extended cross packages (2012-02-24 00:47:44 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (4):
  glib-networking: Add intltools-native to DEPENDS
  classes: Add recipe class to overrides
  default-distrovars: Add empty weak definition for DISTRO variable
  gcc: Stash the gcc-cross builddir to reuse in libgcc and gcc-runtime

 meta/classes/base.bbclass                          |    1 +
 meta/classes/cross-canadian.bbclass                |    2 +-
 meta/classes/cross.bbclass                         |    1 +
 meta/classes/crosssdk.bbclass                      |    1 +
 meta/classes/native.bbclass                        |    3 +-
 meta/classes/nativesdk.bbclass                     |    3 +-
 meta/conf/bitbake.conf                             |    3 +-
 meta/conf/distro/include/default-distrovars.inc    |    7 ++++
 .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    3 --
 .../recipes-devtools/gcc/gcc-configure-runtime.inc |   24 ++++++++++------
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-cross.inc    |   14 +--------
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   30 ++++++++++++++++----
 15 files changed, 58 insertions(+), 40 deletions(-)

-- 
1.7.5.4



