Received: from ra.se.axis.com ([195.60.68.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <peter.kjellerstedt@axis.com>) id 1UOAG7-0001rI-Gc
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:17:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id 4BE0126136F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XmXbjpqlyfCc
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by ra.se.axis.com (Postfix) with ESMTP id A084513CD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9E6883EB51
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 18:59:48 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id r35GxmFf015938
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2013 18:59:48 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id r35GxmUU015937
	for openembedded-core@lists.openembedded.org;
	Fri, 5 Apr 2013 18:59:48 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 18:59:43 +0200
Message-Id: <cover.1365179842.git.pkj@axis.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH 0/3] Fixes for oe-init-build-env
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
X-List-Received-Date: Fri, 05 Apr 2013 17:17:03 -0000

These updates fix three small problems with oe-init-build-env.

//Peter

The following changes since commit 419ef63ba5741ab67c91cbb96ee0c11e44975cb0:

  atom-pc: add i965 Mesa driver so GL works on i965 onwards (2013-04-05 12:44:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/oe-init-build-env
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/oe-init-build-env

Peter Kjellerstedt (3):
  oe-setup-builddir: Allow $OECORENOTESCONF to not exist
  oe-buildenv-internal: Only add to $PATH if needed
  oe-init-build-env: Make it use the correct $OEROOT with zsh

 oe-init-build-env            | 2 ++
 scripts/oe-buildenv-internal | 5 +++--
 scripts/oe-setup-builddir    | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

-- 
1.7.11.7



