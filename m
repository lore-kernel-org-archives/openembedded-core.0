Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32721E6527B
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29203.1769951582869825905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AmGA/WdF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rWLWa4lw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c1955d6f5-5e4f9f78-3b30-418b-b722-ee7c1fcf77e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q6uYY5kkRVEAk8fqERi91sJP/2+2J3IdAPv0A7HXxWw=;
	b=AmGA/WdFAZYoSj3lSZqiqWMY7bEhZOVpcAjS/VDA8QPC8d6WRhW+olIZEJXszaxM
	wHxgcI/uHleEgyW5YqKpsm1HmVzK2XNJmnh/8BzdiMwizDcTQ+nSAoDtO04wVGb1Kci
	Eh2q8Kvpnvs4z7B+D1EZdhduhGV1Uq6NvwYzWWf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q6uYY5kkRVEAk8fqERi91sJP/2+2J3IdAPv0A7HXxWw=;
	b=rWLWa4lwuFJdODHhYbJdE2qA/oxfLAD5FaKBGPLuu5b+01LFiLcrB9bg3xmxqKrl
	PEV5cWfCe4r0uOC8SIl+obD0cLEzthv5BkmcG5LHNIbhTeL5JM505qqxJUacg5kscuL
	4kE3le+/QsXU1k6YKJg0CYDmtts9Y4dsX2baNMd8=
Content-Type: multipart/mixed; boundary="===============8196155804219330952=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.0.9 SUCCEEDED
Message-ID: <0101019c1955d6f5-5e4f9f78-3b30-418b-b722-ee7c1fcf77e1-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:13:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230334

--===============8196155804219330952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.8-4.0.9.patch
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
From 5456179028781ea4d49efd3bd5997349cf1b04e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 13:09:52 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.8 -> 4.0.9

---
 .../recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.8.bb => utfcpp_4.0.9.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
index 628e8ee0ce..55780b1c7c 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
+SRCREV = "63d64de49fd6b829f7c8694df5ab2ee625cb7134"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============8196155804219330952==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.8-4.0.9.patch"

RnJvbSA1NDU2MTc5MDI4NzgxZWE0ZDQ5ZWZkM2JkNTk5NzM0OWNmMWIwNGUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMzowOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
ZmNwcDogdXBncmFkZSA0LjAuOCAtPiA0LjAuOQoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3V0
ZmNwcC97dXRmY3BwXzQuMC44LmJiID0+IHV0ZmNwcF80LjAuOS5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjAuOC5iYiA9PiB1dGZjcHBfNC4wLjkuYmJ9ICg5
NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAu
OC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4wLjkuYmIKc2ltaWxh
cml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0
ZmNwcF80LjAuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNw
cF80LjAuOS5iYgppbmRleCA2MjhlOGVlMGNlLi41NTc4MGIxYzdjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC44LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4wLjkuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQyMjRjY2FlY2IxNGQ5NDJjNzFkMzFi
ZWYyMGQ3OGMgXAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL25lbXRyaWYvdXRmY3BwO3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QiCiAKLVNSQ1JFViA9ICJmOTMxOTE5NWRmZGRmMzY5ZjY4ZjE4ZTdjMDAzOWIz
ZjM1MTc5N2ZkIgorU1JDUkVWID0gIjYzZDY0ZGU0OWZkNmI4MjlmN2M4Njk0ZGY1YWIyZWU2MjVj
YjcxMzQiCiAKIGluaGVyaXQgY21ha2UgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============8196155804219330952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.8 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.0.9 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 2545496 to 2545152 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 61252 to 61021 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.0.8/tests -> /usr/src/debug/utfcpp/4.0.9/tests, directory renamed /usr/src/debug/utfcpp/4.0.8/source/utf8 -> /usr/src/debug/utfcpp/4.0.9/source/utf8
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 86983 to 86752 (-0%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.0.8" to "4.0.9"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.0.8 [default] to 4.0.9 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.0.8" to "4.0.9"

--===============8196155804219330952==--

