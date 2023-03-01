Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3323C83003
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.24026.1677681915154836569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nsm9Ibil;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101869da2759a-e542b508-cd51-4ef9-b4ac-51c9e668196a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dMenNaxPL1HcCSAQkFeMKyW3JSTGec3F8hLTlxqF5Ug=;
	b=Nsm9IbilYJnltMY2UyGiCBXDfRNRnkv+txjMJRfrGhmAHzHqlxWUK+XP8kq1R6XY
	TCMb2U/9w9p2r+qPHBwvtx2LYfLgSJgGHf8tnzFxZR3XeBC+IR09QqSYnAF8Zrl4jA6
	7/9sYEu2Cq+OH00XlopEA10zM9xB13Haek5lJsrA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dMenNaxPL1HcCSAQkFeMKyW3JSTGec3F8hLTlxqF5Ug=;
	b=KjlVcY68Rp9IeikXjCxfux6YZ+mAeq2fOPQp/x6lJ+bqcL3t01WK12CIIw9T+9Sn
	Sdj4Y0+rg362HQlp5xE+ZKW2M9BH9IC2OXywNi8lbisOv3UWJgjJIdZQ3A5AwdL7tox
	iZm4mrC1Olc2doQCus7acn44XhVDpXxsGBg3wuoA=
Content-Type: multipart/mixed; boundary="===============1018432084361960782=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.70.3 SUCCEEDED
Message-ID: <010101869da2759a-e542b508-cd51-4ef9-b4ac-51c9e668196a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177923

--===============1018432084361960782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.70.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.70.2-0.70.3.patch
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
--===============1018432084361960782==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.70.2-0.70.3.patch"

RnJvbSA4MTIzYTQ0NGU1NjJiMTE2Njk1MWI2ZmQ0ZjQyMzNhYzA1ZGFlM2JhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDo0NToxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjcwLjIgLT4gMC43MC4zCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS97dnRlXzAuNzAuMi5iYiA9PiB2dGVfMC43MC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS97dnRlXzAuNzAuMi5iYiA9PiB2dGVfMC43MC4zLmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4yLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdnRlL3Z0ZV8wLjcwLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjcwLjIuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4zLmJiCmluZGV4IGVjMmZiMWY1MjIuLjU4Y2Vl
ODdlOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4yLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4zLmJiCkBAIC0yMSw3ICsy
MSw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB1cHN0cmVh
bS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyCiAKICMgdmFwaWdlbi5tNCBpcyByZXF1aXJl
ZCB3aGVuIHZhbGEgaXMgbm90IHByZXNlbnQgKGJ1dCB0aGUgb25lIGZyb20gdmFsYSBzaG91bGQg
YmUgdXNlZCBub3JtYWxseSkKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjRkMTViNDM4MGRlM2Y1NjRkNTdlYWJkMDA2Mzg5YzQwN2M3MDVkZjViMGM3MDAz
MGZkY2MyNDk3MWEzMzRkODAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI5NDU3MTM0
YTAyZjMxNTdmY2EwNGY3ZTBkMzliZGIwZjMwOTliZTBhM2NlODJiNzEzOWQwYzk4YTgwNzQ4ZjIz
IgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAot
LSAKMi4zOS4yCgo=

--===============1018432084361960782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.70/vte-0.70.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.70/vte-0.70.3.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7000.2", added "/usr/lib/libvte-2.91.so.0.7000.3"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7000.2 to libvte-2.91.so.0.7000.3
  /usr/lib/libvte-2.91.so.0.7000.2 moved to /usr/lib/libvte-2.91.so.0.7000.3
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 6361320 to 6362076 (+0%)
packages/core2-32-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7000.2", added "/usr/lib/.debug/libvte-2.91.so.0.7000.3"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ab: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ab: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2197632 to 2200091 (+0%)
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.70.2 [default] to 0.70.3 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.70.2" to "0.70.3"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.70.2 [default] to 0.70.3 [default]

--===============1018432084361960782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7000.2", added "/usr/lib/libvte-2.91.so.0.7000.3"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7000.2 to libvte-2.91.so.0.7000.3
  /usr/lib/libvte-2.91.so.0.7000.2 moved to /usr/lib/libvte-2.91.so.0.7000.3

--===============1018432084361960782==--

