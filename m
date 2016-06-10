Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE0270030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id EC7B02E233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8B9y-GCXF75Q
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 115E52E1C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E91931834
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id DE5C01558
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id DCA44F3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5AFkCBU031859
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 17:46:12 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5AFkCEQ031858
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2016 17:46:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 17:46:09 +0200
Message-Id: <cover.1465573515.git.pkj@axis.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCHv2 0/2] Make useradd-staticids.bbclass Python 3 compatible
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
X-List-Received-Date: Fri, 10 Jun 2016 15:46:16 -0000

Avoid warnings with Python 3 due to files that are not closed in
useradd-staticids.bbclass.

PATCHv2: Also avoid a FutureWarning about split() requiring a
non-empty pattern. It occured for every recipe that inherited useradd
(with useradd-staticids enabled), but with no context at all. It also
did not end up in the tmp/log/cooker log...

//Peter

The following changes since commit 40e789d1fee7f0df2d23230fff38325119ad2935:

  bitbake: lib/bb/main.py: Fix use of BBPOSTCONF and BBPRECONF (2016-06-09 18:00:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd-staticids-py3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd-staticids-py3

Peter Kjellerstedt (2):
  useradd-staticids.bbclass: Make sure opened files are closed
  useradd-staticids.bbclass: Avoid FutureWarning about split()

 meta/classes/useradd-staticids.bbclass | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

-- 
2.8.3


