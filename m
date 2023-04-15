Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5507C77B77
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.13820.1681581687642642732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=btWDaXOc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101878614405f-a78d5723-b0bc-4406-9fae-31b56729c22a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yM5EhKUDClDrViG7v1WAJQ6pB5FFIJmtRmGACzvFSSg=;
	b=btWDaXOc0yL0n+0vpE1bbVd4+DrKBYzKiaT85r9LzwTEd8Gz1r4Ow2SpQQvkk0zK
	gjhIdqiKm0yAf4xNDmdWvQpTe17OUrZ8+OhoRa+a2Mj9gxonQ4ooxH36XD+/T4azQPM
	zdyzHgdoNTbzf2MdnjcRzY1JXbj6K/cWIjz5Ugls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yM5EhKUDClDrViG7v1WAJQ6pB5FFIJmtRmGACzvFSSg=;
	b=rROJK21RA1CYpivgTiy8WE4aYixH1Tc5sQ7Zf/Jk/2DNeizGzXqIbTpyb7iC7mNY
	R9SAJFsk8zat3DeWYLIt2tJ9W44ocdBFxgYTUqt/+56OjNfuOBZShHNp+wiVrVbViwX
	aIaXd6JI0e8OCSqLmRgZFv0XkDmJrvn0Zcs2J89g=
Content-Type: multipart/mixed; boundary="===============8769620048788066851=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 6fb890e0ea20a3c366ffd2de45d26a0c1c454dd6
 SUCCEEDED
Message-ID: <010101878614405f-a78d5723-b0bc-4406-9fae-31b56729c22a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180109

--===============8769620048788066851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *6fb890e0ea20a3c366ffd2de45d26a0c1c454dd6* has Succeeded.

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
--===============8769620048788066851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+6fb890e0ea [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14299436 to 14385368 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/
 malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r
 0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUT
 OINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/p
 uzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/malloc.c
  /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb
 890e0ea-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC
 +6fb890e0ea-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/twiddle.c /usr/src/debug/pu
 zzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/cube.c /usr/src/debug/p
 uzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+6fb890e0ea-r0/printing.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3649748 (+3%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+6fb890e0ea"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7028162 to 7192002 (+2%)

--===============8769620048788066851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+6fb890e0ea

--===============8769620048788066851==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA1MzllMzAxYmI1MmRmMDM1YWI0MjNlZWMwYmQyNGQyODM0NzhiZjFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTY6NTQ6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggODdiNmZhYzAyNC4uM2ZmODYzYzhlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICI1YTQ5MWM1YWQzMzNlZjM0YzFlNzcxM2Y5MjBmNTFjYmIyMDVhZjYwIgorU1JD
UkVWID0gIjZmYjg5MGUwZWEyMGEzYzM2NmZmZDJkZTQ1ZDI2YTBjMWM0NTRkZDYiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============8769620048788066851==--

