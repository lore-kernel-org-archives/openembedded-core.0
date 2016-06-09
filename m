Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7486C65D00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 23:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 39AB7181BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id hyt-L750KBQT
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 64326181A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 483421AFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 3D40717FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 31CF0FA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u59N7GZ8003081
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 01:07:16 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u59N7GhS003069
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2016 01:07:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 01:07:13 +0200
Message-Id: <cover.1465513580.git.pkj@axis.com>
X-Mailer: git-send-email 2.8.3
Subject: [PATCH 0/1] Make useradd-staticids.bbclass Python 3 compatible
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
X-List-Received-Date: Thu, 09 Jun 2016 23:07:17 -0000

Avoid warnings with Python 3 due to files that are not closed in
useradd-staticids.bbclass.

//Peter

The following changes since commit 40e789d1fee7f0df2d23230fff38325119ad2935:

  bitbake: lib/bb/main.py: Fix use of BBPOSTCONF and BBPRECONF (2016-06-09 18:00:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd-staticids-py3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd-staticids-py3

Peter Kjellerstedt (1):
  useradd-staticids.bbclass: Make sure opened files are closed

 meta/classes/useradd-staticids.bbclass | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

-- 
2.8.3


