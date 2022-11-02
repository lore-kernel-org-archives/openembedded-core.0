Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19A3C63706
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.857.1667349632317853745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ePGn2mtR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c861a6-f9d270be-00ef-4f49-8429-c6aed490349a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z8hVFWXrw9oBhJ7WGpKGLQ3DiZQy0jy4Y0E047A6yEQ=;
	b=ePGn2mtR9dGCGaK8eeXA3HqmJwR57NK3UsFxUPqwao2hlUG84fSV0UhTPT28MdsJ
	3CqhQ/j3sNQkxB5UdrZ+KFlFcGD6wEWm5y4LSPEQ5b9kqqC+KjiCrTcHZrZWWMDbdPp
	vIHIDYEYi82F/7tnzpaG2izMfGRkAeny3yZCCZ28=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z8hVFWXrw9oBhJ7WGpKGLQ3DiZQy0jy4Y0E047A6yEQ=;
	b=NhpGqjIpGpsm8ZKgZXEjHE8YuL2z5xyLHa8T5cjeIwI/730miZ/B5/4zGVZjmZq5
	qkQucE+hW1pGHgr5vg60FlSy0wlfB8bajnxVkOVoMRd1nRtd+7GKhqr0DaPHtyEna95
	rmCocxs6OlKVKIug6vbh2TgVqQ81M5YHXCrLWMTg=
Content-Type: multipart/mixed; boundary="===============5429204725963772604=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pixman: upgrading to 0.42.0 SUCCEEDED
Message-ID: <0101018435c861a6-f9d270be-00ef-4f49-8429-c6aed490349a-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172476

--===============5429204725963772604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pixman* to *0.42.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pixman-upgrade-0.40.0-0.42.0.patch
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
--===============5429204725963772604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pixman: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman: SRC_URI changed from "https://www.cairographics.org/releases/pixman-0.40.0.tar.gz file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch" to "https://www.cairographics.org/releases/pixman-0.42.0.tar.gz file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch"
packages/core2-32-poky-linux/pixman/pixman-dbg: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-dbg: PKGSIZE changed from 4871372 to 4876856 (+0%)
packages/core2-32-poky-linux/pixman/pixman-dbg: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman-dbg: FILELIST: removed "/usr/lib/.debug/libpixman-1.so.0.40.0", added "/usr/lib/.debug/libpixman-1.so.0.42.0"
packages/core2-32-poky-linux/pixman/pixman-dev: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-dev: PKGSIZE changed from 49762 to 50256 (+1%)
packages/core2-32-poky-linux/pixman/pixman-dev: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman-doc: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-doc: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman-locale: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-locale: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman-src: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-src: PKGSIZE changed from 995045 to 997356 (+0%)
packages/core2-32-poky-linux/pixman/pixman-src: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman-staticdev: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman-staticdev: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman: PKGV changed from 0.40.0 [default] to 0.42.0 [default]
packages/core2-32-poky-linux/pixman/pixman: PV changed from "0.40.0" to "0.42.0"
packages/core2-32-poky-linux/pixman/pixman: FILELIST: removed "/usr/lib/libpixman-1.so.0.40.0", added "/usr/lib/libpixman-1.so.0.42.0"
Changes to packages/core2-32-poky-linux/pixman (sysroot):
  /usr/lib/libpixman-1.so.0 changed symlink target from libpixman-1.so.0.40.0 to libpixman-1.so.0.42.0
  /usr/lib/libpixman-1.so.0.40.0 moved to /usr/lib/libpixman-1.so.0.42.0

--===============5429204725963772604==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pixman-upgrade-0.40.0-0.42.0.patch"

RnJvbSA3OTZiYjE3NTVjMGJlMzNhNTM0YmMzZWNiOGRlY2Y4YTIzOGJkNTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNzoyNzoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
eG1hbjogdXBncmFkZSAwLjQwLjAgLT4gMC40Mi4wCgotLS0KIC4uLi94b3JnLWxpYi97cGl4bWFu
XzAuNDAuMC5iYiA9PiBwaXhtYW5fMC40Mi4wLmJifSAgICAgICAgICAgIHwgMyArLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1saWIve3BpeG1hbl8wLjQwLjAuYmIgPT4gcGl4bWFuXzAuNDIu
MC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIv
cGl4bWFuXzAuNDAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWxpYi9waXhtYW5f
MC40Mi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy94b3JnLWxpYi9waXhtYW5fMC40MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Z3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAuNDIuMC5iYgppbmRleCBjY2ZlMjc3NzQ2Li5iNzY4
MTBmMTNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFu
XzAuNDAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1saWIvcGl4bWFuXzAu
NDIuMC5iYgpAQCAtMTAsOCArMTAsNyBAQCBERVBFTkRTID0gInpsaWIiCiBTUkNfVVJJID0gImh0
dHBzOi8vd3d3LmNhaXJvZ3JhcGhpY3Mub3JnL3JlbGVhc2VzLyR7QlB9LnRhci5neiBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLUFSTS1xZW11LXJlbGF0ZWQtd29ya2Fyb3VuZHMtaW4tY3B1LWZl
YXR1cmVzLWRldGVjdGkucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW21kNXN1bV0gPSAi
NzM4NThjMDg2MmRkOTg5NmZiNWY2MmFlMjY3MDg0YTQiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
NmQyMDBkZWMzNzQwZDllYzRlYzhkMTE4MGUyNTc3OWMwMGJjNzQ5Zjk0Mjc4YzhiOTAyMWY1NTM0
ZGIyMjNmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwN2Y3NGM4ZDk1ZTRhNDNlYjJiMDg1Nzhi
MzdmNDBiNzkzN2U2YzViNDg1OTdiM2EwYmIyYzEzYTUzZjQ2YzEzIgogCiAjIHNlZSBodHRwOi8v
Y2Fpcm9ncmFwaGljcy5vcmcvcmVsZWFzZXMvIC0gb25seSBldmVuIG1pbm9yIHZlcnNpb25zIGFy
ZSBzdGFibGUKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInBpeG1hbi0oP1A8cHZlcj5cZCtcLihc
ZCpbMDI0NjhdKSsoXC5cZCspKykiCi0tIAoyLjMxLjEKCg==

--===============5429204725963772604==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pixman/pixman: FILELIST: removed "/usr/lib/libpixman-1.so.0.40.0", added "/usr/lib/libpixman-1.so.0.42.0"
Changes to packages/core2-32-poky-linux/pixman (sysroot):
  /usr/lib/libpixman-1.so.0 changed symlink target from libpixman-1.so.0.40.0 to libpixman-1.so.0.42.0
  /usr/lib/libpixman-1.so.0.40.0 moved to /usr/lib/libpixman-1.so.0.42.0

--===============5429204725963772604==--

