Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04320C18E1B
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.5947.1689456455188126413
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JL0c7S1n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101895b73b1f7-178320b2-7777-4ff4-ab51-c3af159d3f20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fRAo+6JB/2OBmgOiMLQclG9HcIe1pak96eLZdK38w4c=;
	b=JL0c7S1nmGvfchwKtZNzQVCX9B49IANXCHA6qjSs6w8DdUwi1oogGuSd5h57HvR5
	NtaPvV4JSDpOH3d00/4iEVEgem/Q2sVAYogQjcDNpLXsCG9NTiYnkVVmw9In3y4lchN
	hdt+ZLjTsWXqyBjYL73OmtlBROXT26FBcga6SQiw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fRAo+6JB/2OBmgOiMLQclG9HcIe1pak96eLZdK38w4c=;
	b=ek/iDjRd5+aAjn3sKao2uuzmgkkWBSNqBwKxZq/BZ0092taWu4QZy4a2slcDK6iJ
	ly15HyebHqKb4wXK7oLFqrOAMumlIKHTn+gaYdHsiteLYuG90WFHEOzEhRFEUQmRXBw
	kjw7zZ1AvFQa4f1SvLkOWxv+NnYJUdSMrDXhZMfk=
Content-Type: multipart/mixed; boundary="===============3262142552884424297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 6de17a7511bf67e999c450851d5bc9e4892367bb
 SUCCEEDED
Message-ID: <010101895b73b1f7-178320b2-7777-4ff4-ab51-c3af159d3f20-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184386

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *6de17a7511bf67e999c450851d5bc9e4892367bb* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From fab6f36e37fd8b2e027edc6d348f42ec8a21dd10 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 19:55:44 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 960b5d3b11..a25786738d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
+SRCREV = "6de17a7511bf67e999c450851d5bc9e4892367bb"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.39.2


