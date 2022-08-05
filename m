Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AA2C32757
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4053.1659679409227346800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bG8l4/rx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c9a0181-9f4d8980-089e-42a0-aacd-4bccbedb1abc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1q90Sjuk2XfWaXVlF5NXtjcdnF7f9jpgWvKxck+yVHQ=;
	b=bG8l4/rxRmhXePO1padvQY0SM+ojNpgNyHlXUac0d/jJhdkjIOFIU2LajXudMYOj
	g1VFJJqcOQIRY6QgLIrxmijU1OqRLgWPvuE+WK8fW1fIriBmEBH/4rdM18lb9p4Uf+z
	mXbK+8LYKnzV8l4iTSTvpKpmMPuV29PFJmGJHe4A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1q90Sjuk2XfWaXVlF5NXtjcdnF7f9jpgWvKxck+yVHQ=;
	b=ikaVrjAwjMe1eh3nbH2yBClSHABy+v+TEgK5eEI8xwntbIPYN/xv8u9MwV7gNQGJ
	yNkHlEct+ZtjaHvMkBjkfpExkHz+y4R9Q1S+/hCfKBjUAUnY3eeck8XZYgIF8z+A3OE
	dE2UyfD9tUdHeP1lzGOrcZLVkm6RGD39YQdtwrR0=
Content-Type: multipart/mixed; boundary="===============4926754461870819182=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwebp: upgrading to 1.2.3 SUCCEEDED
Message-ID: 
 <010101826c9a0181-9f4d8980-089e-42a0-aacd-4bccbedb1abc-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168913

--===============4926754461870819182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwebp* to *1.2.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwebp-upgrade-1.2.2-1.2.3.patch
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
--===============4926754461870819182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebp.so.7.1.3 /usr/lib/libwebpdemux.so.2.0.9 /usr/lib/libwebpmux.so.3.0.8", added "/usr/lib/libwebp.so.7.1.4 /usr/lib/libwebpmux.so.3.0.9 /usr/lib/libwebpdemux.so.2.0.10"
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.9 to libwebpdemux.so.2.0.10
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.9 to libwebpdemux.so.2.0.10
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.8 to libwebpmux.so.3.0.9
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.8 to libwebpmux.so.3.0.9
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.3 to libwebp.so.7.1.4
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.3 to libwebp.so.7.1.4
  /usr/lib/libwebpmux.so.3.0.8 moved to /usr/lib/libwebpmux.so.3.0.9
  /usr/lib/libwebp.so.7.1.3 moved to /usr/lib/libwebp.so.7.1.4
  /usr/lib/libwebpdemux.so.2.0.10 was added
  /usr/lib/libwebpdemux.so.2.0.9 was removed

