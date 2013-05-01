Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXUSH-0002bh-Sv
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 12:40:23 +0200
Received: by mail-we0-f175.google.com with SMTP id i48so1137127wef.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 03:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=9hoIZMw+CMExpQfFadJdvkAIOMCg0Ax9TWHbVTEY6CY=;
	b=bT/9Yd4LM/81zLtY4gVPc0LW+WUtYkXttPurVmHOCcLooFvjFVOPVf91/bvfQpvMTI
	FLjCkmgJEUYYe7InFLwpXZRxDOvToIj8U1wB/FJ+GrBNz71hfNVXPAmfGf+bOmf4C1/Z
	3Md7Weza+eqWRXdwqMxIFx2H2HLhmXWNgcuw96WsrRsfMeDa2Z4YzwxBAFNbWZ17uegH
	CBw/O6dwr6ag1QNFKncNfTVdNAyQYJajXyf+XJ49e/HzLKB/5OpJbhdAvtSqT/ssqJQw
	Cnj69m0KfI/6w4b2TO00HfedREiSlp6dSpw0qa5+lqH9+vsoSsbzrTBE3PrxU2iwhBdS
	9TMQ==
X-Received: by 10.180.149.200 with SMTP id uc8mr29453473wib.3.1367403738138;
	Wed, 01 May 2013 03:22:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eu18sm21520980wid.1.2013.05.01.03.22.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 May 2013 03:22:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 May 2013 11:19:17 +0100
Message-Id: <cover.1367403369.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmnRI6PjFcvrZgqtZXubtd1RUYP/rPyfTjSF+NfXiuAOSw0WtBzREtDhBOABa/eFxVFL8Xi
Subject: [PATCH 0/3] update libsoup, remove gnome-keyring
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
X-List-Received-Date: Wed, 01 May 2013 10:40:25 -0000

Hi,

This series upgrades libsoup to the latest stable release.  This release also
remoes the libgnome-keyring use, so delete libgnome-keyring and gnome-keyring
from oe-core (these have already been integrated into meta-gnome).

Ross

The following changes since commit c42cc8fb38aee46f4778b9c68412a47ae5919923:

  neard: add systemd unit file (2013-04-29 15:31:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/soup

for you to fetch changes up to 14c10a2894fd7e722a8443b03b12462ab8bdfdad:

  libgnome-keyring: remove, nothing in oe-core uses this anymore (2013-05-01 11:14:39 +0100)

----------------------------------------------------------------
Ross Burton (3):
      libsoup: upgrade to 2.42.1
      gnome-keyring: remove, nothing uses it in oe-core
      libgnome-keyring: remove, nothing in oe-core uses this anymore

 meta/conf/distro/include/seperatebuilddir.inc      |    2 -
 .../gnome/gnome-keyring/org.gnome.keyring.service  |    3 --
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   44 --------------------
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |   19 ---------
 ...libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} |   14 +++----
 5 files changed, 7 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
 delete mode 100644 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} (59%)

Ross Burton (3):
  libsoup: upgrade to 2.42.1
  gnome-keyring: remove, nothing uses it in oe-core
  libgnome-keyring: remove, nothing in oe-core uses this anymore

 meta/conf/distro/include/seperatebuilddir.inc      |    2 -
 .../gnome/gnome-keyring/org.gnome.keyring.service  |    3 --
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   44 --------------------
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |   19 ---------
 ...libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} |   14 +++----
 5 files changed, 7 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
 delete mode 100644 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} (59%)

-- 
1.7.10.4



