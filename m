Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB5EAC63703
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.852.1667349633505542003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q+HOKL4z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018435c85ee2-0cf6ca4f-281d-4a56-abb8-941a26cae60a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N11/99FVcm1oXsT92saUO/Xh3O50NXOgN+vRxR/6/Z0=;
	b=Q+HOKL4zG9hDEZ0VGqLjbRg1FtSuKcQTRg4JJSaIkw9U9FqUxQTwTapV0hVsG9Ih
	uMc/EyFSAfwyquR+FgEfWUhK1RWkb7I6VIfLmrmUFoswgpMssLDfQHM6+bUHCmE1E90
	t5XbUWiiGeCwiZM7Ge0MMJZA7Cp/uwhUxQB//gXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N11/99FVcm1oXsT92saUO/Xh3O50NXOgN+vRxR/6/Z0=;
	b=I0+4s6TcXdT0IUWg0iGWLqL513kY9Bimg5JJ5KABb/TR/UYg0/5J3ukAmmWUCHqb
	nKxgjHGG6YieTncrkFfJ3o4cho2jA5EdT7WmtymEaT2At66aY90qvGJYnjGNzu4DV1d
	pBfskx0cSvfORkAkjEiqrjDFY16rqP9wYVjfT0f4=
Content-Type: multipart/mixed; boundary="===============2226610072164203799=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 5.3.1 SUCCEEDED
Message-ID: <0101018435c85ee2-0cf6ca4f-281d-4a56-abb8-941a26cae60a-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172481

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *5.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-5.3.0-5.3.1.patch
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
--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 45010072 to 45042312 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.50300.0 /usr/lib/.debug/libharfbuzz-icu.so.0.50300.0 /usr/lib/.debug/libharfbuzz-subset.so.0.50300.0 /usr/lib/.debug/libharfbuzz.so.0.50300.0", added "/usr/lib/.debug/libharfbuzz-icu.so.0.50301.0 /usr/lib/.debug/libharfbuzz.so.0.50301.0 /usr/lib/.debug/libharfbuzz-subset.so.0.50301.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1455989 to 1456795 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50300.0", added "/usr/lib/libharfbuzz-icu.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4138944 to 4147052 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/glyf -> /usr/src/debug/harfbuzz/5.3.1-r0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/util -> /usr/src/debug/harfbuzz/5.3.1-r0/util, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/5.3.1-r0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout -> /usr/src/debug/harfbuzz/5.3.1-r0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/5.3.1-r0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/5.3.1-r0/src/OT/Layout/Common, directory renamed /usr/src/debug/harfbuzz/5.3.0-r0/src/graph -> /usr/src/debug/harfbuzz/5.3.1-r0/src/graph, removed "/usr/src/debug/harfbuzz/5.3.0-r0/src/hb-font.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-common.hh /usr
 /src/debug/harfbuzz/5.3.0-r0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-font.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff1.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-null.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-repacker.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-cbdt-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cache.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-array.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-deprecated.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-draw.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-name-language-sta
 tic.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-iter.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-set.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-bimap.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-mutex.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-blob.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-gdef-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-atomic.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-debug.hh /usr/src/debug/harfbuzz/5.3
 .0-r0/src/hb-ot-name-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-buffer.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-version.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-glib.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-cpal-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-algs.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-math.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-blob.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shap
 er-thai.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-unicode.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-face.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-common.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-icu.cc /usr/src/debug/harfbuzz/5.3.0-r0/s
 rc/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-face.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-set.hh /usr/src/debug/harfbuzz/5.
 3.0-r0/src/hb-open-type.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-unicode.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-map.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-map.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ft.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-font.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-draw.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-meta-table.hh /usr/
 src/debug/harfbuzz/5.3.0-r0/src/hb-string-array.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shaper.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-buffer.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-face.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-kern.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-meta.cc /usr/src/debug/har
 fbuzz/5.3.0-r0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-set.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-sbix-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-style.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-utf.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-name.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-unicode.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/5.3.0-
 r0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-meta.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-serialize.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-number.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-common.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-draw.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff2.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-vector.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ft.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-cff-common.hh /usr/src/debu
 g/harfbuzz/5.3.0-r0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-object.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shaper.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-machinery.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ucd.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-static.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-number.hh /usr/sr
 c/debug/harfbuzz/5.3.0-r0/src/hb-ot-var.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-pool.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-font.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shape.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-svg-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-buffer.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic-joining-list.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-open-file.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-shape.h /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-colrv1-closur
 e.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-color-colr-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-blob.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-style.cc /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-map.hh /usr/src/debug/harfbuzz/5.3.0-r0/src/hb-ot-head-table.hh", added "/usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-machinery.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-version.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/5.
 3.1-r0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ucd.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-map.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shaper.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shape.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-colrv1-closure.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-array.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-draw.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/
 debug/harfbuzz/5.3.1-r0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-font.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-blob.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-iter.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-kern.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shaper.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-repacker.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-draw.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-icu.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-null.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-map.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-set.h /usr/s
 rc/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-cbdt-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-bimap.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-deprecated.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-unicode.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-serialize.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-set.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-common.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/h
 b-ot-meta.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-buffer.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-face.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-blob.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-name-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-vector.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-svg-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-algs.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-font.h /usr/src/deb
 ug/harfbuzz/5.3.1-r0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ft.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-unicode.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shape.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-sbix-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-
 shaper-myanmar.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-atomic.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-buffer.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-common.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-face.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-buffer.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-static.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-map.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-set-digest.hh /usr/src/debug/h
 arfbuzz/5.3.1-r0/src/hb-open-file.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-style.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-open-type.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-glib.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-math.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-debug.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-font.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-colr-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-style.h /usr/src/debug/harfbuzz/5.3.
 1-r0/src/hb-subset-cff2.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-face.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-mutex.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-font.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-unicode.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-arabic-joining-list.h
 h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-pool.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-var.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-meta.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ft.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-ta
 g.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-cff1.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cache.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-draw.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-gdef-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-name.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color-cpal-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-object.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-string-a
 rray.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-blob.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-number.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-number.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-utf.hh /usr/src/debug/harf
 buzz/5.3.1-r0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-set.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-subset.hh /usr/src/debug/harfbuzz/5.3.1-r0/src/hb-sanitize.hh"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50300.0", added "/usr/lib/libharfbuzz-subset.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.50300.0 /usr/lib/libharfbuzz.so.0.50300.0", added "/usr/lib/libharfbuzz-gobject.so.0.50301.0 /usr/lib/libharfbuzz.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz: PV changed from "5.3.0" to "5.3.1"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 5.3.0 [default] to 5.3.1 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/5.3.0/harfbuzz-5.3.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/5.3.1/harfbuzz-5.3.1.tar.xz"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50300.0 to libharfbuzz-gobject.so.0.50301.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50300.0 to libharfbuzz-icu.so.0.50301.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50300.0 to libharfbuzz.so.0.50301.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50300.0 to libharfbuzz-subset.so.0.50301.0
  /usr/lib/libharfbuzz-gobject.so.0.50300.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50301.0
  /usr/lib/libharfbuzz-icu.so.0.50300.0 moved to /usr/lib/libharfbuzz-icu.so.0.50301.0
  /usr/lib/libharfbuzz.so.0.50300.0 moved to /usr/lib/libharfbuzz.so.0.50301.0
  /usr/lib/libharfbuzz-subset.so.0.50300.0 moved to /usr/lib/libharfbuzz-subset.so.0.50301.0

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.50300.0", added "/usr/lib/libharfbuzz-icu.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.50300.0", added "/usr/lib/libharfbuzz-subset.so.0.50301.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.50300.0 /usr/lib/libharfbuzz-gobject.so.0.50300.0", added "/usr/lib/libharfbuzz-gobject.so.0.50301.0 /usr/lib/libharfbuzz.so.0.50301.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.50300.0 to libharfbuzz-gobject.so.0.50301.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.50300.0 to libharfbuzz-icu.so.0.50301.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.50300.0 to libharfbuzz.so.0.50301.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.50300.0 to libharfbuzz-subset.so.0.50301.0
  /usr/lib/libharfbuzz-gobject.so.0.50300.0 moved to /usr/lib/libharfbuzz-gobject.so.0.50301.0
  /usr/lib/libharfbuzz-icu.so.0.50300.0 moved to /usr/lib/libharfbuzz-icu.so.0.50301.0
  /usr/lib/libharfbuzz.so.0.50300.0 moved to /usr/lib/libharfbuzz.so.0.50301.0
  /usr/lib/libharfbuzz-subset.so.0.50300.0 moved to /usr/lib/libharfbuzz-subset.so.0.50301.0

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 15 Mirrors 0 Missed 71 Current 361 (17% match, 84% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1153 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1167 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1168 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_fetch)
NOTE: Running task 1176 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1179 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1203 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_fetch)
NOTE: Running task 1206 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1211 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1212 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 1213 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1214 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1215 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1240 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_fetch)
NOTE: Running task 1241 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_fetch)
NOTE: Running task 1242 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1283 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1294 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: Running task 1326 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1374 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_write_config)
NOTE: Running task 1375 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1425 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: Running task 1431 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1432 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1434 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1435 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1436 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1437 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: Running task 1438 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1439 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1440 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: Running task 1441 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1442 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: Running task 1443 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1444 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 1446 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_unpack)
NOTE: Running task 1447 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_unpack)
NOTE: Running task 1448 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running task 1449 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_unpack)
NOTE: Running task 1450 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_unpack)
NOTE: Running task 1451 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1452 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: Running task 1454 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1455 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1456 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Started
NOTE: Running task 1457 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: Running task 1458 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1459 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1460 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: Running task 1461 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: Running task 1462 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: Running task 1463 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: Running task 1464 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: Running task 1465 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: Running task 1466 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: Running task 1467 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: Running task 1468 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: Running task 1469 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1470 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1471 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1472 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: Running task 1473 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: Running task 1474 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1475 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1476 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1477 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_patch)
NOTE: Running task 1478 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1481 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1482 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1483 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1484 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1485 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1486 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: Running task 1487 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1488 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: Running task 1489 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: Running task 1490 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1491 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_patch)
NOTE: Running task 1492 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1493 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Started
NOTE: Running task 1494 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Started
NOTE: Running task 1495 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1497 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1498 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic unihash changed to d41377b50949945528d1914a71372d8cb11870ad33df51635cf089998fe20775
NOTE: Running task 1501 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package)
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 1509 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 1520 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1521 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: Running task 1522 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1523 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1524 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1525 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: Running task 1527 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 1528 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1530 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 1531 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1534 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: Running task 1535 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1537 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_compile)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1540 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1541 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1542 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1543 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1544 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 1545 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1548 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_package: Succeeded
NOTE: Running task 1549 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1552 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1554 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1555 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 1556 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_package)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1557 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1560 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Failed
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1560 tasks of which 1409 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/fontconfig/2.14.0-r0/temp/log.do_packagedata.2925118
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata) failed with exit code '1'

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 63 recipes from the core2-32 sysroot...done.
Removing 63 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 277 Local 202 Mirrors 0 Missed 75 Current 171 (72% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 176 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 223 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 249 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_71.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 694 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 726 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 727 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 728 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 729 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_fetch)
NOTE: Running task 730 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 731 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 736 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_fetch)
NOTE: Running task 737 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 741 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 742 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 743 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 744 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 746 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 756 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_fetch)
NOTE: Running task 757 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_fetch)
NOTE: Running task 758 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 781 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 782 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: Running task 795 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 834 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_write_config)
NOTE: Running task 835 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 845 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: Running task 846 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 847 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: Running task 848 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: Running task 849 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 850 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_unpack)
NOTE: Running task 852 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 853 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 854 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: Running task 855 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: Running task 856 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 857 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 275 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: Running task 858 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_unpack)
NOTE: Running task 859 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_unpack)
NOTE: Running task 860 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_unpack)
NOTE: Running task 861 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: Running setscene task 280 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: recipe icu-71.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 282 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.38.bb:do_populate_sysroot_setscene)
NOTE: Running task 866 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 867 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 284 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 286 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 290 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 890 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe icu-71.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: Running task 892 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 894 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: Running task 895 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Running task 899 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running task 900 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: Running task 901 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 902 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: Running task 904 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: Running task 905 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 906 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: Running setscene task 300 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running task 907 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: Running task 912 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 913 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 914 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 915 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 916 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 917 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 918 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: Running setscene task 303 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 305 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 309 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 927 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_patch)
NOTE: Running task 928 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 929 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Started
NOTE: Running task 930 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 931 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 932 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 316 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 933 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 934 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 935 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 324 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 325 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 944 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 945 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 344 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 351 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 373 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1008 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1009 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1010 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1011 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1012 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic unihash changed to d41377b50949945528d1914a71372d8cb11870ad33df51635cf089998fe20775
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 384 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 386 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 388 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1025 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1038 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 435 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 436 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 442 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 448 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1359 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1385 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1396 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1397 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1414 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1442 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1443 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1485 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1486 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1487 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: Running task 1488 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1489 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1490 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: Running task 1491 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1492 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1493 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure)
NOTE: Running task 1494 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Succeeded
NOTE: Running task 1495 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_install)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Succeeded
NOTE: Running task 1496 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot)
NOTE: Running task 1497 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1500 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile)
NOTE: recipe wayland-1.21.0-r0: task do_compile: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1502 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1505 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot)
NOTE: Running task 1506 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_package: Succeeded
NOTE: Running task 1507 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1508 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1509 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 1510 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: Running task 1513 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: Running task 1516 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: Running task 1521 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1522 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1523 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: Running task 1524 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 1525 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1526 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1527 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1528 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: Running task 1529 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1532 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1533 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: Running task 1535 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: Running task 1536 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1537 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1538 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_compile)
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 1540 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 1545 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1546 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: Running task 1547 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_install)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_install: Succeeded
NOTE: Running task 1548 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot)
NOTE: Running task 1549 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1552 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1554 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 1555 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1556 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1557 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1559 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1562 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1563 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1565 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: Running task 1566 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1567 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1568 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1569 of 1607 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Failed
NOTE: recipe xrandr-1_1.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1569 tasks of which 1395 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/fontconfig/2.14.0-r0/temp/log.do_packagedata.3578675
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata) failed with exit code '1'

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 15 Mirrors 0 Missed 71 Current 361 (17% match, 84% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1153 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1167 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1168 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_fetch)
NOTE: Running task 1176 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1179 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1203 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_fetch)
NOTE: Running task 1206 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1211 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 1212 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1214 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1215 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1216 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1239 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1241 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_fetch)
NOTE: Running task 1242 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_fetch)
NOTE: Running task 1280 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1294 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: Running task 1326 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1372 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1375 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_write_config)
NOTE: Running task 1425 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 1431 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1432 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 1433 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1434 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Started
NOTE: Running task 1436 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1437 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1438 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1439 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1440 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1441 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1442 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_unpack)
NOTE: Running task 1443 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1444 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: Running task 1445 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: Running task 1446 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1447 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1448 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1449 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1450 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_unpack)
NOTE: Running task 1451 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1452 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: Running task 1453 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: Running task 1454 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1455 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1456 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: Running task 1457 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1458 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: Running task 1459 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: Running task 1460 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1461 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1462 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: Running task 1464 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1465 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: Running task 1466 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_patch)
NOTE: Running task 1467 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Started
NOTE: Running task 1468 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1470 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1472 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1473 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: Running task 1474 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 1475 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1476 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1477 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Started
NOTE: Running task 1480 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1481 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1482 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1483 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1484 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1485 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1486 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1487 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1488 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1489 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1490 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_configure)
NOTE: Running task 1491 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_configure)
NOTE: Running task 1492 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: Running task 1493 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1494 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1495 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_compile)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: Running task 1496 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_patch)
NOTE: Running task 1497 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1499 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic)
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Succeeded
NOTE: Running task 1500 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_install)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic unihash changed to d41377b50949945528d1914a71372d8cb11870ad33df51635cf089998fe20775
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Succeeded
NOTE: Running task 1503 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 1509 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1513 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: Running task 1514 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1515 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: Running task 1522 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1523 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1524 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: Running task 1525 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: Running task 1527 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 1528 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1529 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1530 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: Running task 1534 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: Running task 1535 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 1536 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_compile)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: Running task 1538 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_compile)
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1540 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1541 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: Running task 1544 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_install)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1546 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.113-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot)
NOTE: Running task 1548 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Succeeded
NOTE: Running task 1550 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: Running task 1553 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 1554 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_package)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1555 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1556 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1557 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 1559 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1560 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1562 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1563 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1564 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1566 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Failed
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1566 tasks of which 1409 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/fontconfig/2.14.0-r0/temp/log.do_packagedata.3160513
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata) failed with exit code '1'

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 86 Local 15 Mirrors 0 Missed 71 Current 361 (17% match, 84% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1153 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1167 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1168 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_fetch)
NOTE: Running task 1176 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1179 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1203 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_fetch)
NOTE: Running task 1206 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1210 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1211 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 1213 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1214 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1215 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1239 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_fetch)
NOTE: Running task 1241 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_fetch)
NOTE: Running task 1242 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1283 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1292 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: Running task 1326 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1372 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_write_config)
NOTE: Running task 1375 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1425 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1432 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1433 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1434 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1435 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1436 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1437 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: Running task 1438 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1439 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1440 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1441 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 1442 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_unpack)
NOTE: Running task 1443 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_unpack)
NOTE: Running task 1444 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1445 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: Running task 1446 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1447 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1448 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1449 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_unpack)
NOTE: Running task 1450 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_unpack)
NOTE: Running task 1451 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1452 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1453 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: Running task 1454 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1455 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: Running task 1456 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1457 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: Running task 1458 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: Running task 1459 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: Running task 1460 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: Running task 1461 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 1462 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: Running task 1463 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1464 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1465 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1466 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: Running task 1467 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_patch)
NOTE: Running task 1468 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: Running task 1469 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: Running task 1470 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1471 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Started
NOTE: Running task 1472 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1473 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: Running task 1474 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1475 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_patch)
NOTE: Running task 1476 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1477 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 1478 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1481 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1483 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1484 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1485 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1486 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1487 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1488 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: Running task 1489 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1490 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1491 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1492 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1493 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: Running task 1494 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_compile)
NOTE: Running task 1495 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running task 1497 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_install)
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1499 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1500 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic unihash changed to d41377b50949945528d1914a71372d8cb11870ad33df51635cf089998fe20775
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot)
NOTE: Running task 1504 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 1509 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: Running task 1514 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1515 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1522 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: Running task 1523 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1524 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: Running task 1525 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1527 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: Running task 1528 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1530 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1532 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: Running task 1534 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: Running task 1536 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1537 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: Running task 1538 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1542 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: Running task 1544 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_install)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1546 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: Running task 1547 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot)
NOTE: Running task 1548 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1550 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 1551 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_package)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Started
NOTE: Running task 1552 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1554 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1555 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1556 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Succeeded
NOTE: Running task 1557 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Failed
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1557 tasks of which 1409 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/fontconfig/2.14.0-r0/temp/log.do_packagedata.3361724
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata) failed with exit code '1'

