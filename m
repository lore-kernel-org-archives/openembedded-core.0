Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B90EC54ECC
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.75494.1722536827650515422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OcMM7siv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Wx4oSOS8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101910f32432a-b6a2e044-ec65-4173-8497-a89a17dfb553-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0NUxa56haovaV+JtwpsiZZCf7XLLW/pVXAxWjfBSLEE=;
	b=OcMM7siv/zNKDyvKRrrtWVglVCGGp3IF02veYkKttqZsU0OGfec6PmhFm1eSuxtE
	q7t9iMyK2HRhH+tvS4xjyYtiq9UO3KIudJjTZgmkpoYyau2zdDfeVJITgtZzxEAq46P
	Co7n6PNwbb9KRMgagGrYMkfikLC021NajgY8tOME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0NUxa56haovaV+JtwpsiZZCf7XLLW/pVXAxWjfBSLEE=;
	b=Wx4oSOS8hV9wWtmK4NPIr5iWKogUmMwrwm4k4EC0l0fzkc5noYy73bIKDU6uyUA8
	c0kSInpLfIj1Itiv9Sc56ZanNh+W9KZToPN1xHNlK8cvF/bGcHoyebtkYq+fyPzzdFW
	Uocy7tuZiBvtnwrbH0UE3/OEOtjdhllfa/JRWzN8=
Content-Type: multipart/mixed; boundary="===============3488145737222742353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.8 SUCCEEDED
Message-ID: <010101910f32432a-b6a2e044-ec65-4173-8497-a89a17dfb553-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202878

--===============3488145737222742353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.7-0.5.8.patch
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
From d8f5395124cbe72915adf6dc1014efce8ac85c4d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:40:44 +0000
Subject: [PATCH] libproxy: upgrade 0.5.7 -> 0.5.8

---
 .../libproxy/{libproxy_0.5.7.bb => libproxy_0.5.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.7.bb => libproxy_0.5.8.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.7.bb b/meta/recipes-support/libproxy/libproxy_0.5.8.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.7.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.8.bb
index 80441d4525..5dcd7d019b 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.8.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "2686d35cfa5db970d4ba65e2951ebc8183b1be82"
+SRCREV = "04c5185729e164dcc2d010177f83b6209769d9e7"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.44.0


--===============3488145737222742353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.7", added "/usr/lib/libproxy.so.0.5.8"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.7 to libproxy.so.0.5.8
  /usr/lib/libproxy.so.0.5.7 moved to /usr/lib/libproxy.so.0.5.8

--===============3488145737222742353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.7-0.5.8.patch"

RnJvbSBkOGY1Mzk1MTI0Y2JlNzI5MTVhZGY2ZGMxMDE0ZWZjZThhYzg1YzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzo0MDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnByb3h5OiB1cGdyYWRlIDAuNS43IC0+IDAuNS44CgotLS0KIC4uLi9saWJwcm94eS97bGlicHJv
eHlfMC41LjcuYmIgPT4gbGlicHJveHlfMC41LjguYmJ9ICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnByb3h5L3tsaWJwcm94eV8wLjUuNy5iYiA9PiBsaWJwcm94eV8wLjUu
OC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9s
aWJwcm94eV8wLjUuNy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnByb3h5L2xpYnByb3h5
XzAuNS44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnByb3h5L2xpYnByb3h5XzAuNS43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuOC5iYgppbmRleCA4MDQ0MWQ0NTI1Li41ZGNk
N2QwMTliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8w
LjUuOC5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiBERVBFTkRTID0gImds
aWItMi4wIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vbGlicHJveHkvbGlicHJveHk7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiMjY4NmQzNWNmYTVkYjk3MGQ0
YmE2NWUyOTUxZWJjODE4M2IxYmU4MiIKK1NSQ1JFViA9ICIwNGM1MTg1NzI5ZTE2NGRjYzJkMDEw
MTc3ZjgzYjYyMDk3NjlkOWU3IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogaW5oZXJpdCBtZXNv
biBwa2djb25maWcgZ29iamVjdC1pbnRyb3NwZWN0aW9uIHZhbGEgZ2ktZG9jZ2VuCi0tIAoyLjQ0
LjAKCg==

--===============3488145737222742353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libproxy: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 149376 to 149480 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-dbg: FILELIST: removed "/usr/lib/.debug/libproxy.so.0.5.7", added "/usr/lib/.debug/libproxy.so.0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-src: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 68468 to 68655 (+0%)
packages/core2-64-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.7/modules", added "/usr/lib/libproxy/0.5.8/modules"
packages/core2-64-poky-linux/libproxy/libproxy: PV changed from "0.5.7" to "0.5.8"
packages/core2-64-poky-linux/libproxy/libproxy: PKGV changed from 0.5.7 [default] to 0.5.8 [default]
packages/core2-64-poky-linux/libproxy/libproxy: FILELIST: removed "/usr/lib/libproxy.so.0.5.7", added "/usr/lib/libproxy.so.0.5.8"
Changes to packages/core2-64-poky-linux/libproxy (sysroot):
  /usr/lib/libproxy.so.1 changed symlink target from libproxy.so.0.5.7 to libproxy.so.0.5.8
  /usr/lib/libproxy.so.0.5.7 moved to /usr/lib/libproxy.so.0.5.8

--===============3488145737222742353==--

