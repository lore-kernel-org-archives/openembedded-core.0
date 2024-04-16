Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D852C05052
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13427.1713248038174058471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xgl0nUQO;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NPqNMEDv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a9bc7-6850c418-26e7-4e9e-b1e3-0c42d791a365-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=UpvDHdmDbsbzv29gi3xbZfm+agHw2DFNMZFIiyhku8M=;
	b=Xgl0nUQOzCnqPJgzgKCtSJNe5kziRZKPR8HQDT2P+JFFMTKdXpHAHOdLG1AR21kp
	tnm56U/okrcmD/+GBAAv3qVKi5tP1K4xvEfVz7BCPgEPWLuniiGYqxflEClAZNPxrUL
	69Ne3jK3/gMRDhkEblehXR28zw+FV1BmIqhs+oKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248050;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=UpvDHdmDbsbzv29gi3xbZfm+agHw2DFNMZFIiyhku8M=;
	b=NPqNMEDvMS2+Zzw62gLG1MjQ3OatrJwZ/gQtqQVEOg+xJqQFAVuT7njN9YpzX6Iq
	7MXONB0KTaj/7Em3Ynh34tXDI63G98aeV03YetCjah8aBXXs5/LHufQMna8LCLe9QU5
	XBdk8vZ/SW8rz2+VTAWjUC53RAmElciHhyN0m8Io=
Content-Type: multipart/mixed; boundary="===============2391874112656269829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xev: upgrading to 1.2.6 SUCCEEDED
Message-ID: <0101018ee58a9bc7-6850c418-26e7-4e9e-b1e3-0c42d791a365-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198369

--===============2391874112656269829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xev* to *1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xev-upgrade-1.2.5-1.2.6.patch
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
From c92ff12c2e0cd2aca5840dc892a98aaa21229702 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 00:18:52 +0000
Subject: [PATCH] xev: upgrade 1.2.5 -> 1.2.6

---
 meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xev_1.2.5.bb => xev_1.2.6.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-app/xev_1.2.5.bb
rename to meta/recipes-graphics/xorg-app/xev_1.2.6.bb
index 1d2e66b7b4..182aeff1b7 100644
--- a/meta/recipes-graphics/xorg-app/xev_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-app/xev_1.2.6.bb
@@ -12,6 +12,6 @@ PE = "1"
 
 DEPENDS += "libxrandr xorgproto"
 
-SRC_URI[sha256sum] = "c9461a4389714e0f33974f9e75934bdc38d836a0f059b8dc089c7cbf2ce36ec1"
+SRC_URI[sha256sum] = "61e1c5e008ac9973aca7cdddf36e9df7410e77083b030eb04f4dc737c51807d7"
 
 SRC_URI_EXT = "xz"
-- 
2.42.0


--===============2391874112656269829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/xev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev: SRC_URI changed from "https://www.x.org/releases//individual/app/xev-1.2.5.tar.xz" to "https://www.x.org/releases//individual/app/xev-1.2.6.tar.xz"
packages/core2-64-poky-linux/xev/xev-dbg: PKGSIZE changed from 68360 to 67864 (-1%)
packages/core2-64-poky-linux/xev/xev-dbg: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-dev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-doc: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-locale: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-src: PKGSIZE changed from 46810 to 46902 (+0%)
packages/core2-64-poky-linux/xev/xev-src: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/core2-64-poky-linux/xev/xev: PKGSIZE changed from 35208 to 35184 (-0%)
packages/core2-64-poky-linux/xev/xev: PV changed from "1.2.5" to "1.2.6"
packages/core2-64-poky-linux/xev/xev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]

--===============2391874112656269829==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-xev-upgrade-1.2.5-1.2.6.patch"

RnJvbSBjOTJmZjEyYzJlMGNkMmFjYTU4NDBkYzg5MmE5OGFhYTIxMjI5NzAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDA6MTg6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ZXY6IHVwZ3JhZGUgMS4yLjUgLT4gMS4yLjYKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hv
cmctYXBwL3t4ZXZfMS4yLjUuYmIgPT4geGV2XzEuMi42LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWFwcC97eGV2XzEuMi41LmJiID0+IHhldl8xLjIuNi5iYn0gKDg0JSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEuMi41LmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hldl8xLjIuNi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDg0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEu
Mi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAveGV2XzEuMi42
LmJiCmluZGV4IDFkMmU2NmI3YjQuLjE4MmFlZmYxYjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy94b3JnLWFwcC94ZXZfMS4yLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmctYXBwL3hldl8xLjIuNi5iYgpAQCAtMTIsNiArMTIsNiBAQCBQRSA9ICIxIgogCiBE
RVBFTkRTICs9ICJsaWJ4cmFuZHIgeG9yZ3Byb3RvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
Yzk0NjFhNDM4OTcxNGUwZjMzOTc0ZjllNzU5MzRiZGMzOGQ4MzZhMGYwNTliOGRjMDg5YzdjYmYy
Y2UzNmVjMSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2MWUxYzVlMDA4YWM5OTczYWNhN2NkZGRm
MzZlOWRmNzQxMGU3NzA4M2IwMzBlYjA0ZjRkYzczN2M1MTgwN2Q3IgogCiBTUkNfVVJJX0VYVCA9
ICJ4eiIKLS0gCjIuNDIuMAoK

--===============2391874112656269829==--

