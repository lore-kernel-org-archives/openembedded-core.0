Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D9CC64ED8
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.875.1667349632981329428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q5j5lZBN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c85464-e2b1de59-55b7-42db-ab46-16827bd5e109-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WiQ0atfJ2+0B58p17rcjSw7OROZb9DlZN+2cwAfNAbo=;
	b=Q5j5lZBN0L3MWWTfcgxgeOWI1eyFDbORaAhtNwuF+d4aql4oESo9UQGwJgzGMym/
	JAOvhkKkzYnKVVTG/QS4dBROLgmS1HaBu6ieapn9W21LH3mlZ0K0AtKK3+1QY5aOCf2
	5ZxweeQGvIXajfxfi9axvNLWPKYTrSqlMHvE9ohM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WiQ0atfJ2+0B58p17rcjSw7OROZb9DlZN+2cwAfNAbo=;
	b=BusoMEBy6MbrHperri1zF72XeNH5xrjFHtsj5nTCaMruLiXq6LpXXbRnMq9rXWbw
	Ci+hHUnvs6faAI90w5Mh8dLTaWpgzN5VY1crnOdTuBJmJwZM9MUjDU9GsGx4GP/kXK9
	T1skUqzZKtHt3ub9YeVVv1DszQmB7qZ1ynC2gbnA=
Content-Type: multipart/mixed; boundary="===============1262800989908964774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libedit: upgrading to 20221030-3.1 SUCCEEDED
Message-ID: <0101018435c85464-e2b1de59-55b7-42db-ab46-16827bd5e109-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172417