--===============4926754461870819182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwebp: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp: SRC_URI changed from "http://downloads.webmproject.org/releases/webp/libwebp-1.2.2.tar.gz" to "http://downloads.webmproject.org/releases/webp/libwebp-1.2.3.tar.gz"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dbg: FILELIST: removed "/usr/lib/.debug/libwebpdemux.so.2.0.9 /usr/lib/.debug/libwebp.so.7.1.3 /usr/lib/.debug/libwebpmux.so.3.0.8", added "/usr/lib/.debug/libwebpmux.so.3.0.9 /usr/lib/.debug/libwebp.so.7.1.4 /usr/lib/.debug/libwebpdemux.so.2.0.10"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGSIZE changed from 3163292 to 3195912 (+1%)
packages/core2-32-poky-linux/libwebp/libwebp-dev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGSIZE changed from 96273 to 96255 (-0%)
packages/core2-32-poky-linux/libwebp/libwebp-doc: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGSIZE changed from 29748 to 29848 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-locale: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-locale: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: FILELIST: directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/imageio -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/imageio, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/examples -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/examples, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/enc -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/enc, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/mux -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/mux, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/demux -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/demux, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/utils -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/utils, directory renamed /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dec -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dec, directory renamed 
 /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/webp -> /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/webp, removed "/usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/rescaler_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cpu.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/common_sse41.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cost_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cost_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/rescaler_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_sse2.c /usr
 /src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/filters_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/alpha_processing_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/quant.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_clip_tables.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/filters_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/alpha_processing.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/ssim.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cost_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/s
 rc/dsp/filters_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/upsampling.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_common.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/rescaler_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/rescaler_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cost_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dsp.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/rescaler_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/alpha_processing_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/upsampling_msa.c /usr/src/debug/l
 ibwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/common_sse2.h /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/upsampling_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/filters.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/alpha_processing_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/alpha_processing_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/upsampling_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_mips32.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/
 dsp/rescaler.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/dec.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/cost.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/filters_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_enc_msa.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/yuv_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_sse2.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/enc_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/lossless_sse41.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/upsampling_neon.c /usr/src/debug/libwebp/1.2.2-r0/libwebp-1.2.2/src/dsp/ssim_sse2.c /usr/src/debug/libwebp/1.2.2-r0/
 libwebp-1.2.2/src/dsp/upsampling_sse2.c", added "/usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/enc_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/common_sse2.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/filters_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/alpha_processing_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0
 /libwebp-1.2.3/src/dsp/enc_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/quant.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/alpha_processing_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/filters_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cost_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cpu.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv.h /usr/src/debug/libw
 ebp/1.2.3-r0/libwebp-1.2.3/src/dsp/filters.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cost_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/enc_sse41.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_clip_tables.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/enc_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_gamma.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sr
 c/dsp/cost_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/ssim_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_csp.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/alpha_processing_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/common_sse41.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/filters_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_gamma.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/alpha_processing.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cost.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp
 /lossless_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/enc_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_mips32.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/enc_msa.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dec_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_common.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/rescaler.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_csp.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_dsp.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv.c /usr/src/debug/libwebp/1.
 2.3-r0/libwebp-1.2.3/src/dsp/enc.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cost_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/cpu.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/dsp.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/yuv_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/sharpyuv/sharpyuv_dsp.h /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/alpha_processing_neon.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/ssim.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/filters_mips_dsp_r2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/upsampling_sse2.c /usr/src/debug/libwebp/1.2.3-r0/libwebp-1.2.3/src/dsp/lossless_enc_sse2.c"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGSIZE changed from 2858830 to 2896213 (+1%)
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp: PV changed from "1.2.2" to "1.2.3"
packages/core2-32-poky-linux/libwebp/libwebp: PKGV changed from 1.2.2 [default] to 1.2.3 [default]
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebp.so.7.1.3 /usr/lib/libwebpdemux.so.2.0.9 /usr/lib/libwebpmux.so.3.0.8", added "/usr/lib/libwebpmux.so.3.0.9 /usr/lib/libwebp.so.7.1.4 /usr/lib/libwebpdemux.so.2.0.10"
packages/core2-32-poky-linux/libwebp/libwebp: PKGSIZE changed from 565332 to 569429 (+1%)
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.9 to libwebpdemux.so.2.0.10
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.9 to libwebpdemux.so.2.0.10
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.8 to libwebpmux.so.3.0.9
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.8 to libwebpmux.so.3.0.9
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.3 to libwebp.so.7.1.4
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.3 to libwebp.so.7.1.4
  /usr/lib/libwebpmux.so.3.0.8 moved to /usr/lib/libwebpmux.so.3.0.9
  /usr/lib/libwebp.so.7.1.3 moved to /usr/lib/libwebp.so.7.1.4
  /usr/lib/libwebpdemux.so.2.0.10 was added
  /usr/lib/libwebpdemux.so.2.0.9 was removed

--===============4926754461870819182==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwebp-upgrade-1.2.2-1.2.3.patch"

RnJvbSAxMjBmOTViNTc1ODc5YzIxMWMyNTliZmMwMzI2NWUxM2E5ZWNjZjhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMjo0MToxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YndlYnA6IHVwZ3JhZGUgMS4yLjIgLT4gMS4yLjMKCi0tLQogLi4uL3dlYnAve2xpYndlYnBfMS4y
LjIuYmIgPT4gbGlid2VicF8xLjIuMy5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvd2VicC97bGlid2VicF8xLjIuMi5iYiA9PiBsaWJ3ZWJwXzEuMi4zLmJi
fSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2Vi
cF8xLjIuMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2VicF8xLjIuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS93ZWJwL2xpYndlYnBfMS4yLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L3dlYnAvbGlid2VicF8xLjIuMy5iYgppbmRleCAyODFjZmYxYmYyLi4yZDUyM2RmNzQ5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS93ZWJwL2xpYndlYnBfMS4yLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvd2VicC9saWJ3ZWJwXzEuMi4zLmJiCkBAIC0xNCw3
ICsxNCw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTZlOGRlZTkz
MmMyNmYyZGFiNTAzYWJmNzBjOTZkOGJiIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL1BB
VEVOVFM7bWQ1PWM2OTI2ZDBjYjA3ZDI5NmY4ODZhYjZlMGNjNWE4NWI3IgogCiBTUkNfVVJJID0g
Imh0dHA6Ly9kb3dubG9hZHMud2VibXByb2plY3Qub3JnL3JlbGVhc2VzL3dlYnAvJHtCUH0udGFy
Lmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc2NTY1MzJmODM3YWY1ZjRjZWMzZmY2YmFmZTU1
MmMwNDRkYzM5YmY0NTM1ODdiZDViNzc0NTA4MDJmNGFlZTYiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZjVkN2FiMjM5MGIwNmI4YTkzNGE0ZmMzNTc4NDI5MWIzODg1YjU1Nzc4MGQwOTliZDMyZjA5
MjQxZjlkODNmOSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly9kb3dubG9hZHMud2Vi
bXByb2plY3Qub3JnL3JlbGVhc2VzL3dlYnAvaW5kZXguaHRtbCIKIAotLSAKMi4zMS4xCgo=

--===============4926754461870819182==--

