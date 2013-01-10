Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TtNlM-0007iL-4W
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 20:26:05 +0100
Received: by mail-la0-f47.google.com with SMTP id fh20so988517lab.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 11:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=DPv3mSsRfcdwS+ix6EgiQ+gTR4RKlvdu0c1/UX9pSSs=;
	b=hymkLhtNopOt7jTOhHWx+pi0I79pVaLhXXP7Z9fP5bH0Z7J2DuBBDBXT4z7AIFHWdx
	RP3cQq2zi72NN6cqxhp8rpyAxsrRBFy5lcuNT2XsoNNEABbyGHzxVnJsMyLVfoP+Px+I
	m6qwG1GeXVCB8ElC+n35vQNBwjXgM1OREB5LnI3HXhGNxYwOLaHVuYvtCL98oFgcjiRN
	3+ZakKrBTdsB/KOabyoff6J4Kx68wC7sp+noGvXYf7HgsrNwRR3YIFvbnknojUratScI
	jAHiuuGVLC8hny8xVFb0WHBt6l2P/EcK/FsPn0RWhMUU2G18WBZKyTv5FTrpA3LwqxA7
	HSdg==
X-Received: by 10.152.125.136 with SMTP id mq8mr70257400lab.41.1357845050457; 
	Thu, 10 Jan 2013 11:10:50 -0800 (PST)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id ie3sm1196732lab.4.2013.01.10.11.10.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 11:10:49 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TtNWY-00085h-HE; Thu, 10 Jan 2013 21:10:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 21:10:44 +0200
Message-Id: <cover.1357844418.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Misc patches
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
X-List-Received-Date: Thu, 10 Jan 2013 19:26:05 -0000

A couple of already sent patches that have been ignored (patchwork issues?)

The following changes since commit 0cfec10c4c7b0597f0e0c8f85539d901861a2f83:

  guile: add explicit dependency to avoid parallel build issue (2013-01-09 13:41:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (3):
  libxdamage: update to upstream version 1.1.4
  coreutils: fix license segment md5sum boundary
  help2man: update to upstream version 1.40.13

 meta/recipes-core/coreutils/coreutils_8.14.bb                    |    2 +-
 .../{help2man-native_1.38.2.bb => help2man-native_1.40.13.bb}    |    6 +++---
 .../xorg-lib/{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb}        |    6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.38.2.bb => help2man-native_1.40.13.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxdamage_1.1.3.bb => libxdamage_1.1.4.bb} (86%)

-- 
1.7.10.4



