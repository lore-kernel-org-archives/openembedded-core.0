Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17659C52CDA
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.173802.1692224343941388704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aGZTpiyZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ESxRmNkh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a006e6eaa-5c4e4feb-684f-45ae-bf96-77acd12d38ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RQaWQT0jF0+oKXbfJCv4o740GY7HsRgAGL8kYpUo9cU=;
	b=aGZTpiyZQTWDvk6EcB6LXh3gOFbP0gm38UUIHfwusxwgU0/xJxR44Y+GRV8UnPV4
	LjSzHkbnjV5Kci8N4xMBbx+RUJH8rJWpr5bgZ+rs+cR9AfUR7D3Co5T/pU3Ck9oHQUV
	19qw8igXa6s5ioSvy30NoV8BMW5IvMHK0o4atqsQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RQaWQT0jF0+oKXbfJCv4o740GY7HsRgAGL8kYpUo9cU=;
	b=ESxRmNkhVvTneG1H6dBPlTLehczmndxF87cmQT1eOgaWjcdxIfZwjrfh+1DhpHBc
	Q5hjdyPKyvOjf6dWxR2GR4EfgfBFDxQt2IQPnV/80ufuEurxPdchm86Xx8oyMvu9ei0
	+5go91OO5FNBbg4uLfgM97CFCfUzXDIAud4bW9K0=
Content-Type: multipart/mixed; boundary="===============5777414729987436754=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to eeec6b867af104a93a615a285a29fab91d8709d4
 SUCCEEDED
Message-ID: <0101018a006e6eaa-5c4e4feb-684f-45ae-bf96-77acd12d38ca-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186255

--===============5777414729987436754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *eeec6b867af104a93a615a285a29fab91d8709d4* has Succeeded.

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
From cda5f7d741510471a682087c1cb006d549174a50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 19:10:35 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 960b5d3b11..88db431860 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "b6c842a28cf6597df063fcff35079c3e3982381e"
+SRCREV = "eeec6b867af104a93a615a285a29fab91d8709d4"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.39.2


--===============5777414729987436754==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBjZGE1ZjdkNzQxNTEwNDcxYTY4MjA4N2MxY2IwMDZkNTQ5MTc0YTUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMTk6MTA6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggOTYwYjVkM2IxMS4uODhkYjQzMTg2MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICJiNmM4NDJhMjhjZjY1OTdkZjA2M2ZjZmYzNTA3OWMz
ZTM5ODIzODFlIgorU1JDUkVWID0gImVlZWM2Yjg2N2FmMTA0YTkzYTYxNWEyODVhMjlmYWI5MWQ4
NzA5ZDQiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============5777414729987436754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+b6c842a28c [default] to 0.0+gitAUTOINC+eeec6b867a [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 15564492 to 15735752 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOIN
 C+b6c842a28c-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6
 c842a28c-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tracks.c /usr/src/debug/puzzles/2_
 0.0+gitAUTOINC+b6c842a28c-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/grid.h /usr/src/
 debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+b6c842a28c-r0/loopy.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/combi.
 c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/penrose-legacy.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUT
 OINC+eeec6b867a-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/penrose-legacy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/version.c /usr/src/debug/puzzle
 s/2_0.0+gitAUTOINC+eeec6b867a-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/spectre-tables-auto.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/hat-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/flood.c
  /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/spectre.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/spectre.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/spectre-tabl
 es-manual.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/penrose-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/spectre-internal.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/untangle.c /usr/
 src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+eeec6b867a-r0/fifteen.c"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3692462 to 3837346 (+4%)
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+b6c842a28c" to "0.0+gitAUTOINC+eeec6b867a"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7454150 to 7523782 (+1%)

--===============5777414729987436754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+b6c842a28c to 0.0+git0+eeec6b867a

--===============5777414729987436754==--

