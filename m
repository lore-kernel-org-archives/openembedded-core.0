Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64488C64E78
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.856.1667349632279043740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n1k7fgZE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018435c85be4-9423db5c-a0be-458c-92ca-ff4447e8dc2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=g4OkEz24RE9GJQXQ8BXQBVWER2W8eqHTg8tcxnFKZXY=;
	b=n1k7fgZE1u4EKhLY3WNwyGXq35W0rRkwTOgCQiAlkGQvrtF5khTTqijbDiyZ6fBg
	AF4UPc7nDq+vKeg/JsDnYz4TScu1LMzNAN4aR2oA975QdUchiSk7MD6GhGtMHlTi++j
	M8MzosXa/n/2f6spz31Y6AkFsphL/YAfwnuYmQzM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=g4OkEz24RE9GJQXQ8BXQBVWER2W8eqHTg8tcxnFKZXY=;
	b=fC7tM3ICCMu178qPxb1589a+516r1hHfYQZhD9sX+z95hpaNqHNZG/UYpqI0YRCl
	nftS5lVC2v6D1761BNPGc4EkHAcuddjdAht94qvP/GZXKvXErYTmUdt0xN6uZXnAjwt
	6He14I/BEVFmR047WEyQ1yi3/Qv1NPfynnZ+9Z0w=
Content-Type: multipart/mixed; boundary="===============7227141666817969864=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libidn2: upgrading to 2.3.4 SUCCEEDED
Message-ID: <0101018435c85be4-9423db5c-a0be-458c-92ca-ff4447e8dc2c-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172449

