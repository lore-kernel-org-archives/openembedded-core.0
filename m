Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB636FC6165
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5670.1693650552681799033
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JwHEMB8v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bvnluYKf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a55708bb2-14f25800-36a7-4de5-b548-6d4db8d2147f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AZPS7iwgv+cH7VrMdhSt5ykeNBCRTwU2QOVFNvJ06/U=;
	b=JwHEMB8vVsiQ8dduNJbM80QohxFpanavdMgt48oof42QiaRPegT8ysik7dXPqGTU
	VIs+BX1TLB46IHbCzc8dUWhQpZ1pKugTANmWq4SOZF93C54Gdsmio2GAaM59TL+jL5s
	kxDov9XTxUoSXIY7mgquzJEnp2TA92vaEreNvisA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AZPS7iwgv+cH7VrMdhSt5ykeNBCRTwU2QOVFNvJ06/U=;
	b=bvnluYKf6QKlj0+qLhMDytgeOQ44b3SWyQ0RwvrP4RZddiENw43Nuhkl/Xs5DBPy
	WkiH8M516fD+yHH7iLRH4eERGGlcl2q6ih8sJpT8wvUC3g88c4vD51C4U+YrxBLe5Pa
	g/9VxqwcElDJQe1dLzUkU2Rvpx4ADMo2Y4AL9xc8=
Content-Type: multipart/mixed; boundary="===============6938902902504248013=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.13 SUCCEEDED
Message-ID: <0101018a55708bb2-14f25800-36a7-4de5-b548-6d4db8d2147f-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187082

--===============6938902902504248013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.8-0.56.13.patch
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
From 8ed8362c0b7291bdf7b5d9af4da9c10f26a190ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 19:58:55 +0000
Subject: [PATCH] vala: upgrade 0.56.8 -> 0.56.13

---
 meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.13.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-devtools/vala/vala_0.56.13.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.8.bb
rename to meta/recipes-devtools/vala/vala_0.56.13.bb
index f55fb41ad3..0d43ac59a0 100644
--- a/meta/recipes-devtools/vala/vala_0.56.8.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.13.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380af118e295d904bde"
+SRC_URI[sha256sum] = "4988223036c7e1e4874c476d0de8bd9cbe500ee25ef19a76e560dc0b6d56ae07"
-- 
2.39.2


--===============6938902902504248013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.8.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.13.tar.xz"
packages/core2-32-poky-linux/vala: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 16368848 to 16378608 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-dev: PKGSIZE changed from 439364 to 439657 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10301 to 10313 (+0%)
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15792695 to 15804520 (+0%)
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.8" to "0.56.13"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.8 [default] to 0.56.13 [default]
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13227550 to 13249826 (+0%)
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.8" to "0.56.13"

--===============6938902902504248013==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.8-0.56.13.patch"

RnJvbSA4ZWQ4MzYyYzBiNzI5MWJkZjdiNWQ5YWY0ZGE5YzEwZjI2YTE5MGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxOTo1ODo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGE6IHVwZ3JhZGUgMC41Ni44IC0+IDAuNTYuMTMKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGEve3ZhbGFfMC41Ni44LmJiID0+IHZhbGFfMC41Ni4xMy5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdmFsYS97dmFsYV8wLjU2LjguYmIgPT4gdmFsYV8wLjU2LjEzLmJifSAoMTgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni44LmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjEzLmJiCnNpbWlsYXJpdHkg
aW5kZXggMTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41
Ni44LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTMu
YmIKaW5kZXggZjU1ZmI0MWFkMy4uMGQ0M2FjNTlhMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGEvdmFsYV8wLjU2LjEzLmJiCkBAIC0xLDMgKzEsMyBAQAogcmVxdWlyZSAke0JQTn0uaW5j
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5M2Y4MWRjZmM2YTkzYjc3YmFhMjcxZDY1ZTZiZTk4
MWVlMzIzOGFkNDUxZWYzODBhZjExOGUyOTVkOTA0YmRlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjQ5ODgyMjMwMzZjN2UxZTQ4NzRjNDc2ZDBkZThiZDljYmU1MDBlZTI1ZWYxOWE3NmU1NjBkYzBi
NmQ1NmFlMDciCi0tIAoyLjM5LjIKCg==

--===============6938902902504248013==--

