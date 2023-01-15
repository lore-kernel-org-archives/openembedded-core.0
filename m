Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E249CC678D7
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:30 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.145731.1673805745368749521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n4leFPp4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010185b698c985-e1befbe6-a959-4fd3-b7f9-0c26591ff674-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mkfXrrkGDXUjNQPGiwM3ZIWsDs2120zYOZhv+uPkIWY=;
	b=n4leFPp4vhTuU6UFMtA7YOVYjaGMmWiiaGoR2wkaXZwk8C8eKdLeLSdmbxtYVWMl
	VKQ4ZXkZagh1LXdAXbpqzMMzqzGskOXf66W8ige8tBpk6P/YdG/C/O1/XD74vh5JuTY
	WROP+3zlxEtilzuxP0KVKPpFsVCEc3Fr+WT6C3aY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mkfXrrkGDXUjNQPGiwM3ZIWsDs2120zYOZhv+uPkIWY=;
	b=euSLLaCNeVNSx2OaLGv/sIpjY1NSVPt6m565MWVp2GhXAl8aSdOSkU/gejqdVjdD
	ONY7n7kxHVnqESeMayj8R1VTivuLwglf1v7xEjZGuWP20vLl2KW2HEuvfkoUB5F12vh
	AvDfRjlU4nBFUw4Ze2Mc5CSomHlBY8RCI8hxP+fw=
Content-Type: multipart/mixed; boundary="===============4360499927294270092=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwebp: upgrading to 1.3.0 SUCCEEDED
Message-ID: <01010185b698c985-e1befbe6-a959-4fd3-b7f9-0c26591ff674-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175943

--===============4360499927294270092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwebp* to *1.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwebp-upgrade-1.2.4-1.3.0.patch
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
--===============4360499927294270092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwebp: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp: SRC_URI changed from "http://downloads.webmproject.org/releases/webp/libwebp-1.2.4.tar.gz" to "http://downloads.webmproject.org/releases/webp/libwebp-1.3.0.tar.gz"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dbg: FILELIST: removed "/usr/lib/.debug/libwebpmux.so.3.0.10 /usr/lib/.debug/libwebp.so.7.1.5 /usr/lib/.debug/libwebpdemux.so.2.0.11", added "/usr/lib/.debug/libsharpyuv.so.0.0.0 /usr/lib/.debug/libwebpdemux.so.2.0.12 /usr/lib/.debug/libwebpmux.so.3.0.11 /usr/lib/.debug/libwebp.so.7.1.6"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGSIZE changed from 3196960 to 3223460 (+1%)
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dev: FILELIST: added "/usr/lib/libsharpyuv.so /usr/include/webp/sharpyuv/sharpyuv_csp.h /usr/lib/pkgconfig/libsharpyuv.pc /usr/include/webp/sharpyuv/sharpyuv.h"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGSIZE changed from 96256 to 103055 (+7%)
packages/core2-32-poky-linux/libwebp/libwebp-dev: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-doc: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-locale: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-locale: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGSIZE changed from 2896022 to 2899068 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-src: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.11 /usr/lib/libwebpmux.so.3.0.10 /usr/lib/libwebp.so.7.1.5", added "/usr/lib/libsharpyuv.so.0.0.0 /usr/lib/libwebpmux.so.3.0.11 /usr/lib/libwebp.so.7.1.6 /usr/lib/libwebpdemux.so.2.0.12 /usr/lib/libsharpyuv.so.0"
packages/core2-32-poky-linux/libwebp/libwebp: PKGSIZE changed from 569434 to 583058 (+2%)
packages/core2-32-poky-linux/libwebp/libwebp: PV changed from "1.2.4" to "1.3.0"
packages/core2-32-poky-linux/libwebp/libwebp: PKGV changed from 1.2.4 [default] to 1.3.0 [default]
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.11 to libwebpdemux.so.2.0.12
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.11 to libwebpdemux.so.2.0.12
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.10 to libwebpmux.so.3.0.11
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.10 to libwebpmux.so.3.0.11
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.5 to libwebp.so.7.1.6
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.5 to libwebp.so.7.1.6
  /usr/lib/libwebpdemux.so.2.0.11 moved to /usr/lib/libwebpdemux.so.2.0.12
  /usr/lib/libwebpmux.so.3.0.10 moved to /usr/lib/libwebpmux.so.3.0.11
  /usr/lib/libwebp.so.7.1.5 moved to /usr/lib/libwebp.so.7.1.6
  /usr/include/webp/sharpyuv was added
  /usr/include/webp/sharpyuv/sharpyuv_csp.h was added
  /usr/include/webp/sharpyuv/sharpyuv.h was added
  /usr/lib/libsharpyuv.so.0.0.0 was added
  /usr/lib/libsharpyuv.so.0 was added
  /usr/lib/libsharpyuv.so was added
  /usr/lib/pkgconfig/libsharpyuv.pc was added

