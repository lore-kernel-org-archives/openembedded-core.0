Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401B1C02184
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.33391.1734254990553492634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fW+RBDfn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vAXpVCpo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010193c9a711ad-ca037bc6-3603-4d57-b37b-30c2153b3df4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lfe7361vZ9zLNr8Kd9FAHym3mBXB5EtzJBu5gQyVhV0=;
	b=fW+RBDfnoCdpEtcP3WZZGWrAlr3+oIWZvXyMzIw+1Bbe6l4I1E4DHDPzBq0uGKD4
	w95mZdJ8xf6pXuH4MXaXPPCLIGKkhDa0Tlx45uMZ5MPs9MixCA6ipCoGjWxzVpGcnyv
	ajd1CVuTjZkI+M4QlTYYxMZHg6emZUAcqSorHl5Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lfe7361vZ9zLNr8Kd9FAHym3mBXB5EtzJBu5gQyVhV0=;
	b=vAXpVCpoNaWjjhcSWqBywPBeAKGiS4ByuxhRiPfXP9wcDLWxjRtO4/76DGT8O1ok
	CI31gQOYCCaN5RT+mTqDyn8ZjWVTfzwnwoNQ9tBNPGY77HGLQWcGVn04rlTAxL2akE/
	M3B5msFk1cGIGMxVnJBl87Rpyb9b715F2zu7Ylvg=
Content-Type: multipart/mixed; boundary="===============3087646997212846747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.6.1 SUCCEEDED
Message-ID: <01010193c9a711ad-ca037bc6-3603-4d57-b37b-30c2153b3df4-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208742

--===============3087646997212846747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libjitterentropy* to *3.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libjitterentropy-upgrade-3.6.0-3.6.1.patch
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
From 683014f1643bb09e4ecc497f28314eb334ae33a1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 09:19:09 +0000
Subject: [PATCH] libjitterentropy: upgrade 3.6.0 -> 3.6.1

---
 .../{libjitterentropy_3.6.0.bb => libjitterentropy_3.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_3.6.0.bb => libjitterentropy_3.6.1.bb} (95%)

diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
similarity index 95%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
index e9ff898617..35be1e2e50 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.6.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=18a5cada7ee95e61db4180f0cb4a69cf \
                     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git;branch=master;protocol=https"
-SRCREV = "7199c8959347b0e8342df7dc6e0c1fc4b484d2fb"
+SRCREV = "16c9e5c93e614f0df25f1cb30d0730102e6f4e41"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.44.1


--===============3087646997212846747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libjitterentropy: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: PKGSIZE changed from 53480 to 53640 (+0%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dbg: FILELIST: removed "/usr/lib/.debug/libjitterentropy.so.3.6.0", added "/usr/lib/.debug/libjitterentropy.so.3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-dev: PKGSIZE changed from 32402 to 33770 (+4%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-doc: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-locale: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-src: PKGSIZE changed from 116174 to 118014 (+2%)
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy-staticdev: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PKGV changed from 3.6.0 [default] to 3.6.1 [default]
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: PV changed from "3.6.0" to "3.6.1"
packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.0", added "/usr/lib/libjitterentropy.so.3.6.1"
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.0 to libjitterentropy.so.3.6.1
  /usr/lib/libjitterentropy.so.3.6.0 moved to /usr/lib/libjitterentropy.so.3.6.1

--===============3087646997212846747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libjitterentropy-upgrade-3.6.0-3.6.1.patch"

RnJvbSA2ODMwMTRmMTY0M2JiMDllNGVjYzQ5N2YyODMxNGViMzM0YWUzM2ExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDk6MTk6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJqaXR0ZXJlbnRyb3B5OiB1cGdyYWRlIDMuNi4wIC0+IDMuNi4xCgotLS0KIC4uLi97bGliaml0
dGVyZW50cm9weV8zLjYuMC5iYiA9PiBsaWJqaXR0ZXJlbnRyb3B5XzMuNi4xLmJifSAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkve2xpYmppdHRlcmVudHJvcHlf
My42LjAuYmIgPT4gbGliaml0dGVyZW50cm9weV8zLjYuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRlcmVudHJvcHlf
My42LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRl
cmVudHJvcHlfMy42LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5XzMuNi4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJqaXR0ZXJlbnRyb3B5L2xpYmppdHRl
cmVudHJvcHlfMy42LjEuYmIKaW5kZXggZTlmZjg5ODYxNy4uMzViZTFlMmU1MCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaml0dGVyZW50cm9weS9saWJqaXR0ZXJlbnRyb3B5
XzMuNi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmppdHRlcmVudHJvcHkvbGli
aml0dGVyZW50cm9weV8zLjYuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFO21kNT0xOGE1Y2FkYTdlZTk1ZTYxZGI0MTgwZjBjYjRhNjljZiBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLmJzZDttZDU9NjZhNWNlZGFmNjJj
NGIyNjM3MDI1ZjA0OWY5YjgyNmYgXAogICAgICAgICAgICAgICAgICAgICAiCiBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vc211ZWxsZXJERC9qaXR0ZXJlbnRyb3B5LWxpYnJhcnkuZ2l0O2Jy
YW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiNzE5OWM4OTU5MzQ3YjBlODM0
MmRmN2RjNmUwYzFmYzRiNDg0ZDJmYiIKK1NSQ1JFViA9ICIxNmM5ZTVjOTNlNjE0ZjBkZjI1ZjFj
YjMwZDA3MzAxMDJlNmY0ZTQxIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogZG9fY29uZmlndXJl
W25vZXhlY10gPSAiMSIKLS0gCjIuNDQuMQoK

--===============3087646997212846747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libjitterentropy/libjitterentropy: FILELIST: removed "/usr/lib/libjitterentropy.so.3.6.0", added "/usr/lib/libjitterentropy.so.3.6.1"
Changes to packages/core2-64-poky-linux/libjitterentropy (sysroot):
  /usr/lib/libjitterentropy.so.3 changed symlink target from libjitterentropy.so.3.6.0 to libjitterentropy.so.3.6.1
  /usr/lib/libjitterentropy.so.3.6.0 moved to /usr/lib/libjitterentropy.so.3.6.1

--===============3087646997212846747==--

