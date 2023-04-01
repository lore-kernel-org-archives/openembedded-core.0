Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6538CA9EA9
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.32118.1680384534322850598
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WuFCki8q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101873eb922eb-789dcf71-344d-4030-8ad4-559c45c41d44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xEl/jLng1wciKqlXBjKYXp2YODtAYlMZExsQ8/81DmA=;
	b=WuFCki8qS1SenPMw7/r0NGHLwFbZqmrx2/uq6uiq2WzuHAt0AVOzeK5moQhBRsu3
	PxxlWNvdQHW9AXjrjSestbkYJ+DjgxYYWKYifQsiazXO+TX7NvcjguIsAuy/l8DuN6K
	tObAhYizrM4SjFKwQJGRZ3uG0HsxhcSOpWYSJQUU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xEl/jLng1wciKqlXBjKYXp2YODtAYlMZExsQ8/81DmA=;
	b=rjBswPLFp1kcgUwau7uFCiOz9ygWwMebQEiwLTSTXAqd2hgd+2yB0EPj6zyZ48AF
	hGEyEIoTFRpdoy833DF8tFuSdBbh/ON+Nl44w5opqPTqQ4j24jUpUDh6IDfKJiOKuQW
	JFnlZMQb/wJVHNdDkzoTGDwvqiX3douRaGc2cyBA=
Content-Type: multipart/mixed; boundary="===============0412626720115263967=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dmidecode: upgrading to 3.5 SUCCEEDED
Message-ID: <010101873eb922eb-789dcf71-344d-4030-8ad4-559c45c41d44-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179485

--===============0412626720115263967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dmidecode* to *3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dmidecode-upgrade-3.4-3.5.patch
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
--===============0412626720115263967==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dmidecode-upgrade-3.4-3.5.patch"

RnJvbSAyNjE2MDk3NjUxN2RmZWRmOThiMzcwMjYzYzYxZTBiNWQ1YTU2OTVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwNzo1NToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRt
aWRlY29kZTogdXBncmFkZSAzLjQgLT4gMy41CgotLS0KIC4uLi9kbWlkZWNvZGUve2RtaWRlY29k
ZV8zLjQuYmIgPT4gZG1pZGVjb2RlXzMuNS5iYn0gICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbWlkZWNvZGUve2RtaWRlY29kZV8zLjQuYmIgPT4gZG1pZGVjb2RlXzMuNS5i
Yn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG1pZGVjb2RlL2Rt
aWRlY29kZV8zLjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG1pZGVjb2RlL2RtaWRlY29k
ZV8zLjUuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RtaWRlY29kZS9kbWlkZWNvZGVfMy40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZG1pZGVjb2RlL2RtaWRlY29kZV8zLjUuYmIKaW5kZXggYmM3NDEwNDZkZC4uMmUw
NmIyNzA0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RtaWRlY29kZS9kbWlk
ZWNvZGVfMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbWlkZWNvZGUvZG1pZGVj
b2RlXzMuNS5iYgpAQCAtMjAsNSArMjAsNSBAQCBkb19pbnN0YWxsKCkgewogCW9lX3J1bm1ha2Ug
REVTVERJUj0iJHtEfSIgaW5zdGFsbAogfQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDNjYmE4
NTFkODQ2N2M5OTc5Y2NkYmVhYjE5MmViNjYzOGM3ZDNhNjk3ZWJhNWRkYjc3OWRhODgzNzU0MjIx
MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3OWQ3NjczNWVlOGUyNTE5NmUyYTcyMjk2NGNmOTY4
M2Y1YTA5NTgxNTAzNTM3ODg0YjI1NmIwMTM4OWNjMDczIgogCi0tIAoyLjM5LjIKCg==

--===============0412626720115263967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 291068 to 295336 (+1%)
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-dev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-doc: PKGSIZE changed from 29555 to 30266 (+2%)
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-locale: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 235645 to 252624 (+7%)
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode-staticdev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode/dmidecode: PKGSIZE changed from 182732 to 190940 (+4%)
packages/core2-32-poky-linux/dmidecode: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/dmidecode: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/dmidecode: SRC_URI changed from "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.4.tar.xz file://0001-Committing-changes-from-do_unpack_extra.patch" to "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.5.tar.xz file://0001-Committing-changes-from-do_unpack_extra.patch"

--===============0412626720115263967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'dmidecode'
dmidecode was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============0412626720115263967==--