--===============2226610072164203799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1666 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:1af2da4c1505ca8198786c141676afffce02d0b8"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 16 Mirrors 0 Missed 71 Current 360 (18% match, 84% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 439 of 447 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 447 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.224.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1153 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_fetch)
NOTE: Running task 1167 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_fetch)
NOTE: Running task 1168 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_fetch)
NOTE: Running task 1176 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_fetch)
NOTE: Running task 1179 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_fetch)
NOTE: Running task 1203 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_fetch)
NOTE: Running task 1206 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_fetch)
NOTE: Running task 1209 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_fetch)
NOTE: Running task 1210 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_fetch)
NOTE: Running task 1212 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_fetch)
NOTE: Running task 1213 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_fetch)
NOTE: Running task 1214 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_fetch)
NOTE: Running task 1235 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_fetch)
NOTE: Running task 1236 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_fetch)
NOTE: Running task 1238 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_fetch)
NOTE: Running task 1274 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_fetch)
NOTE: Running task 1286 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_write_config)
NOTE: Running task 1320 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_fetch)
NOTE: Running task 1353 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_write_config)
NOTE: Running task 1354 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_write_config)
NOTE: Running task 1406 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-native-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glslang-native-1_1.3.224.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Started
NOTE: Running task 1412 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_unpack)
NOTE: Running task 1413 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_fetch: Succeeded
NOTE: Running task 1414 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_unpack)
NOTE: Running task 1415 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Started
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Started
NOTE: Running task 1416 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_unpack)
NOTE: Running task 1417 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_unpack)
NOTE: Running task 1418 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_unpack)
NOTE: Running task 1419 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_fetch: Succeeded
NOTE: Running task 1420 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_unpack)
NOTE: Running task 1421 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_unpack)
NOTE: recipe cairo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Started
NOTE: Running task 1422 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_unpack)
NOTE: Running task 1423 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_unpack)
NOTE: Running task 1424 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1425 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_unpack)
NOTE: Running task 1426 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_unpack)
NOTE: Running task 1427 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Started
NOTE: Running task 1428 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_fetch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1429 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_unpack)
NOTE: Running task 1430 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_unpack)
NOTE: Running task 1431 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_unpack)
NOTE: Running task 1432 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_unpack)
NOTE: Running task 1433 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.113-r0: task do_write_config: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_unpack: Succeeded
NOTE: Running task 1434 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-native-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Started
NOTE: Running task 1444 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_22.2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1445 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_unpack)
NOTE: recipe libxext-1_1.3.4-r0: task do_unpack: Succeeded
NOTE: Running task 1446 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Started
NOTE: Running task 1447 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1448 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Started
NOTE: Running task 1449 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_patch)
NOTE: recipe glslang-native-1_1.3.224.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxshmfence-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1460 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_patch)
NOTE: Running task 1461 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_patch)
NOTE: Running task 1462 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_patch)
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_unpack: Succeeded
NOTE: Running task 1463 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_patch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1464 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_patch)
NOTE: Running task 1465 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_unpack: Succeeded
NOTE: Running task 1466 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_patch)
NOTE: recipe fontconfig-2.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_patch)
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1469 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1470 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1471 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_patch: Succeeded
NOTE: Running task 1472 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1473 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpciaccess-0.16-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1474 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1475 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1477 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1478 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_configure)
NOTE: Running task 1479 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_configure)
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.113-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1481 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe cairo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1483 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_patch)
NOTE: recipe libxshmfence-1.3-r0: task do_patch: Succeeded
NOTE: Running task 1484 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1485 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_patch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1486 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_configure)
NOTE: recipe xrandr-1_1.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1487 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_patch: Succeeded
NOTE: Running task 1488 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1489 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_configure)
NOTE: recipe fontconfig-2.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1490 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1491 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_configure)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1493 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1494 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1495 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1496 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_configure)
NOTE: recipe harfbuzz-5.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1497 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic)
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_lic unihash changed to d41377b50949945528d1914a71372d8cb11870ad33df51635cf089998fe20775
NOTE: recipe harfbuzz-5.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1499 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 1500 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_22.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_compile)
NOTE: recipe pixman-1_0.40.0-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_compile: Succeeded
NOTE: Running task 1503 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_install)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_populate_sysroot)
NOTE: Running task 1505 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_package)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_configure: Succeeded
NOTE: Running task 1506 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_compile: Succeeded
NOTE: Running task 1509 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_install)
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.224.1.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_install)
NOTE: recipe libxshmfence-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_compile)
NOTE: recipe vulkan-headers-1.3.224.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_compile: Succeeded
NOTE: Running task 1513 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_install)
NOTE: recipe libpciaccess-0.16-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_configure: Succeeded
NOTE: Running task 1515 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_compile)
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot)
NOTE: Running task 1517 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_install)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_install: Succeeded
NOTE: Running task 1519 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3-r0: task do_install: Started
NOTE: recipe libpciaccess-0.16-r0: task do_install: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot)
NOTE: Running task 1522 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot)
NOTE: Running task 1523 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package)
NOTE: Running task 1524 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_compile: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Started
NOTE: Running task 1525 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_install)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package: Started
NOTE: Running task 1526 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1527 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot)
NOTE: Running task 1529 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package: Succeeded
NOTE: Running task 1530 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_configure)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata)
NOTE: Running task 1534 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_configure)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_compile)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1538 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot)
NOTE: Running task 1539 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package)
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1540 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1543 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_configure)
NOTE: Running task 1544 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Started
NOTE: recipe libdrm-2.4.113-r0: task do_configure: Succeeded
NOTE: Running task 1545 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_compile)
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.113-r0: task do_compile: Succeeded
NOTE: Running task 1546 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_install)
NOTE: recipe libdrm-2.4.113-r0: task do_install: Started
NOTE: recipe libdrm-2.4.113-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_populate_sysroot)
NOTE: Running task 1548 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_package)
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Started
NOTE: recipe libdrm-2.4.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1549 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_install)
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Started
NOTE: recipe libdrm-2.4.113-r0: task do_package: Succeeded
NOTE: Running task 1550 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.113.bb:do_packagedata)
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.113-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_install: Succeeded
NOTE: Running task 1551 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_populate_sysroot)
NOTE: Running task 1552 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_package)
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1553 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_compile)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 1554 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_install)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 1558 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_install)
NOTE: Running task 1559 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 1560 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Started
NOTE: Running task 1561 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1562 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.14.0-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1563 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1564 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1565 of 1606 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package)
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Started
NOTE: recipe fontconfig-2.14.0-r0: task do_packagedata: Failed
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1565 tasks of which 1409 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.1-r0 to 0:2.14.0-r0) [version-going-backwards]
ERROR: fontconfig-2.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.14.0-r0/temp/log.do_packagedata.2572561
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.0.bb:do_packagedata) failed with exit code '1'