--===============1262800989908964774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libedit* to *20221030-3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libedit-upgrade-20210910-3.1-20221030-3.1.patch
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
--===============1262800989908964774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libedit: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit: SRC_URI changed from "http://www.thrysoee.dk/editline/libedit-20210910-3.1.tar.gz file://stdc-predef.patch" to "http://www.thrysoee.dk/editline/libedit-20221030-3.1.tar.gz file://stdc-predef.patch"
packages/core2-32-poky-linux/libedit/libedit-dbg: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dbg: FILELIST: removed "/usr/lib/.debug/libedit.so.0.0.68", added "/usr/lib/.debug/libedit.so.0.0.70"
packages/core2-32-poky-linux/libedit/libedit-dbg: PKGSIZE changed from 481000 to 487588 (+1%)
packages/core2-32-poky-linux/libedit/libedit-dev: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-dev: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-dev: PKGSIZE changed from 18343 to 19115 (+4%)
packages/core2-32-poky-linux/libedit/libedit-doc: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-doc: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-locale: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-locale: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-src: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit-src: FILELIST: directory renamed /usr/src/debug/libedit/20210910-3.1-r0/src/editline -> /usr/src/debug/libedit/20221030-3.1-r0/src/editline, removed "/usr/src/debug/libedit/20210910-3.1-r0/src/map.h /usr/src/debug/libedit/20210910-3.1-r0/src/keymacro.c /usr/src/debug/libedit/20210910-3.1-r0/src/strlcat.c /usr/src/debug/libedit/20210910-3.1-r0/src/sys.h /usr/src/debug/libedit/20210910-3.1-r0/src/hist.c /usr/src/debug/libedit/20210910-3.1-r0/src/el.c /usr/src/debug/libedit/20210910-3.1-r0/src/func.h /usr/src/debug/libedit/20210910-3.1-r0/src/chared.h /usr/src/debug/libedit/20210910-3.1-r0/src/filecomplete.h /usr/src/debug/libedit/20210910-3.1-r0/src/refresh.c /usr/src/debug/libedit/20210910-3.1-r0/src/search.c /usr/src/debug/libedit/20210910-3.1-r0/src/strlcpy.c /usr/src/debug/libedit/20210910-3.1-r0/src/read.h /usr/src/debug/libedit/20210910-3.1-r0/src/wcsdup.c /usr/src/debug/libedit/20210910-3.1-r0/src/vi.c /usr/src/debug/libedit/20210910-
 3.1-r0/src/chartype.h /usr/src/debug/libedit/20210910-3.1-r0/src/readline.c /usr/src/debug/libedit/20210910-3.1-r0/src/tty.c /usr/src/debug/libedit/20210910-3.1-r0/src/vi.h /usr/src/debug/libedit/20210910-3.1-r0/src/prompt.c /usr/src/debug/libedit/20210910-3.1-r0/src/help.h /usr/src/debug/libedit/20210910-3.1-r0/src/map.c /usr/src/debug/libedit/20210910-3.1-r0/src/history.c /usr/src/debug/libedit/20210910-3.1-r0/src/tty.h /usr/src/debug/libedit/20210910-3.1-r0/src/vis.h /usr/src/debug/libedit/20210910-3.1-r0/src/terminal.c /usr/src/debug/libedit/20210910-3.1-r0/src/eln.c /usr/src/debug/libedit/20210910-3.1-r0/src/el.h /usr/src/debug/libedit/20210910-3.1-r0/src/filecomplete.c /usr/src/debug/libedit/20210910-3.1-r0/src/histedit.h /usr/src/debug/libedit/20210910-3.1-r0/src/vis.c /usr/src/debug/libedit/20210910-3.1-r0/src/prompt.h /usr/src/debug/libedit/20210910-3.1-r0/src/sig.h /usr/src/debug/libedit/20210910-3.1-r0/src/emacs.c /usr/src/debug/libedit/20210910-3.1-r0/src/sig.c /usr/src/
 debug/libedit/20210910-3.1-r0/src/terminal.h /usr/src/debug/libedit/20210910-3.1-r0/src/refresh.h /usr/src/debug/libedit/20210910-3.1-r0/src/parse.c /usr/src/debug/libedit/20210910-3.1-r0/src/emacs.h /usr/src/debug/libedit/20210910-3.1-r0/src/keymacro.h /usr/src/debug/libedit/20210910-3.1-r0/src/chartype.c /usr/src/debug/libedit/20210910-3.1-r0/src/literal.h /usr/src/debug/libedit/20210910-3.1-r0/src/search.h /usr/src/debug/libedit/20210910-3.1-r0/src/parse.h /usr/src/debug/libedit/20210910-3.1-r0/src/common.h /usr/src/debug/libedit/20210910-3.1-r0/src/unvis.c /usr/src/debug/libedit/20210910-3.1-r0/src/chared.c /usr/src/debug/libedit/20210910-3.1-r0/src/literal.c /usr/src/debug/libedit/20210910-3.1-r0/src/tokenizer.c /usr/src/debug/libedit/20210910-3.1-r0/src/read.c /usr/src/debug/libedit/20210910-3.1-r0/src/common.c /usr/src/debug/libedit/20210910-3.1-r0/src/hist.h", added "/usr/src/debug/libedit/20221030-3.1-r0/src/read.c /usr/src/debug/libedit/20221030-3.1-r0/src/sig.c /usr/src/d
 ebug/libedit/20221030-3.1-r0/src/el.c /usr/src/debug/libedit/20221030-3.1-r0/src/vis.h /usr/src/debug/libedit/20221030-3.1-r0/src/vi.c /usr/src/debug/libedit/20221030-3.1-r0/src/unvis.c /usr/src/debug/libedit/20221030-3.1-r0/src/func.h /usr/src/debug/libedit/20221030-3.1-r0/src/emacs.h /usr/src/debug/libedit/20221030-3.1-r0/src/vis.c /usr/src/debug/libedit/20221030-3.1-r0/src/filecomplete.c /usr/src/debug/libedit/20221030-3.1-r0/src/read.h /usr/src/debug/libedit/20221030-3.1-r0/src/sys.h /usr/src/debug/libedit/20221030-3.1-r0/src/chared.h /usr/src/debug/libedit/20221030-3.1-r0/src/literal.c /usr/src/debug/libedit/20221030-3.1-r0/src/sig.h /usr/src/debug/libedit/20221030-3.1-r0/src/terminal.c /usr/src/debug/libedit/20221030-3.1-r0/src/help.h /usr/src/debug/libedit/20221030-3.1-r0/src/terminal.h /usr/src/debug/libedit/20221030-3.1-r0/src/map.h /usr/src/debug/libedit/20221030-3.1-r0/src/vi.h /usr/src/debug/libedit/20221030-3.1-r0/src/tty.c /usr/src/debug/libedit/20221030-3.1-r0/src/com
 mon.h /usr/src/debug/libedit/20221030-3.1-r0/src/readline.c /usr/src/debug/libedit/20221030-3.1-r0/src/refresh.c /usr/src/debug/libedit/20221030-3.1-r0/src/keymacro.h /usr/src/debug/libedit/20221030-3.1-r0/src/eln.c /usr/src/debug/libedit/20221030-3.1-r0/src/wcsdup.c /usr/src/debug/libedit/20221030-3.1-r0/src/refresh.h /usr/src/debug/libedit/20221030-3.1-r0/src/literal.h /usr/src/debug/libedit/20221030-3.1-r0/src/reallocarr.c /usr/src/debug/libedit/20221030-3.1-r0/src/hist.c /usr/src/debug/libedit/20221030-3.1-r0/src/keymacro.c /usr/src/debug/libedit/20221030-3.1-r0/src/prompt.c /usr/src/debug/libedit/20221030-3.1-r0/src/histedit.h /usr/src/debug/libedit/20221030-3.1-r0/src/prompt.h /usr/src/debug/libedit/20221030-3.1-r0/src/search.c /usr/src/debug/libedit/20221030-3.1-r0/src/hist.h /usr/src/debug/libedit/20221030-3.1-r0/src/chartype.c /usr/src/debug/libedit/20221030-3.1-r0/src/map.c /usr/src/debug/libedit/20221030-3.1-r0/src/emacs.c /usr/src/debug/libedit/20221030-3.1-r0/src/el.h /
 usr/src/debug/libedit/20221030-3.1-r0/src/parse.c /usr/src/debug/libedit/20221030-3.1-r0/src/tokenizer.c /usr/src/debug/libedit/20221030-3.1-r0/src/chartype.h /usr/src/debug/libedit/20221030-3.1-r0/src/parse.h /usr/src/debug/libedit/20221030-3.1-r0/src/strlcat.c /usr/src/debug/libedit/20221030-3.1-r0/src/search.h /usr/src/debug/libedit/20221030-3.1-r0/src/common.c /usr/src/debug/libedit/20221030-3.1-r0/src/strlcpy.c /usr/src/debug/libedit/20221030-3.1-r0/src/history.c /usr/src/debug/libedit/20221030-3.1-r0/src/chared.c /usr/src/debug/libedit/20221030-3.1-r0/src/filecomplete.h /usr/src/debug/libedit/20221030-3.1-r0/src/tty.h"
