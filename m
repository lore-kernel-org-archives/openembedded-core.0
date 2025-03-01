Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B89C36010
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.7164.1740828318892089703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ZB9tbSm4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=luVh+aZo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019551744a0b-60176d65-b6a7-4279-9481-e544bce1e4a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/PHHfRtXZheOz2YiZeEiKKoN5Jud1FPzmNhjjRVzodQ=;
	b=ZB9tbSm4CzyelzmjrrLl1Ty4eaS1YwtMYugt7YSQOn/2kjQtFwyrSMW8VmdjXcG3
	DxLEp8CHFLIaEqJzN14su8SoxO96Abi0/Hwe4PPXauTaLnAQdFSemC3fi5EWzzT7aK/
	BVkz+mY+1sCy7JED977h9IKY+OstJ1LxOEFR/cqE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/PHHfRtXZheOz2YiZeEiKKoN5Jud1FPzmNhjjRVzodQ=;
	b=luVh+aZo3Hcfu5LQHcK3OfGhdos2ESKnhkSW5/vW2prAIz+6/OWs6DNbfSedjcQV
	2B5h9RauKHmGrJBUGadSEb+wFD93OQ4DIJAqpYjGb32Ax3SjkySIRlGp7Grmj2WP9tE
	OJ4Gi9TrSiWyodVChFTqX2T/zPwVFsNJw5b1h5Tc=
Content-Type: multipart/mixed; boundary="===============6292976423034276771=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] minicom: upgrading to 2.10 SUCCEEDED
Message-ID: <0101019551744a0b-60176d65-b6a7-4279-9481-e544bce1e4a1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212141

--===============6292976423034276771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *minicom* to *2.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-minicom-upgrade-2.9-2.10.patch
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
From e17b71ce2ae50f2d7684e930e1788a96139f3407 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 08:55:22 +0000
Subject: [PATCH] minicom: upgrade 2.9 -> 2.10

