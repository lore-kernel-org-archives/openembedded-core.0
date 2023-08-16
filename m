Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D0FC3DA61
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.174022.1692224342707034216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EKFkL/LS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HZb/nWd5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a006e45c4-2563ea13-d69a-47a6-baab-e990401b89e9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mql8dOqNS/dF0++Q4VRuPWSm3Ax+j5J53lPP9Sb1OdE=;
	b=EKFkL/LSAwLPOhrfO719yPYBDlt+LR9aoHcXharRrypDHSdckw86kk6mFA0gaZbO
	f1XKGNg4yHEjt71qTb/t3S8s6ajo6XV3co182f5QJDIhCOhk2SUzelxXVKWfEdxXTzF
	d3vmE+DxWFp7OT70X6dPmz3Bxjha3FdZhiAqwn5M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224341;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mql8dOqNS/dF0++Q4VRuPWSm3Ax+j5J53lPP9Sb1OdE=;
	b=HZb/nWd5zH4SnKIy0Vp2+SQ4Z6FG8Xspr09FZOBZXVESVwdhmOtStZfPWFSJ9N0h
	7O/PwGXJ+ziAuvR59pTZ2bmG++9edFGux7e1pUxHcRG6uO2JdgppioT7xXUQPxo38n7
	b7aKl7XKNkDC2vWd89YhIJ+Ghv2hMAYqA15ZG5V4=
Content-Type: multipart/mixed; boundary="===============0266221404620283304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 3.1.2 SUCCEEDED
Message-ID: <0101018a006e45c4-2563ea13-d69a-47a6-baab-e990401b89e9-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186155

--===============0266221404620283304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssl* to *3.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-3.1.1-3.1.2.patch
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
From 54278bdf399ab31db583d42adb7cff4c6d3b3bc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 00:10:15 +0000
Subject: [PATCH] openssl: upgrade 3.1.1 -> 3.1.2

---
 .../openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.2.bb
index c2a7173c84..817bfedee1 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b3aa61334233b852b63ddb048df181177c2c659eb9d4376008118f9c08d07674"
+SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.39.2


--===============0266221404620283304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssl: SRC_URI changed from "http://www.openssl.org/source/openssl-3.1.1.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://fix_random_labels.patch" to "http://www.openssl.org/source/openssl-3.1.2.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://fix_random_labels.patch"
packages/core2-32-poky-linux/openssl: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/libcrypto: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/libcrypto: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/libssl: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/libssl: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-bin: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-bin: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-conf: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-conf: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 574771872 to 575061340 (+0%)
packages/core2-32-poky-linux/openssl/openssl-dbg: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-dbg: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-dev: PKGSIZE changed from 1968123 to 1968293 (+0%)
packages/core2-32-poky-linux/openssl/openssl-dev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-dev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-doc: PKGSIZE changed from 14182136 to 14190965 (+0%)
packages/core2-32-poky-linux/openssl/openssl-doc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-doc: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-engines: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-engines: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-locale: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-locale: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-misc: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-misc: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-ossl-module-legacy: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-ossl-module-legacy: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/certs/sm2-pub.key /usr/lib/openssl/ptest/test/recipes/90-test_store_cases.t /usr/lib/openssl/ptest/test/recipes/90-test_store_cases_data/garbage-pkcs12.p12"
packages/core2-32-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 311257276 to 311405153 (+0%)
packages/core2-32-poky-linux/openssl/openssl-ptest: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-ptest: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-src: PKGSIZE changed from 21706081 to 21718325 (+0%)
packages/core2-32-poky-linux/openssl/openssl-src: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-src: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 18699418 to 18712560 (+0%)
packages/core2-32-poky-linux/openssl/openssl-staticdev: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl-staticdev: PV changed from "3.1.1" to "3.1.2"
packages/core2-32-poky-linux/openssl/openssl: PKGV changed from 3.1.1 [default] to 3.1.2 [default]
packages/core2-32-poky-linux/openssl/openssl: PV changed from "3.1.1" to "3.1.2"

--===============0266221404620283304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-3.1.1-3.1.2.patch"

RnJvbSA1NDI3OGJkZjM5OWFiMzFkYjU4M2Q0MmFkYjdjZmY0YzZkM2IzYmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDA6MTA6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NsOiB1cGdyYWRlIDMuMS4xIC0+IDMuMS4yCgotLS0KIC4uLi9vcGVuc3NsL3tvcGVuc3Ns
XzMuMS4xLmJiID0+IG9wZW5zc2xfMy4xLjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC97b3BlbnNzbF8zLjEuMS5iYiA9PiBvcGVuc3NsXzMu
MS4yLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsXzMuMS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3Ns
L29wZW5zc2xfMy4xLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy4xLjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4yLmJiCmluZGV4IGMy
YTcxNzNjODQuLjgxN2JmZWRlZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvb3BlbnNzbC9vcGVuc3NsXzMuMS4yLmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQu
ZC1vcGVuc3NsLnNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjNh
YTYxMzM0MjMzYjg1MmI2M2RkYjA0OGRmMTgxMTc3YzJjNjU5ZWI5ZDQzNzYwMDgxMThmOWMwOGQw
NzY3NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMGNlNjliOGI5N2VhNmEzNWI5Njg3NTIzNWFh
NDUzYjk2NmJhM2NiYThhZjJkZTIzNjU3ZDhiNjc2N2Q2NTM5IgogCiBpbmhlcml0IGxpYl9wYWNr
YWdlIG11bHRpbGliX2hlYWRlciBtdWx0aWxpYl9zY3JpcHQgcHRlc3QgcGVybG5hdGl2ZQogTVVM
VElMSUJfU0NSSVBUUyA9ICIke1BOfS1iaW46JHtiaW5kaXJ9L2NfcmVoYXNoIgotLSAKMi4zOS4y
Cgo=

--===============0266221404620283304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/certs/sm2-pub.key /usr/lib/openssl/ptest/test/recipes/90-test_store_cases.t /usr/lib/openssl/ptest/test/recipes/90-test_store_cases_data/garbage-pkcs12.p12"

--===============0266221404620283304==--

