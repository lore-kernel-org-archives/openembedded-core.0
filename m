Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DE9CAC592
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:42 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.89813.1756850201028016350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S/bO8Q3V;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MCZU1jAf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101990c6e9ead-bea8a3f1-b04f-46f4-956c-d9159f313d5c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DtxIjL2j3N8NA0WS1T6ki6spPevFigxvP4RxHS3j/ZU=;
	b=S/bO8Q3VM/+UR4M4sq+mkbbM/wqe3I5MCHttSYBBVrunZ7LDAWaF+xoxL/IDpb+U
	SapfWxixanm3fipVPo3FeHGOQUDf5V0ZApjtF+gyX4AZ3M9oENRQNxS6gmBy8QJbez1
	2YcnY24O2zEdr5a77fD2y9vvX8kGNCozBpXaoWl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850200;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DtxIjL2j3N8NA0WS1T6ki6spPevFigxvP4RxHS3j/ZU=;
	b=MCZU1jAfW2hyyYyb/mBxMGdOQOAYSroaw1rdhXPIMDCuuDJ6QeD3mDprM5JhBHZ+
	dlJdySnb/j7o3WrYmg1mXkWPiu6VvQsQi0jfwTt60eggqu8qHXJfb0d0j6Avo2B84he
	ofBj/9PclRBIY2q8BMYHSAv22v24nRDumOLKj5CI=
Content-Type: multipart/mixed; boundary="===============1605298477795555105=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.32.10 SUCCEEDED
Message-ID: <010101990c6e9ead-bea8a3f1-b04f-46f4-956c-d9159f313d5c-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222813

--===============1605298477795555105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libsdl2* to *2.32.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.32.8-2.32.10.patch
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
From c4254853cd6cbfccde6b1aa92c41fddbe92b3e2b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 20:04:32 +0000
Subject: [PATCH] libsdl2: upgrade 2.32.8 -> 2.32.10

