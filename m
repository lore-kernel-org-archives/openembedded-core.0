Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D014C64E76
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5319.1668517535257945753
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SGmccHy2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101847b6520cf-78171424-cd76-436c-af86-ce0dfff3ae78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v9hI2j/lrEsggAw+u+dA62DAdcE9WD7hA0lsz5fF5EI=;
	b=SGmccHy20WCFVk4wLBvV0fSsD5JbpI/ztBoeuIhud4tSZr5R1zM7QaOqbO/IKYck
	A7P3bojDHTef6FQqYL+YxDMkpWR3Ug6WhEEzB25U30b9YSFPu4ZsDePso3L3pLLIlEl
	N/11+leH6mvP8LAdiD/yAAqNuW416pEgLtv5kWjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v9hI2j/lrEsggAw+u+dA62DAdcE9WD7hA0lsz5fF5EI=;
	b=Q26sofYtInoQ0H50cxCfZeWhvhDysk9ICaKmEn4GW/+1QvsXBXZDYQihMU9LjyR9
	jNzUqs1ECjlqz+dUPOTr+XDK4KVlNngJgVD9jCG4yhxwIgz09NpmKN5rtI8m+T15jPH
	Nb4F+JSkN80OYwW6zLsxOurksj/As4ou77BAm1jY=
Content-Type: multipart/mixed; boundary="===============8603719554673200665=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libpipeline: upgrading to 1.5.7 SUCCEEDED
Message-ID: <010101847b6520cf-78171424-cd76-436c-af86-ce0dfff3ae78-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173302

--===============8603719554673200665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpipeline* to *1.5.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpipeline-upgrade-1.5.6-1.5.7.patch
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
--===============8603719554673200665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.6", added "/usr/lib/libpipeline.so.1.5.7"
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.6 to libpipeline.so.1.5.7
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.6 to libpipeline.so.1.5.7
  /usr/lib/libpipeline.so.1.5.6 moved to /usr/lib/libpipeline.so.1.5.7

--===============8603719554673200665==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpipeline-upgrade-1.5.6-1.5.7.patch"

RnJvbSA1MzZjOTFjNDdjNWI4NTk2NzEwOWQ0YjIyM2ZmZjFhM2E2ZDFiM2YwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDg6MjE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwaXBlbGluZTogdXBncmFkZSAxLjUuNiAtPiAxLjUuNwoKLS0tCiAuLi4vbGlicGlwZWxpbmUv
e2xpYnBpcGVsaW5lXzEuNS42LmJiID0+IGxpYnBpcGVsaW5lXzEuNS43LmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlicGlwZWxpbmUve2xpYnBpcGVsaW5lXzEuNS42LmJiID0+IGxp
YnBpcGVsaW5lXzEuNS43LmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJwaXBlbGluZS9saWJwaXBlbGluZV8xLjUuNi5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9saWJwaXBlbGluZS9saWJwaXBlbGluZV8xLjUuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDg1
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlicGlwZWxpbmUvbGlicGlwZWxp
bmVfMS41LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJwaXBlbGluZS9s
aWJwaXBlbGluZV8xLjUuNy5iYgppbmRleCA3MDA3NjA4YTM5Li43M2M3YWFhYTkxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlicGlwZWxpbmUvbGlicGlwZWxpbmVfMS41LjYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnBpcGVsaW5lL2xpYnBpcGVsaW5lXzEu
NS43LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNFTlNFID0gIkdQTC0zLjAtb25seSIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTFlYmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRl
NDQwNDY0IgogCiBTUkNfVVJJID0gIiR7U0FWQU5OQUhfR05VX01JUlJPUn0vbGlicGlwZWxpbmUv
bGlicGlwZWxpbmUtJHtQVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwZmJiOWU3
ZGMzOTg1MjhlNWYzYTc3NmFmNTdiYjI4Y2EzZmU1ZDlmMGNkOGE5NjFhYzZjZWJmZTZlOWI3OTci
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjhiNDUxOTQ5ODkwMjJhNzllYzEzMTdmNjRhMmE3NWIx
NTUxYjJhNTViZWEwNmY2NzcwNGNiMmEyZTQ2OTBiMCIKIAogaW5oZXJpdCBwa2djb25maWcgYXV0
b3Rvb2xzCiAKLS0gCjIuMzEuMQoK

--===============8603719554673200665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libpipeline: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline: SRC_URI changed from "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.6.tar.gz" to "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.7.tar.gz"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: FILELIST: removed "/usr/lib/.debug/libpipeline.so.1.5.6", added "/usr/lib/.debug/libpipeline.so.1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-dbg: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-dev: PKGSIZE changed from 19330 to 19341 (+0%)
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-doc: PKGSIZE changed from 25226 to 25412 (+1%)
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-locale: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-src: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline-staticdev: PV changed from "1.5.6" to "1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline: PKGV changed from 1.5.6 [default] to 1.5.7 [default]
packages/core2-32-poky-linux/libpipeline/libpipeline: FILELIST: removed "/usr/lib/libpipeline.so.1.5.6", added "/usr/lib/libpipeline.so.1.5.7"
packages/core2-32-poky-linux/libpipeline/libpipeline: PV changed from "1.5.6" to "1.5.7"
Changes to packages/core2-32-poky-linux/libpipeline (sysroot):
  /usr/lib/libpipeline.so.1 changed symlink target from libpipeline.so.1.5.6 to libpipeline.so.1.5.7
  /usr/lib/libpipeline.so changed symlink target from libpipeline.so.1.5.6 to libpipeline.so.1.5.7
  /usr/lib/libpipeline.so.1.5.6 moved to /usr/lib/libpipeline.so.1.5.7

--===============8603719554673200665==--

