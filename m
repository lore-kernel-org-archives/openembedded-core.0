Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8727705F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 34AC518111;
	Fri, 23 Oct 2015 12:38:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 57fugUlgQc-K; Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 8FA931810B;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 71496127;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 621B083;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 5FEB63404E;
	Fri, 23 Oct 2015 12:38:31 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9NAcVAb005177;
	Fri, 23 Oct 2015 12:38:31 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9NAcUnW005164;
	Fri, 23 Oct 2015 12:38:31 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 12:38:17 +0200
Message-Id: <cover.1445596115.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Fix for useradd-staticids.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 10:38:33 -0000

This change corrects useradd-staticids.bbclass to allow user and group
files without trailing colons. Previously one had to write:

foo::123::::

in the group file to define the static UID for a user or one would
receive a Python exception. With this change applied one can instead
write:

foo::123

The change is of course backwards compatible so the old format is
still valid.

//Peter

The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd_skip_colons
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd_skip_colons

Peter Kjellerstedt (1):
  useradd-staticids.bbclass: Do not require trailing colons

 meta/classes/useradd-staticids.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
2.1.0


