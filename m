Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D1BCA0EDE
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:56:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.12499.1752594952231306510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bkb5MdGN;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jZO4Un81;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101980eccae89-cfb5911f-4ae4-4af4-acd5-aea8f61b6c02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jiBUl4uek7AcJuSkL+3fYqmhbjhlrDCUlhW0NWeeHcA=;
	b=bkb5MdGNsIo4lc2hzQRcStTj86quLZ7oLNQE2pVBf4rSrdUyT7R85j59Lo/fxoUn
	22YHTDMz81akx7/0nMtrpic/w+ia7UxAeaF4Ox/g518CDG3n/kup3pvuWaAEXI3YdeI
	yFKCR5fBmJ11iQOuNIcMuiI3UyyAjO+hGu7Cnseo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594951;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jiBUl4uek7AcJuSkL+3fYqmhbjhlrDCUlhW0NWeeHcA=;
	b=jZO4Un81rnilbHM68gZy99iZSO/DlNf/Kf47FWaa/4SVnGatOT/NCy21g1bpc1WP
	SJoUrDhEKk9OA9HE6Xoq1eiXH9Q8vDe+OfxRGk+/NLZ0yz0tMRw9eFAAzQDZPnU8lb4
	65WvzNQlvZPzYHlLjvDV60LUXo7/pUDkNK7bQQlg=
Content-Type: multipart/mixed; boundary="===============0018864417363352399=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.28.901 SUCCEEDED
Message-ID: <010101980eccae89-cfb5911f-4ae4-4af4-acd5-aea8f61b6c02-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220383

--===============0018864417363352399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.28.901* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.28.1-1.28.901.patch
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
From 9f6b742111e070f896403afd0ff3d51de9ad1458 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 14:12:05 +0000
Subject: [PATCH] libinput: upgrade 1.28.1 -> 1.28.901

---
 .../wayland/{libinput_1.28.1.bb => libinput_1.28.901.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.28.1.bb => libinput_1.28.901.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.901.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.28.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.28.901.bb
index 521a7f9a09..ec2eccd26d 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.901.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "4f7b4ef0e4eb5d569df36be387579858eba349bb"
+SRCREV = "7716954365a3fa2cc2b3948f21548a98085f16e4"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.47.1


--===============0018864417363352399==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.28.1-1.28.901.patch"

RnJvbSA5ZjZiNzQyMTExZTA3MGY4OTY0MDNhZmQwZmYzZDUxZGU5YWQxNDU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTQ6MTI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI4LjEgLT4gMS4yOC45MDEKCi0tLQogLi4uL3dheWxhbmQve2xp
YmlucHV0XzEuMjguMS5iYiA9PiBsaWJpbnB1dF8xLjI4LjkwMS5iYn0gICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve2xpYmlucHV0XzEuMjguMS5iYiA9PiBsaWJpbnB1
dF8xLjI4LjkwMS5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC9saWJpbnB1dF8xLjI4LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI4LjkwMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI4LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjguOTAxLmJiCmluZGV4
IDUyMWE3ZjlhMDkuLmVjMmVjY2QyNmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL2xpYmlucHV0XzEuMjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC9saWJpbnB1dF8xLjI4LjkwMS5iYgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0g
ImxpYmV2ZGV2IHVkZXYgbXRkZXYiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvbGliaW5wdXQvbGliaW5wdXQuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3Rh
Zz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1T
UkNSRVYgPSAiNGY3YjRlZjBlNGViNWQ1NjlkZjM2YmUzODc1Nzk4NThlYmEzNDliYiIKK1NSQ1JF
ViA9ICI3NzE2OTU0MzY1YTNmYTJjYzJiMzk0OGYyMTU0OGE5ODA4NWYxNmU0IgogCiBVUFNUUkVB
TV9DSEVDS19SRUdFWCA9ICJsaWJpbnB1dC0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCsp
IgogCi0tIAoyLjQ3LjEKCg==

--===============0018864417363352399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: SRC_URI changed from "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.28.1 file://run-ptest" to "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=1.28.901 file://run-ptest"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 7738024 to 8435960 (+9%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 228925 to 236022 (+3%)
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGSIZE changed from 47709 to 48071 (+1%)
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGSIZE changed from 1156022 to 1187062 (+3%)
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.28.1" to "1.28.901"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1437839 to 1559659 (+8%)
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.28.1 [default] to 1.28.901 [default]
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.6'])"
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.28.1" to "1.28.901"

--===============0018864417363352399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput-dbg: RRECOMMENDS: added "systemd-dbg"
packages/core2-64-poky-linux/libinput/libinput-dev: RRECOMMENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput-dev: RDEPENDS: added "systemd-dev"
packages/core2-64-poky-linux/libinput/libinput: RDEPENDS: added "libsystemd (['>= 257.6'])"

--===============0018864417363352399==--

