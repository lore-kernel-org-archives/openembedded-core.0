Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 94B3260125
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Oct 2015 09:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8FDFC2E776;
	Sat, 24 Oct 2015 11:50:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2ex-P9jPDybD; Sat, 24 Oct 2015 11:50:47 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id ACE2F2E762;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 94B1515F;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 88F92AB;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8654F340B3;
	Sat, 24 Oct 2015 11:50:46 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id t9O9ok3Y016311;
	Sat, 24 Oct 2015 11:50:46 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id t9O9ojBw016310;
	Sat, 24 Oct 2015 11:50:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Oct 2015 11:50:16 +0200
Message-Id: <cover.1445679443.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Cc: Christopher Larson <clarson@kergoth.com>
Subject: [PATCHv2 0/1] Fix for useradd-staticids.bbclass
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
X-List-Received-Date: Sat, 24 Oct 2015 09:50:50 -0000

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

 meta/classes/useradd-staticids.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.1.0


