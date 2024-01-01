Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFD6C48289
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:07 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4599.1704114720264599221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N7L4znwu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dip/wUpV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018cc5270c22-8cb70e71-b94e-4fbf-aeff-5af5121901a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+37i49q3EnKvtWp6OSm7DUz7EZaqCpmvfGO0/+1BWA4=;
	b=N7L4znwuGMFNV+/5Rigx/AY4bfyf7yx7juUp7+1+UqsxhKo00wOwrucx4oPf6Jk8
	WUyzYhZ0i0fei6bw9ghq708IgUMFKV22pTU1xu2HFnX81pbq7v5lEOhW2GOSzGdofDD
	ihWAXEWCcRNX5ziDmJjTrvk/yTrP/eD7av57rU50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+37i49q3EnKvtWp6OSm7DUz7EZaqCpmvfGO0/+1BWA4=;
	b=Dip/wUpVNTQqR6Lz5F470Y5yruaAQG5mi8QSAXLaVZGSklkrl/iNDwMYyHsry+KK
	5PqIlaiBs1oSFxW3m3Dde9Awo2wSV6V/vNX4H96c0e5BlABCpdkEUoxrUgEgjjzQovv
	ThGf/d//IiW5XrWtcKalqCI3xK44XX5tnkwTDbvU=
Content-Type: multipart/mixed; boundary="===============4840029285151112545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.14 SUCCEEDED
Message-ID: <0101018cc5270c22-8cb70e71-b94e-4fbf-aeff-5af5121901a7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193146

--===============4840029285151112545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.13-0.56.14.patch
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
From a603d36e513bd3dc2c8ea33f326c236824e66b41 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 08:33:29 +0000
Subject: [PATCH] vala: upgrade 0.56.13 -> 0.56.14

---
 meta/recipes-devtools/vala/{vala_0.56.13.bb => vala_0.56.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.13.bb => vala_0.56.14.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.13.bb b/meta/recipes-devtools/vala/vala_0.56.14.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.13.bb
rename to meta/recipes-devtools/vala/vala_0.56.14.bb
index 0d43ac59a0..3240214bf8 100644
--- a/meta/recipes-devtools/vala/vala_0.56.13.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.14.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
+SRC_URI[sha256sum] = "9382c268ca9bdc02aaedc8152a9818bf3935273041f629c56de410e360a3f557"
-- 
2.42.0


--===============4840029285151112545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.13-0.56.14.patch"

RnJvbSBhNjAzZDM2ZTUxM2JkM2RjMmM4ZWEzM2YzMjZjMjM2ODI0ZTY2YjQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwODozMzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGE6IHVwZ3JhZGUgMC41Ni4xMyAtPiAwLjU2LjE0CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3t2YWxhXzAuNTYuMTMuYmIgPT4gdmFsYV8wLjU2LjE0LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxhL3t2YWxhXzAuNTYuMTMuYmIgPT4gdmFsYV8wLjU2LjE0LmJifSAo
MTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4x
My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xNC5iYgpzaW1pbGFy
aXR5IGluZGV4IDE4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxh
XzAuNTYuMTMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41
Ni4xNC5iYgppbmRleCAwZDQzYWM1OWEwLi4zMjQwMjE0YmY4IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE0LmJiCkBAIC0xLDMgKzEsMyBAQAogcmVxdWlyZSAke0JQ
Tn0uaW5jCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0OTg4MjIzMDM2YzdlMWU0ODc0YzQ3NmQw
ZGU4YmQ5Y2JlNTAwZWUyNWVmMTlhNzZlNTYwZGMwYjZkNTZhZTA3IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjkzODJjMjY4Y2E5YmRjMDJhYWVkYzgxNTJhOTgxOGJmMzkzNTI3MzA0MWY2MjljNTZk
ZTQxMGUzNjBhM2Y1NTciCi0tIAoyLjQyLjAKCg==

--===============4840029285151112545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.13.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.14.tar.xz"
packages/core2-64-poky-linux/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-dbg: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dbg: PKGSIZE changed from 18890736 to 18896200 (+0%)
packages/core2-64-poky-linux/vala/vala-dbg: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-dev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-dev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-doc: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-doc: PKGSIZE changed from 10313 to 10319 (+0%)
packages/core2-64-poky-linux/vala/vala-doc: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-locale: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-locale: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-src: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-src: PKGSIZE changed from 15804520 to 15810014 (+0%)
packages/core2-64-poky-linux/vala/vala-src: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala-staticdev: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.13 [default] to 0.56.14 [default]
packages/core2-64-poky-linux/vala/vala: PV changed from "0.56.13" to "0.56.14"
packages/core2-64-poky-linux/vala/vala: PKGSIZE changed from 12324414 to 12344976 (+0%)
packages/core2-64-poky-linux/vala/vala: PKGV changed from 0.56.13 [default] to 0.56.14 [default]

--===============4840029285151112545==--

