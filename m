Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BADBD60049
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4644.1731964602095666029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=GPuCSpE6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NJCk4P+7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101934122a4f2-4b5f0275-4c06-4423-ae26-b49a375ef167-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=11RP8rm8iGjJW5//fT6RypVD92ow9gHsuSlTju5k6M8=;
	b=GPuCSpE65sd2CrQib2dhkL1rFt0N3JuX+8Mut0AMXX7opvrrWhhMJRd6WSEPgAf2
	wX1JDtqI263aAXd8/2nBMYugHNmk7RPm/E6j7E+OPucwuTZRE8nMcgCWJLBUWp8Co57
	ado1jZCLx2PjJkLN4cVu0cNVfB3a/UajNQhs3JmI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964610;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=11RP8rm8iGjJW5//fT6RypVD92ow9gHsuSlTju5k6M8=;
	b=NJCk4P+7yYWihyp6Lcr5cZ4h4yOGB/IKeivl+nwyfolHjfPFiUZmT9WBHWTCwP8B
	mfGZ5m/NazS91d5BfiSNIIrB7ImOSlyUtEHOUnOU/TB/HRxIHPDuJKZmCQlmS0aC4Ym
	rmuKbVKbMJn/C4jAurFvu91TkfDwxpQwzg/ABL+Q=
Content-Type: multipart/mixed; boundary="===============2416681226146307382=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] seatd: upgrading to 0.9.1 SUCCEEDED
Message-ID: <010101934122a4f2-4b5f0275-4c06-4423-ae26-b49a375ef167-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207253

--===============2416681226146307382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *seatd* to *0.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.8.0-0.9.1.patch
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
From 3c691026f17c0df7131d95c932e1898e3859a1c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 07:16:03 +0000
Subject: [PATCH] seatd: upgrade 0.8.0 -> 0.9.1

