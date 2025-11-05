Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CABACD4F2C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2362.1762384579487837860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=faBLcmlF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=U8+eX7vf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a564ef6d3-8536d8cb-37be-4696-b255-4bf551977afb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+1ei4//kwiwHQ1/v3KQBL/7eHYchRz97pu6FODMoVEk=;
	b=faBLcmlFQjupXvJHc+bPCMJS5U3UP4fgLmN7Q47IMY/E5LUOUWtFieh3Idg9fEW8
	M++AiB3pmz7kLVzdcE4g2HlUQLo9FOLPVZ+dZsVOhNF2bSBBVcFSQvuarEoSXzx3ktc
	FkKBy8yLqrFfOMOTW2ADXN/K58HxUV/w9jyTSovU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384607;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+1ei4//kwiwHQ1/v3KQBL/7eHYchRz97pu6FODMoVEk=;
	b=U8+eX7vf2mnbC3jkAjU7Z/iLguCY21y960b3H36YlOGQARc2GYmpi7IhmC6jUl7Q
	ZNVplxLDlrctKqIlm+BLMBFDFkJ+wQPfu4Ul3PBd419b5G+Y7NyCQqQgr2aPcuz+VPQ
	iXVNfNOfNXpobzHseVgldyzLvRVmixORgqBOnEfQ=
Content-Type: multipart/mixed; boundary="===============1922337622299603258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.4 SUCCEEDED
Message-ID: <0101019a564ef6d3-8536d8cb-37be-4696-b255-4bf551977afb-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225921

--===============1922337622299603258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.15.3-0.15.4.patch
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

-- >8 --
From 74759f5977112c23b937ef17b3c7bf016dd3badd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 23:08:50 +0000
Subject: [PATCH] liburcu: upgrade 0.15.3 -> 0.15.4

---
 .../liburcu/{liburcu_0.15.3.bb => liburcu_0.15.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.3.bb => liburcu_0.15.4.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.3.bb b/meta/recipes-support/liburcu/liburcu_0.15.4.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.3.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.4.bb
index fdbd79e016..05151a367c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.4.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d"
+SRC_URI[sha256sum] = "11a14a7660ac9ba9c0bbd3b2d81718523d27dc6c8a9dfabd5e401b406673ee3a"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.47.1


--===============1922337622299603258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.15.3-0.15.4.patch"

RnJvbSA3NDc1OWY1OTc3MTEyYzIzYjkzN2VmMTdiM2M3YmYwMTZkZDNiYWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMzowODo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVyY3U6IHVwZ3JhZGUgMC4xNS4zIC0+IDAuMTUuNAoKLS0tCiAuLi4vbGlidXJjdS97bGlidXJj
dV8wLjE1LjMuYmIgPT4gbGlidXJjdV8wLjE1LjQuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ1cmN1L3tsaWJ1cmN1XzAuMTUuMy5iYiA9PiBsaWJ1cmN1XzAuMTUu
NC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xp
YnVyY3VfMC4xNS4zLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAu
MTUuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4xNS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4xNS40LmJiCmluZGV4IGZkYmQ3OWUwMTYuLjA1MTUxYTM2
N2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE1
LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuNC5i
YgpAQCAtMTMsNyArMTMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1k
O21kNT1jMmE5MjQ5OGI2ZTg4ZTI3NmY5ODY4Nzc5OTU0MjViOCBcCiAKIFNSQ19VUkkgPSAiaHR0
cDovL2x0dG5nLm9yZy9maWxlcy91cmN1L3VzZXJzcGFjZS1yY3UtJHtQVn0udGFyLmJ6MiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjI2Njg3ZWM4NGUzZTExNDc1OTQ1NGM4ODRhMDhhYmVhZjc5
ZGVjMDliMDQxODk1ZGRmNGM0NWVjMTUwYWNiNmQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFh
MTRhNzY2MGFjOWJhOWMwYmJkM2IyZDgxNzE4NTIzZDI3ZGM2YzhhOWRmYWJkNWU0MDFiNDA2Njcz
ZWUzYSIKIAogUyA9ICIke1VOUEFDS0RJUn0vdXNlcnNwYWNlLXJjdS0ke1BWfSIKIGluaGVyaXQg
YXV0b3Rvb2xzIG11bHRpbGliX2hlYWRlcgotLSAKMi40Ny4xCgo=

--===============1922337622299603258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/uatomic/builtins-x86.h"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/include/urcu/uatomic/builtins-x86.h was added

--===============1922337622299603258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.15.4.tar.bz2"
packages/x86-64-v3-poky-linux/liburcu: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGSIZE changed from 896768 to 896744 (-0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: FILELIST: added "/usr/include/urcu/uatomic/builtins-x86.h"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 362025 to 364806 (+1%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.15.3" to "0.15.4"
packages/x86-64-v3-poky-linux/liburcu/liburcu: PKGV changed from 0.15.3 [default] to 0.15.4 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu: PV changed from "0.15.3" to "0.15.4"
Changes to packages/x86-64-v3-poky-linux/liburcu (sysroot):
  /usr/include/urcu/uatomic/builtins-x86.h was added

--===============1922337622299603258==--

