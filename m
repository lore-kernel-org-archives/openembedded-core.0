Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841E6C2FC2F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.174038.1692224349282543178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MHBtb5Pr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SPDJqVS9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018a006e63c4-be0f859e-d23c-4797-b75d-83397ea8f1b3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LfxoxVkvYQefgwWGFVpF/fuMLT098hEh/HVxwFAAXe8=;
	b=MHBtb5Pr/MkZ6JiP3zbqrxJV2jMbuu6SwhrsS65PBeMFEKxV0/jgpS5CaPjXXJna
	xiN9+op6DEXXxhZMMzQ+KvaElKoH3rOw5oOCYVZ4NWyr9fEd1lr7sKv5PKcEXphvMQN
	XxSnWdrfuPM6knglnGg+qhvbgN14hLmJZ0ZScbls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LfxoxVkvYQefgwWGFVpF/fuMLT098hEh/HVxwFAAXe8=;
	b=SPDJqVS958hKCmZxgf+/gIgeXQ2nsDH3nueOYLIXO+du6H1AiaajKXsdMRXR4yM/
	p8H3RgyH4wlhOy49trJSoXSlPNrfYqKQnikhkb0/tmN1PAgWy8jwVWoHwgs7p23JJRH
	stg8ohxnGbv72Fx/Eej2DjcK1NJduEe790Yr4xic=
Content-Type: multipart/mixed; boundary="===============0540981183862754116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.11 SUCCEEDED
Message-ID: <0101018a006e63c4-be0f859e-d23c-4797-b75d-83397ea8f1b3-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186200

--===============0540981183862754116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.8-0.56.11.patch
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
From eeff6c486e83ef092f667b4915fe0e504781fa5f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 07:49:20 +0000
Subject: [PATCH] vala: upgrade 0.56.8 -> 0.56.11

---
 meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.8.bb => vala_0.56.11.bb} (18%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-devtools/vala/vala_0.56.11.bb
similarity index 18%
rename from meta/recipes-devtools/vala/vala_0.56.8.bb
rename to meta/recipes-devtools/vala/vala_0.56.11.bb
index f55fb41ad3..b7cfdd607b 100644
--- a/meta/recipes-devtools/vala/vala_0.56.8.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.11.bb
@@ -1,3 +1,3 @@
 require ${BPN}.inc
 
-SRC_URI[sha256sum] = "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380af118e295d904bde"
+SRC_URI[sha256sum] = "0cf3baf19f278fbeaf78bab2ee1dd18ce53e0d65bf9c57d5aa000c1832b1de64"
-- 
2.39.2


--===============0540981183862754116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.8.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.11.tar.xz"
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 16369444 to 16377752 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala-dev: PKGSIZE changed from 439364 to 439657 (+0%)
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10301 to 10313 (+0%)
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15792695 to 15802925 (+0%)
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.8" to "0.56.11"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.8 [default] to 0.56.11 [default]
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13227550 to 13249698 (+0%)

--===============0540981183862754116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.8-0.56.11.patch"

RnJvbSBlZWZmNmM0ODZlODNlZjA5MmY2NjdiNDkxNWZlMGU1MDQ3ODFmYTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDc6NDk6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuOCAtPiAwLjU2LjExCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3t2YWxhXzAuNTYuOC5iYiA9PiB2YWxhXzAuNTYuMTEuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGEve3ZhbGFfMC41Ni44LmJiID0+IHZhbGFfMC41Ni4xMS5iYn0gKDE4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuOC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xMS5iYgpzaW1pbGFyaXR5
IGluZGV4IDE4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAu
NTYuOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjEx
LmJiCmluZGV4IGY1NWZiNDFhZDMuLmI3Y2ZkZDYwN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3ZhbGFfMC41Ni4xMS5iYgpAQCAtMSwzICsxLDMgQEAKIHJlcXVpcmUgJHtCUE59Lmlu
YwogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTNmODFkY2ZjNmE5M2I3N2JhYTI3MWQ2NWU2YmU5
ODFlZTMyMzhhZDQ1MWVmMzgwYWYxMThlMjk1ZDkwNGJkZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICIwY2YzYmFmMTlmMjc4ZmJlYWY3OGJhYjJlZTFkZDE4Y2U1M2UwZDY1YmY5YzU3ZDVhYTAwMGMx
ODMyYjFkZTY0IgotLSAKMi4zOS4yCgo=

--===============0540981183862754116==--