--===============4360499927294270092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwebp/libwebp-dev: FILELIST: added "/usr/lib/pkgconfig/libsharpyuv.pc /usr/include/webp/sharpyuv/sharpyuv.h /usr/include/webp/sharpyuv/sharpyuv_csp.h /usr/lib/libsharpyuv.so"
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebp.so.7.1.5 /usr/lib/libwebpdemux.so.2.0.11 /usr/lib/libwebpmux.so.3.0.10", added "/usr/lib/libwebpmux.so.3.0.11 /usr/lib/libwebpdemux.so.2.0.12 /usr/lib/libsharpyuv.so.0 /usr/lib/libwebp.so.7.1.6 /usr/lib/libsharpyuv.so.0.0.0"
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.11 to libwebpdemux.so.2.0.12
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.11 to libwebpdemux.so.2.0.12
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.10 to libwebpmux.so.3.0.11
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.10 to libwebpmux.so.3.0.11
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.5 to libwebp.so.7.1.6
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.5 to libwebp.so.7.1.6
  /usr/lib/libwebpdemux.so.2.0.11 moved to /usr/lib/libwebpdemux.so.2.0.12
  /usr/lib/libwebpmux.so.3.0.10 moved to /usr/lib/libwebpmux.so.3.0.11
  /usr/lib/libwebp.so.7.1.5 moved to /usr/lib/libwebp.so.7.1.6
  /usr/include/webp/sharpyuv was added
  /usr/include/webp/sharpyuv/sharpyuv_csp.h was added
  /usr/include/webp/sharpyuv/sharpyuv.h was added
  /usr/lib/libsharpyuv.so.0.0.0 was added
  /usr/lib/libsharpyuv.so.0 was added
  /usr/lib/libsharpyuv.so was added
  /usr/lib/pkgconfig/libsharpyuv.pc was added

--===============4360499927294270092==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwebp-upgrade-1.2.4-1.3.0.patch"

RnJvbSAyZDQ5MTYzNzU1NTM4ZTAyZGU3ZTEyMzdjMmI0ZjNhOTY4MjMzMmM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTY6NDg6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ3ZWJwOiB1cGdyYWRlIDEuMi40IC0+IDEuMy4wCgotLS0KIC4uLi93ZWJwL3tsaWJ3ZWJwXzEu
Mi40LmJiID0+IGxpYndlYnBfMS4zLjAuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL3dlYnAve2xpYndlYnBfMS4yLjQuYmIgPT4gbGlid2VicF8xLjMuMC5i
Yn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS93ZWJwL2xpYndl
YnBfMS4yLjQuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS93ZWJwL2xpYndlYnBfMS4zLjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvd2VicC9saWJ3ZWJwXzEuMi40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS93ZWJwL2xpYndlYnBfMS4zLjAuYmIKaW5kZXggMjYzNTg5ODQ2YS4uN2I0ZDEzOGQyYyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvd2VicC9saWJ3ZWJwXzEuMi40LmJiCisr
KyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3dlYnAvbGlid2VicF8xLjMuMC5iYgpAQCAtMTQs
NyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT02ZThkZWU5
MzJjMjZmMmRhYjUwM2FiZjcwYzk2ZDhiYiBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Q
QVRFTlRTO21kNT1jNjkyNmQwY2IwN2QyOTZmODg2YWI2ZTBjYzVhODViNyIKIAogU1JDX1VSSSA9
ICJodHRwOi8vZG93bmxvYWRzLndlYm1wcm9qZWN0Lm9yZy9yZWxlYXNlcy93ZWJwLyR7QlB9LnRh
ci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YmY1YThhMjhjYzY5YmNmYThjYjIxNGYyYzMw
OTU3MDNjNmI3M2FjNWZiYTRkNTQ4MGMyMDUzMzFkOTQ5NGRmIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjY0YWM0NjE0ZGIyOTJhZThjNWFhMjZkZTAyOTViZjE2MjNkYmIzOTg1MDU0Y2I2NTZjNTVl
Njc0MzFkZWYxN2MiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwOi8vZG93bmxvYWRzLndl
Ym1wcm9qZWN0Lm9yZy9yZWxlYXNlcy93ZWJwL2luZGV4Lmh0bWwiCiAKLS0gCjIuMzcuMwoK

--===============4360499927294270092==--

