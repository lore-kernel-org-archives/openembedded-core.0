Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454CCCA9EB3
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7632.1685693432454653899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MgR+EAE+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b28886c-85935c6e-193c-4b12-a172-03439a6e6e62-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B55dY8kjonBEWCSFAx3Om785Mu40aFSE2ICtsJhZaoE=;
	b=MgR+EAE+A98fgR7PmBXAQ07ccAuSM2bZV3+uOb/5YDw11FQ55DwmYvzqeBBRBvZn
	9xS1CrzdxOg8G0ynu1xUUQ2N6RxL85nVOYS9Lc/qETt9iItnrXqg6ozZ23u5K7EEYuU
	UcfZPLQ6g6krCQ0dXwG/cTxLXZORha8xPMBkEd9Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B55dY8kjonBEWCSFAx3Om785Mu40aFSE2ICtsJhZaoE=;
	b=WwWDAAmYsKjJfO+edp2i5/0DF57vzVN60+N6zW+5j9BQA2lCVCkno3B2+RLvnRFI
	TLDwQ2gKnWqVGNj+/dgwQqXvropPt+L5o/+kpg26+U9uoLdeIIkjg42CAfKvRVyc42J
	gt2+qZUCD9N6Bw7BOHvwboabhu2yf+enxgwIw5RE=
Content-Type: multipart/mixed; boundary="===============5496204013406484503=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] parted: upgrading to 3.6 SUCCEEDED
Message-ID: <010101887b28886c-85935c6e-193c-4b12-a172-03439a6e6e62-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182224

--===============5496204013406484503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *parted* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-parted-upgrade-3.5-3.6.patch
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
--===============5496204013406484503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh /usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh /usr/lib/parted/ptest/tests/t0900-type-gpt.sh"
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted.so.2.0.4 /usr/lib/libparted-fs-resize.so.0.0.4", added "/usr/lib/libparted.so.2.0.5 /usr/lib/libparted-fs-resize.so.0.0.5"
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============5496204013406484503==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-parted-upgrade-3.5-3.6.patch"

RnJvbSBlODNiODE1YTdkYjg1NTc5OTliMzZiM2NmMjk0NWEyMmYzY2I5MjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMDozNzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
cnRlZDogdXBncmFkZSAzLjUgLT4gMy42CgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0
ZWQve3BhcnRlZF8zLjUuYmIgPT4gcGFydGVkXzMuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGFydGVkL3twYXJ0ZWRfMy41LmJiID0+IHBhcnRlZF8zLjYuYmJ9ICg5NiUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy41LmJiIGIvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy42LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhcnRlZC9wYXJ0ZWRfMy42LmJiCmlu
ZGV4IGVhMmI2OGJiZDguLjA1ZDU3NTA3ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFy
dGVkL3BhcnRlZF8zLjYuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0dOVV9NSVJS
T1J9L3BhcnRlZC9wYXJ0ZWQtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1w
dGVzdCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5MzhkZDVjMWMx
MjVmNmM3OGIxZjRiM2UyOTc1MjZmMThlZTc0YWE0M2Q0NWMyNDg1NzhiMWQyNDcwYzA1YTIiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiM2I0M2RiZTMzY2NhMGY5YTE4NjAxZWJhYjU2Yjc4NTJiMTI4
ZWMxYTNkZjNhOWIzMGNjZGU1ZTczMzU5ZTYxMiIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29u
ZmlnIGdldHRleHQgdGV4aW5mbyBwdGVzdAogCi0tIAoyLjM5LjIKCg==

