Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D4DCCF96F
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.5674.1693650552932763156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Hm42BHTx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=l57S0hhB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a55708d24-8657ec1f-78e1-4918-99d0-54ce63268682-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=87EFgvc78r01oz59K3wIf2AgoPH+ej542BeAb6DkT5U=;
	b=Hm42BHTxoMrYA+c+hEZ/OZochD+zP88rj1ABvPw0oGFstuJ9p0G1IzuJtLH1LhvV
	fSnAX5pkzRy2IV8S7YS8OicXiTMtxhgRNZznxzP7dWx978NeDv8rQtKxGLxQisTRjr8
	qDwHK+RvfqXHn/45XNJSFJnR6wwxFRgNVE5/KlIM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=87EFgvc78r01oz59K3wIf2AgoPH+ej542BeAb6DkT5U=;
	b=l57S0hhBQx3iRub/T7OiiqIy2YlZvC8tDFDbYAIzEYqhSLQE7JBuTL408I6qClAt
	NsSHzsJQ9H+PN0ZzYkLfHbYOIC4nd44tZIapqP3GJEX621NtpiuIX8KbI0jhrz4vr2t
	KyWMmPeTnt62rpK8Xrr3TUBgnwXtq05IpvqvHvWs=
Content-Type: multipart/mixed; boundary="===============6842775614974539481=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pigz: upgrading to 2.8 SUCCEEDED
Message-ID: <0101018a55708d24-8657ec1f-78e1-4918-99d0-54ce63268682-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187096

--===============6842775614974539481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pigz* to *2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pigz-upgrade-2.7-2.8.patch
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
From 30939b9348df7a03ff0002d6af3743e0d6242100 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 20:47:48 +0000
Subject: [PATCH] pigz: upgrade 2.7 -> 2.8

---
 meta/recipes-extended/pigz/{pigz_2.7.bb => pigz_2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pigz/{pigz_2.7.bb => pigz_2.8.bb} (94%)

diff --git a/meta/recipes-extended/pigz/pigz_2.7.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
similarity index 94%
rename from meta/recipes-extended/pigz/pigz_2.7.bb
rename to meta/recipes-extended/pigz/pigz_2.8.bb
index 9a1c591b27..fcf0c93e41 100644
--- a/meta/recipes-extended/pigz/pigz_2.7.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -9,7 +9,7 @@ LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
-SRC_URI[sha256sum] = "b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707"
+SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
 PROVIDES:class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
-- 
2.39.2


--===============6842775614974539481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pigz: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz: SRC_URI changed from "http://zlib.net/pigz/fossils/pigz-2.7.tar.gz" to "http://zlib.net/pigz/fossils/pigz-2.8.tar.gz"
packages/core2-32-poky-linux/pigz: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-dbg: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-dbg: PKGSIZE changed from 273688 to 274620 (+0%)
packages/core2-32-poky-linux/pigz/pigz-dbg: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-dev: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-dev: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-doc: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-doc: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-locale: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-locale: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-src: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-src: PKGSIZE changed from 361519 to 361771 (+0%)
packages/core2-32-poky-linux/pigz/pigz-src: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz-staticdev: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz-staticdev: PKGV changed from 2.7 [default] to 2.8 [default]
packages/core2-32-poky-linux/pigz/pigz: PV changed from "2.7" to "2.8"
packages/core2-32-poky-linux/pigz/pigz: PKGV changed from 2.7 [default] to 2.8 [default]

--===============6842775614974539481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-pigz-upgrade-2.7-2.8.patch"

RnJvbSAzMDkzOWI5MzQ4ZGY3YTAzZmYwMDAyZDZhZjM3NDNlMGQ2MjQyMTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMDo0Nzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z3o6IHVwZ3JhZGUgMi43IC0+IDIuOAoKLS0tCiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGlnei97
cGlnel8yLjcuYmIgPT4gcGlnel8yLjguYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Bp
Z3ove3BpZ3pfMi43LmJiID0+IHBpZ3pfMi44LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9waWd6L3BpZ3pfMi43LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3BpZ3ovcGlnel8yLjguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3BpZ3ovcGlnel8yLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1l
eHRlbmRlZC9waWd6L3BpZ3pfMi44LmJiCmluZGV4IDlhMWM1OTFiMjcuLmZjZjBjOTNlNDEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9waWd6L3BpZ3pfMi43LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9waWd6L3BpZ3pfMi44LmJiCkBAIC05LDcgKzksNyBAQCBMSUNF
TlNFID0gIlpsaWIgJiBBcGFjaGUtMi4wIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vcGln
ei5jO21kNT05YWU2ZGVlOGNlYmE5NjEwNTk2ZWQwYWRhNDkzZDE0MjtiZWdpbmxpbmU9NztlbmRs
aW5lPTIxIgogCiBTUkNfVVJJID0gImh0dHA6Ly96bGliLm5ldC8ke0JQTn0vZm9zc2lscy8ke0JQ
fS50YXIuZ3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjRjOWU2MDM0NGEwOGQ1ZGIzN2NhN2Fk
MDBhNWIyYzc2Y2NiOTU1NjM1NGI3MjJkNTZkNTVjYTdlOGIxYzcwNyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJlYjg3MmI0ZjBlMWYwZWJlNTljOWY3YmQ4YzUwNmM0MjA0ODkzYmE2YTg0OTJkZTMx
ZGY0MTZmMGQ1MTcwZmQwIgogUFJPVklERVM6Y2xhc3MtbmF0aXZlICs9ICJnemlwLW5hdGl2ZSIK
IAogIyBQb2ludCB0aGlzIGF0IHRoZSBob21lcGFnZSBpbiBjYXNlIC9mb3NzaWxzLyBpc24ndCB1
cGRhdGVkCi0tIAoyLjM5LjIKCg==

--===============6842775614974539481==--

