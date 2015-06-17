Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 40490737AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:33:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 591C16002A0
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 09:33:17 +0100
Message-Id: <cover.1434529133.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH 0/1] distutils-common-base: add to, don't set, FILES_${PN}
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
X-List-Received-Date: Wed, 17 Jun 2015 08:33:26 -0000

A recipe I was working on which indirectly inherited both
distutils-common-base and gtk-icon-cache was reporting installed but not
shipped errors for icons in the path gtk-icon-cache explicitly adds to
FILES_${PN}.

This turns out to be because distutils-common-base sets (=) rather than
appends (+= or _append) FILES_${PN} and gtk-icon-cache was ahead of
distutils-common-base in the inherit order.

The proposed fix here, appending rather then settings FILES_${PN}, works for
the recipe I am working on and doesn't introduce errors for any recipe in 
meta/recipes-devtools/python.

Cheers,

Joshua

The following changes since commit 45b368427accf6d519078812d5335ec250bacef8:

  packagedata: Fix to ensure variables expand correctly (2015-06-16 14:20:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/distutils
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/distutils

Joshua Lock (1):
  distutils-common-base: add to, don't set, FILES_${PN}

 meta/classes/distutils-common-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.1.0


