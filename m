Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19799CA9ECA
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107895.1682976351373701328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QR3wcceM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d9352787-35f6a33f-ec27-4f2a-9335-e159f34bf25a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CkWvOQgG6q+FRBBqrZ3weuv4SM9dgfr7bOCUZmdhVy4=;
	b=QR3wcceMfcI9WFGNqrlX2ZU2VhNMp3jWqRI+/2zTTbLQ0iP8uQZSIftTkWdEkJCK
	qA6a9IKaB3hOmj5vCVeQ5xCtzQTC+SeyNGcGGG9ubbgVBcJAVy4FZKPLa3qj+Uilgwh
	si6e62JtW+eio7BQR4Hb6Jk0izrtJJdzX5pXBK5k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CkWvOQgG6q+FRBBqrZ3weuv4SM9dgfr7bOCUZmdhVy4=;
	b=fp/4e+MdcN4oD5tjsSDfiQ/n++6yrN/GW9CF2tHDXxm7cAWi4+UxfRV4VtnVgj8G
	STAHkfiufVNboRpuKfMREpcQgn5szFML+kmcokWAqL8duOQFfGn4rj59GbTBqxxyIlv
	m2NNqXImgudXe6a/senfeMAwK4c/Ojc/AT62GHVw=
Content-Type: multipart/mixed; boundary="===============6924212349862142354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 7.2.0 SUCCEEDED
Message-ID: <01010187d9352787-35f6a33f-ec27-4f2a-9335-e159f34bf25a-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180661

