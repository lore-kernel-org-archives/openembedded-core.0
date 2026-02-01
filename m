Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B92E7C71B
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29052.1769951564401180849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZU8C8FWE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=L08Vxq5B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019c19558f7f-0577759f-dd06-43d8-877f-2e6f4208427d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kpe9yTzxJan5FxgRGrhZNhd9QTihZNgwSP331WET+i8=;
	b=ZU8C8FWER5lP8e3wkwCFr80yUoTOJVJxJJR9qszg92ueR5mtn1O7wCIw+ZbZCsuX
	BqNl1tZ98MN1IC6qaV1rqkFRe+0x/xBfyt455hp73ditEZnOGIxWgzkZHIbbJr0OqN9
	zEUEl/StEN7eunFbkKIFil6rV/r2kBuuMsnVv/1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951563;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kpe9yTzxJan5FxgRGrhZNhd9QTihZNgwSP331WET+i8=;
	b=L08Vxq5BgBoAa9TOALnzYHmQx0WtahVVNNkM5p4nQJPTmfRIuguOEF4sc7uDqjn3
	O9CMQB4ykO9IJHLyas/1YFxzpsgblr97G1xuIcZ0w4V5Xos1C3c2eFF/2rNcY8l8Hz/
	JZDimn+RJrixCnJnxvTpX+Wd4EhIxSWaTyp1B7pI=
Content-Type: multipart/mixed; boundary="===============5557977099494078476=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xauth: upgrading to 1.1.5 SUCCEEDED
Message-ID: <0101019c19558f7f-0577759f-dd06-43d8-877f-2e6f4208427d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230265

--===============5557977099494078476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xauth* to *1.1.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xauth-upgrade-1.1.4-1.1.5.patch
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
From 9269ddb9fbc834945f3a0a18b59beb0afde320e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 06:38:41 +0000
Subject: [PATCH] xauth: upgrade 1.1.4 -> 1.1.5

---
 .../xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.4.bb => xauth_1.1.5.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
index 919457bca6..8660d17ff0 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.4.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.5.bb
@@ -9,7 +9,7 @@ DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e9318141464ad7b4dc0f8564a580f0d20f977c85a388cc40d5a766206151c690"
+SRC_URI[sha256sum] = "a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.47.1


--===============5557977099494078476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/xauth: SRC_URI changed from "https://www.x.org/releases//individual/app/xauth-1.1.4.tar.xz" to "https://www.x.org/releases//individual/app/xauth-1.1.5.tar.xz"
packages/x86-64-v3-poky-linux/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGSIZE changed from 118720 to 119328 (+1%)
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dbg: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-dev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGSIZE changed from 11403 to 12018 (+5%)
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-doc: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-locale: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGSIZE changed from 76373 to 76741 (+0%)
packages/x86-64-v3-poky-linux/xauth/xauth-src: FILELIST: directory renamed /usr/src/debug/xauth/1.1.4 -> /usr/src/debug/xauth/1.1.5
packages/x86-64-v3-poky-linux/xauth/xauth-src: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-src: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth-staticdev: PV changed from "1.1.4" to "1.1.5"
packages/x86-64-v3-poky-linux/xauth/xauth: PKGV changed from 1.1.4 [default] to 1.1.5 [default]
packages/x86-64-v3-poky-linux/xauth/xauth: PV changed from "1.1.4" to "1.1.5"

--===============5557977099494078476==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xauth-upgrade-1.1.4-1.1.5.patch"

RnJvbSA5MjY5ZGRiOWZiYzgzNDk0NWYzYTBhMThiNTliZWIwYWZkZTMyMGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNjozODo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhh
dXRoOiB1cGdyYWRlIDEuMS40IC0+IDEuMS41CgotLS0KIC4uLi94b3JnLWFwcC97eGF1dGhfMS4x
LjQuYmIgPT4geGF1dGhfMS4xLjUuYmJ9ICAgICAgICAgICAgICAgICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC97eGF1dGhfMS4xLjQuYmIgPT4geGF1dGhfMS4xLjUuYmJ9ICg4
MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEu
MS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hhdXRoXzEuMS41LmJiCnNp
bWlsYXJpdHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3Jn
LWFwcC94YXV0aF8xLjEuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmct
YXBwL3hhdXRoXzEuMS41LmJiCmluZGV4IDkxOTQ1N2JjYTYuLjg2NjBkMTdmZjAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94YXV0aF8xLjEuNC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGF1dGhfMS4xLjUuYmIKQEAgLTksNyArOSw3
IEBAIERFUEVORFMgKz0gImxpYnhhdSBsaWJ4ZXh0IGxpYnhtdSIKIFBFID0gIjEiCiAKIFNSQ19V
UklfRVhUID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU5MzE4MTQxNDY0YWQ3YjRkYzBm
ODU2NGE1ODBmMGQyMGY5NzdjODVhMzg4Y2M0MGQ1YTc2NjIwNjE1MWM2OTAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiYTQwMDBlMmY0NDFmYWNlYmY1NjkwMjZiZWRlY2MyM2JhMjYyY2M2OTI3YmU1
MjA3MGFiZTAwMDI2MjVjZmJlMCIKIAogUEFDS0FHRUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZp
bHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2lwdjYnLCBkKX0iCiBQQUNLQUdFQ09ORklHW2lwdjZd
ID0gIi0tZW5hYmxlLWlwdjYsLS1kaXNhYmxlLWlwdjYsIgotLSAKMi40Ny4xCgo=

--===============5557977099494078476==--

