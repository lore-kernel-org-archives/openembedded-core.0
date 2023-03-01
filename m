Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0580C87FF2
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.24042.1677681915241599928
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=W9jGNhjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101869da27352-82d7c21e-f104-40f3-b488-7a8613608f8d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=91ACoVJj7J6cnsTJa/Zg98pValu18svqcY3lbuaghow=;
	b=W9jGNhjrhuEyY56SXKGFyHuaPFHhR/T5VEvKgkIKgDEXHyZtPYr58XF6abQ52RS9
	iPeIbhBGfTXHAqHFyw0m4z4AOWqQ615aZKiNiEkRuGKez4vPRfF2Rfw+GNCzpL5yHfK
	rgbatVes+Mx1c9ChWLxTpKIcyYNfJUKY/rhLSNtU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=91ACoVJj7J6cnsTJa/Zg98pValu18svqcY3lbuaghow=;
	b=QRa4pwAtVGUdj/rc7AEEOB0hb0qmb1Y/2Emye5w+J/d0UtfNFTyUl/sOjaQjjagr
	n1eFgL84wmYPjDHDjSennF1uDv4ZP/UBDvtkYQMesN7IeSIDg9celnb53RT8K2lASMG
	rkW4r1ulRjGmb7ExILQm6oKTyHv0waAFbAxbVa5k=
Content-Type: multipart/mixed; boundary="===============3370761820485597213=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.50.13 SUCCEEDED
Message-ID: <010101869da27352-82d7c21e-f104-40f3-b488-7a8613608f8d-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177913

