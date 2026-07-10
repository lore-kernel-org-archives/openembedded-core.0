Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5132EC4450E
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:34 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7999.1783669769776342025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=oh3injpx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=zPldmDut;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019f4b00c36b-251d3b87-7e2d-4e99-981f-80b580a54578-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fTpKhfT08wAS/q1FKG2P8/nA7w35NB+g+4hxlMmVTbo=;
	b=oh3injpxhglUau+nZkg+Klw9KJHI6H/hvfv7WNQb5a9KJQlY8EvCDoQ8uRaZ9QCr
	v3AZtoZ0mhpinSZE9Q/RUsXQkTKP8lt0YDmF7cdrInWtAEJrO7gpz6ncBvMsMEpzJOm
	xjjdEkWmzUx7RQ9g1JT24apyDedF82Z9Y46CJ4HI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fTpKhfT08wAS/q1FKG2P8/nA7w35NB+g+4hxlMmVTbo=;
	b=zPldmDutA+eg/O6HfGJQNlyEl7HJGtiMxX/nGMDxiXF+Lt7SrA1rQXbn/FNwx6dF
	pSh1Sik45uvC/QypXAPXRtsVLF320wsEd0Ab4bdih68N5Euf+I4qIj6bUIy5tRXmpZ8
	KthGDR8jnUWq/bnZPjrjjzg5qSrMneuNKpbxVajY=
Content-Type: multipart/mixed; boundary="===============0454504517360509451=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-build: upgrading to 1.5.1 SUCCEEDED
Message-ID: <0101019f4b00c36b-251d3b87-7e2d-4e99-981f-80b580a54578-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240606

--===============0454504517360509451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-build* to *1.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-build-upgrade-1.5.0-1.5.1.patch
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
From c4d9008fe0f0d8aa3fd10e8afa91147379f5edec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 06:02:15 +0000
Subject: [PATCH] python3-build: upgrade 1.5.0 -> 1.5.1

---
 .../python/{python3-build_1.5.0.bb => python3-build_1.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-build_1.5.0.bb => python3-build_1.5.1.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-build_1.5.0.bb b/meta/recipes-devtools/python/python3-build_1.5.1.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-build_1.5.0.bb
rename to meta/recipes-devtools/python/python3-build_1.5.1.bb
index e263e29383..dd741cb862 100644
--- a/meta/recipes-devtools/python/python3-build_1.5.0.bb
+++ b/meta/recipes-devtools/python/python3-build_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/build"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
 
-SRC_URI[sha256sum] = "302c22c3ba2a0fd5f3911918651341ebb3896176cbdec15bd421f80b1afc7647"
+SRC_URI[sha256sum] = "94e17f1db803ab22f46049376c44c8437c52090f0dfdf1adc43df56542d644fb"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============0454504517360509451==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-build-upgrade-1.5.0-1.5.1.patch"

RnJvbSBjNGQ5MDA4ZmUwZjBkOGFhM2ZkMTBlOGFmYTkxMTQ3Mzc5ZjVlZGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDY6MDI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJ1aWxkOiB1cGdyYWRlIDEuNS4wIC0+IDEuNS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtYnVpbGRfMS41LjAuYmIgPT4gcHl0aG9uMy1idWlsZF8xLjUuMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYnVpbGRfMS41LjAuYmIgPT4gcHl0
aG9uMy1idWlsZF8xLjUuMS5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS41LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRfMS41LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNS4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYnVpbGRf
MS41LjEuYmIKaW5kZXggZTI2M2UyOTM4My4uZGQ3NDFjYjg2MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJ1aWxkXzEuNS4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1idWlsZF8xLjUuMS5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5cGEvYnVpbGQiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTMxMDQzOWFm
Mjg3YjBmYjQ3ODBiMmFkNjkwN2MyNTZjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzAyYzIy
YzNiYTJhMGZkNWYzOTExOTE4NjUxMzQxZWJiMzg5NjE3NmNiZGVjMTViZDQyMWY4MGIxYWZjNzY0
NyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5NGUxN2YxZGI4MDNhYjIyZjQ2MDQ5Mzc2YzQ0Yzg0
MzdjNTIwOTBmMGRmZGYxYWRjNDNkZjU2NTQyZDY0NGZiIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X2ZsaXRfY29yZQogCi0tIAoyLjQ3LjEKCg==

--===============0454504517360509451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 173481 to 218453 (+26%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.5.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.5.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info

--===============0454504517360509451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-build: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/build/build-1.5.0.tar.gz;downloadfilename=build-1.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/build/build-1.5.1.tar.gz;downloadfilename=build-1.5.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-build: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dbg: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-dev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-doc: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-locale: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-src: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build-staticdev: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
packages/x86-64-v3-poky-linux/python3-build/python3-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/build-1.5.0.dist-info -> /usr/lib/python3.14/site-packages/build-1.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/build-1.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/build-1.5.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-build/python3-build: PV changed from "1.5.0" to "1.5.1"
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGSIZE changed from 173481 to 218453 (+26%)
packages/x86-64-v3-poky-linux/python3-build/python3-build: PKGV changed from 1.5.0 [default] to 1.5.1 [default]
Changes to packages/x86-64-v3-poky-linux/python3-build (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.0.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.1.dist-info

--===============0454504517360509451==--

