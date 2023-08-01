Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AE2C2FC0E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:29:03 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.17721.1690907331873033016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C3fCZDps;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=m1OlJZht;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189b1ee516d-5284429e-b056-48b1-ae93-023ec65a2b35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HR9UgJ6ZDNMvl6l2AmYlh00vxu05dw64nM8pLZGBUrY=;
	b=C3fCZDpsP6tY2M5DhlK3/mgoTNvw6XpAWC+ib1aKnHKwyXEXrmzFc8ZGF5XnZUem
	QMz2YAENLj/z/EZjQsOlgOezF8jAbsmJ6mWhk/9vAac7Gz0dHwJBwSgUup/OK5aF2/J
	4iuui1TNMPhv+y/tQkm2Ah2zkqOTCORMr6i1cr8k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907333;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HR9UgJ6ZDNMvl6l2AmYlh00vxu05dw64nM8pLZGBUrY=;
	b=m1OlJZht1ISaFG9hicUHJoUWqHA2ObC/hJHJV/KrOF+poBHYn6BFxk/bp+uEnLrr
	+yeq4QfLPdiUyFD0dYV9t7NR4oWLOSsAaoafb7i7D6C6rzCzSSMJ36WYmM3+zkJWUEG
	RkiSTNft90igANndbv6/zsrgjtU0RXFXELyq+6l0=
Content-Type: multipart/mixed; boundary="===============1969694665022612454=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 0dd01866627e82ea21ed0e85021abdb070e0159c
 SUCCEEDED
Message-ID: <01010189b1ee516d-5284429e-b056-48b1-ae93-023ec65a2b35-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185342

--===============1969694665022612454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *0dd01866627e82ea21ed0e85021abdb070e0159c* has Succeeded.

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
From abc875e820963a25bf8eb83131ae861f7ae8860d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 16:03:26 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 960b5d3b11..6f1b220de0 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
+SRCREV = "0dd01866627e82ea21ed0e85021abdb070e0159c"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.39.2


--===============1969694665022612454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+b6c842a28c [default] to 0.0+gitAUTOINC+0dd0186662 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 15564172 to 15728372 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+0dd0186662-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3692462 to 3831955 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0
 /dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTO
 INC+b6c842a28c-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAU
 TOINC+b6c842a28c-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/puzzles.h /usr/src/debug/p
 uzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/range.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/dra
 wing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/penrose-legacy.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/penrose-legacy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/spectre-tables-manual.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/printing.c /usr/src/debug/puz
 zles/2_0.0+gitAUTOINC+0dd0186662-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/penrose-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/spectre.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/spectre
 .c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/spectre-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/spectre-tables-auto.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/findloop.c /usr/src/debug/puzzles/
 2_0.0+gitAUTOINC+0dd0186662-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/magnets.c /usr/src/debug/p
 uzzles/2_0.0+gitAUTOINC+0dd0186662-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/matching.h /usr/sr
 c/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/palisade.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+0dd0186662-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7454150 to 7523782 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+0dd0186662"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662

--===============1969694665022612454==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBhYmM4NzVlODIwOTYzYTI1YmY4ZWI4MzEzMWFlODYxZjdhZTg4NjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxNjowMzoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA5NjBiNWQzYjExLi42ZjFiMjIwZGUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gImI2Yzg0MmEyOGNmNjU5N2RmMDYzZmNmZjM1MDc5YzNl
Mzk4MjM4MWUiCitTUkNSRVYgPSAiMGRkMDE4NjY2MjdlODJlYTIxZWQwZTg1MDIxYWJkYjA3MGUw
MTU5YyIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzkuMgoK

--===============1969694665022612454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1805 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1805 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:12a94e38c0fcd9970cd22ef1cfd5c89c2ae79138"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 259 Local 249 Mirrors 0 Missed 10 Current 723 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2402 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_recipe_qa)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_recipe_qa: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2660 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_fetch: Succeeded
NOTE: Running task 2661 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 2662 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_unpack: Succeeded
NOTE: Running task 2663 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 2664 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_patch: Succeeded
NOTE: Running task 2665 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2666 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: Running task 2667 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_lic)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_populate_lic: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_populate_lic: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2668 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_configure: Succeeded
NOTE: Running task 2669 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_compile: Succeeded
NOTE: Running task 2670 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_install: Succeeded
NOTE: Running task 2671 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 2672 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_populate_sysroot: Succeeded
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_package: Succeeded
NOTE: Running task 2673 of 2678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+gitAUTOINC+0dd0186662-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 2673 tasks of which 2658 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+b6c842a28c-r0 to 2:0.0+git0+0dd0186662-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+gitAUTOINC+0dd0186662-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/puzzles/2_0.0+gitAUTOINC+0dd0186662-r0/temp/log.do_packagedata.4126777
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============1969694665022612454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles (['= 2:0.0+git0+0dd0186662-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+b6c842a28c-r0'])", added "puzzles-dev (['= 2:0.0+git0+0dd0186662-r0'])"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+0dd0186662

--===============1969694665022612454==--