--===============3370761820485597213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.50.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.50.12-1.50.13.patch
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
--===============3370761820485597213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.50/pango-1.50.12.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch" to "https://download.gnome.org/sources//pango/1.50/pango-1.50.13.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch"
packages/core2-32-poky-linux/pango: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangoxft-1.0.so.0.5000.12 /usr/lib/.debug/libpango-1.0.so.0.5000.12 /usr/lib/.debug/libpangocairo-1.0.so.0.5000.12 /usr/lib/.debug/libpangoft2-1.0.so.0.5000.12", added "/usr/lib/.debug/libpangoxft-1.0.so.0.5000.13 /usr/lib/.debug/libpangoft2-1.0.so.0.5000.13 /usr/lib/.debug/libpangocairo-1.0.so.0.5000.13 /usr/lib/.debug/libpango-1.0.so.0.5000.13"
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 2386716 to 2390436 (+0%)
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-src: FILELIST: directory renamed /usr/src/debug/pango/1.50.12-r0/utils -> /usr/src/debug/pango/1.50.13-r0/utils, directory renamed /usr/src/debug/pango/1.50.12-r0/pango/json -> /usr/src/debug/pango/1.50.13-r0/pango/json, directory renamed /usr/src/debug/pango/1.50.12-r0/tests -> /usr/src/debug/pango/1.50.13-r0/tests, removed "/usr/src/debug/pango/1.50.12-r0/pango/pango-context.h /usr/src/debug/pango/1.50.12-r0/pango/pango-ot-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-emoji-table.h /usr/src/debug/pango/1.50.12-r0/pango/pango-context.c /usr/src/debug/pango/1.50.12-r0/pango/pangoft2-private.h /usr/src/debug/pango/1.50.12-r0/pango/pangoxft-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-engine.h /usr/src/debug/pango/1.50.12-r0/pango/pango-ot-tag.c /usr/src/debug/pango/1.50.12-r0/pango/glyphstring.c /usr/src/debug/pango/1.50.12-r0/pango/pango-engine.c /usr/src/debug/pango/1.50.12-r0/pango/pango-renderer.c /usr/src/debug/pango/1.50.
 12-r0/pango/pangofc-fontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pango-break.h /usr/src/debug/pango/1.50.12-r0/pango/pangofc-fontmap.h /usr/src/debug/pango/1.50.12-r0/pango/pango-renderer.h /usr/src/debug/pango/1.50.12-r0/pango/pango-emoji.c /usr/src/debug/pango/1.50.12-r0/pango/pangoft2-fontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pangoxft-fontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pangofc-font-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-glyph-item.c /usr/src/debug/pango/1.50.12-r0/pango/pango-language.h /usr/src/debug/pango/1.50.12-r0/pango/pango-glyph-item.h /usr/src/debug/pango/1.50.12-r0/pango/pango-script-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-language.c /usr/src/debug/pango/1.50.12-r0/pango/pango-impl-utils.h /usr/src/debug/pango/1.50.12-r0/pango/pango-types.h /usr/src/debug/pango/1.50.12-r0/pango/pango-utils.h /usr/src/debug/pango/1.50.12-r0/pango/pango-utils.c /usr/src/debug/pango/1.50.12-r0/pango/break-indic.c /usr/src/debug/pango/1.50.1
 2-r0/pango/fonts.c /usr/src/debug/pango/1.50.12-r0/pango/pango-break-table.h /usr/src/debug/pango/1.50.12-r0/pango/pango-ot.h /usr/src/debug/pango/1.50.12-r0/pango/pango-modules.h /usr/src/debug/pango/1.50.12-r0/pango/pango-markup.h /usr/src/debug/pango/1.50.12-r0/pango/pango-markup.c /usr/src/debug/pango/1.50.12-r0/pango/pango-attributes.h /usr/src/debug/pango/1.50.12-r0/pango/break-thai.c /usr/src/debug/pango/1.50.12-r0/pango/pango-attributes.c /usr/src/debug/pango/1.50.12-r0/pango/modules.c /usr/src/debug/pango/1.50.12-r0/pango/pango-bidi-type.h /usr/src/debug/pango/1.50.12-r0/pango/pango-glyph.h /usr/src/debug/pango/1.50.12-r0/pango/pango-bidi-type.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-fcfont.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-font.c /usr/src/debug/pango/1.50.12-r0/pango/break.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-render.c /usr/src/debug/pango/1.50.12-r0/pango/pango-fontset-simple-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-col
 or.c /usr/src/debug/pango/1.50.12-r0/pango/pango-color.h /usr/src/debug/pango/1.50.12-r0/pango/pango-enum-types.c /usr/src/debug/pango/1.50.12-r0/pango/pango-language-sample-table.h /usr/src/debug/pango/1.50.12-r0/pango/pango-enum-types.h /usr/src/debug/pango/1.50.12-r0/pango/serializer.c /usr/src/debug/pango/1.50.12-r0/pango/pango-context-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-coverage-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-matrix.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-context.c /usr/src/debug/pango/1.50.12-r0/pango/pango-matrix.h /usr/src/debug/pango/1.50.12-r0/pango/break-latin.c /usr/src/debug/pango/1.50.12-r0/pango/ellipsize.c /usr/src/debug/pango/1.50.12-r0/pango/pangofc-font.c /usr/src/debug/pango/1.50.12-r0/pango/pangoft2-render.c /usr/src/debug/pango/1.50.12-r0/pango/pango-emoji-private.h /usr/src/debug/pango/1.50.12-r0/pango/pangoxft-render.c /usr/src/debug/pango/1.50.12-r0/pango/pangoxft.h /usr/src/debug/pango/1.50.12-r0/pango/pan
 gofc-font.h /usr/src/debug/pango/1.50.12-r0/pango/pangoxft-render.h /usr/src/debug/pango/1.50.12-r0/pango/reorder-items.c /usr/src/debug/pango/1.50.12-r0/pango/pango-gravity.h /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-fc.h /usr/src/debug/pango/1.50.12-r0/pango/pango-trace.c /usr/src/debug/pango/1.50.12-r0/pango/pango-gravity.c /usr/src/debug/pango/1.50.12-r0/pango/pango-script-lang-table.h /usr/src/debug/pango/1.50.12-r0/pango/pangoxft-font.c /usr/src/debug/pango/1.50.12-r0/pango/pangofc-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-ot-ruleset.c /usr/src/debug/pango/1.50.12-r0/pango/itemize.c /usr/src/debug/pango/1.50.12-r0/pango/pango-ot-info.c /usr/src/debug/pango/1.50.12-r0/pango/pango-layout.h /usr/src/debug/pango/1.50.12-r0/pango/pango-layout-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-layout.c /usr/src/debug/pango/1.50.12-r0/pango/pango-ot-buffer.c /usr/src/debug/pango/1.50.12-r0/pango/pango-color-table.h /usr/src/debug/pango/1.50.12-r0/pango/pangoft2.
 c /usr/src/debug/pango/1.50.12-r0/pango/pango-coverage.c /usr/src/debug/pango/1.50.12-r0/pango/pango-coverage.h /usr/src/debug/pango/1.50.12-r0/pango/pangoft2.h /usr/src/debug/pango/1.50.12-r0/pango/pango-font.h /usr/src/debug/pango/1.50.12-r0/pango/pango-item.h /usr/src/debug/pango/1.50.12-r0/pango/pango-tabs.h /usr/src/debug/pango/1.50.12-r0/pango/pangocairo.h /usr/src/debug/pango/1.50.12-r0/pango/pango-item.c /usr/src/debug/pango/1.50.12-r0/pango/pango-tabs.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-fc-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-attributes-private.h /usr/src/debug/pango/1.50.12-r0/pango/pangofc-decoder.c /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-fcfontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pangofc-decoder.h /usr/src/debug/pango/1.50.12-r0/pango/pango-fontset.h /usr/src/debug/pango/1.50.12-r0/pango/pango-direction.h /usr/src/debug/pango/1.50.12-r0/pango/pango-fontset.c /usr/src/debug/pango/1.50.12-r0/pango/pango-script.c /usr/src/debu
 g/pango/1.50.12-r0/pango/pango-script.h /usr/src/debug/pango/1.50.12-r0/pango/pango-utils-internal.h /usr/src/debug/pango/1.50.12-r0/pango/pango-fontmap.h /usr/src/debug/pango/1.50.12-r0/pango/pango-fontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pango-fontset-simple.c /usr/src/debug/pango/1.50.12-r0/pango/break-arabic.c /usr/src/debug/pango/1.50.12-r0/pango/pango-font-private.h /usr/src/debug/pango/1.50.12-r0/pango/pango-item-private.h /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-private.h /usr/src/debug/pango/1.50.12-r0/pango/shape.c /usr/src/debug/pango/1.50.12-r0/pango/pango-fontset-simple.h /usr/src/debug/pango/1.50.12-r0/pango/pangocairo-fontmap.c /usr/src/debug/pango/1.50.12-r0/pango/pangofc-fontmap-private.h", added "/usr/src/debug/pango/1.50.13-r0/pango/pango-context.h /usr/src/debug/pango/1.50.13-r0/pango/pangoft2-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-emoji-table.h /usr/src/debug/pango/1.50.13-r0/pango/pango-ot-private.h /usr/src/debug/pango/1.50.13-r0/
 pango/pango-context.c /usr/src/debug/pango/1.50.13-r0/pango/pangoxft-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-engine.h /usr/src/debug/pango/1.50.13-r0/pango/pango-ot-tag.c /usr/src/debug/pango/1.50.13-r0/pango/glyphstring.c /usr/src/debug/pango/1.50.13-r0/pango/pango-engine.c /usr/src/debug/pango/1.50.13-r0/pango/pango-renderer.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-fontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pango-break.h /usr/src/debug/pango/1.50.13-r0/pango/pangofc-fontmap.h /usr/src/debug/pango/1.50.13-r0/pango/pango-renderer.h /usr/src/debug/pango/1.50.13-r0/pango/pango-emoji.c /usr/src/debug/pango/1.50.13-r0/pango/pangoft2-fontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pangoxft-fontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-font-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-glyph-item.c /usr/src/debug/pango/1.50.13-r0/pango/pango-language.h /usr/src/debug/pango/1.50.13-r0/pango/pango-glyph-item.h /usr/src/debug/pango/1.50.13-r0/pango
 /pango-script-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-language.c /usr/src/debug/pango/1.50.13-r0/pango/pango-impl-utils.h /usr/src/debug/pango/1.50.13-r0/pango/pango-types.h /usr/src/debug/pango/1.50.13-r0/pango/pango-utils.h /usr/src/debug/pango/1.50.13-r0/pango/pango-utils.c /usr/src/debug/pango/1.50.13-r0/pango/break-indic.c /usr/src/debug/pango/1.50.13-r0/pango/fonts.c /usr/src/debug/pango/1.50.13-r0/pango/pango-break-table.h /usr/src/debug/pango/1.50.13-r0/pango/pango-ot.h /usr/src/debug/pango/1.50.13-r0/pango/pango-modules.h /usr/src/debug/pango/1.50.13-r0/pango/pango-markup.h /usr/src/debug/pango/1.50.13-r0/pango/pango-markup.c /usr/src/debug/pango/1.50.13-r0/pango/pango-attributes.h /usr/src/debug/pango/1.50.13-r0/pango/break-thai.c /usr/src/debug/pango/1.50.13-r0/pango/pango-attributes.c /usr/src/debug/pango/1.50.13-r0/pango/modules.c /usr/src/debug/pango/1.50.13-r0/pango/pango-bidi-type.h /usr/src/debug/pango/1.50.13-r0/pango/pango-glyph.h /usr/src/debug/pang
 o/1.50.13-r0/pango/pango-bidi-type.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-fcfont.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-font.c /usr/src/debug/pango/1.50.13-r0/pango/break.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-render.c /usr/src/debug/pango/1.50.13-r0/pango/pango-fontset-simple-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-color.c /usr/src/debug/pango/1.50.13-r0/pango/pango-color.h /usr/src/debug/pango/1.50.13-r0/pango/pango-enum-types.c /usr/src/debug/pango/1.50.13-r0/pango/pango-language-sample-table.h /usr/src/debug/pango/1.50.13-r0/pango/pango-enum-types.h /usr/src/debug/pango/1.50.13-r0/pango/serializer.c /usr/src/debug/pango/1.50.13-r0/pango/pango-context-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-coverage-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-matrix.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-context.c /usr/src/debug/pango/1.50.13-r0/pango/pango-matrix.h /usr/src/debug/pango/1.50.13-r0/pango/break-la
 tin.c /usr/src/debug/pango/1.50.13-r0/pango/ellipsize.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-font.c /usr/src/debug/pango/1.50.13-r0/pango/pangoft2-render.c /usr/src/debug/pango/1.50.13-r0/pango/pango-emoji-private.h /usr/src/debug/pango/1.50.13-r0/pango/pangoxft-render.c /usr/src/debug/pango/1.50.13-r0/pango/pangoxft.h /usr/src/debug/pango/1.50.13-r0/pango/pangofc-font.h /usr/src/debug/pango/1.50.13-r0/pango/pangoxft-render.h /usr/src/debug/pango/1.50.13-r0/pango/reorder-items.c /usr/src/debug/pango/1.50.13-r0/pango/pango-gravity.h /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-fc.h /usr/src/debug/pango/1.50.13-r0/pango/pango-trace.c /usr/src/debug/pango/1.50.13-r0/pango/pango-gravity.c /usr/src/debug/pango/1.50.13-r0/pango/pango-script-lang-table.h /usr/src/debug/pango/1.50.13-r0/pango/pangoxft-font.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-ot-ruleset.c /usr/src/debug/pango/1.50.13-r0/pango/itemize.c /usr/src/de
 bug/pango/1.50.13-r0/pango/pango-ot-info.c /usr/src/debug/pango/1.50.13-r0/pango/pango-layout.h /usr/src/debug/pango/1.50.13-r0/pango/pango-layout-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-layout.c /usr/src/debug/pango/1.50.13-r0/pango/pango-ot-buffer.c /usr/src/debug/pango/1.50.13-r0/pango/pango-color-table.h /usr/src/debug/pango/1.50.13-r0/pango/pangoft2.c /usr/src/debug/pango/1.50.13-r0/pango/pango-coverage.c /usr/src/debug/pango/1.50.13-r0/pango/pango-coverage.h /usr/src/debug/pango/1.50.13-r0/pango/pangoft2.h /usr/src/debug/pango/1.50.13-r0/pango/pango-font.h /usr/src/debug/pango/1.50.13-r0/pango/pango-item.h /usr/src/debug/pango/1.50.13-r0/pango/pango-tabs.h /usr/src/debug/pango/1.50.13-r0/pango/pangocairo.h /usr/src/debug/pango/1.50.13-r0/pango/pango-item.c /usr/src/debug/pango/1.50.13-r0/pango/pango-tabs.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-fc-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-attributes-private.h /usr/src/debug/pango/1.50.13-r0/
 pango/pangofc-decoder.c /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-fcfontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-decoder.h /usr/src/debug/pango/1.50.13-r0/pango/pango-fontset.h /usr/src/debug/pango/1.50.13-r0/pango/pango-direction.h /usr/src/debug/pango/1.50.13-r0/pango/pango-fontset.c /usr/src/debug/pango/1.50.13-r0/pango/pango-script.c /usr/src/debug/pango/1.50.13-r0/pango/pango-script.h /usr/src/debug/pango/1.50.13-r0/pango/pango-utils-internal.h /usr/src/debug/pango/1.50.13-r0/pango/pango-utils-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-fontmap.h /usr/src/debug/pango/1.50.13-r0/pango/pango-fontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pango-fontset-simple.c /usr/src/debug/pango/1.50.13-r0/pango/break-arabic.c /usr/src/debug/pango/1.50.13-r0/pango/pango-font-private.h /usr/src/debug/pango/1.50.13-r0/pango/pango-item-private.h /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-private.h /usr/src/debug/pango/1.50.13-r0/pango/shape.c /usr/src/debug/pango
 /1.50.13-r0/pango/pango-fontset-simple.h /usr/src/debug/pango/1.50.13-r0/pango/pangocairo-fontmap.c /usr/src/debug/pango/1.50.13-r0/pango/pangofc-fontmap-private.h"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 2320934 to 2328087 (+0%)
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.50.12" to "1.50.13"
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangocairo-1.0.so.0.5000.12 /usr/lib/libpango-1.0.so.0.5000.12 /usr/lib/libpangoxft-1.0.so.0.5000.12 /usr/lib/libpangoft2-1.0.so.0.5000.12", added "/usr/lib/libpango-1.0.so.0.5000.13 /usr/lib/libpangocairo-1.0.so.0.5000.13 /usr/lib/libpangoft2-1.0.so.0.5000.13 /usr/lib/libpangoxft-1.0.so.0.5000.13"
packages/core2-32-poky-linux/pango/pango: PKGSIZE changed from 862179 to 866275 (+0%)
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.50.12 [default] to 1.50.13 [default]
packages/core2-32-poky-linux/pango/pango: PV changed from "1.50.12" to "1.50.13"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.12 to libpango-1.0.so.0.5000.13
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.12 to libpangocairo-1.0.so.0.5000.13
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.12 to libpangoft2-1.0.so.0.5000.13
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.12 to libpangoxft-1.0.so.0.5000.13
  /usr/lib/libpango-1.0.so.0.5000.12 moved to /usr/lib/libpango-1.0.so.0.5000.13
  /usr/lib/libpangocairo-1.0.so.0.5000.12 moved to /usr/lib/libpangocairo-1.0.so.0.5000.13
  /usr/lib/libpangoft2-1.0.so.0.5000.12 moved to /usr/lib/libpangoft2-1.0.so.0.5000.13
  /usr/lib/libpangoxft-1.0.so.0.5000.12 moved to /usr/lib/libpangoxft-1.0.so.0.5000.13