---
 .../minicom/{minicom_2.9.bb => minicom_2.10.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/minicom/{minicom_2.9.bb => minicom_2.10.bb} (90%)

diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb b/meta/recipes-extended/minicom/minicom_2.10.bb
similarity index 90%
rename from meta/recipes-extended/minicom/minicom_2.9.bb
rename to meta/recipes-extended/minicom/minicom_2.10.bb
index 907d5c79c9..20ce5662c2 100644
--- a/meta/recipes-extended/minicom/minicom_2.9.bb
+++ b/meta/recipes-extended/minicom/minicom_2.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
+SRC_URI[sha256sum] = "90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.44.1


--===============6292976423034276771==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-minicom-upgrade-2.9-2.10.patch"

RnJvbSBlMTdiNzFjZTJhZTUwZjJkNzY4NGU5MzBlMTc4OGE5NjEzOWYzNDA3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwODo1NToyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1p
bmljb206IHVwZ3JhZGUgMi45IC0+IDIuMTAKCi0tLQogLi4uL21pbmljb20ve21pbmljb21fMi45
LmJiID0+IG1pbmljb21fMi4xMC5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL21pbmljb20ve21pbmljb21fMi45LmJiID0+IG1pbmljb21fMi4xMC5iYn0gKDkw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNvbS9taW5pY29tXzIu
OS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb21fMi4xMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWluaWNv
bS9taW5pY29tXzIuOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21pbmljb20v
bWluaWNvbV8yLjEwLmJiCmluZGV4IDkwN2Q1Yzc5YzkuLjIwY2U1NjYyYzIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb21fMi45LmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9taW5pY29tL21pbmljb21fMi4xMC5iYgpAQCAtOSw3ICs5LDcgQEAg
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NDIwNDc3YWJjNTY3NDA0ZGVi
Y2EwYTJhMWNiNmI2NDUgXAogCiBTUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9tLyR7
QlBOfS8ke0JQTn1fJHtQVn0ub3JpZy50YXIuYnoyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
OWVmYmI2NDU4MTQwZTVhMGRlNDQ1NjEzZjBlNzZiY2YxMmNiZjdhOTg5MmIyZjUzZTA3NWMyZTdi
ZWFiYTg2YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MGU3Y2UyODU2YjNlYWFhM2Y0NTIzNTRk
MTc5ODFjNDlkMzJjNDI2YTI1NWI2ZjBkMzA2M2EyMjdjMTAxNTM4IgogCiBQQUNLQUdFQ09ORklH
ID8/PSAiIgogUEFDS0FHRUNPTkZJR1tsb2NrZGV2XSA9ICItLWVuYWJsZS1sb2NrZGV2LC0tZGlz
YWJsZS1sb2NrZGV2LGxvY2tkZXYiCi0tIAoyLjQ0LjEKCg==

--===============6292976423034276771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/minicom: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.9.orig.tar.bz2" to "http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.10.orig.tar.bz2"
packages/core2-64-poky-linux/minicom/minicom-dbg: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom-dbg: PKGSIZE changed from 619312 to 618552 (-0%)
packages/core2-64-poky-linux/minicom/minicom-dev: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-dev: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom-doc: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-doc: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom-doc: PKGSIZE changed from 45118 to 45005 (-0%)
packages/core2-64-poky-linux/minicom/minicom-locale: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-locale: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom-src: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-src: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom-src: PKGSIZE changed from 438718 to 435044 (-1%)
packages/core2-64-poky-linux/minicom/minicom-src: FILELIST: directory renamed /usr/src/debug/minicom/2.9/lib -> /usr/src/debug/minicom/2.10/lib, removed "/usr/src/debug/minicom/2.9/src/getsdir.h /usr/src/debug/minicom/2.9/src/minicom.c /usr/src/debug/minicom/2.9/src/sysdep1_s.c /usr/src/debug/minicom/2.9/src/getsdir.c /usr/src/debug/minicom/2.9/src/minicom.h /usr/src/debug/minicom/2.9/src/vt100.c /usr/src/debug/minicom/2.9/src/windiv.c /usr/src/debug/minicom/2.9/src/util.c /usr/src/debug/minicom/2.9/src/wkeys.c /usr/src/debug/minicom/2.9/src/vt100.h /usr/src/debug/minicom/2.9/src/wildmat.c /usr/src/debug/minicom/2.9/src/ascii-xfr.c /usr/src/debug/minicom/2.9/src/main.c /usr/src/debug/minicom/2.9/src/dial.c /usr/src/debug/minicom/2.9/src/port.h /usr/src/debug/minicom/2.9/src/common.c /usr/src/debug/minicom/2.9/src/config.c /usr/src/debug/minicom/2.9/src/file.c /usr/src/debug/minicom/2.9/src/sysdep1.c /usr/src/debug/minicom/2.9/src/sysdep2.c /usr/src/debug/minicom/2.9/src/help.c /usr/s
 rc/debug/minicom/2.9/src/rwconf.c /usr/src/debug/minicom/2.9/src/window.h /usr/src/debug/minicom/2.9/src/updown.c /usr/src/debug/minicom/2.9/src/script.c /usr/src/debug/minicom/2.9/src/window.c /usr/src/debug/minicom/2.9/src/ipc.c /usr/src/debug/minicom/2.9/src/configsym.h", added "/usr/src/debug/minicom/2.10/src/sysdep2.c /usr/src/debug/minicom/2.10/src/sysdep1.c /usr/src/debug/minicom/2.10/src/common.c /usr/src/debug/minicom/2.10/src/help.c /usr/src/debug/minicom/2.10/src/wildmat.c /usr/src/debug/minicom/2.10/src/script.c /usr/src/debug/minicom/2.10/src/window.c /usr/src/debug/minicom/2.10/src/configsym.h /usr/src/debug/minicom/2.10/src/window.h /usr/src/debug/minicom/2.10/src/config.c /usr/src/debug/minicom/2.10/src/dial.c /usr/src/debug/minicom/2.10/src/updown.c /usr/src/debug/minicom/2.10/src/ipc.c /usr/src/debug/minicom/2.10/src/vt100.c /usr/src/debug/minicom/2.10/src/sysdep1_s.c /usr/src/debug/minicom/2.10/src/file.c /usr/src/debug/minicom/2.10/src/vt100.h /usr/src/debug/mini
 com/2.10/src/main.c /usr/src/debug/minicom/2.10/src/minicom.c /usr/src/debug/minicom/2.10/src/minicom.h /usr/src/debug/minicom/2.10/src/util.c /usr/src/debug/minicom/2.10/src/windiv.c /usr/src/debug/minicom/2.10/src/wkeys.c /usr/src/debug/minicom/2.10/src/ascii-xfr.c /usr/src/debug/minicom/2.10/src/getsdir.h /usr/src/debug/minicom/2.10/src/rwconf.c /usr/src/debug/minicom/2.10/src/getsdir.c"
packages/core2-64-poky-linux/minicom/minicom-staticdev: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom-staticdev: PKGV changed from 2.9 [default] to 2.10 [default]
packages/core2-64-poky-linux/minicom/minicom: PV changed from "2.9" to "2.10"
packages/core2-64-poky-linux/minicom/minicom: PKGV changed from 2.9 [default] to 2.10 [default]

--===============6292976423034276771==--