---
 .../libsdl2/{libsdl2_2.32.8.bb => libsdl2_2.32.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.32.8.bb => libsdl2_2.32.10.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 98291e0f80..834cf096b9 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
+SRC_URI[sha256sum] = "5f5993c530f084535c65a6879e9b26ad441169b3e25d789d83287040a9ca5165"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 UPSTREAM_CHECK_REGEX = "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.47.1


--===============1605298477795555105==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.32.8-2.32.10.patch"

RnJvbSBjNDI1NDg1M2NkNmNiZmNjZGU2YjFhYTkyYzQxZmRkYmU5MmIzZTJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAyMDowNDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNkbDI6IHVwZ3JhZGUgMi4zMi44IC0+IDIuMzIuMTAKCi0tLQogLi4uL2xpYnNkbDIve2xpYnNk
bDJfMi4zMi44LmJiID0+IGxpYnNkbDJfMi4zMi4xMC5iYn0gICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIve2xpYnNkbDJfMi4zMi44LmJiID0+IGxpYnNkbDJfMi4z
Mi4xMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2Rs
Mi9saWJzZGwyXzIuMzIuOC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4zMi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMzIuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMl8yLjMyLjEwLmJiCmluZGV4IDk4MjkxZTBmODAu
LjgzNGNmMDk2YjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xp
YnNkbDJfMi4zMi44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNk
bDJfMi4zMi4xMC5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmxp
YnNkbC5vcmcvcmVsZWFzZS9TREwyLSR7UFZ9LnRhci5neiIKIAogUyA9ICIke1VOUEFDS0RJUn0v
U0RMMi0ke1BWfSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBjYTgzZTljOWIzMWUxODI4OGM3
ZWM4MTExMDhlNThiYWMxZjFiYjVlYzY1NzdhZDM4NjgzMGVhYzUxYzc4N2UiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiNWY1OTkzYzUzMGYwODQ1MzVjNjVhNjg3OWU5YjI2YWQ0NDExNjliM2UyNWQ3
ODlkODMyODcwNDBhOWNhNTE2NSIKIAogaW5oZXJpdCBjbWFrZSBsaWJfcGFja2FnZSBiaW5jb25m
aWctZGlzYWJsZWQgcGtnY29uZmlnIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbgogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAiU0RMMi0oP1A8cHZlcj5cZCtcLihcZCpbMDI0NjhdKSsoXC5cZCspKylc
LnRhciIKLS0gCjIuNDcuMQoK

--===============1605298477795555105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libsdl2: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2: SRC_URI changed from "https://www.libsdl.org/release/SDL2-2.32.8.tar.gz" to "https://www.libsdl.org/release/SDL2-2.32.10.tar.gz"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-bin: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-bin: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dbg: FILELIST: removed "/usr/lib/.debug/libSDL2-2.0.so.0.3200.8", added "/usr/lib/.debug/libSDL2-2.0.so.0.3200.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dbg: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dbg: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dbg: PKGSIZE changed from 7142464 to 7142864 (+0%)
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dev: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dev: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-dev: PKGSIZE changed from 2458745 to 2458818 (+0%)
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-doc: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-doc: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-locale: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-locale: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-src: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-src: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-src: PKGSIZE changed from 10621405 to 10625915 (+0%)
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-staticdev: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-staticdev: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2-staticdev: PKGSIZE changed from 14465354 to 14466226 (+0%)
packages/x86-64-v3-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3200.8", added "/usr/lib/libSDL2-2.0.so.0.3200.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2: PKGV changed from 2.32.8 [default] to 2.32.10 [default]
packages/x86-64-v3-poky-linux/libsdl2/libsdl2: PV changed from "2.32.8" to "2.32.10"
packages/x86-64-v3-poky-linux/libsdl2/libsdl2: PKGSIZE changed from 1894531 to 1894532 (+0%)
Changes to packages/x86-64-v3-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3200.8 to libSDL2-2.0.so.0.3200.10
  /usr/lib/libSDL2-2.0.so.0.3200.10 was added
  /usr/lib/libSDL2-2.0.so.0.3200.8 was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============1605298477795555105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1941 targets, 53 skipped, 0 masked, 0 errors.
Removing 111 recipes from the qemux86_64 sysroot...done.
Removing 111 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0e44b5a94a22451d026e19a7f30418c39da65c9f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0e44b5a94a22451d026e19a7f30418c39da65c9f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 865 Local 841 Mirrors 0 Missed 24 Current 400 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch allarch...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 493 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_populate_lic_setscene)
NOTE: Running setscene task 521 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 525 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 526 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 533 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 535 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 541 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx_setscene)
NOTE: Running setscene task 542 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_create_spdx_setscene)
NOTE: Running setscene task 543 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_create_spdx_setscene)
NOTE: Running setscene task 544 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_populate_lic_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ell-0.79-r0: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 546 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 548 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 558 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 571 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 593 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 612 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.83-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 614 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 615 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 617 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 621 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/ofono/2.17/temp/log.do_packagedata_setscene.1069219
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 637 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 641 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 643 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 645 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_package_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 659 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 660 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 669 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 670 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 671 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 672 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 676 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 681 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 685 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 693 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 707 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 709 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 720 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_package_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 722 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 733 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 742 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 745 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 748 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 749 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 752 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 755 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 767 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 771 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 773 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 777 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 782 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 783 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_package_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 784 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 785 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 786 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_packagedata_setscene)
NOTE: Running setscene task 789 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 799 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 806 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 808 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 809 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 812 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 814 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_packagedata_setscene)
NOTE: Running setscene task 816 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.79-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 823 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 826 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 827 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 839 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 841 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 843 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 847 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 848 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 852 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 855 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 856 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 857 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 860 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 862 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 863 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 864 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 867 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe ofono-2.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 869 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 870 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 871 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 872 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 874 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 875 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 883 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 887 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 889 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 893 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 897 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 900 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 901 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 902 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 906 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 907 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 911 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 913 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 916 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 921 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 922 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 923 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 925 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 929 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 931 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 933 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 934 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 941 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 946 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 949 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 950 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 954 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 956 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 959 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 961 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 965 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 967 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 969 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 970 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 971 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 974 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 975 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 978 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 985 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 986 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 987 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 990 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 991 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1004 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1007 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1011 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1013 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1014 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1018 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1022 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1025 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1027 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1031 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1032 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1036 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1038 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1040 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1042 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1050 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1052 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1057 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1059 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running task 960 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1160 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1062 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1065 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1066 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1069 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1070 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1071 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1072 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1073 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1074 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1075 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1077 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1078 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 1079 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1083 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1084 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1088 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1094 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1479 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-20.1.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe binutils-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1103 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.14.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1680 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running setscene task 1104 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1106 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1703 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_fetch)
NOTE: Running task 1705 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1813 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1855 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_recipe_qa)
NOTE: recipe ofono-2.17-r0: task do_fetch: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1877 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.17-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1109 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1890 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1928 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxml2-2.14.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1954 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1110 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1112 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1113 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.17-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: Running setscene task 1117 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running setscene task 1119 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2012 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2013 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2040 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_fetch)
NOTE: recipe ofono-2.17-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1123 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running setscene task 1125 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1126 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1129 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1137 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1138 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1139 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1141 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1142 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1143 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1144 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1146 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1148 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1149 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1150 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1151 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1153 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1158 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1162 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1164 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1169 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1170 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1171 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1174 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1178 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1180 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1181 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1182 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1183 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1186 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1188 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1189 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1191 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1196 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1199 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1202 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1204 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1207 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1208 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1210 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1211 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1213 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1215 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1217 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1219 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1221 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1222 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1224 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1225 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1226 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1228 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1230 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1233 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2215 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2226 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2229 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: Running task 2230 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1239 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Succeeded
NOTE: Running task 2253 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1241 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1242 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Succeeded
NOTE: Running task 2256 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 2257 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1245 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 1247 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1248 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1252 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1255 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2286 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1259 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1264 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2677 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: Running task 3401 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3411 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_packagedata)
NOTE: Running task 3412 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe ofono-2.17-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3419 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_collect_spdx_deps)
NOTE: Running task 3420 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_collect_spdx_deps)
NOTE: recipe ofono-2.17-r0: task do_packagedata: Succeeded
NOTE: recipe ofono-2.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe ofono-2.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3421 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.17.bb:do_create_spdx)
NOTE: recipe ofono-2.17-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ofono-2.17-r0: task do_create_spdx: Succeeded
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3422 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: Running task 3423 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_compile)
NOTE: recipe avahi-0.8-r0: task do_compile: Started
NOTE: recipe avahi-0.8-r0: task do_compile: Succeeded
NOTE: Running task 3424 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_install)
NOTE: recipe avahi-0.8-r0: task do_install: Started
NOTE: recipe avahi-0.8-r0: task do_install: Succeeded
NOTE: Running task 3425 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot)
NOTE: Running task 3426 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_package: Started
NOTE: recipe avahi-0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_populate_sysroot unihash changed to d701bb75241844da3069e9513435347fb597ea341893fd0472fb0ba20e73137f
NOTE: Setscene tasks completed
NOTE: Running task 3427 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3428 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_configure)
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Started
NOTE: recipe avahi-0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_package unihash changed to 1a22a5eef3ae555f0fd402a504161801ce517165f3696ffcec700373e7975b58
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata became valid
NOTE: Running setscene task 1262 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_packagedata_setscene)
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3430 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_create_spdx)
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Started
NOTE: recipe avahi-0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3431 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_collect_spdx_deps)
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pulseaudio-17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3432 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_compile)
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Started
NOTE: recipe pulseaudio-17.0-r0: task do_compile: Succeeded
NOTE: Running task 3433 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_install)
NOTE: recipe pulseaudio-17.0-r0: task do_install: Started
NOTE: recipe pulseaudio-17.0-r0: task do_install: Succeeded
NOTE: Running task 3434 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package)
NOTE: Running task 3435 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot)
NOTE: recipe pulseaudio-17.0-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Started
NOTE: recipe pulseaudio-17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_populate_sysroot unihash changed to 0dd3ddc6db70a0ee02ecb0129074e15fc30d92e9b7ebcacef2502121616ac7c8
NOTE: Setscene tasks completed
NOTE: Running task 3436 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.32.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3437 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_configure)
NOTE: recipe libsdl2-2.32.10-r0: task do_configure: Started
NOTE: recipe pulseaudio-17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_package unihash changed to 220db2bf3d4cf79c6979b08d32f6ec88b27116258becfa7caf0ea7af516a39c6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata became valid
NOTE: Running setscene task 1264 of 1265 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3439 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_create_spdx)
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Started
NOTE: recipe pulseaudio-17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3440 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_collect_spdx_deps)
NOTE: recipe libsdl2-2.32.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3441 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_compile)
NOTE: recipe libsdl2-2.32.10-r0: task do_compile: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_compile: Succeeded
NOTE: Running task 3442 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_install)
NOTE: recipe libsdl2-2.32.10-r0: task do_install: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_install: Succeeded
NOTE: Running task 3443 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_package)
NOTE: Running task 3444 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_populate_sysroot)
NOTE: recipe libsdl2-2.32.10-r0: task do_package: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_package: Succeeded
NOTE: Running task 3445 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_packagedata)
NOTE: recipe libsdl2-2.32.10-r0: task do_packagedata: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_packagedata: Succeeded
NOTE: Running task 3446 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_create_spdx)
NOTE: Running task 3447 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_package_write_ipk)
NOTE: Running task 3448 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_package_write_deb)
NOTE: Running task 3449 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_package_write_rpm)
NOTE: recipe libsdl2-2.32.10-r0: task do_create_spdx: Started
NOTE: Running task 3450 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_package_qa)
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_ipk: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_deb: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_rpm: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_package_qa: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3451 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_create_package_spdx)
NOTE: recipe libsdl2-2.32.10-r0: task do_create_package_spdx: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_package_qa: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3452 of 3452 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_build)
NOTE: Tasks Summary: Attempted 3452 tasks of which 3391 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-src went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-dbg went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-tests went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-staticdev went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-dev went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-doc went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono-locale went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: QA Issue: Package version for package ofono went backwards which would break package feeds (from 0:2.18-r0 to 0:2.17-r0) [version-going-backwards]
ERROR: ofono-2.17-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1605298477795555105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libsdl2/libsdl2: FILELIST: removed "/usr/lib/libSDL2-2.0.so.0.3200.8", added "/usr/lib/libSDL2-2.0.so.0.3200.10"
Changes to packages/x86-64-v3-poky-linux/libsdl2 (sysroot):
  /usr/lib/libSDL2-2.0.so.0 changed symlink target from libSDL2-2.0.so.0.3200.8 to libSDL2-2.0.so.0.3200.10
  /usr/lib/libSDL2-2.0.so.0.3200.10 was added
  /usr/lib/libSDL2-2.0.so.0.3200.8 was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============1605298477795555105==--

