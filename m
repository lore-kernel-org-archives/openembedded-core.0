Received: from mail-bk0-f48.google.com ([209.85.214.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1UJfnL-00036J-1G
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Mar 2013 08:56:47 +0100
Received: by mail-bk0-f48.google.com with SMTP id jf20so2350900bkc.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2013 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=08xesYDdhpBbhleM+5jhHXmCVbcLoZFzfTQoN8ZBtzA=;
	b=bbi0uY+Q2urPm6WrmUftCem/mKdnh2TD6Zs9YZqGCWPWzMVkMRtAJHQn8sFKT4ptR4
	bugDGHm1z3eBRomU2AfpmCKfqSJ+w3FSnhpV9F61kkNSpD9x+cO9O+JiE3SX8ar1SAry
	Dx6RzbLzmwxpPfVuu5CNO7L0snavwHj9L4oRnwr0vMe9nwVVasOvbZDyB0LxRLRBp8mC
	A5PkzsBPpPAF4D1llxzP3UibGTAXskQ3PKIrmG3jmfb9c9j4DK0OfgTbgOSnF+st4b+Y
	5z0BHFqSIPBGQ4Ovp1r6/7RG29zgNcE9YqVjEf51WWjmNddZbiViZUlltdKvlmFA7UfT
	mr1g==
X-Received: by 10.204.231.73 with SMTP id jp9mr1961913bkb.116.1364110790444;
	Sun, 24 Mar 2013 00:39:50 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPS id z6sm1913330bkv.11.2013.03.24.00.39.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Mar 2013 00:39:49 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UJfWt-0000aF-MZ; Sun, 24 Mar 2013 09:39:47 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Mar 2013 09:39:45 +0200
Message-Id: <cover.1364110643.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] coreutils update
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
X-List-Received-Date: Sun, 24 Mar 2013 07:56:48 -0000

Problems that prevented using of previous upstream version of coreutils
fixed in latest upstream release.

The following changes since commit 41c0241a810f0a97ddc98a834e717645e0047958:

  tcl: Fix the location of the installed headers (2013-03-23 18:09:54 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib cazfi/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/misc

Marko Lindqvist (1):
  coreutils: update to upstream version 8.21

 .../coreutils/coreutils-8.14/remove-gets.patch     |   23 --------------------
 .../coreutils-build-with-acl.patch                 |    0
 .../coreutils/coreutils-8.21/dummy_help2man.patch  |   22 +++++++++++++++++++
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.14.bb => coreutils_8.21.bb}       |   11 +++++-----
 5 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.21}/coreutils-build-with-acl.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.patch
 rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.21}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.21.bb} (91%)

-- 
1.7.10.4



