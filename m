Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF869C77B75
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.32128.1680384533625961513
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=R/HlZ2tE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb92ff0-52f41af2-b06e-462b-8f58-f88fad372fce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=384R6RZWddHPd+Afy5LlQyMZZpChjTlcUBF0MGx5GAE=;
	b=R/HlZ2tEUSCqgT8Xvun/xpF848UOz8LLEX7qCuPaqo35G90K+3vDfuyG3gjsowxr
	uofBvHBV/QySG6lV/0xb1CaOUHwfrTD7S/J4QOtVDlW72FBW1BtEhEwDlIFGTT0utcc
	8hfL8RkskdejrmA1kuAm5Y76ORoYzhAWgrU8xdfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=384R6RZWddHPd+Afy5LlQyMZZpChjTlcUBF0MGx5GAE=;
	b=V1B4zEgxRYdbLdT8iY30isFB9Qe1j7WSCXbYNPuPw/cdiJIrKNKbOlL+TPo0uUEe
	1BqWJUuPqoRT/EHPEvE3aoQ5fJiFLeXSyuF8jemhRexQ0YOnFSfq0RKwI7jiTVT5Fr1
	uH5l477qceNRppyiOku5o9t/Ht2YkS31HvTA5vXU=
Content-Type: multipart/mixed; boundary="===============5793141825832267390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 91735e5019be84d2fa693c5d40746c818ace28f8
 SUCCEEDED
Message-ID: <010101873eb92ff0-52f41af2-b06e-462b-8f58-f88fad372fce-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179557

--===============5793141825832267390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *91735e5019be84d2fa693c5d40746c818ace28f8* has Succeeded.

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
--===============5793141825832267390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBmYWJiOTVmOThlMzVjYzk1YTBkOTBkNGJkYmQ0OGU5NzNhOTVhNmYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDowNDozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA4N2I2ZmFjMDI0Li44ZjVkNmJkNzZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgot
U1JDUkVWID0gIjVhNDkxYzVhZDMzM2VmMzRjMWU3NzEzZjkyMGY1MWNiYjIwNWFmNjAiCitTUkNS
RVYgPSAiOTE3MzVlNTAxOWJlODRkMmZhNjkzYzVkNDA3NDZjODE4YWNlMjhmOCIKIFBFID0gIjIi
CiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzkuMgoK

--===============5793141825832267390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+91735e5019 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14299436 to 14379964 (+1%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3708782 (+5%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-src: FILELIST: removed "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pattern.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r
 0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/dominosa.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5a
 d3-r0/magnets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/latin.h /usr/src/debug/puzzles/2_0.0+gi
 tAUTOINC+5a491c5ad3-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/malloc.c /usr/src/debug/puzzl
 es/2_0.0+gitAUTOINC+5a491c5ad3-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+5a491c5ad3-r0/penrose.c", added "/usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/penrose.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/netslide.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/unruly.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/blackbox.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/penrose.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/mines.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/magn
 ets.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/tree234.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/tree234.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/pegs.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/combi.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/grid.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/palisade.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/flip.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/ps.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/version.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/divvy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/hat-tables.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/pearl.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/grid.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/bridges.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/singles.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019
 -r0/fifteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/gtk.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/tents.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/slant.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/flood.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/gtk.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/dsf.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/loopy.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/cube.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/galaxies.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/random.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/samegame.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/untangle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/tdq.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/sixteen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/tracks.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e501
 9-r0/malloc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/printing.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/mosaic.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/map.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/matching.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/towers.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/lightup.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/matching.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/signpost.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/hat.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/loopgen.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/sort.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/puzzles.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/rect.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/loopgen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/drawing.c /usr/src/debug/puzzles/2_0.0+gitAUT
 OINC+91735e5019-r0/hat.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/net.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/guess.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/latin.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/solo.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/findloop.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/laydomino.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/range.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/undead.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/misc.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/filling.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/latin.h /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/unequal.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/midend.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/inertia.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/dominosa.c /usr/src/debug/puzzles/2_0.0
 +gitAUTOINC+91735e5019-r0/no-icon.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/keen.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/twiddle.c /usr/src/debug/puzzles/2_0.0+gitAUTOINC+91735e5019-r0/pattern.c"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+91735e5019"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 7028162 to 7200194 (+2%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019

--===============5793141825832267390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+91735e5019

--===============5793141825832267390==--

