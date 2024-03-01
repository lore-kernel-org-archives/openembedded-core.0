Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A2FC54EBE
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.36980.1709330716994468372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M05vynXd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aqxIoR14;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd598-4421232e-c9c7-412f-b21c-5c71aaa0431f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YLuwEy9ruWaUJU3uhF2J7bN+YBGIaC8Qcg64NmyiUCA=;
	b=M05vynXdEf+3k5rcDAxftFbiWenaHelKj5xUPv96lbd9qD9VEK3a29tgSfAwwC13
	Kxjene9FaHCFAHUy2yV6JIibq4KqbHHB2jnjmudwgDZNCC+pjh5G151Qf9pY0g6Y8aN
	t4ttqfK9ND94RcUd50Pg+NDVcTgeO51ACXimlLS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YLuwEy9ruWaUJU3uhF2J7bN+YBGIaC8Qcg64NmyiUCA=;
	b=aqxIoR14tBqEdnW6Q3B8M8Z/FIdjoirErjon2Exim8hghWBIsMTnUOXTZgx3VASg
	oxVFoqa9yTzvlNpuYmAzfVGLQ9J0ohk1YAWAeyhtvIGiFLL2rwvKaT2nTl+sRWRrlVG
	SS1s3l1Ie3VQxUQhmOWB50amOW12acG3WmyUysYA=
Content-Type: multipart/mixed; boundary="===============8312893801100757263=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] orc: upgrading to 0.4.38 SUCCEEDED
Message-ID: <0101018dfc0cd598-4421232e-c9c7-412f-b21c-5c71aaa0431f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196491

--===============8312893801100757263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *orc* to *0.4.38* has Succeeded.

Next steps:
    - apply the patch: git am 0001-orc-upgrade-0.4.37-0.4.38.patch
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
From 57e90e83c6b83f588fcd07b4bf11697adc2b1bb4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 12:26:45 +0000
Subject: [PATCH] orc: upgrade 0.4.37 -> 0.4.38