packages/core2-32-poky-linux/libedit/libedit-src: PKGSIZE changed from 582218 to 589212 (+1%)
packages/core2-32-poky-linux/libedit/libedit-staticdev: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit-staticdev: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit: PV changed from "20210910-3.1" to "20221030-3.1"
packages/core2-32-poky-linux/libedit/libedit: PKGV changed from 20210910-3.1 [default] to 20221030-3.1 [default]
packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.68", added "/usr/lib/libedit.so.0.0.70"
packages/core2-32-poky-linux/libedit/libedit: PKGSIZE changed from 226785 to 234977 (+4%)
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.70
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.70
  /usr/lib/libedit.so.0.0.68 moved to /usr/lib/libedit.so.0.0.70

--===============1262800989908964774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libedit-upgrade-20210910-3.1-20221030-3.1.patch"

RnJvbSBmOTg2ZTI1MGZjMWZmMjczMWNhMWUyOWVmZGFjNDlhOTMzYWRhOGIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzo1NDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmVkaXQ6IHVwZ3JhZGUgMjAyMTA5MTAtMy4xIC0+IDIwMjIxMDMwLTMuMQoKLS0tCiAuLi4ve2xp
YmVkaXRfMjAyMTA5MTAtMy4xLmJiID0+IGxpYmVkaXRfMjAyMjEwMzAtMy4xLmJifSAgICAgICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC97bGliZWRpdF8yMDIxMDkxMC0zLjEu
YmIgPT4gbGliZWRpdF8yMDIyMTAzMC0zLjEuYmJ9ICg4OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDIxMDkxMC0zLjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJlZGl0XzIwMjIxMDMwLTMuMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZWRpdC9saWJl
ZGl0XzIwMjEwOTEwLTMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVk
aXQvbGliZWRpdF8yMDIyMTAzMC0zLjEuYmIKaW5kZXggNWFhODNlZjI0Ni4uOTE5NTI1OGMxMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDIxMDkx
MC0zLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmVkaXQvbGliZWRpdF8yMDIy
MTAzMC0zLjEuYmIKQEAgLTEzLDcgKzEzLDcgQEAgaW5oZXJpdCBhdXRvdG9vbHMKIFNSQ19VUkkg
PSAiaHR0cDovL3d3dy50aHJ5c29lZS5kay9lZGl0bGluZS8ke0JQfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vc3RkYy1wcmVkZWYucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI2NzkyYTZhOTkyMDUwNzYyZWRjY2EyOGZmMzMxOGNkYjdkZTM3ZGNjZjdiYzMw
ZGI1OWZjZDcwMTdlZWQxM2M1IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYwOTI1YTVhZGY0YjFi
ZjExNmVlMTk3NjZiN2RhYTc2NjkxN2FlYzE5ODc0Nzk0M2IxYzRlZGY2N2E0YmUyYmIiCiAKIEJC
Q0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAotLSAKMi4zMS4xCgo=

--===============1262800989908964774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libedit/libedit: FILELIST: removed "/usr/lib/libedit.so.0.0.68", added "/usr/lib/libedit.so.0.0.70"
Changes to packages/core2-32-poky-linux/libedit (sysroot):
  /usr/lib/libedit.so.0 changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.70
  /usr/lib/libedit.so changed symlink target from libedit.so.0.0.68 to libedit.so.0.0.70
  /usr/lib/libedit.so.0.0.68 moved to /usr/lib/libedit.so.0.0.70

--===============1262800989908964774==--