--===============6924212349862142354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *7.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-7.1.0-7.2.0.patch
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
--===============6924212349862142354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 49926412 to 51042168 (+2%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.60710.0 /usr/lib/.debug/libharfbuzz.so.0.60710.0 /usr/lib/.debug/libharfbuzz-subset.so.0.60710.0 /usr/lib/.debug/libharfbuzz-icu.so.0.60710.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60710.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.60720.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.60720.0 /usr/lib/.debug/libharfbuzz.so.0.60720.0 /usr/lib/.debug/libharfbuzz-cairo.so.0.60720.0 /usr/lib/.debug/libharfbuzz-icu.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1692493 to 1694301 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60710.0", added "/usr/lib/libharfbuzz-icu.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 4565796 to 4598028 (+1%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Color/COLR -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Color/COLR, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/glyf -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/glyf, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Layout -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Layout, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Layout/GDEF -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Layout/GDEF, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/graph -> /usr/src/debug/harfbuzz/7.2.0-r0/src/graph, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Color/CBDT -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Color/CBDT, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Layout/GSUB -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Layout/GSUB, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Color/svg -> /usr/src/debug/harfbuzz/7.2.0
 -r0/src/OT/Color/svg, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/util -> /usr/src/debug/harfbuzz/7.2.0-r0/util, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/name -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/name, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Color/sbix -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Color/sbix, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Layout/GPOS -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Layout/GPOS, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Color/CPAL -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Color/CPAL, directory renamed /usr/src/debug/harfbuzz/7.1.0-r0/src/OT/Layout/Common -> /usr/src/debug/harfbuzz/7.2.0-r0/src/OT/Layout/Common, removed "/usr/src/debug/harfbuzz/7.1.0-r0/src/hb-iter.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-buffer-serialize.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-number.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-set.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shap
 er-use.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shape.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-open-file.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-number.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-open-type.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-color.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-pool.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-debug.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-head-tabl
 e.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-vector.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-version.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-string-array.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-draw.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-kern.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-atomic.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-input.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-mutex.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-unicode.cc /usr
 /src/debug/harfbuzz/7.1.0-r0/src/hb-cairo.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-machinery.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-blob.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-repacker.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-paint.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff1.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-utf.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-font.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-os2-uni
 code-ranges.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-gobject-enums.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-map.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-serialize.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-indic.hh /usr/src/debug/harf
 buzz/7.1.0-r0/src/hb-face.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-glib.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-paint.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-meta.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-vorg-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/h
 b-font.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-bimap.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-buffer.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-object.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-font.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-math.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-name.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-paint.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-commo
 n.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-face.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-face.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-blob.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cache.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ft.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-buffer.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-set.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-syllabic.hh /usr/s
 rc/debug/harfbuzz/7.1.0-r0/src/hb-buffer.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-blob.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-style.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ucd.cc /usr/src/de
 bug/harfbuzz/7.1.0-r0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-sanitize.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-draw.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-unicode.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-unicode.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cairo.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-post-macroman.hh /usr/src/debug/harfb
 uzz/7.1.0-r0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-array.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-style.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-icu.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-multimap.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-accelerator.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff2.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-fallback-shape.cc /usr/sr
 c/debug/harfbuzz/7.1.0-r0/src/hb-deprecated.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-algs.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-outline.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-set.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-font.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-common.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-null.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-hebrew.cc /usr/src/deb
 ug/harfbuzz/7.1.0-r0/src/hb-outline.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-draw.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-map.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-map.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shaper.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-static.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shape.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-shaper.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ft.h /usr/src/debug/harfbuzz/7.1.0-r0/src/hb-ot-shaper-arabic-joining-list.hh", added "/usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-name-language.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-iter.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-buffer-seri
 alize.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-number.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-set.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-use.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shape.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-open-file.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-number.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-open-type.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-color.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-metrics.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-pool.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-buffer-verify.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-face-table-list.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cmap-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cff2-interp-cs.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cff1-interp-cs.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic-fallback.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic.hh /usr/
 src/debug/harfbuzz/7.2.0-r0/src/hb-debug.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-hdmx-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-head-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-hhea-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-vector.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-version.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shape-plan.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-avar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-cvar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-fvar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-gvar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-hvar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-mvar-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-string-array.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-draw.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-kern.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-atomic.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-input.cc /usr
 /src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-mutex.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-unicode.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cairo.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-machinery.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-blob.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-repacker.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape-normalize.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-metrics.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-paint.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff1.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-utf.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-indic-table.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-font.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-os2-unicode-ranges.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-gobject-
 enums.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-default.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-kerx-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-feat-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-map.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-ankr-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-just-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-morx-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-trak-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-indic.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-khmer.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-priority-queue.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-serialize.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cff-interp-dict-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff1.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-indic.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-face.cc /usr/src/debug/harfbuzz/7.2.0-r0/s
 rc/hb-glib.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-myanmar.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-meta.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-paint.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape-normalize.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-math.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-meta.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-math-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-maxp-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-meta-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-post-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ucd-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-name.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-face.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-font.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff1-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff2-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-font.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff-common.hh /usr/src
 /debug/harfbuzz/7.2.0-r0/src/hb-bimap.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-map.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-name-language-static.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-tag.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cairo-utils.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-buffer.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-object.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-face.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-font.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-bit-set-invertible.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-map.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-math.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-meta.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-name.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-paint.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-common.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-face.h /usr/src/debug/harfbuzz
 /7.2.0-r0/src/hb-face.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-blob.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-color.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-map.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cache.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-ltag-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ft.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-bit-set.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-syllabic.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-buffer.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-set.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shape-plan.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout-gsubgpos.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-syllabic.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-buffer.cc /usr/src/debug/harfbuzz/7.2.0-r
 0/src/hb-ot-deprecated.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-os2-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-tag-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-paint-extents.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cplusplus.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-blob.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shape-plan.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cff-interp-cs-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-thai.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-style.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-input.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-gobject-enums.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ucd.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout.cc /usr/src/debug/harfbuzz/7.2.0-r0/
 src/hb-sanitize.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff2.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-draw.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-layout-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-instancer-solver.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-post-table-v2subset.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-vowel-constraints.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-vowel-constraints.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-unicode.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-face-builder.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-unicode.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cairo.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-use-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-hmtx-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-kern-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-stat-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb
 -ot-vorg-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shaper-list.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-post-macroman.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape-fallback.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-unicode-emoji-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-array.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-metrics.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shape-fallback.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-style.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cff-interp-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-cairo-utils.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-bit-page.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic-pua.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-icu.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-multimap.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff1-table.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff2-table.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-accelerator.hh /usr/src/debug/harfbu
 zz/7.2.0-r0/src/hb-aat-layout.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff2.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-fallback-shape.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-deprecated.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-paint-extents.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-algs.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout-base-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout-gpos-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-layout-gsub-table.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-gobject-structs.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-outline.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-plan.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-set.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-aat-map.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-font.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-common.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-plan.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic.cc /usr/src/debug/harfbuzz/7.2
 .0-r0/src/hb-ot-shaper-hangul.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-null.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-hebrew.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-outline.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ft-colr.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-cff1-std-str.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-draw.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-dispatch.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-map.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-map.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shaper.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-static.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-var-common.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shape.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-shaper.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-subset-cff-common.cc /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-set-digest.hh /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ft.h /usr/src/debug/harfbuzz/7.2.0-r0/src/hb-ot-shaper-arabic-joining-list.hh"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 1271339 to 1316395 (+4%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60710.0", added "/usr/lib/libharfbuzz-subset.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1568798 to 1605734 (+2%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.60710.0 /usr/lib/libharfbuzz-gobject.so.0.60710.0 /usr/lib/libharfbuzz-cairo.so.0.60710.0", added "/usr/lib/libharfbuzz.so.0.60720.0 /usr/lib/libharfbuzz-cairo.so.0.60720.0 /usr/lib/libharfbuzz-gobject.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz: PV changed from "7.1.0" to "7.2.0"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 7.1.0 [default] to 7.2.0 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases//download/7.1.0/harfbuzz-7.1.0.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases//download/7.2.0/harfbuzz-7.2.0.tar.xz"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60710.0 to libharfbuzz-cairo.so.0.60720.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60710.0 to libharfbuzz-gobject.so.0.60720.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60710.0 to libharfbuzz-icu.so.0.60720.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60710.0 to libharfbuzz.so.0.60720.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60710.0 to libharfbuzz-subset.so.0.60720.0
  /usr/lib/libharfbuzz-cairo.so.0.60710.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60720.0
  /usr/lib/libharfbuzz-gobject.so.0.60710.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60720.0
  /usr/lib/libharfbuzz-icu.so.0.60710.0 moved to /usr/lib/libharfbuzz-icu.so.0.60720.0
  /usr/lib/libharfbuzz.so.0.60710.0 moved to /usr/lib/libharfbuzz.so.0.60720.0
  /usr/lib/libharfbuzz-subset.so.0.60710.0 moved to /usr/lib/libharfbuzz-subset.so.0.60720.0

--===============6924212349862142354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.60710.0", added "/usr/lib/libharfbuzz-icu.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.60710.0", added "/usr/lib/libharfbuzz-subset.so.0.60720.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.60710.0 /usr/lib/libharfbuzz-cairo.so.0.60710.0 /usr/lib/libharfbuzz-gobject.so.0.60710.0", added "/usr/lib/libharfbuzz.so.0.60720.0 /usr/lib/libharfbuzz-cairo.so.0.60720.0 /usr/lib/libharfbuzz-gobject.so.0.60720.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-cairo.so.0 changed symlink target from libharfbuzz-cairo.so.0.60710.0 to libharfbuzz-cairo.so.0.60720.0
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.60710.0 to libharfbuzz-gobject.so.0.60720.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.60710.0 to libharfbuzz-icu.so.0.60720.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.60710.0 to libharfbuzz.so.0.60720.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.60710.0 to libharfbuzz-subset.so.0.60720.0
  /usr/lib/libharfbuzz-cairo.so.0.60710.0 moved to /usr/lib/libharfbuzz-cairo.so.0.60720.0
  /usr/lib/libharfbuzz-gobject.so.0.60710.0 moved to /usr/lib/libharfbuzz-gobject.so.0.60720.0
  /usr/lib/libharfbuzz-icu.so.0.60710.0 moved to /usr/lib/libharfbuzz-icu.so.0.60720.0
  /usr/lib/libharfbuzz.so.0.60710.0 moved to /usr/lib/libharfbuzz.so.0.60720.0
  /usr/lib/libharfbuzz-subset.so.0.60710.0 moved to /usr/lib/libharfbuzz-subset.so.0.60720.0

--===============6924212349862142354==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-7.1.0-7.2.0.patch"

RnJvbSA4ZjI1M2NlNTY5ZDcwNDkyZTk1NmRkODc1YjAxMDc2ZjU4OWZmZTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNzowNToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGhh
cmZidXp6OiB1cGdyYWRlIDcuMS4wIC0+IDcuMi4wCgotLS0KIC4uLi9oYXJmYnV6ei97aGFyZmJ1
enpfNy4xLjAuYmIgPT4gaGFyZmJ1enpfNy4yLjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei97aGFyZmJ1enpfNy4xLjAuYmIgPT4gaGFyZmJ1enpfNy4y
LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6
L2hhcmZidXp6XzcuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZi
dXp6XzcuMi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el83LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzcuMi4wLmJiCmluZGV4IDcxYzkyYzY0ZWYu
LmQxN2RkOTAyYTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9o
YXJmYnV6el83LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFy
ZmJ1enpfNy4yLjAuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWI5ODQyOWI4ZThlM2MyYTY3Y2ZlZjAxZTk5ZTQ4OTNkIFwKICAgICAgICAg
ICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8k
e1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImYxMzVhNjFj
ZDQ2NGM5ZWQ2YmM5ODIzNzY0YzE4OGYyNzZjMzg1MGE4ZGM5MDQ2MjhkZTJhODc5NjZiNzA3N2Ii
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmM1NTYwYzgwN2VhZTBlZmQ1Zjk1YjVhYTRjNjU4MDBj
N2E4ZWVkNjY0MjAwOGE2YjFlN2UzZmZmZjc4NzNjYyIKIAogREVQRU5EUyArPSAiZ2xpYi0yLjAt
bmF0aXZlIgogCi0tIAoyLjM5LjIKCg==

--===============6924212349862142354==--

