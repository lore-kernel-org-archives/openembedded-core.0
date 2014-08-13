Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3088C70BA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 17:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 54D452E329
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 1HIfEzJ2BF+Y
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 272252E3E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 07ED51443
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id F0561DF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:07 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id EE38034005
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:07 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7DHd7DG029921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 19:39:07 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7DHd7Lu029920
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Aug 2014 19:39:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Aug 2014 19:39:01 +0200
Message-Id: <cover.1407951483.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/3] Fixes for building with USE_NLS=no
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
X-List-Received-Date: Wed, 13 Aug 2014 17:47:12 -0000

This adds missing inherit of gettext to three recipes that were
discovered after we added USE_NLS = "no" to our distribution
configuration.

//Peter

The following changes since commit 6882d2d9993c8655a292c93e84ea01b4738a700d:

  yocto-project-qs, ref-manual: Added 'socat' package to essentials. (2014-08-12 13:50:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/use_nls_no
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/use_nls_no

Peter Kjellerstedt (3):
  systemd: Inherit gettext
  libsoup-2.4: Inherit gettext
  glib-networking: Inherit gettext

 meta/recipes-core/glib-networking/glib-networking_2.38.0.bb | 2 +-
 meta/recipes-core/systemd/systemd_213.bb                    | 2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.9.0


