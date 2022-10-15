Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E9CC64EC2
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.24537.1665871393935372028
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YrM7IrGB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac3121-3b80b768-a552-40eb-bcec-9e3c618c87ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HOZthqdpxlqb1YmxPRdgom5IB7mahQvCAvo8HWRKifw=;
	b=YrM7IrGBiSDVwxZcq/b9IcMKby+qShrr1r0zWKJZbnovQmZ1DIH5vYYWABjNEOoF
	+iRNHu2VRGb2wSfiuoF3HABj+6puCWPgtrFg62rsZFlAhJ/G7SEPkyeK+0pkgprI3T5
	ToMqjz1w9lPdJUaCrifwCSqNzNC5eIzCFLWvDz0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HOZthqdpxlqb1YmxPRdgom5IB7mahQvCAvo8HWRKifw=;
	b=IMsrf5zMqMIaL4nh6nYnIWrXBKYbHznuwC4d5+LZJD5aCykg+XLCSklbW2FDb2+/
	OlGWn/xqm2PCwlvrl5KH5gGZMTRjBi8GlgXuckSOSbsv2uBpscQK5q2h31F8H+fpoJz
	MDaRhuHVGJ2bTRI5VeOzeYgLRBNDpqiOhKXKKCPo=
Content-Type: multipart/mixed; boundary="===============6479830131909035403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20221009-3.1 SUCCEEDED
Message-ID: <01010183ddac3121-3b80b768-a552-40eb-bcec-9e3c618c87ef-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171774

--===============6479830131909035403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libedit* to *20221009-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20210910-3.1-20221009-3.1.patch
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
--===============6479830131909035403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.68", added "/usr/lib/libedit.so.0.0.69"
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.69
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.69
  /usr/lib/libedit.so.0.0.68 moved to /usr/lib/libedit.so.0.0.69

--===============6479830131909035403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20210910-3.1-20221009-3.1.patch"

RnJvbSBhNWM4YzJhZTJlZDRhMGIwNWM0ZDYwNGZkNzhlODgzM2ZiZWY1YWU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDg6NTU6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJlZGl0OiB1cGdyYWRlIDIwMjEwOTEwLTMuMSAtPiAyMDIyMTAwOS0zLjEKCi0tLQogLi4uL3ts
aWJlZGl0XzIwMjEwOTEwLTMuMS5iYiA9PiBsaWJlZGl0XzIwMjIxMDA5LTMuMS5iYn0gICAgICAg
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQve2xpYmVkaXRfMjAyMTA5MTAtMy4x
LmJiID0+IGxpYmVkaXRfMjAyMjEwMDktMy4xLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyMTA5MTAtMy4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDIyMTAwOS0zLjEuYmIKc2ltaWxhcml0
eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGli
ZWRpdF8yMDIxMDkxMC0zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJl
ZGl0L2xpYmVkaXRfMjAyMjEwMDktMy4xLmJiCmluZGV4IDVhYTgzZWYyNDYuLmE3NDI3YzY2NjIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAyMTA5
MTAtMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJlZGl0L2xpYmVkaXRfMjAy
MjEwMDktMy4xLmJiCkBAIC0xMyw3ICsxMyw3IEBAIGluaGVyaXQgYXV0b3Rvb2xzCiBTUkNfVVJJ
ID0gImh0dHA6Ly93d3cudGhyeXNvZWUuZGsvZWRpdGxpbmUvJHtCUH0udGFyLmd6IFwKICAgICAg
ICAgICAgZmlsZTovL3N0ZGMtcHJlZGVmLnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNjc5MmE2YTk5MjA1MDc2MmVkY2NhMjhmZjMzMThjZGI3ZGUzN2RjY2Y3YmMz
MGRiNTlmY2Q3MDE3ZWVkMTNjNSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiN2IxMzVhNTExMmNl
NDM0NGM5YWMzZGZmNTdjYzA1N2IyYjBlMWI5MTI2MTlhMzZjZjFkMTNmY2U4ZTg4NjI2IgogCiBC
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKLS0gCjIuMzEuMQoK