--===============5496204013406484503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/parted: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted: PACKAGES: added "parted-locale-ka"
packages/core2-32-poky-linux/parted: SRC_URI changed from "https://ftp.gnu.org/gnu/parted/parted-3.5.tar.xz file://fix-doc-mandir.patch file://run-ptest" to "https://ftp.gnu.org/gnu/parted/parted-3.6.tar.xz file://fix-doc-mandir.patch file://run-ptest"
packages/core2-32-poky-linux/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-dbg: FILELIST: removed "/usr/lib/.debug/libparted.so.2.0.4 /usr/lib/.debug/libparted-fs-resize.so.0.0.4", added "/usr/lib/.debug/libparted-fs-resize.so.0.0.5 /usr/lib/.debug/libparted.so.2.0.5"
packages/core2-32-poky-linux/parted/parted-dbg: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dbg: PKGSIZE changed from 1631936 to 1649360 (+1%)
packages/core2-32-poky-linux/parted/parted-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-dev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-dev: PKGSIZE changed from 51119 to 52495 (+3%)
packages/core2-32-poky-linux/parted/parted-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-doc: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-doc: PKGSIZE changed from 74823 to 75876 (+1%)
packages/core2-32-poky-linux/parted/parted-locale-ca: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ca: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-cs: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-cs: PKGSIZE changed from 53937 to 53773 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-da: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-da: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-da: PKGSIZE changed from 46440 to 46294 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-de: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-de: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-de: PKGSIZE changed from 75120 to 74785 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-es: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-es: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-es: PKGSIZE changed from 73981 to 73647 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fr: PKGSIZE changed from 71697 to 71324 (-1%)
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-fur: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-fur: PKGSIZE changed from 65752 to 73773 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-gl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-gl: PKGSIZE changed from 36492 to 36338 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-hu: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-hu: PKGSIZE changed from 64534 to 64392 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-id: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-id: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-id: PKGSIZE changed from 71674 to 71369 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-it: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-it: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-it: PKGSIZE changed from 65306 to 65161 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ja: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ja: PKGSIZE changed from 82969 to 82612 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ko: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ko: PKGSIZE changed from 77412 to 77057 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-nl: PKGSIZE changed from 70310 to 69996 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-nn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-nn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pl: PKGSIZE changed from 73932 to 73608 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-pt-br: PKGSIZE changed from 72810 to 72480 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-pt: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-pt: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ro: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ro: PKGSIZE changed from 76252 to 75936 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-ru: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-ru: PKGSIZE changed from 90800 to 92400 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-rw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-rw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sk: PKGSIZE changed from 62607 to 62461 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sl: PKGSIZE changed from 58539 to 58397 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sr: PKGSIZE changed from 90984 to 92670 (+2%)
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-sv: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-sv: PKGSIZE changed from 72383 to 72054 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-tr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-tr: PKGSIZE changed from 64803 to 64669 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-uk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-uk: PKGSIZE changed from 93872 to 93455 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-vi: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-vi: PKGSIZE changed from 69671 to 78082 (+12%)
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-cn: PKGSIZE changed from 67719 to 67435 (-0%)
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-locale-zh-tw: PKGSIZE changed from 68482 to 68192 (-0%)
packages/core2-32-poky-linux/parted/parted-ptest: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-ptest: FILELIST: added "/usr/lib/parted/ptest/tests/t0911-type-dos-invalid.sh /usr/lib/parted/ptest/tests/t0901-type-gpt-invalid.sh /usr/lib/parted/ptest/tests/t9025-gpt-1s-partition.sh /usr/lib/parted/ptest/tests/t0910-type-dos.sh /usr/lib/parted/ptest/tests/t0900-type-gpt.sh /usr/lib/parted/ptest/tests/t9024-msdos-1s-partition.sh"
packages/core2-32-poky-linux/parted/parted-ptest: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-ptest: PKGSIZE changed from 581946 to 608925 (+5%)
packages/core2-32-poky-linux/parted/parted-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-src: FILELIST: directory renamed /usr/src/debug/parted/3.5-r0/include/parted -> /usr/src/debug/parted/3.6-r0/include/parted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/nilfs2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/nilfs2, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/linux_swap -> /usr/src/debug/parted/3.6-r0/libparted/fs/linux_swap, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/udf -> /usr/src/debug/parted/3.6-r0/libparted/fs/udf, directory renamed /usr/src/debug/parted/3.5-r0/libparted/arch -> /usr/src/debug/parted/3.6-r0/libparted/arch, directory renamed /usr/src/debug/parted/3.5-r0/parted -> /usr/src/debug/parted/3.6-r0/parted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ext2 -> /usr/src/debug/parted/3.6-r0/libparted/fs/ext2, directory renamed /usr/src/debug/parted/3.5-r0/partprobe -> /usr/src/debug/parted/3.6-r0/partprobe, directory renamed /usr/src/debug/parted/3.5-r0/l
 ibparted/cs -> /usr/src/debug/parted/3.6-r0/libparted/cs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r -> /usr/src/debug/parted/3.6-r0/libparted/fs/r, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/xfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/xfs, directory renamed /usr/src/debug/parted/3.5-r0/tests -> /usr/src/debug/parted/3.6-r0/tests, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/hfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/f2fs -> /usr/src/debug/parted/3.6-r0/libparted/fs/f2fs, directory renamed /usr/src/debug/parted/3.5-r0/libparted -> /usr/src/debug/parted/3.6-r0/libparted, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/reiserfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/reiserfs, directory renamed /usr/src/debug/parted/3.5-r0/libp
 arted/fs/amiga -> /usr/src/debug/parted/3.6-r0/libparted/fs/amiga, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/r/hfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/r/hfs, directory renamed /usr/src/debug/parted/3.5-r0/lib/glthread -> /usr/src/debug/parted/3.6-r0/lib/glthread, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/jfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/jfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/labels -> /usr/src/debug/parted/3.6-r0/libparted/labels, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/fat -> /usr/src/debug/parted/3.6-r0/libparted/fs/fat, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ntfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ntfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/btrfs -> /usr/src/debug/parted/3.6-r0/libparted/fs/btrfs, directory renamed /usr/src/debug/parted/3.5-r0/libparted/fs/ufs -> /usr/src/debug/parted/3.6-r0/libparted/fs/ufs, removed "/usr/sr
 c/debug/parted/3.5-r0/lib/xalloc-die.c /usr/src/debug/parted/3.5-r0/lib/regex.h /usr/src/debug/parted/3.5-r0/lib/stat-time.h /usr/src/debug/parted/3.5-r0/lib/dirname.h /usr/src/debug/parted/3.5-r0/lib/wchar.h /usr/src/debug/parted/3.5-r0/lib/xstrtol.h /usr/src/debug/parted/3.5-r0/lib/regcomp.c /usr/src/debug/parted/3.5-r0/lib/xmalloc.c /usr/src/debug/parted/3.5-r0/lib/xstrtol.c /usr/src/debug/parted/3.5-r0/lib/regexec.c /usr/src/debug/parted/3.5-r0/lib/dirname.c /usr/src/debug/parted/3.5-r0/lib/closeout.c /usr/src/debug/parted/3.5-r0/lib/closeout.h /usr/src/debug/parted/3.5-r0/lib/strerror.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.5-r0/lib/idx.h /usr/src/debug/parted/3.5-r0/lib/regex_internal.c /usr/src/debug/parted/3.5-r0/lib/regex_internal.h /usr/src/debug/parted/3.5-r0/lib/stripslash.c /usr/src/debug/parted/3.5-r0/lib/getopt-core.h /usr/src/debug/parted/3.5-r0/lib/quotearg.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_finalize.c /usr
 /src/debug/parted/3.5-r0/lib/quotearg.h /usr/src/debug/parted/3.5-r0/lib/c-strcase.h /usr/src/debug/parted/3.5-r0/lib/sys-limits.h /usr/src/debug/parted/3.5-r0/lib/xalloc.h /usr/src/debug/parted/3.5-r0/lib/getprogname.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.5-r0/lib/version-etc.c /usr/src/debug/parted/3.5-r0/lib/version-etc.h /usr/src/debug/parted/3.5-r0/lib/setlocale_null.h /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.5-r0/lib/setlocale_null.c /usr/src/debug/parted/3.5-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.5-r0/lib/localcharset.c /usr/src/debug/parted/3.5-r0/lib/fcntl.h /usr/src/debug/parted/3.5-r0/lib/fcntl.c /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.5-r0/lib/getopt-ext.h /usr/src/debug/parted/3.5-r0/lib/localcharset.h /usr/src/debug/parted/3.5-r0/lib/c-strncasecmp.c /usr/src/debug/parted/3.5-r0/lib/version-etc-fsf.c /usr/src/deb
 ug/parted/3.5-r0/lib/malloc/scratch_buffer_dupfree.c /usr/src/debug/parted/3.5-r0/lib/dirname-lgpl.c /usr/src/debug/parted/3.5-r0/lib/getopt_int.h /usr/src/debug/parted/3.5-r0/lib/argmatch.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.5-r0/lib/safe-read.c /usr/src/debug/parted/3.5-r0/lib/argmatch.c /usr/src/debug/parted/3.5-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.5-r0/lib/close-stream.c /usr/src/debug/parted/3.5-r0/lib/c-ctype.h /usr/src/debug/parted/3.5-r0/lib/malloca.h /usr/src/debug/parted/3.5-r0/lib/mbrtowc.c /usr/src/debug/parted/3.5-r0/lib/cloexec.c /usr/src/debug/parted/3.5-r0/lib/close-stream.h /usr/src/debug/parted/3.5-r0/lib/getopt1.c /usr/src/debug/parted/3.5-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.5-r0/lib/malloca.c /usr/src/debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.5-r0/lib/exitfail.h /usr/src/debug/parted/3.5-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.5-r0/lib/exitfail.c /usr/src
 /debug/parted/3.5-r0/lib/malloc/scratch_buffer_grow.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.5-r0/lib/long-options.c /usr/src/debug/parted/3.5-r0/lib/hard-locale.h /usr/src/debug/parted/3.5-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.5-r0/lib/error.h /usr/src/debug/parted/3.5-r0/lib/hard-locale.c /usr/src/debug/parted/3.5-r0/lib/tempname.c /usr/src/debug/parted/3.5-r0/lib/basename.c /usr/src/debug/parted/3.5-r0/lib/quote.h /usr/src/debug/parted/3.5-r0/lib/progname.c /usr/src/debug/parted/3.5-r0/lib/progname.h /usr/src/debug/parted/3.5-r0/lib/getopt.c /usr/src/debug/parted/3.5-r0/lib/strtol.c /usr/src/debug/parted/3.5-r0/lib/ialloc.h /usr/src/debug/parted/3.5-r0/lib/stdlib.h /usr/src/debug/parted/3.5-r0/lib/string.h", added "/usr/src/debug/parted/3.6-r0/lib/c-strcaseeq.h /usr/src/debug/parted/3.6-r0/lib/regex.h /usr/src/debug/parted/3.6-r0/lib/fcntl.h /usr/src/
 debug/parted/3.6-r0/lib/fcntl.c /usr/src/debug/parted/3.6-r0/lib/quotearg.c /usr/src/debug/parted/3.6-r0/lib/safe-read.c /usr/src/debug/parted/3.6-r0/lib/regex_internal.c /usr/src/debug/parted/3.6-r0/lib/quotearg.h /usr/src/debug/parted/3.6-r0/lib/sys-limits.h /usr/src/debug/parted/3.6-r0/lib/regex_internal.h /usr/src/debug/parted/3.6-r0/lib/xalloc.h /usr/src/debug/parted/3.6-r0/lib/getopt-ext.h /usr/src/debug/parted/3.6-r0/lib/dirname-lgpl.c /usr/src/debug/parted/3.6-r0/lib/getprogname.c /usr/src/debug/parted/3.6-r0/lib/c-ctype.h /usr/src/debug/parted/3.6-r0/lib/malloca.h /usr/src/debug/parted/3.6-r0/lib/cloexec.c /usr/src/debug/parted/3.6-r0/lib/getopt1.c /usr/src/debug/parted/3.6-r0/lib/malloca.c /usr/src/debug/parted/3.6-r0/lib/mbrtowc.c /usr/src/debug/parted/3.6-r0/lib/quote.h /usr/src/debug/parted/3.6-r0/lib/basename.c /usr/src/debug/parted/3.6-r0/lib/progname.c /usr/src/debug/parted/3.6-r0/lib/stripslash.c /usr/src/debug/parted/3.6-r0/lib/c-strncasecmp.c /usr/src/debug/parted
 /3.6-r0/lib/tempname.c /usr/src/debug/parted/3.6-r0/lib/closeout.h /usr/src/debug/parted/3.6-r0/lib/progname.h /usr/src/debug/parted/3.6-r0/lib/closeout.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow_preserve.c /usr/src/debug/parted/3.6-r0/lib/getopt-core.h /usr/src/debug/parted/3.6-r0/lib/idx.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_finalize.c /usr/src/debug/parted/3.6-r0/lib/long-options.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize_clear.c /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.h /usr/src/debug/parted/3.6-r0/lib/exitfail.c /usr/src/debug/parted/3.6-r0/lib/basename-lgpl.c /usr/src/debug/parted/3.6-r0/lib/exitfail.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_resize.c /usr/src/debug/parted/3.6-r0/lib/version-etc-fsf.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_at_failure.c /usr/src/debug/parted/3.6-r0/lib/argmatch.h /usr/src/debug/parted/3.6-r0/lib/argmatch.c /usr/src/debug/parted/3.6-r0/lib/wchar.h /usr/src/debug/parted/3.6-r
 0/lib/getopt.c /usr/src/debug/parted/3.6-r0/lib/strtol.c /usr/src/debug/parted/3.6-r0/lib/version-etc.h /usr/src/debug/parted/3.6-r0/lib/ialloc.h /usr/src/debug/parted/3.6-r0/lib/stdlib.h /usr/src/debug/parted/3.6-r0/lib/string.h /usr/src/debug/parted/3.6-r0/lib/version-etc.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer.gl.h /usr/src/debug/parted/3.6-r0/lib/close-stream.c /usr/src/debug/parted/3.6-r0/lib/close-stream.h /usr/src/debug/parted/3.6-r0/lib/stat-time.h /usr/src/debug/parted/3.6-r0/lib/xalloc-die.c /usr/src/debug/parted/3.6-r0/lib/dirname.h /usr/src/debug/parted/3.6-r0/lib/xstrtol.h /usr/src/debug/parted/3.6-r0/lib/dirname.c /usr/src/debug/parted/3.6-r0/lib/regcomp.c /usr/src/debug/parted/3.6-r0/lib/regexec.c /usr/src/debug/parted/3.6-r0/lib/hard-locale.c /usr/src/debug/parted/3.6-r0/lib/xmalloc.c /usr/src/debug/parted/3.6-r0/lib/xstrtol.c /usr/src/debug/parted/3.6-r0/lib/hard-locale.h /usr/src/debug/parted/3.6-r0/lib/c-strcasecmp.c /usr/src/debug/parted/3.6-r0/l
 ib/malloc/dynarray-skeleton.c /usr/src/debug/parted/3.6-r0/lib/localcharset.c /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray_emplace_enlarge.c /usr/src/debug/parted/3.6-r0/lib/localcharset.h /usr/src/debug/parted/3.6-r0/lib/malloc/dynarray.h /usr/src/debug/parted/3.6-r0/lib/setlocale_null.c /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_set_array_size.c /usr/src/debug/parted/3.6-r0/lib/setlocale_null.h /usr/src/debug/parted/3.6-r0/lib/getopt_int.h /usr/src/debug/parted/3.6-r0/lib/strerror.c /usr/src/debug/parted/3.6-r0/lib/c-strcase.h /usr/src/debug/parted/3.6-r0/lib/malloc/scratch_buffer_grow.c"
packages/core2-32-poky-linux/parted/parted-src: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted-src: PKGSIZE changed from 2461512 to 2480391 (+1%)
packages/core2-32-poky-linux/parted/parted-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted-staticdev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/parted/parted: FILELIST: removed "/usr/lib/libparted.so.2.0.4 /usr/lib/libparted-fs-resize.so.0.0.4", added "/usr/lib/libparted.so.2.0.5 /usr/lib/libparted-fs-resize.so.0.0.5"
packages/core2-32-poky-linux/parted/parted: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/parted/parted: PKGSIZE changed from 691138 to 695234 (+1%)
Changes to packages/core2-32-poky-linux/parted (sysroot):
  /usr/lib/libparted-fs-resize.so.0 changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted-fs-resize.so changed symlink target from libparted-fs-resize.so.0.0.4 to libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2 changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted.so changed symlink target from libparted.so.2.0.4 to libparted.so.2.0.5
  /usr/lib/libparted-fs-resize.so.0.0.4 moved to /usr/lib/libparted-fs-resize.so.0.0.5
  /usr/lib/libparted.so.2.0.4 moved to /usr/lib/libparted.so.2.0.5

--===============5496204013406484503==--

