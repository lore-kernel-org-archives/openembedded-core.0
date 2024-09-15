Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8801DC3600F
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.115646.1726410841701258344
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ObgT5WaY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=bRAgvyPW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adbf1-f21f65de-c67e-42d9-a421-662a9ab551a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nHudiSelz6cE4weIi0Ky+jDqwj+ncO3PakKYm6O77MI=;
	b=ObgT5WaYXFZAocuH9NJRwae+XYouf0/O97PUsc5n/A7SQsPkUA676k3umZ0oF4I5
	9jPrh/HaEmRcaBYpDMjwLD9z2GAe8qs6O/Scz/dGyI0SNDQKxsDUpMNORinqG05erml
	h/rSkO85zBcKCXfcg55z5HaaSktnGR/uU+X2HpHw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nHudiSelz6cE4weIi0Ky+jDqwj+ncO3PakKYm6O77MI=;
	b=bRAgvyPWqqQAykx17fWlqsFFM+fQrsz2WKSn5y+6MDUXTG4LFCV4uIwjNKZ4oW2p
	SC/UWMELVOgeKuEnqrJ7e23njBrfQ4k9XFNOKRXXPTIfKw7bhH0GPwoCoNVL+u4LDsp
	WUvsT3hCK36dtfqFsHCLaaop+2LolNGBuOMVQ+Oo=
Content-Type: multipart/mixed; boundary="===============2873063771789592412=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.6.2 SUCCEEDED
Message-ID: <01010191f61adbf1-f21f65de-c67e-42d9-a421-662a9ab551a9-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204556

--===============2873063771789592412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.6.1-2.6.2.patch
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
From b9e382e8d31af4757228066503d7b3b6721fc144 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 10:22:40 +0000
Subject: [PATCH] sysklogd: upgrade 2.6.1 -> 2.6.2

---
 .../sysklogd/{sysklogd_2.6.1.bb => sysklogd_2.6.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.1.bb => sysklogd_2.6.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
index 99454b8230..7f06738d00 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "c2bc519697aaa94f7b5e658a31ff55b9d54e7c8d"
+SRCREV = "c1f8842853378781c2fdf6e70070a95539ba7d2e"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============2873063771789592412==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.6.1-2.6.2.patch"

RnJvbSBiOWUzODJlOGQzMWFmNDc1NzIyODA2NjUwM2Q3YjNiNjcyMWZjMTQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTA6MjI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjYuMSAtPiAyLjYuMgoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNi4xLmJiID0+IHN5c2tsb2dkXzIuNi4yLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNi4xLmJiID0+IHN5c2tsb2dkXzIu
Ni4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjYuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjYuMi5iYgppbmRleCA5OTQ1NGI4MjMw
Li43ZjA2NzM4ZDAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNi4yLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
YzJiYzUxOTY5N2FhYTk0ZjdiNWU2NThhMzFmZjU1YjlkNTRlN2M4ZCIKK1NSQ1JFViA9ICJjMWY4
ODQyODUzMzc4NzgxYzJmZGY2ZTcwMDcwYTk1NTM5YmE3ZDJlIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============2873063771789592412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 207544 to 210384 (+1%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9557 to 9733 (+2%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 97164 to 97977 (+1%)
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 149954 to 150975 (+1%)
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.6.1 [default] to 2.6.2 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.6.1" to "2.6.2"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGSIZE changed from 98476 to 98508 (+0%)

--===============2873063771789592412==--