--===============3370761820485597213==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.50.12-1.50.13.patch"

RnJvbSBmZmI0NWM4Njk2ZDNkNjIwOGRkMGFjOTViZDUwYTRiNDRjNDNiYjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxMjozNjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvOiB1cGdyYWRlIDEuNTAuMTIgLT4gMS41MC4xMwoKLS0tCiAuLi4vcGFuZ28ve3BhbmdvXzEu
NTAuMTIuYmIgPT4gcGFuZ29fMS41MC4xMy5iYn0gICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvcGFuZ28ve3BhbmdvXzEuNTAuMTIuYmIgPT4gcGFuZ29fMS41MC4xMy5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29f
MS41MC4xMi5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjUwLjEzLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9w
YW5nby9wYW5nb18xLjUwLjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFu
Z28vcGFuZ29fMS41MC4xMy5iYgppbmRleCA2Nzc5ZjM5YzRmLi5lNjczMzY2ZGM3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4xMi5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4xMy5iYgpAQCAtMjQsNyArMjQs
NyBAQCBTUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtU2tpcC1ydW5uaW5nLXRlc3QtbGF5b3V0LXRlc3QucGF0Y2ggXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNhZWY5NmQyN2JiZTc5MmE2YmU5MjcyN2M3
MzQ2OGQ4MzJiMTNkYTU3YzgwNzFlZjc5YjlkZjY5ZWUwNThmZTMiCitTUkNfVVJJW2FyY2hpdmUu
c2hhMjU2c3VtXSA9ICI1Y2RjZjZkNzYxZDI2YTNlYjk0MTJiNmNiMDY5YjMyYmQxZDliMDdhYmYx
MTYzMjExNjdkOTRjMjE4OTI5OWZkIgogCiBERVBFTkRTID0gImdsaWItMi4wIGdsaWItMi4wLW5h
dGl2ZSBmb250Y29uZmlnIGZyZWV0eXBlIHZpcnR1YWwvbGliaWNvbnYgY2Fpcm8gaGFyZmJ1enog
ZnJpYmlkaSIKIAotLSAKMi4zOS4yCgo=

