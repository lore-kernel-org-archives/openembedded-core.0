Received: from anubis.se.axis.com ([195.60.68.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UPVzf-0002FU-QV
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 12:41:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 1BBD619DC5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0W4OAKs8u3Gj
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:19 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by anubis.se.axis.com (Postfix) with ESMTP id 7B37A19DC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:19 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 0ECE1340AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 12:24:19 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r39AOJJo011630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 12:24:19 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r39AOJrw011629
	for openembedded-core@lists.openembedded.org;
	Tue, 9 Apr 2013 12:24:19 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 12:24:12 +0200
Message-Id: <cover.1365503027.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/1] Do not grow PATH unnecessarily in oe-buildenv-internal
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
X-List-Received-Date: Tue, 09 Apr 2013 10:41:41 -0000

As a result of the discussion on the OE mailing list, I have reworked
the patch for oe-buildenv-internal that makes sure that the paths for OE
and BitBake are added to $PATH in a way that does not make it grow
unnecessarily.

//Peter

The following changes since commit e57284abca76fe7e6c29484104ae4349459c63dc:

  kernel.bbclass: do_sizecheck: update path to build image and do not delete (2013-04-08 22:26:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-buildenv-internal
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-buildenv-internal

Peter Kjellerstedt (1):
  oe-buildenv-internal: Only add to $PATH if needed

 scripts/oe-buildenv-internal | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
1.7.11.7