--===============7227141666817969864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libidn2* to *2.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libidn2-upgrade-2.3.3-2.3.4.patch
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
--===============7227141666817969864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libidn2: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2: PACKAGES: added "libidn2-locale-ko"
packages/core2-32-poky-linux/libidn2: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2: SRC_URI changed from "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.3.tar.gz" to "https://ftp.gnu.org/gnu/libidn/libidn2-2.3.4.tar.gz"
packages/core2-32-poky-linux/libidn2/libidn2-bin: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-bin: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-dbg: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-dbg: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-dbg: PKGSIZE changed from 223488 to 271932 (+22%)
packages/core2-32-poky-linux/libidn2/libidn2-dev: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-dev: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-doc: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-doc: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-doc: PKGSIZE changed from 80110 to 80113 (+0%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-cs: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-cs: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-cs: PKGSIZE changed from 6554 to 6694 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-da: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-da: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-de: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-de: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-de: PKGSIZE changed from 6750 to 6883 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-eo: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-eo: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-eo: PKGSIZE changed from 6353 to 6492 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-es: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-es: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-es: PKGSIZE changed from 6707 to 6854 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-fi: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-fi: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-fr: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-fr: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-fr: PKGSIZE changed from 6682 to 6812 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-fur: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-fur: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-hr: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-hr: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-hu: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-hu: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-id: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-id: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-it: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-it: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-ja: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-ja: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-ka: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-ka: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-nl: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-nl: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-nl: PKGSIZE changed from 6482 to 6606 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-pl: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-pl: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-pl: PKGSIZE changed from 6574 to 6722 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-pt-br: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-pt-br: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-ro: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-ro: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-ro: PKGSIZE changed from 6710 to 6851 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-ru: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-ru: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-ru: PKGSIZE changed from 6292 to 8305 (+32%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-sr: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-sr: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-sr: PKGSIZE changed from 7869 to 8041 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-sv: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-sv: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-sv: PKGSIZE changed from 6384 to 6511 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-uk: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-uk: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-uk: PKGSIZE changed from 8243 to 8398 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-vi: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-vi: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-zh-cn: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-locale-zh-cn: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-locale-zh-cn: PKGSIZE changed from 6210 to 6322 (+2%)
packages/core2-32-poky-linux/libidn2/libidn2-src: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-src: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2-src: PKGSIZE changed from 1279727 to 1875647 (+47%)
packages/core2-32-poky-linux/libidn2/libidn2-src: FILELIST: directory renamed /usr/src/debug/libidn2/2.3.3-r0/gl -> /usr/src/debug/libidn2/2.3.4-r0/gl, directory renamed /usr/src/debug/libidn2/2.3.3-r0/src -> /usr/src/debug/libidn2/2.3.4-r0/src, directory renamed /usr/src/debug/libidn2/2.3.3-r0/lib -> /usr/src/debug/libidn2/2.3.4-r0/lib, directory renamed /usr/src/debug/libidn2/2.3.3-r0/unistring -> /usr/src/debug/libidn2/2.3.4-r0/unistring, removed "/usr/src/debug/libidn2/2.3.3-r0/unistring/uninorm/decomposition-table1.h /usr/src/debug/libidn2/2.3.3-r0/unistring/uninorm/decomposition-table2.h /usr/src/debug/libidn2/2.3.3-r0/unistring/uninorm/decompose-internal.h", added "/usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/scripts_byname.gperf /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/decomposition-table2.h /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/canonical-decomposition.c /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/categ_of.c /usr/src/debug/libidn2/2.3.4-r0/un
 istring/uninorm/decompose-internal.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/combiningclass.c /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/joiningtype_of.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/joiningtype_of.c /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/bidi_of.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/categ_M.h /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/normalize-internal.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/combiningclass.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/scripts.c /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/decomposition-table.h /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/decomposition-table1.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/scripts.h /usr/src/debug/libidn2/2.3.4-r0/unistring/uninorm/u-normalize-internal.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/categ_of.h /usr/src/debug/libidn2/2.3.4-r0/unistring/unictype/bidi_of.c"
packages/core2-32-poky-linux/libidn2/libidn2-staticdev: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2-staticdev: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2: PV changed from "2.3.3" to "2.3.4"
packages/core2-32-poky-linux/libidn2/libidn2: PKGV changed from 2.3.3 [default] to 2.3.4 [default]
packages/core2-32-poky-linux/libidn2/libidn2: PKGSIZE changed from 210436 to 329220 (+56%)

--===============7227141666817969864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libidn2: PACKAGES: added "libidn2-locale-ko"
packages/core2-32-poky-linux/libidn2/libidn2-dbg: PKGSIZE changed from 223488 to 271932 (+22%)
packages/core2-32-poky-linux/libidn2/libidn2-locale-ru: PKGSIZE changed from 6292 to 8305 (+32%)
packages/core2-32-poky-linux/libidn2/libidn2-src: PKGSIZE changed from 1279727 to 1875647 (+47%)
packages/core2-32-poky-linux/libidn2/libidn2: PKGSIZE changed from 210436 to 329220 (+56%)

--===============7227141666817969864==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libidn2-upgrade-2.3.3-2.3.4.patch"

RnJvbSA5ZjBkODZlMDczMjRmYWViZjlhZjNjMjdiZWZiOGZmNTdlMDk3ZDA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMjo0NTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmlkbjI6IHVwZ3JhZGUgMi4zLjMgLT4gMi4zLjQKCi0tLQogLi4uL2xpYmlkbi97bGliaWRuMl8y
LjMuMy5iYiA9PiBsaWJpZG4yXzIuMy40LmJifSAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2xpYmlkbi97bGliaWRuMl8yLjMuMy5iYiA9PiBsaWJpZG4yXzIuMy40LmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJpZG4vbGliaWRu
Ml8yLjMuMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJpZG4vbGliaWRuMl8yLjMuNC5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bGliaWRuL2xpYmlkbjJfMi4zLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWJpZG4vbGliaWRuMl8yLjMuNC5iYgppbmRleCBhODZiMmI1YThkLi5iNDhkZTM5ZmEwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliaWRuL2xpYmlkbjJfMi4zLjMuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmlkbi9saWJpZG4yXzIuMy40LmJiCkBAIC0xMiw3
ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJkODM0ZWE3
ZDQ4MDQzOGFkYTA0ZTVkODQ2MTUyMzk1IFwKICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNf
VVJJID0gIiR7R05VX01JUlJPUn0vbGliaWRuLyR7QlBOfS0ke1BWfS50YXIuZ3oiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZjNhYzk4NzUyMmMwMGQzM2Q0NGIzMjNjYWU0MjRlMmNmZmNiNGM2M2M2
YWE2Y2QxMzc2ZWRhY2JmMWMzNmViMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5M2NhYmE3MmI0
ZTA1MWQxZjhkNGY1YTA3NmFiNjNjOTliNzdmYWVlMDE5YjcyYjk3ODNiMjY3OTg2ZGJiNDVmIgog
CiBERVBFTkRTID0gInZpcnR1YWwvbGliaWNvbnYgbGlidW5pc3RyaW5nIgogCi0tIAoyLjMxLjEK
Cg==

--===============7227141666817969864==--

