Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97D2CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3763.1684186747398878690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XxqNpWKN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a4e99-40ef17a3-c9a5-4a74-8792-b19800609b22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v7RQswUkaokoNZqJYwc9Aao2Boa3V9+xZNQVvNO1/2g=;
	b=XxqNpWKNCm2VoFBmo8xkFWl9z3SPJpaFOOvXdu3tZ5SCS7ims77OayjoGFq+T0jE
	wWzH2PFOyIb4jM4n1HHzsIRmxLKTATyKZYmnkJB9bTDUuFFm5A9Mruc0LUFgJC6glN3
	QJHKYCP0WfBuBoADDAgu5wv7sND09SLGjOwwWTfA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186746;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v7RQswUkaokoNZqJYwc9Aao2Boa3V9+xZNQVvNO1/2g=;
	b=llJY1hkvgSbDD0PW1Xq54S105A5wJq+8yg8TVWYe9YaMNKRiX/3kb4D1UIMVT6VG
	R7SEZ5dJOM0wx2UqN/qcY1NJyxI1cBJpCHq4RJHu5k3AX3ZXPEDE2tMiu4ZMz1bT9bZ
	W8giLJGDJ7lu06npMjuwvwQUiE7H9ZoAkj1nL/Yo=
Content-Type: multipart/mixed; boundary="===============3684599534204191285=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libmodulemd: upgrading to 2.15.0 SUCCEEDED
Message-ID: <01010188215a4e99-40ef17a3-c9a5-4a74-8792-b19800609b22-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181297

--===============3684599534204191285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libmodulemd* to *2.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libmodulemd-upgrade-2.14.0-2.15.0.patch
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
--===============3684599534204191285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libmodulemd: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGSIZE changed from 1258768 to 1263168 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dbg: FILELIST: removed "/usr/lib/.debug/libmodulemd.so.2.14.0", added "/usr/lib/.debug/libmodulemd.so.2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGSIZE changed from 991847 to 994291 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-dev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-doc: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-locale: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGSIZE changed from 1210796 to 1223091 (+1%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd-src: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd-staticdev: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PV changed from "2.14.0" to "2.15.0"
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGSIZE changed from 679125 to 679213 (+0%)
packages/core2-32-poky-linux/libmodulemd/libmodulemd: PKGV changed from 2.14.0 [default] to 2.15.0 [default]
packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.14.0", added "/usr/lib/libmodulemd.so.2.15.0"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.14.0 to libmodulemd.so.2.15.0
  /usr/lib/libmodulemd.so.2.14.0 moved to /usr/lib/libmodulemd.so.2.15.0

--===============3684599534204191285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libmodulemd/libmodulemd: FILELIST: removed "/usr/lib/libmodulemd.so.2.14.0", added "/usr/lib/libmodulemd.so.2.15.0"
Changes to packages/core2-32-poky-linux/libmodulemd (sysroot):
  /usr/lib/libmodulemd.so.2 changed symlink target from libmodulemd.so.2.14.0 to libmodulemd.so.2.15.0
  /usr/lib/libmodulemd.so.2.14.0 moved to /usr/lib/libmodulemd.so.2.15.0

--===============3684599534204191285==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libmodulemd-upgrade-2.14.0-2.15.0.patch"

RnJvbSBhNGYzYzMxZGI4MTAyMjY1YWY3ZTRiZWNkN2Y4MzExOGQ5NzBjNDViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDk6MjI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJtb2R1bGVtZDogdXBncmFkZSAyLjE0LjAgLT4gMi4xNS4wCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYm1vZHVsZW1kL2xpYm1vZHVsZW1kX2dpdC5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9saWJtb2R1bGVtZC9saWJtb2R1bGVtZF9naXQuYmIKaW5kZXggOWUz
MjEzNDYyOC4uZDNiZWY4MzMwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
Ym1vZHVsZW1kL2xpYm1vZHVsZW1kX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGlibW9kdWxlbWQvbGlibW9kdWxlbWRfZ2l0LmJiCkBAIC02LDggKzYsOCBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yNWEzOTI3YmZmM2VlNGY1YjIxYmNiMGVkM2Zj
ZDZiYiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2ZlZG9yYS1tb2R1bGFyaXR5L2xp
Ym1vZHVsZW1kO3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgogCi1QViA9ICIyLjE0LjAiCi1T
UkNSRVYgPSAiZWU4MDMwOWJjNzY2ZDc4MWExNDRlNjg3OTQxOWIyOWY0NDRkOTRlYiIKK1BWID0g
IjIuMTUuMCIKK1NSQ1JFViA9ICJiZmRlN2YyZDA0ZmJiMjJlMjZjOWViODQzZTRjY2M0Nzg3NjJk
ZDhkIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3684599534204191285==--