--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+b6c842a28c [default] to 0.0+gitAUTOINC+6de17a7511 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 15565588 to 15728716 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+6de17a7511-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3692462 to 3831579 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0
 /twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6
 c842a28c-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/findloop.c /usr/src/debug/puzzles/2
 _0.0+gitAUTOINC+b6c842a28c-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.h /usr/src/debug/pu
 zzles/2_0.0+gitAUTOINC+b6c842a28c-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/midend.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/inertia.c 
 /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/spectre-tables-manual.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOIN
 C+6de17a7511-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/spectre-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/spectre.c /usr/src/debug/
 puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/spectre.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/spectre-tables-auto.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/penrose-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a
 7511-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/penrose-legacy.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/penrose-legacy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/sixteen.c /usr/src/debug
 /puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/bridges.c /us
 r/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/flood.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+6de17a7511-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7454150 to 7523782 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+6de17a7511"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+6de17a7511-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+6de17a7511-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+6de17a7511

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 34 Mirrors 0 Missed 20 Current 717 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 728 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/7.3.0-r0/temp/log.do_packagedata_setscene.1401990
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_package_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Started
NOTE: Running task 2164 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 2376 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: Running task 2377 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: Running task 2379 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: Running task 2384 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 2385 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: Running task 2386 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2388 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2389 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2390 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2391 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2392 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2393 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_fetch)
NOTE: Running task 2395 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: Running task 2396 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2398 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Started
NOTE: Running task 2401 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2402 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2404 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2405 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c9720f2334310b54f80024b2bad87457e6ea259af8be0f4934f782cccb68d3e0
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2406 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2426 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata)
NOTE: Running task 2428 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2429 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2430 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2435 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2437 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2438 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2440 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2441 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2444 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2445 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2448 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2449 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Succeeded
NOTE: Running task 2450 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2451 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2451 tasks of which 2407 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 34 Mirrors 0 Missed 20 Current 717 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 728 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/7.3.0-r0/temp/log.do_packagedata_setscene.1238178
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 770 of 771 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_package_setscene)
NOTE: Running task 2164 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 2375 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: Running task 2376 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Started
NOTE: Running task 2379 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2380 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2386 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: Running task 2387 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2388 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 2389 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: Running task 2390 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2392 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2393 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2394 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2395 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 2396 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2397 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_fetch)
NOTE: Running task 2399 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: Running task 2400 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2401 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2404 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2405 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c9720f2334310b54f80024b2bad87457e6ea259af8be0f4934f782cccb68d3e0
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2406 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2407 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2427 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata)
NOTE: Running task 2429 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2430 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2437 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2438 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: Running task 2439 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2440 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2441 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2442 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2443 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2444 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2445 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2446 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Succeeded
NOTE: Running task 2447 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2448 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2449 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Succeeded
NOTE: Running task 2450 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2451 of 2451 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2451 tasks of which 2407 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 89 recipes from the core2-32 sysroot...done.
Removing 89 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 456 Local 445 Mirrors 0 Missed 11 Current 283 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 284 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 293 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 295 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 303 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 307 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 330 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1058 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 356 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 357 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: Running task 1128 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 392 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1130 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 1131 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 394 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c9720f2334310b54f80024b2bad87457e6ea259af8be0f4934f782cccb68d3e0
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 401 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1132 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: Running task 1134 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: Running setscene task 430 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 432 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/harfbuzz/7.3.0-r0/temp/log.do_packagedata_setscene.1488590
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 437 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_package_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running setscene task 474 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 495 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 514 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 524 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 526 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 528 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 530 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 550 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 553 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 559 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 560 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 582 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 615 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 629 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 636 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 650 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 671 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 693 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 699 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 717 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 722 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 739 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2249 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata)
NOTE: Running task 2289 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: Running task 2342 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2343 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Running task 2344 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2346 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2348 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2349 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2350 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Succeeded
NOTE: Running task 2351 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2352 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2353 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Succeeded
NOTE: Running task 2354 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2355 of 2355 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2355 tasks of which 2330 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 298 Local 289 Mirrors 0 Missed 9 Current 479 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2198 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: Running task 2456 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2457 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: Running task 2458 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2459 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 2460 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2461 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2462 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2463 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2467 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2468 tasks of which 2454 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+6de17a7511-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+6de17a7511-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+6de17a7511-r0/temp/log.do_packagedata.1133088
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 35 Mirrors 0 Missed 20 Current 722 (63% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 733 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/7.3.0-r0/temp/log.do_packagedata_setscene.1147014
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 776 of 777 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_package_setscene)
NOTE: Running task 2182 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Started
NOTE: Running task 2398 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Running task 2399 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: Running task 2401 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2402 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2407 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2408 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: Running task 2409 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 2410 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2413 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_fetch)
NOTE: Running task 2415 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2416 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2417 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2419 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 2420 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2421 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2422 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2423 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2424 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 2425 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2426 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2427 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c9720f2334310b54f80024b2bad87457e6ea259af8be0f4934f782cccb68d3e0
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: Running task 2448 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata)
NOTE: Running task 2450 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2451 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2452 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2457 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2458 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2459 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2460 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: Running task 2461 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2462 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2463 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2464 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2465 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2466 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2467 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2468 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Succeeded
NOTE: Running task 2469 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: Running task 2470 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2471 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Succeeded
NOTE: Running task 2472 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2473 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2473 tasks of which 2429 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3262142552884424297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBmYWI2ZjM2ZTM3ZmQ4YjJlMDI3ZWRjNmQzNDhmNDJlYzhhMjFkZDEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTk6NTU6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggOTYwYjVkM2IxMS4uYTI1Nzg2NzM4ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICJiNmM4NDJhMjhjZjY1OTdkZjA2M2ZjZmYzNTA3OWMz
ZTM5ODIzODFlIgorU1JDUkVWID0gIjZkZTE3YTc1MTFiZjY3ZTk5OWM0NTA4NTFkNWJjOWU0ODky
MzY3YmIiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============3262142552884424297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b003fb9311a1e7613c8f6d4ebf0b8cf41d8af575"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 34 Mirrors 0 Missed 20 Current 712 (62% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 723 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/7.3.0-r0/temp/log.do_packagedata_setscene.1322174
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 765 of 766 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_package_setscene)
NOTE: Running task 2152 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: Running task 2357 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: Running task 2358 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: Running task 2363 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: Running task 2368 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Started
NOTE: Running task 2369 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2370 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2371 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: Running task 2373 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: Running task 2374 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2376 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2377 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2378 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2379 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2380 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2382 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2383 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2384 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_unpack)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2386 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_patch: Succeeded
NOTE: Running task 2387 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2388 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2389 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic unihash changed to c9720f2334310b54f80024b2bad87457e6ea259af8be0f4934f782cccb68d3e0
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2390 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2391 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2411 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata)
NOTE: Running task 2413 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2414 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2419 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2420 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2421 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_configure: Succeeded
NOTE: Running task 2422 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2423 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2424 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2425 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_compile: Succeeded
NOTE: Running task 2426 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2428 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package: Succeeded
NOTE: Running task 2429 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_packagedata: Succeeded
NOTE: Running task 2430 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_write_rpm)
NOTE: Running task 2431 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: Running task 2432 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2433 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_qa: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_spdx: Succeeded
NOTE: Running task 2434 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_create_runtime_spdx)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+6de17a7511-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2435 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_build)
NOTE: Tasks Summary: Attempted 2435 tasks of which 2391 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:8.0.1-r0 to 0:7.3.0-r0) [version-going-backwards]
ERROR: harfbuzz-7.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3262142552884424297==--

