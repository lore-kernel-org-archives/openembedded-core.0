Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1R9mP5-0006NH-DE
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Oct 2011 01:22:03 +0200
Received: by wyh5 with SMTP id 5so1681120wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 16:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=svWLR1NeoRWi5wuBCMzrYjG76rckaeSPtKIoVJf7etE=;
	b=FY/Kb1o9uhtln4CLGyABEmHO0gVjaT7oMW+LoaIBF/Y2PqBWzQYVZDb78BYOgJyAQV
	6XwBJuLAqhA4WtYS7KnP/znZgIbJMFksKOuosta4MaB3ZcViRqRWGWB1cztCd5HETlLK
	iYz6LobWC6e6J+BGAWX2/ZiP04fpmX5zIG+ns=
Received: by 10.227.137.210 with SMTP id x18mr2531771wbt.57.1317424593092;
	Fri, 30 Sep 2011 16:16:33 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id i29sm11252793wbp.22.2011.09.30.16.16.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 16:16:31 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2011 01:10:14 +0100
Message-Id: <1317427816-31888-1-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH v2 0/2] Fix useradd class to accept useradd long options.
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
X-List-Received-Date: Fri, 30 Sep 2011 23:22:03 -0000

This first patch fixes the --root option for programs in shadow-native and
allow one to specify useradd long options when using the useradd class
in a recipe.

This is demonstrated in the second patch which is a respin of another patch
for the OpenSSH recipe I proposed earlier. As suggested by Saul, it had
been reworked to use useradd long options in the USERADD_PARAM variable.

v2: Fixed a typo in add_root_cmd_options.patch, --root is equivalent to -Q
instead of -R.

NOTE: Phil's patch "shadow: add patch for useradd lossage" doesn't fix the
long options issue as it has been suggested in an answer to one of my
initial post.

Julian Pidancet (2):
  Fix the --root option in shadow-native programs.
  Use useradd and update-rc.d classes in the OpenSSH recipe

 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +---
 .../shadow/files/add_root_cmd_options.patch        |  180 ++++++++++----------
 2 files changed, 97 insertions(+), 112 deletions(-)

-- 
Julian Pidancet



