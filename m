Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1gW4-0002vj-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 18:32:20 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 09:19:20 -0700
Received: by wibhr14 with SMTP id hr14so1294246wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 09:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7UEUzEh/VJV0hLAfQqiY9OfbBY5pHm+Ul6W8kdtFnCY=;
	b=afKJUhUzc2nIRuMcm2Ol1fIKDzu/eKaiBGwQUg+YMe1Qm+Enn1HDq8yW/ZLJyfo4f8
	lHBQ+ZR6MXnlgcA84u6AQ90Nc298QVLbzalpwM1NGg5GgeOT6rXCc+/eoBZcu1wxwZTi
	QX6+nVcNUw6gX0eCk/sg6sN1gkvcPRhWIiMB2bpmVz/rv40yUQ41aE9bbPYafLq8+/cF
	DTUEkmTLF/xjM7eK03pmsz+5SDi29ZeambkA+yg49kwZlVB3vLFQecJ359BKWiUE2oz+
	1c5fQeG5l1H63nmMwPQzcfuwGtESJixYkEXTgLbMUGWNME+EeBgvAoGo6f5DQ5AobDTb
	kTkQ==
Received: by 10.216.23.202 with SMTP id v52mr8420567wev.32.1345047558791;
	Wed, 15 Aug 2012 09:19:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eu4sm29482830wib.2.2012.08.15.09.19.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 09:19:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2012 17:18:45 +0100
Message-Id: <cover.1345047378.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlAyOoOP0HqNTvTI0XPhEVfP5xiRnz4aAv+pE5ppc2yPE6J/TqTkecBOTskmYcBSiozYtyo
Subject: [PATCH 0/2] Make webkit-gtk depend on make-replacement-native 3.81
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
X-List-Received-Date: Wed, 15 Aug 2012 16:32:20 -0000

This isn't my finest moment but I welcome suggestions...

webkit-gtk fails with -j when the host has GNU Make 3.82.  This appears to be a
GNU Make regression where it prunes rules it actually needs.

So add make-replacement-native 3.81, and depend on that in webkit-gtk.

I'm now off to scrub myself clean.

The following changes since commit 0c6ac62a9fb81146ace64ae7493dcc56b4bed197:

  documentation: remove references to Pimlico (2012-08-15 15:26:27 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/make

for you to fetch changes up to 127bffbf550f6357ad14c1b5b03c1c908e4e51e2:

  webkit-gtk: add depends on make-replacement-native (2012-08-15 17:15:55 +0100)

----------------------------------------------------------------
Ross Burton (2):
      make: add make-replacement-native 3.81
      webkit-gtk: add depends on make-replacement-native

 meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb               |    8 +++++---
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.81.bb

Ross Burton (2):
  make: add make-replacement-native 3.81
  webkit-gtk: add depends on make-replacement-native

 meta/recipes-devtools/make/make-replacement-native_3.81.bb |    6 ++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb               |    8 +++++---
 2 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-replacement-native_3.81.bb

-- 
1.7.10