--===============3370761820485597213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoxft-1.0.so.0.5000.12 /usr/lib/libpangocairo-1.0.so.0.5000.12 /usr/lib/libpango-1.0.so.0.5000.12 /usr/lib/libpangoft2-1.0.so.0.5000.12", added "/usr/lib/libpango-1.0.so.0.5000.13 /usr/lib/libpangocairo-1.0.so.0.5000.13 /usr/lib/libpangoxft-1.0.so.0.5000.13 /usr/lib/libpangoft2-1.0.so.0.5000.13"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.12 to libpango-1.0.so.0.5000.13
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.12 to libpangocairo-1.0.so.0.5000.13
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.12 to libpangoft2-1.0.so.0.5000.13
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.12 to libpangoxft-1.0.so.0.5000.13
  /usr/lib/libpango-1.0.so.0.5000.12 moved to /usr/lib/libpango-1.0.so.0.5000.13
  /usr/lib/libpangocairo-1.0.so.0.5000.12 moved to /usr/lib/libpangocairo-1.0.so.0.5000.13
  /usr/lib/libpangoft2-1.0.so.0.5000.12 moved to /usr/lib/libpangoft2-1.0.so.0.5000.13
  /usr/lib/libpangoxft-1.0.so.0.5000.12 moved to /usr/lib/libpangoxft-1.0.so.0.5000.13

--===============3370761820485597213==--