---
 meta/recipes-devtools/orc/{orc_0.4.37.bb => orc_0.4.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.37.bb => orc_0.4.38.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.37.bb b/meta/recipes-devtools/orc/orc_0.4.38.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.37.bb
rename to meta/recipes-devtools/orc/orc_0.4.38.bb
index 9985204d74..5d2296694a 100644
--- a/meta/recipes-devtools/orc/orc_0.4.37.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.38.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "85638c0d447d989cd0d7e03406adbfbc380e67db2a622a4727a0ce3d440b2974"
+SRC_URI[sha256sum] = "a55a98d4772567aa3faed8fb84d540c3db77eaba16d3e2e10b044fbc9228668d"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.42.0


--===============8312893801100757263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/orc: SRC_URI changed from "http://gstreamer.freedesktop.org/src/orc/orc-0.4.37.tar.xz" to "http://gstreamer.freedesktop.org/src/orc/orc-0.4.38.tar.xz"
packages/core2-64-poky-linux/orc: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/liborc-0.4: FILES: removed "/usr/lib/liborc-0.4.so.0.37.0", added "/usr/lib/liborc-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/liborc-0.4: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.37.0", added "/usr/lib/liborc-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/liborc-0.4: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILES: removed "/usr/lib/liborc-test-0.4.so.0.37.0", added "/usr/lib/liborc-test-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/liborc-test-0.4: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.37.0", added "/usr/lib/liborc-test-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/liborc-test-0.4: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-dbg: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-dbg: FILELIST: removed "/usr/lib/.debug/liborc-test-0.4.so.0.37.0 /usr/lib/.debug/liborc-0.4.so.0.37.0", added "/usr/lib/.debug/liborc-test-0.4.so.0.38.0 /usr/lib/.debug/liborc-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/orc-dbg: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-dbg: PKGSIZE changed from 2093904 to 2088960 (-0%)
packages/core2-64-poky-linux/orc/orc-dev: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-dev: FILELIST: removed "/usr/share/aclocal/orc.m4"
packages/core2-64-poky-linux/orc/orc-dev: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-dev: PKGSIZE changed from 239268 to 237116 (-1%)
packages/core2-64-poky-linux/orc/orc-doc: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-doc: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-examples: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-examples: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-locale: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-locale: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-src: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-src: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc-src: PKGSIZE changed from 1746273 to 1737982 (-0%)
packages/core2-64-poky-linux/orc/orc-staticdev: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc-staticdev: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
packages/core2-64-poky-linux/orc/orc: PV changed from "0.4.37" to "0.4.38"
packages/core2-64-poky-linux/orc/orc: PKGV changed from 0.4.37 [default] to 0.4.38 [default]
Changes to packages/core2-64-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.37.0 to liborc-0.4.so.0.38.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.37.0 to liborc-test-0.4.so.0.38.0
  /usr/lib/liborc-0.4.so.0.37.0 moved to /usr/lib/liborc-0.4.so.0.38.0
  /usr/lib/liborc-test-0.4.so.0.37.0 moved to /usr/lib/liborc-test-0.4.so.0.38.0
  /usr/share was removed
  /usr/share/aclocal was removed
  /usr/share/aclocal/orc.m4 was removed

--===============8312893801100757263==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-orc-upgrade-0.4.37-0.4.38.patch"

RnJvbSA1N2U5MGU4M2M2YjgzZjU4OGZjZDA3YjRiZjExNjk3YWRjMmIxYmI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxMjoyNjo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9y
YzogdXBncmFkZSAwLjQuMzcgLT4gMC40LjM4CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9v
cmMve29yY18wLjQuMzcuYmIgPT4gb3JjXzAuNC4zOC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvb3JjL3tvcmNfMC40LjM3LmJiID0+IG9yY18wLjQuMzguYmJ9ICg5MiUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM3LmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAuNC4zNy5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL29yYy9vcmNfMC40LjM4LmJiCmluZGV4IDk5ODUyMDRkNzQu
LjVkMjI5NjY5NGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcmMvb3JjXzAu
NC4zNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvb3JjL29yY18wLjQuMzguYmIKQEAg
LTUsNyArNSw3IEBAIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTQwMGJkOWQwOWU4YWY1NmI5ZWM5
ODJiM2Q4NTc5N2UiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5v
cmcvc3JjL29yYy9vcmMtJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg1NjM4
YzBkNDQ3ZDk4OWNkMGQ3ZTAzNDA2YWRiZmJjMzgwZTY3ZGIyYTYyMmE0NzI3YTBjZTNkNDQwYjI5
NzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTU1YTk4ZDQ3NzI1NjdhYTNmYWVkOGZiODRkNTQw
YzNkYjc3ZWFiYTE2ZDNlMmUxMGIwNDRmYmM5MjI4NjY4ZCIKIAogaW5oZXJpdCBtZXNvbiBwa2dj
b25maWcgZ3RrLWRvYwogCi0tIAoyLjQyLjAKCg==

--===============8312893801100757263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/orc/liborc-0.4: FILELIST: removed "/usr/lib/liborc-0.4.so.0.37.0", added "/usr/lib/liborc-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/liborc-test-0.4: FILELIST: removed "/usr/lib/liborc-test-0.4.so.0.37.0", added "/usr/lib/liborc-test-0.4.so.0.38.0"
packages/core2-64-poky-linux/orc/orc-dev: FILELIST: removed "/usr/share/aclocal/orc.m4"
Changes to packages/core2-64-poky-linux/orc (sysroot):
  /usr/lib/liborc-0.4.so.0 changed symlink target from liborc-0.4.so.0.37.0 to liborc-0.4.so.0.38.0
  /usr/lib/liborc-test-0.4.so.0 changed symlink target from liborc-test-0.4.so.0.37.0 to liborc-test-0.4.so.0.38.0
  /usr/lib/liborc-0.4.so.0.37.0 moved to /usr/lib/liborc-0.4.so.0.38.0
  /usr/lib/liborc-test-0.4.so.0.37.0 moved to /usr/lib/liborc-test-0.4.so.0.38.0
  /usr/share was removed
  /usr/share/aclocal was removed
  /usr/share/aclocal/orc.m4 was removed

--===============8312893801100757263==--

