Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA454CD5BC4
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34756.1778851226279965805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G4DsYPAi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y6bluKoM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019e2bcbd83a-f2a07c16-f5ee-4355-afc0-ad955eef07fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OMKixa/m3WyqwJtYuDFLl9K9z9VOQGFT7aZYUyUE6eE=;
	b=G4DsYPAimBoAhEhT/cAEdoefiS9Us5Ic7G04x1BprQi5LWpoX+KM61DQunAXz5Mc
	Jh4dOoDbGRs/6sWHJzq+2q6z84eSfnTJJ6XaD6EdL3gn0J8QoCgpfGx4sN6/FZSwXK+
	fs8HpUDzrtmRu8ytBszfQVkQx2n/t9U8sE992p2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851240;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OMKixa/m3WyqwJtYuDFLl9K9z9VOQGFT7aZYUyUE6eE=;
	b=y6bluKoMwaopDTQIiWGiTIQpcPSOs924Zu2/1tPpdN930aySklwFYoO15Q6d/myp
	u46Si0lcgARawwlfZPVW3JRp8Bz6YW1z+YnY1E4i/QK2I7/btK5/deqYQUzzaRdPU1k
	kCdI/Ttj+RU/qoIH5V4yIhtk1yTle+qAj/uy9w68=
Content-Type: multipart/mixed; boundary="===============6207436665779576120=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.28.3 SUCCEEDED
Message-ID: <0101019e2bcbd83a-f2a07c16-f5ee-4355-afc0-ad955eef07fa-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237152

--===============6207436665779576120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.28.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.28.2-1.28.3.patch
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
From a6e1d18f23299b12221eb574aff43c2ce35be273 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 11:09:52 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.3

---
 ...streamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.3.bb
index 856c883816..538f97b317 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8d71223a3043a4e"
+SRC_URI[sha256sum] = "28fcd45d9ace261d4bda896466d5326af6efd2fcf0a20f24502094b5a9955bdf"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============6207436665779576120==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.28.2-1.28.3.patch"

RnJvbSBhNmUxZDE4ZjIzMjk5YjEyMjIxZWI1NzRhZmY0M2MyY2UzNWJlMjczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMTE6MDk6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguMwoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI4LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjguMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI4LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjguMy5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjguMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yOC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yOC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjguMy5iYgppbmRleCA4NTZjODgzODE2Li41MzhmOTdiMzE3IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjguMy5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjQ1YmE2NTUzNTg3MGFhN2MwMjYxMTlkMmU5MGIzNWRjNzYwZTFj
ZjZmNTBiZmZiZmU4ZDcxMjIzYTMwNDNhNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjhmY2Q0
NWQ5YWNlMjYxZDRiZGE4OTY0NjZkNTMyNmFmNmVmZDJmY2YwYTIwZjI0NTAyMDk0YjVhOTk1NWJk
ZiIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============6207436665779576120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 1001064 to 1000864 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-libav/1.28.2/ext/libav -> /usr/src/debug/gstreamer1.0-libav/1.28.3/ext/libav
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.28.2" to "1.28.3"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.3.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.28.2 [default] to 1.28.3 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.28.2" to "1.28.3"

--===============6207436665779576120==--

