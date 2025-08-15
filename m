Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F786CA0FFF
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11340.1755263231202460901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PF6f3GiT;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ZpGUvCYL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add77e6b-28e342f6-f516-4571-be0d-c5b74d847f9d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nMIi+ASW9ngCxetRpFOlx5ny1VzTd6tLKVemM+a4DVI=;
	b=PF6f3GiTuj40T98h+IDFmP1/8ElDgjPOZEGR6DmxKFcH1NivMd7+7DTewKAOYz35
	Zt945D2Ti5j8s6MuDVTyGwjfj3AJOun/q0CJdW0rOOgpCwP8s7dtsVDa9qNXyMclueu
	MJEG9cZrGI2sb9/qMrUi2B+9jSnjrN798AF75IIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263237;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nMIi+ASW9ngCxetRpFOlx5ny1VzTd6tLKVemM+a4DVI=;
	b=ZpGUvCYLfvxL7He7wmCiCmlOeVq8QG9Ire6AYS372JAYHDodGVnhQVMnIiRAyx2V
	G4xOrEe9EhnAeOwxIYEacibyUL6MS8uqj9lqvc/ZZyqdoyVu9DlVUsN2W8risFrWvNZ
	ouqHNT9KgtEIcG5i3yAwNETeSBZ16KReTrA3xB/s=
Content-Type: multipart/mixed; boundary="===============9214836083587702114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.5 SUCCEEDED
Message-ID: <01010198add77e6b-28e342f6-f516-4571-be0d-c5b74d847f9d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221946

--===============9214836083587702114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.3-1.26.5.patch
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
From ca808d4f952e3b329222398f814d52198a9de5e8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 12:00:10 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.3 -> 1.26.5

---
 ...streamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.3.bb => gstreamer1.0-libav_1.26.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
index 4125fdf31f..c3ee529497 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ada7e50a3b9b8ba3e405b14c4021e25fbb10379f77d2ce490aa16523ed2724d"
+SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============9214836083587702114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav: PKGV changed from 1.26.3 [default] to 1.26.5 [default]
packages/core2-64-poky-linux/gstreamer1.0-libav: PV changed from "1.26.3" to "1.26.5"
packages/core2-64-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.3.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.26.5.tar.xz"

--===============9214836083587702114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.3-1.26.5.patch"

RnJvbSBjYTgwOGQ0Zjk1MmUzYjMyOTIyMjM5OGY4MTRkNTIxOThhOWRlNWU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTI6MDA6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yNi4zIC0+IDEuMjYuNQoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI2LjMuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuNS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI2LjMuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuNS5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjYuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yNi41LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yNi4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjYuNS5iYgppbmRleCA0MTI1ZmRmMzFmLi5jM2VlNTI5NDk3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuNS5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjNhZGE3ZTUwYTNiOWI4YmEzZTQwNWIxNGM0MDIxZTI1ZmJiMTAz
NzlmNzdkMmNlNDkwYWExNjUyM2VkMjcyNGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDZkZTA1
ODg0ZWY0MjM3NmRkOGNkZTg5OTQwZjdiNTBjZWQ5NmY0ZjZmNTI4ODhlNzY0Y2Q4MjMzZTc0ZjA1
MiIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============9214836083587702114==--

