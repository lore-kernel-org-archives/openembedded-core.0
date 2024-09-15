Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C07AC3601D
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.115634.1726410840479636390
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ISUOiiRP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nA+FfTPk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010191f61ad9f7-70149900-193d-45ae-9844-66a28e86c6fa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n9KBNtCCeYL37m/BsScZhFGtWRYZQXcMTsWdENOOtMc=;
	b=ISUOiiRPenRnjFiOLUChcdX5mmQdfgn9JZLOg4e0xZu2FrNBN81FD9s/Sj+Z3YI4
	9gkJ8MCJIec280uE1ylUIYif/F53ik5PqZEGec7tHUti/bW7KnYguJaGgwHqP0jmB6X
	U6Rb+SyrAajjBJrjDlt14WNGiZv4cekrXe5x10hc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n9KBNtCCeYL37m/BsScZhFGtWRYZQXcMTsWdENOOtMc=;
	b=nA+FfTPku/InSjGP5HCw46z4GBjjTu7TLZnfREpPNk4R7ikxTgOCKaaQuAwb0bRu
	EJKMdF+cUWZ6gBUkHkm3XGS9b6K63RcIL12+dJ/jlriu24CgP9PwSZYaMW3yOpHFRS8
	IYLYdZRKi0Yt4Pcn18nVhELLdFZZ7WK1CATIjpB0=
Content-Type: multipart/mixed; boundary="===============2132319487233985621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.8.1 SUCCEEDED
Message-ID: <01010191f61ad9f7-70149900-193d-45ae-9844-66a28e86c6fa-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204534

--===============2132319487233985621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.8.0-4.8.1.patch
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
From 57c4486c31e06676846e8a6767af328b984a04a9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 09:13:00 +0000
Subject: [PATCH] python3-scons: upgrade 4.8.0 -> 4.8.1

---
 .../python/{python3-scons_4.8.0.bb => python3-scons_4.8.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.8.0.bb => python3-scons_4.8.1.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.8.0.bb b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-scons_4.8.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.8.1.bb
index b1348665e0..4564aa368f 100644
--- a/meta/recipes-devtools/python/python3-scons_4.8.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.8.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "2c7377ff6a22ca136c795ae3dc3d0824696e5478d1e4940f2af75659b0d45454"
+SRC_URI[sha256sum] = "5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa"
 UPSTREAM_CHECK_PYPI_PACKAGE = "SCons"
 
 inherit pypi python_setuptools_build_meta
-- 
2.44.0


--===============2132319487233985621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.8.0-4.8.1.patch"

RnJvbSA1N2M0NDg2YzMxZTA2Njc2ODQ2ZThhNjc2N2FmMzI4Yjk4NGEwNGE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDk6MTM6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuOC4wIC0+IDQuOC4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc2NvbnNfNC44LjAuYmIgPT4gcHl0aG9uMy1zY29uc180LjguMS5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2NvbnNfNC44LjAuYmIgPT4gcHl0
aG9uMy1zY29uc180LjguMS5iYn0gKDg5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC44LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC44LjEuYmIKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNf
NC44LjEuYmIKaW5kZXggYjEzNDg2NjVlMC4uNDU2NGFhMzY4ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjguMS5iYgpAQCAtNCw3ICs0
LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQ5MDNiMGI4MDI3ZjQ2MTQwMmJhYzliNTE2
OWIzNmY3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmM3Mzc3ZmY2YTIyY2ExMzZjNzk1YWUz
ZGMzZDA4MjQ2OTZlNTQ3OGQxZTQ5NDBmMmFmNzU2NTliMGQ0NTQ1NCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1YjY0MTM1NzkwNGQyZjU2ZjdiZmRiYjM3ZTE2NWFiOTk2YjYxNDNjOTQ4YjlkZjBl
ZmM3MzA1ZjU0OTQ5ZGFhIgogVVBTVFJFQU1fQ0hFQ0tfUFlQSV9QQUNLQUdFID0gIlNDb25zIgog
CiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQotLSAKMi40NC4wCgo=

--===============2132319487233985621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.8.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.8.1.dist-info

--===============2132319487233985621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.8.0.tar.gz;downloadfilename=scons-4.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.8.1.tar.gz;downloadfilename=scons-4.8.1.tar.gz"
packages/core2-64-poky-linux/python3-scons: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 22092219 to 22098097 (+0%)
packages/core2-64-poky-linux/python3-scons/python3-scons: PV changed from "4.8.0" to "4.8.1"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGV changed from 4.8.0 [default] to 4.8.1 [default]
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.12/site-packages/SCons-4.8.0.dist-info moved to /usr/lib/python3.12/site-packages/SCons-4.8.1.dist-info

--===============2132319487233985621==--

