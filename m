Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC21AD0EE0F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.53257.1728588943607063016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=i34xYmVD;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DcmY8LID;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019277ee4e77-b402c3cf-5d61-45f6-be5f-25dc8c009293-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588959;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xizROfLGJ3EhTO+pkbeubP5AxSPBi4Uz+lqaraYLTR4=;
	b=i34xYmVDhTey97BoTHohuE7FzxrtZSl9fDZz8gARMRcYGQxOQjhX/zhdk90/72MR
	EKZQIemnpjv5pTq1ZlpnlTxiOPNrVPenKkdr7F4j2jZZLEoavXOmftnP1kO6eCyUhPF
	qDgU6EVEjTXyfFvPYMtpENYtAsujTROwmYZsi7js=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588959;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xizROfLGJ3EhTO+pkbeubP5AxSPBi4Uz+lqaraYLTR4=;
	b=DcmY8LIDPagGSIfxoo5ipjxOg4zg0iy8iF2ZA3Xg9w3Jw/+pdbhaE/H2yqr7gm56
	HqiSB53zGzqYntg1JQ/s5olp8pc0Z/I8IN70tziGaz28pQiySjermAJ5MjKqxE5WhXc
	d2HQvt9oHcjxLD+znmlo8duYUG5NwPoxtJfEZOEs=
Content-Type: multipart/mixed; boundary="===============6071816617546343680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.26.2 SUCCEEDED
Message-ID: <0101019277ee4e77-b402c3cf-5d61-45f6-be5f-25dc8c009293-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205494

--===============6071816617546343680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libinput-upgrade-1.26.1-1.26.2.patch
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
From 77e04b338ed9810d1b978d862e314751bdfcbdaf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:43:32 +0000
Subject: [PATCH] libinput: upgrade 1.26.1 -> 1.26.2

---
 .../wayland/{libinput_1.26.1.bb => libinput_1.26.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/wayland/{libinput_1.26.1.bb => libinput_1.26.2.bb} (97%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.1.bb b/meta/recipes-graphics/wayland/libinput_1.26.2.bb
similarity index 97%
rename from meta/recipes-graphics/wayland/libinput_1.26.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.26.2.bb
index 487270505a..6a96b0e14a 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.26.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "124431a5d3186e1c3c3aa144a0634b84b3089486"
+SRCREV = "3402f380019dc4f882e1d8627029607aca3f4be6"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.44.1


--===============6071816617546343680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-lg.quirks /usr/share/libinput/50-system-minisforum.quirks"
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-lg.quirks was added
  /usr/share/libinput/50-system-minisforum.quirks was added

--===============6071816617546343680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libinput: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-bin: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-bin: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGSIZE changed from 6436792 to 6436808 (+0%)
packages/core2-64-poky-linux/libinput/libinput-dbg: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-dbg: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-dev: PKGSIZE changed from 219952 to 219936 (-0%)
packages/core2-64-poky-linux/libinput/libinput-dev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-dev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-doc: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-doc: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-locale: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-locale: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-ptest: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-ptest: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-src: PKGSIZE changed from 3587187 to 3587165 (-0%)
packages/core2-64-poky-linux/libinput/libinput-src: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-src: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput-staticdev: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput-staticdev: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
packages/core2-64-poky-linux/libinput/libinput: FILELIST: added "/usr/share/libinput/50-system-lg.quirks /usr/share/libinput/50-system-minisforum.quirks"
packages/core2-64-poky-linux/libinput/libinput: PKGSIZE changed from 1236502 to 1237057 (+0%)
packages/core2-64-poky-linux/libinput/libinput: PV changed from "1.26.1" to "1.26.2"
packages/core2-64-poky-linux/libinput/libinput: PKGV changed from 1.26.1 [default] to 1.26.2 [default]
Changes to packages/core2-64-poky-linux/libinput (sysroot):
  /usr/share/libinput/50-system-lg.quirks was added
  /usr/share/libinput/50-system-minisforum.quirks was added

--===============6071816617546343680==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libinput-upgrade-1.26.1-1.26.2.patch"

RnJvbSA3N2UwNGIzMzhlZDk4MTBkMWI5NzhkODYyZTMxNDc1MWJkZmNiZGFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NDM6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJpbnB1dDogdXBncmFkZSAxLjI2LjEgLT4gMS4yNi4yCgotLS0KIC4uLi93YXlsYW5kL3tsaWJp
bnB1dF8xLjI2LjEuYmIgPT4gbGliaW5wdXRfMS4yNi4yLmJifSAgICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3tsaWJpbnB1dF8xLjI2LjEuYmIgPT4gbGliaW5wdXRf
MS4yNi4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXls
YW5kL2xpYmlucHV0XzEuMjYuMS5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xp
YmlucHV0XzEuMjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC9saWJpbnB1dF8xLjI2LjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL2xpYmlucHV0XzEuMjYuMi5iYgppbmRleCA0ODcyNzA1
MDVhLi42YTk2YjBlMTRhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFu
ZC9saWJpbnB1dF8xLjI2LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQv
bGliaW5wdXRfMS4yNi4yLmJiCkBAIC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAibGliZXZkZXYg
dWRldiBtdGRldiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9saWJp
bnB1dC9saWJpbnB1dC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjEyNDQzMWE1ZDMx
ODZlMWMzYzNhYTE0NGEwNjM0Yjg0YjMwODk0ODYiCitTUkNSRVYgPSAiMzQwMmYzODAwMTlkYzRm
ODgyZTFkODYyNzAyOTYwN2FjYTNmNGJlNiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIFVQU1RS
RUFNX0NIRUNLX1JFR0VYID0gImxpYmlucHV0LSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxk
KykiCi0tIAoyLjQ0LjEKCg==

--===============6071816617546343680==--

