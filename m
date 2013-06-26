Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa09-08.prod.phx3.secureserver.net
	(p3plsmtpa09-08.prod.phx3.secureserver.net [173.201.193.237])
	by mail.openembedded.org (Postfix) with ESMTP id B13936A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 17:33:37 +0000 (UTC)
Received: from localhost.localdomain ([74.131.113.133])
	by p3plsmtpa09-08.prod.phx3.secureserver.net with 
	id t5ZJ1l0082skrMm015ZcFn; Wed, 26 Jun 2013 10:33:38 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2013 13:33:15 -0400
Message-Id: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/2] Make systemd.bbclass work without SYSTEMD_AUTO_ENABLE.
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
X-List-Received-Date: Wed, 26 Jun 2013 17:33:38 -0000

Currently when using systemd.bbclass, the package will always get a
postinst function that either enables or disables on install, based
on the value of the SYSTEMD_AUTO_ENABLE variable.

There are instances where automatic disabling or enabling on package
install is not desired so this set of patches allows for a package
to override the systemd_postinst routine to be empty.

The moving of the functions in the second patch is mostly to make sure
that changes to systemd_postinst in a recipe actually cause the package
tasks to rerun.

Randy Witt (2):
  systemd: Don't enable systemd services when native.
  systemd: Move functions that only affect metadata to parse time.

 meta/classes/systemd.bbclass | 72 ++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 33 deletions(-)

-- 
1.8.1.4


