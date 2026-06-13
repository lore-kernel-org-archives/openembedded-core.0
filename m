Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA18DCD98D8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 07:50:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87199.1781337028038836078
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2026 00:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Njs8PZD5;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Qt7H3Nci;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ebff5f325-ba1b78df-ca6b-4c1a-8fa7-322e2fe75043-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wJgAYiMCOYL8/oCm1DYB1NI9/eeUtPMo26c9ynSyCCs=;
	b=Njs8PZD5qM8k7kqtmGT6I/YGlchIgvmNkYq5HeTEnrNT52LogOLB00e6lgtxb1g3
	tRw5k9MCUt6uhA/RtXdfecBjS1FFedLuTpKLIDmWE4WF/CBh/XlJv3TlH0TIuASrW6y
	9a0A0xbC68Ajf97toKW6gRcFUY3MXGfnQ+7/b7FQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781337027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wJgAYiMCOYL8/oCm1DYB1NI9/eeUtPMo26c9ynSyCCs=;
	b=Qt7H3NciS9osQqsA5X/qqV7Q7aig4CnRoF54psW6KJli+DfM60J9Hv0ma7cEXaPo
	IyggwvmDocHqhjEKJre+393Cgu8qeVxos9X+/ek0cInjofJi/rstCKdvyCDq0n9rMrX
	LyA2jNeQJuNRfvYholr7e8ijHncaoErZr2c1UvE8=
Content-Type: multipart/mixed; boundary="===============7255550682672198826=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.28.4 SUCCEEDED
Message-ID: <0101019ebff5f325-ba1b78df-ca6b-4c1a-8fa7-322e2fe75043-000000@us-west-2.amazonses.com>
Date: Sat, 13 Jun 2026 07:50:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.13-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2026 07:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238664

--===============7255550682672198826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.28.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.28.2-1.28.4.patch
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
From 625f44852a9a257d6c2eca73dcbaa8b5f472a6db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 13 Jun 2026 07:38:14 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.28.2 -> 1.28.4

---
 ...streamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.2.bb => gstreamer1.0-libav_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
index 856c883816..4898c42190 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "45ba65535870aa7c026119d2e90b35dc760e1cf6f50bffbfe8d71223a3043a4e"
+SRC_URI[sha256sum] = "bd17a5df2874a7a58bcbaf7b940223379ad9613624db8ead783db03e74bb904b"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============7255550682672198826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 1010896 to 1010728 (-0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-libav/1.28.2/ext/libav -> /usr/src/debug/gstreamer1.0-libav/1.28.4/ext/libav
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 564033 to 564038 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.28.2" to "1.28.4"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PKGV changed from 1.28.2 [default] to 1.28.4 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.2.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.28.4.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-libav: PV changed from "1.28.2" to "1.28.4"

--===============7255550682672198826==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.28.2-1.28.4.patch"

RnJvbSA2MjVmNDQ4NTJhOWEyNTdkNmMyZWNhNzNkY2JhYThiNWY0NzJhNmRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTMgSnVuIDIwMjYgMDc6Mzg6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yOC4yIC0+IDEuMjguNAoKLS0tCiAuLi5zdHJl
YW1lcjEuMC1saWJhdl8xLjI4LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjguNC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI4LjIuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjguNC5iYn0gKDkxJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjguMi5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yOC40LmJiCnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4yOC4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLWxpYmF2XzEuMjguNC5iYgppbmRleCA4NTZjODgzODE2Li40ODk4YzQyMTkwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjguMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjguNC5iYgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT02OTMzM2RhYTA0NGNiNzdlNDg2Y2MzNjEyOWY3YTc3MCBc
CiAgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1saWJhdi9nc3QtbGliYXYtJHtQVn0udGFyLnh6IgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjQ1YmE2NTUzNTg3MGFhN2MwMjYxMTlkMmU5MGIzNWRjNzYwZTFj
ZjZmNTBiZmZiZmU4ZDcxMjIzYTMwNDNhNGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmQxN2E1
ZGYyODc0YTdhNThiY2JhZjdiOTQwMjIzMzc5YWQ5NjEzNjI0ZGI4ZWFkNzgzZGIwM2U3NGJiOTA0
YiIKIAogUyA9ICIke1VOUEFDS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============7255550682672198826==--

