Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1R8CW0-0007Ih-NN
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 16:50:41 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpZgS027409 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 58V+biqnHUok
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:35 +0100 (BST)
Received: from ted (tim [93.97.173.237])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8QEpVA1027371
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 15:51:33 +0100
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1R8CQd-0007vi-PP
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 15:45:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 15:45:03 +0100
Message-Id: <cover.1317048110.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/03] Perl path contamination fixes
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
X-List-Received-Date: Mon, 26 Sep 2011 14:50:41 -0000

The following changes since commit ed2a606909b9490ac57a3ad3db7a15e83a8664f9:

  neon: Add libproxy to DEPENDS to ensure determinstic builds (2011-09-25 15:54:55 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/master2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master2

and fix perl path contamination issues from the build system.

Richard Purdie (3):
  openssl: Ensure perl scripts reference the correct perl
  util-linux: Ensure perl scripts reference the correct perl
  mc: Ensure perl scripts reference the correct perl