--===============6479830131909035403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20221009-3.1.tar.gz file://stdc-predef.patch"
packages/core2-32-poky-linux/libedit: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/.debug/libedit.so.0.0.68", added "/usr/lib/.debug/libedit.so.0.0.69"
packages/core2-32-poky-linux/libedit/libedit-dbg: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 481000 to 486328 (+1%)
packages/core2-32-poky-linux/libedit/libedit-dev: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-dev: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dev: PKGSIZE changed from 18343 to 19115 (+4%)
packages/core2-32-poky-linux/libedit/libedit-doc: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-doc: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-locale: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-locale: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: FILELIST: directory renamed /usr/src/debug/libedit/20210910-3.1-r0/src/editline -> /usr/src/debug/libedit/20221009-3.1-r0/src/editline, removed "/usr/src/debug/libedit/20210910-3.1-r0/src/refresh.h /usr/src/debug/libedit/20210910-3.1-r0/src/el.h /usr/src/debug/libedit/20210910-3.1-r0/src/refresh.c /usr/src/debug/libedit/20210910-3.1-r0/src/common.c /usr/src/debug/libedit/20210910-3.1-r0/src/emacs.c /usr/src/debug/libedit/20210910-3.1-r0/src/tokenizer.c /usr/src/debug/libedit/20210910-3.1-r0/src/strlcpy.c /usr/src/debug/libedit/20210910-3.1-r0/src/el.c /usr/src/debug/libedit/20210910-3.1-r0/src/unvis.c /usr/src/debug/libedit/20210910-3.1-r0/src/literal.c /usr/src/debug/libedit/20210910-3.1-r0/src/vis.h /usr/src/debug/libedit/20210910-3.1-r0/src/readline.c /usr/src/debug/libedit/20210910-3.1-r0/src/chartype.c /usr/src/debug/libedit/20210910-3.1-r0/src/vi.h /usr/src/debug/libedit/20210910-3.1-r0/src/parse.h /usr/src/debug/libedit/2021091
 0-3.1-r0/src/histedit.h /usr/src/debug/libedit/20210910-3.1-r0/src/map.c /usr/src/debug/libedit/20210910-3.1-r0/src/chartype.h /usr/src/debug/libedit/20210910-3.1-r0/src/hist.c /usr/src/debug/libedit/20210910-3.1-r0/src/hist.h /usr/src/debug/libedit/20210910-3.1-r0/src/prompt.c /usr/src/debug/libedit/20210910-3.1-r0/src/sig.h /usr/src/debug/libedit/20210910-3.1-r0/src/read.c /usr/src/debug/libedit/20210910-3.1-r0/src/keymacro.h /usr/src/debug/libedit/20210910-3.1-r0/src/emacs.h /usr/src/debug/libedit/20210910-3.1-r0/src/filecomplete.h /usr/src/debug/libedit/20210910-3.1-r0/src/chared.c /usr/src/debug/libedit/20210910-3.1-r0/src/search.c /usr/src/debug/libedit/20210910-3.1-r0/src/eln.c /usr/src/debug/libedit/20210910-3.1-r0/src/tty.h /usr/src/debug/libedit/20210910-3.1-r0/src/terminal.c /usr/src/debug/libedit/20210910-3.1-r0/src/strlcat.c /usr/src/debug/libedit/20210910-3.1-r0/src/map.h /usr/src/debug/libedit/20210910-3.1-r0/src/read.h /usr/src/debug/libedit/20210910-3.1-r0/src/vis.c
  /usr/src/debug/libedit/20210910-3.1-r0/src/func.h /usr/src/debug/libedit/20210910-3.1-r0/src/search.h /usr/src/debug/libedit/20210910-3.1-r0/src/chared.h /usr/src/debug/libedit/20210910-3.1-r0/src/history.c /usr/src/debug/libedit/20210910-3.1-r0/src/literal.h /usr/src/debug/libedit/20210910-3.1-r0/src/keymacro.c /usr/src/debug/libedit/20210910-3.1-r0/src/wcsdup.c /usr/src/debug/libedit/20210910-3.1-r0/src/filecomplete.c /usr/src/debug/libedit/20210910-3.1-r0/src/parse.c /usr/src/debug/libedit/20210910-3.1-r0/src/common.h /usr/src/debug/libedit/20210910-3.1-r0/src/help.h /usr/src/debug/libedit/20210910-3.1-r0/src/tty.c /usr/src/debug/libedit/20210910-3.1-r0/src/sys.h /usr/src/debug/libedit/20210910-3.1-r0/src/sig.c /usr/src/debug/libedit/20210910-3.1-r0/src/vi.c /usr/src/debug/libedit/20210910-3.1-r0/src/terminal.h /usr/src/debug/libedit/20210910-3.1-r0/src/prompt.h", added "/usr/src/debug/libedit/20221009-3.1-r0/src/unvis.c /usr/src/debug/libedit/20221009-3.1-r0/src/wcsdup.c /usr/s
 rc/debug/libedit/20221009-3.1-r0/src/strlcat.c /usr/src/debug/libedit/20221009-3.1-r0/src/vi.c /usr/src/debug/libedit/20221009-3.1-r0/src/hist.c /usr/src/debug/libedit/20221009-3.1-r0/src/vis.h /usr/src/debug/libedit/20221009-3.1-r0/src/filecomplete.c /usr/src/debug/libedit/20221009-3.1-r0/src/vis.c /usr/src/debug/libedit/20221009-3.1-r0/src/chared.h /usr/src/debug/libedit/20221009-3.1-r0/src/sig.h /usr/src/debug/libedit/20221009-3.1-r0/src/strlcpy.c /usr/src/debug/libedit/20221009-3.1-r0/src/keymacro.c /usr/src/debug/libedit/20221009-3.1-r0/src/emacs.h /usr/src/debug/libedit/20221009-3.1-r0/src/refresh.h /usr/src/debug/libedit/20221009-3.1-r0/src/read.c /usr/src/debug/libedit/20221009-3.1-r0/src/emacs.c /usr/src/debug/libedit/20221009-3.1-r0/src/histedit.h /usr/src/debug/libedit/20221009-3.1-r0/src/chartype.c /usr/src/debug/libedit/20221009-3.1-r0/src/el.c /usr/src/debug/libedit/20221009-3.1-r0/src/readline.c /usr/src/debug/libedit/20221009-3.1-r0/src/reallocarr.c /usr/src/debug/li
 bedit/20221009-3.1-r0/src/filecomplete.h /usr/src/debug/libedit/20221009-3.1-r0/src/tokenizer.c /usr/src/debug/libedit/20221009-3.1-r0/src/vi.h /usr/src/debug/libedit/20221009-3.1-r0/src/search.c /usr/src/debug/libedit/20221009-3.1-r0/src/help.h /usr/src/debug/libedit/20221009-3.1-r0/src/literal.c /usr/src/debug/libedit/20221009-3.1-r0/src/keymacro.h /usr/src/debug/libedit/20221009-3.1-r0/src/chared.c /usr/src/debug/libedit/20221009-3.1-r0/src/terminal.c /usr/src/debug/libedit/20221009-3.1-r0/src/chartype.h /usr/src/debug/libedit/20221009-3.1-r0/src/search.h /usr/src/debug/libedit/20221009-3.1-r0/src/sig.c /usr/src/debug/libedit/20221009-3.1-r0/src/common.c /usr/src/debug/libedit/20221009-3.1-r0/src/terminal.h /usr/src/debug/libedit/20221009-3.1-r0/src/sys.h /usr/src/debug/libedit/20221009-3.1-r0/src/literal.h /usr/src/debug/libedit/20221009-3.1-r0/src/history.c /usr/src/debug/libedit/20221009-3.1-r0/src/hist.h /usr/src/debug/libedit/20221009-3.1-r0/src/tty.c /usr/src/debug/libedit/
 20221009-3.1-r0/src/prompt.h /usr/src/debug/libedit/20221009-3.1-r0/src/tty.h /usr/src/debug/libedit/20221009-3.1-r0/src/map.c /usr/src/debug/libedit/20221009-3.1-r0/src/func.h /usr/src/debug/libedit/20221009-3.1-r0/src/parse.c /usr/src/debug/libedit/20221009-3.1-r0/src/prompt.c /usr/src/debug/libedit/20221009-3.1-r0/src/read.h /usr/src/debug/libedit/20221009-3.1-r0/src/common.h /usr/src/debug/libedit/20221009-3.1-r0/src/refresh.c /usr/src/debug/libedit/20221009-3.1-r0/src/eln.c /usr/src/debug/libedit/20221009-3.1-r0/src/parse.h /usr/src/debug/libedit/20221009-3.1-r0/src/el.h /usr/src/debug/libedit/20221009-3.1-r0/src/map.h"
packages/core2-32-poky-linux/libedit/libedit-src: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-src: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: PKGSIZE changed from 582218 to 589290 (+1%)
packages/core2-32-poky-linux/libedit/libedit-staticdev: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.68", added "/usr/lib/libedit.so.0.0.69"
packages/core2-32-poky-linux/libedit/libedit: PV changed from "20210910-3.1" to "20221009-3.1"
packages/core2-32-poky-linux/libedit/libedit: PKGV changed from 20210910-3.1 [default] to 20221009-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit: PKGSIZE changed from 226785 to 234977 (+4%)
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.69
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.69
  /usr/lib/libedit.so.0.0.68 moved to /usr/lib/libedit.so.0.0.69

--===============6479830131909035403==--

