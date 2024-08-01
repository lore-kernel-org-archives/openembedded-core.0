Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159C7C52D76
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.75734.1722536822069824083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=deMe3C+6;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nBEQ9XEt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f3204b0-2526ce2b-62db-4184-9926-5114ff1761e5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LG4pVhxH3RuwMaFQOYV+g5dPkI/90r9oLct9araefC0=;
	b=deMe3C+6OoS0FryNdoT1shSBNmF6l7fwO2XcDCMYs6p/hMg7bZbFr8sjVpCLkt16
	aCdRrjiNRs1kjvJiLrUHSIGBhAad+OzrC0xGL7EZapjFllsCiSG6Ji5olcSamOr7XUB
	oXTWK3a7Gqof85Om4RVMXbT5JLMvmbG6xbvWWyVk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LG4pVhxH3RuwMaFQOYV+g5dPkI/90r9oLct9araefC0=;
	b=nBEQ9XEtDCy8gbEVeML1gg0fJzYjXcO3x/MSXQqYEN54R4XUAE75iZ8mFmsge/zo
	l5S/qs3XPBZ9HaDslfwSucKdcvAxcd4utC+X1NgK7Omvv9SRyFw+Irf/dEjdrvyKYhp
	Uk7FTCT936AzvK4tVqAXNJDvE6mbFh4iQT7Z7BHc=
Content-Type: multipart/mixed; boundary="===============2415757602665487452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 13.0.3 SUCCEEDED
Message-ID: <010101910f3204b0-2526ce2b-62db-4184-9926-5114ff1761e5-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202767

--===============2415757602665487452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *weston* to *13.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-weston-upgrade-13.0.1-13.0.3.patch
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
From ed4fb9ca484852690527ad356e75ef5e2674a21b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 07:47:30 +0000
Subject: [PATCH] weston: upgrade 13.0.1 -> 13.0.3