--===============2226610072164203799==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-5.3.0-5.3.1.patch"

RnJvbSBhMTVkNzdkNjMzNWY4N2Y3YmZlOWZiNDVjMjdkYzIyNDRhNWU2YzJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNTowMjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDUuMy4wIC0+IDUuMy4xCgotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1
enpfNS4zLjAuYmIgPT4gaGFyZmJ1enpfNS4zLjEuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfNS4zLjAuYmIgPT4gaGFyZmJ1enpfNS4z
LjEuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzUuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6XzUuMy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el81LjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzUuMy4xLmJiCmluZGV4IDFjMjE2MTBmYjUu
LmY1NjQwM2Q0MjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9o
YXJmYnV6el81LjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFy
ZmJ1enpfNS4zLjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PTZlZTBmMTYyODE2OTRmYjZhYTY4OWNjYTFlMGZiM2RhIFwKICAgICAgICAg
ICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8k
e1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwNWUxOWUz
ZjUyZGEyNGVkMDcxNTIyZjBmZGRmODcyMTU3ZDdkMjVlODY5Y2ZkMTU2Y2Q2ZjFlODFjNDIxNTIi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNGE2Y2UwOTdiNzVhODEyMWZhY2M0YmE4M2I1YjA4M2Jm
ZWM2NTdmNDViMDAzY2Q1YTM0MjRmMmFlNmI0NDM0ZCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25m
aWcgbGliX3BhY2thZ2UgZ3RrLWRvYyBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2l0aHViLXJlbGVh
c2VzCiAKLS0gCjIuMzEuMQoK

--===============2226610072164203799==--