---
 meta/recipes-core/seatd/{seatd_0.8.0.bb => seatd_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.8.0.bb => seatd_0.9.1.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.8.0.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.8.0.bb
rename to meta/recipes-core/seatd/seatd_0.9.1.bb
index df5fe35f98..8da57acc56 100644
--- a/meta/recipes-core/seatd/seatd_0.8.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
+SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.44.1


--===============2416681226146307382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/seatd: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-dbg: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 335408 to 329128 (-2%)
packages/core2-64-poky-linux/seatd/seatd-dbg: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-dev: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-dev: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-doc: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-doc: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-locale: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-locale: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-src: FILELIST: directory renamed /usr/src/debug/seatd/0.8.0/libseat -> /usr/src/debug/seatd/0.9.1/libseat, directory renamed /usr/src/debug/seatd/0.8.0/seatd -> /usr/src/debug/seatd/0.9.1/seatd, directory renamed /usr/src/debug/seatd/0.8.0/seatd-launch -> /usr/src/debug/seatd/0.9.1/seatd-launch, directory renamed /usr/src/debug/seatd/0.8.0/libseat/backend -> /usr/src/debug/seatd/0.9.1/libseat/backend, removed "/usr/src/debug/seatd/0.8.0/common/linked_list.c /usr/src/debug/seatd/0.8.0/include/drm.h /usr/src/debug/seatd/0.8.0/include/connection.h /usr/src/debug/seatd/0.8.0/include/client.h /usr/src/debug/seatd/0.8.0/include/log.h /usr/src/debug/seatd/0.8.0/common/connection.c /usr/src/debug/seatd/0.8.0/include/libseat.h /usr/src/debug/seatd/0.8.0/common/drm.c /usr/src/debug/seatd/0.8.0/include/protocol.h /usr/src/debug/seatd/0.8.0/include/terminal.h /usr/src/debug/seatd/0.8.0/include/wscons.h /usr/src/debug/seatd/0.8.0/include/linked_list.h /usr
 /src/debug/seatd/0.8.0/include/backend.h /usr/src/debug/seatd/0.8.0/include/poller.h /usr/src/debug/seatd/0.8.0/include/server.h /usr/src/debug/seatd/0.8.0/common/log.c /usr/src/debug/seatd/0.8.0/common/evdev.c /usr/src/debug/seatd/0.8.0/common/wscons.c /usr/src/debug/seatd/0.8.0/common/terminal.c /usr/src/debug/seatd/0.8.0/include/seat.h /usr/src/debug/seatd/0.8.0/include/evdev.h", added "/usr/src/debug/seatd/0.9.1/common/linked_list.c /usr/src/debug/seatd/0.9.1/include/drm.h /usr/src/debug/seatd/0.9.1/include/connection.h /usr/src/debug/seatd/0.9.1/include/client.h /usr/src/debug/seatd/0.9.1/include/log.h /usr/src/debug/seatd/0.9.1/common/connection.c /usr/src/debug/seatd/0.9.1/include/libseat.h /usr/src/debug/seatd/0.9.1/common/drm.c /usr/src/debug/seatd/0.9.1/include/protocol.h /usr/src/debug/seatd/0.9.1/include/terminal.h /usr/src/debug/seatd/0.9.1/include/hidraw.h /usr/src/debug/seatd/0.9.1/include/wscons.h /usr/src/debug/seatd/0.9.1/include/linked_list.h /usr/src/debug/seatd/
 0.9.1/include/backend.h /usr/src/debug/seatd/0.9.1/include/server.h /usr/src/debug/seatd/0.9.1/include/poller.h /usr/src/debug/seatd/0.9.1/common/log.c /usr/src/debug/seatd/0.9.1/common/evdev.c /usr/src/debug/seatd/0.9.1/common/hidraw.c /usr/src/debug/seatd/0.9.1/common/terminal.c /usr/src/debug/seatd/0.9.1/common/wscons.c /usr/src/debug/seatd/0.9.1/include/seat.h /usr/src/debug/seatd/0.9.1/include/evdev.h"
packages/core2-64-poky-linux/seatd/seatd-src: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-src: PKGSIZE changed from 132790 to 138413 (+4%)
packages/core2-64-poky-linux/seatd/seatd-src: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd-staticdev: PV changed from "0.8.0" to "0.9.1"
packages/core2-64-poky-linux/seatd/seatd: PKGV changed from 0.8.0 [default] to 0.9.1 [default]
packages/core2-64-poky-linux/seatd/seatd: PV changed from "0.8.0" to "0.9.1"

--===============2416681226146307382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.8.0-0.9.1.patch"

RnJvbSAzYzY5MTAyNmYxN2MwZGY3MTMxZDk1YzkzMmUxODk4ZTM4NTlhMWMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDc6MTY6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZWF0ZDogdXBncmFkZSAwLjguMCAtPiAwLjkuMQoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zZWF0
ZC97c2VhdGRfMC44LjAuYmIgPT4gc2VhdGRfMC45LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc2VhdGQve3NlYXRkXzAuOC4wLmJiID0+IHNlYXRkXzAuOS4xLmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc2VhdGQvc2VhdGRfMC45LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC44LjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4xLmJiCmluZGV4IGRmNWZlMzVmOTguLjhk
YTU3YWNjNTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOC4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4xLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MTVhOTlkMmRk
NTUyZTYxODhlNzRkNGVkMjkxNGQ1YSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQuc3IuaHQvfmtl
bm55bGV2aW5zZW4vc2VhdGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAg
ICAgIGZpbGU6Ly9pbml0IgotU1JDUkVWID0gIjNlOWVmNjlmMTRmNjMwYTcxOWRkNDY0ZjNjOTBh
NzkzMmYxYzgyOTYiCitTUkNSRVYgPSAiNTY2ZmZlYjAzMmFmNDI4NjVkYzEyMTBlNDhjZWMwODM2
ODA1OWJiOSIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVzb24gcGtnY29uZmln
IHVwZGF0ZS1yYy5kCi0tIAoyLjQ0LjEKCg==

--===============2416681226146307382==--