---
 ...1-libweston-tools-Include-libgen.h-for-basename-signat.patch | 2 +-
 .../wayland/{weston_13.0.1.bb => weston_13.0.3.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_13.0.1.bb => weston_13.0.3.bb} (98%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
index fbec9f9d4e..e9d464f4ba 100644
--- a/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
+++ b/meta/recipes-graphics/wayland/weston/0001-libweston-tools-Include-libgen.h-for-basename-signat.patch
@@ -1,4 +1,4 @@
-From e050830898ea37d30ef1c5339cb1665bdb92dcdc Mon Sep 17 00:00:00 2001
+From dedbadb0a61799f6567e15e1473064471b3e01f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 14 Dec 2023 09:13:54 -0800
 Subject: [PATCH] libweston,tools: Include libgen.h for basename signature
diff --git a/meta/recipes-graphics/wayland/weston_13.0.1.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
similarity index 98%
rename from meta/recipes-graphics/wayland/weston_13.0.1.bb
rename to meta/recipes-graphics/wayland/weston_13.0.3.bb
index eae13e1c21..e4843d38f7 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
            file://systemd-notify.weston-start \
            "
 
-SRC_URI[sha256sum] = "ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a"
+SRC_URI[sha256sum] = "27f68d96e3b97d98daadef13a202356524924fa381418fa6716b9136ef099093"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.0


--===============2415757602665487452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3

--===============2415757602665487452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-weston-upgrade-13.0.1-13.0.3.patch"

RnJvbSBlZDRmYjljYTQ4NDg1MjY5MDUyN2FkMzU2ZTc1ZWY1ZTI2NzRhMjFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwNzo0NzozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdl
c3RvbjogdXBncmFkZSAxMy4wLjEgLT4gMTMuMC4zCgotLS0KIC4uLjEtbGlid2VzdG9uLXRvb2xz
LUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCB8IDIgKy0KIC4uLi93
YXlsYW5kL3t3ZXN0b25fMTMuMC4xLmJiID0+IHdlc3Rvbl8xMy4wLjMuYmJ9ICAgICAgICAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3t3ZXN0b25fMTMuMC4xLmJi
ID0+IHdlc3Rvbl8xMy4wLjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRvb2xzLUluY2x1ZGUtbGliZ2Vu
LmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL3dlc3Rvbi8wMDAxLWxpYndlc3Rvbi10b29scy1JbmNsdWRlLWxpYmdlbi5oLWZvci1iYXNl
bmFtZS1zaWduYXQucGF0Y2gKaW5kZXggZmJlYzlmOWQ0ZS4uZTlkNDY0ZjRiYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uLzAwMDEtbGlid2VzdG9uLXRv
b2xzLUluY2x1ZGUtbGliZ2VuLmgtZm9yLWJhc2VuYW1lLXNpZ25hdC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b24vMDAwMS1saWJ3ZXN0b24tdG9vbHMtSW5j
bHVkZS1saWJnZW4uaC1mb3ItYmFzZW5hbWUtc2lnbmF0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBlMDUwODMwODk4ZWEzN2QzMGVmMWM1MzM5Y2IxNjY1YmRiOTJkY2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBkZWRiYWRiMGE2MTc5OWY2NTY3ZTE1ZTE0NzMwNjQ0NzFiM2Uw
MWY1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IFRodSwgMTQgRGVjIDIwMjMgMDk6MTM6NTQgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gbGlid2VzdG9uLHRvb2xzOiBJbmNsdWRlIGxpYmdlbi5oIGZvciBiYXNlbmFtZSBz
aWduYXR1cmUKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dlc3Rv
bl8xMy4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4z
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xMy4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy93YXlsYW5kL3dlc3Rvbl8xMy4wLjMuYmIKaW5kZXggZWFlMTNlMWMyMS4uZTQ4NDNkMzhmNyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2VzdG9uXzEzLjAuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93ZXN0b25fMTMuMC4zLmJiCkBA
IC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3dheWxhbmQvd2VzdG9uLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvCiAgICAgICAgICAgIGZpbGU6
Ly9zeXN0ZW1kLW5vdGlmeS53ZXN0b24tc3RhcnQgXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJlYTE1NjZhYjRmNWZmY2U3ZTlmZDRmN2ExZmNhNWIzMGNhYWU0ZDUwMDIz
YmY0NTkyMTM5OTQwOTRlMDJiMjlhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI3ZjY4ZDk2ZTNi
OTdkOThkYWFkZWYxM2EyMDIzNTY1MjQ5MjRmYTM4MTQxOGZhNjcxNmI5MTM2ZWYwOTkwOTMiCiAK
IFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5
bGFuZC93ZXN0b24vLS90YWdzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvKD9Q
PHB2ZXI+XGQrXC5cZCtcLig/ITlcZCspXGQrKSIKLS0gCjIuNDQuMAoK

--===============2415757602665487452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/weston: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.1/downloads/weston-13.0.1.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start" to "https://gitlab.freedesktop.org/wayland/weston/-/releases/13.0.3/downloads/weston-13.0.3.tar.xz file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch file://weston.png file://weston.desktop file://xwayland.weston-start file://systemd-notify.weston-start"
packages/core2-64-poky-linux/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/libweston-13: FILELIST: removed "/usr/lib/libweston-13.so.0.0.1", added "/usr/lib/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/libweston-13: PV changed from "13.0.1" to "13.0.3"
Changes to packages/core2-64-poky-linux/weston (sysroot):
  /usr/lib/libweston-13.so.0 changed symlink target from libweston-13.so.0.0.1 to libweston-13.so.0.0.3
  /usr/lib/libweston-13.so.0.0.1 moved to /usr/lib/libweston-13.so.0.0.3
packages/core2-64-poky-linux/weston/weston-dbg: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-dbg: FILELIST: removed "/usr/lib/.debug/libweston-13.so.0.0.1", added "/usr/lib/.debug/libweston-13.so.0.0.3"
packages/core2-64-poky-linux/weston/weston-dbg: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-dev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-dev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-doc: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-doc: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-examples: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-examples: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-locale: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-locale: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-src: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-src: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-staticdev: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-staticdev: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston-xwayland: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston-xwayland: PV changed from "13.0.1" to "13.0.3"
packages/core2-64-poky-linux/weston/weston: PKGV changed from 13.0.1 [default] to 13.0.3 [default]
packages/core2-64-poky-linux/weston/weston: PV changed from "13.0.1" to "13.0.3"

--===============2415757602665487452==--

