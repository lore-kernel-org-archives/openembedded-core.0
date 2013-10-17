Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id F26F461000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:58:54 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Thu, 17 Oct 2013 16:58:49 +0200 (CEST)
Received: from localhost.localdomain (host-95-199-9-14.mobileonline.telia.com
	[95.199.9.14]) (Authenticated sender: petter@technux.se)
	by smtp-05-01.atm.binero.net (Postfix) with ESMTPSA id CAF1E3A168;
	Thu, 17 Oct 2013 16:58:46 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 16:58:37 +0200
Message-Id: <cover.1381985833.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] clutter: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 17 Oct 2013 14:58:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a first changeset of trying to remove usage if FILESPATH (Bug 4497).
I like the solution to always use ${P} or ${BP} (even if the recipe is alone),
since that will (at least hopefully) force you to go through the file and/or patches
when bumping a recipe to a newer version. One of the cons with this is of course that
you more easily can miss re-create the patches-directory to reflect the new version
but this should result in a build error (since the patch should exist in SRC_URI...).

Especially review the parts where I have moved patches located in both
${PN} and $PN-<something> into just ${P}.

BR,
Petter

The following changes since commit faf8f8660fae26a14578738b642fdeb08bcb9d54:

  build-appliance: Update SRCREV for release (2013-10-11 23:13:07 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug/4497
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug/4497

Petter Mabäcker (1):
  clutter: remove usage of FILESPATH

 meta/classes/clutter.bbclass                       |    1 -
 .../enable_tests.patch                             |    0
 .../fix-wayland-deps.patch                         |    0
 .../cogl-1.14.patch                                |    0
 .../enable-tests.patch                             |    0
 .../fix-build-dir.patch                            |    0
 .../fix-test-includes.patch                        |    0
 7 files changed, 1 deletion(-)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/enable_tests.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/fix-wayland-deps.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.6 => clutter-gst-1.0-1.6.0}/cogl-1.14.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst => clutter-gst-1.0-1.6.0}/enable-tests.patch (100%)
 rename meta/recipes-graphics/mx/{mx-1.4 => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-build-dir.patch (100%)
 rename meta/recipes-graphics/mx/{mx => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-test-includes.patch (100%)

-- 
1.7.9.5


