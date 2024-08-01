Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09617C5473B
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.75487.1722536824370817382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=B6B0fOlp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pf3yircR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101910f320af2-ab718dbf-b1d4-4e5c-a5f1-cffd2c74320d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pi2Oumt3N7hk0CFfSkzIC36DjqkJ3IgUyO/IoL4PUQY=;
	b=B6B0fOlpyo7T3o3VDWeDIWq/E+CLqAvpjjO0v0KV7G+eI3mbq1z4By3qTs3SH611
	QpsXtob4D4eR/UqeAxO7/wroBwvRbHaSbfD58lfVK7c9P2TJrNGuwfAqkY5b7LuNk4/
	QkuL0NRz0fv2hDG9bYKreHbndBRg0o1+N+001A3Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536823;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pi2Oumt3N7hk0CFfSkzIC36DjqkJ3IgUyO/IoL4PUQY=;
	b=pf3yircRurxw7h7FBe1eapWk+/I5d5hXh84oAfI5cbQoRTTNQUd/AncsXANz37mI
	kdAJJTsytxp0a93znwGm0A5xIq+hN5R+jE4/nvi1pNK7EWM2J74utGzV+T0TYk1kDF5
	UxEkShzjOc4P3y/fkw7H/FDULVoLGCE/cCECfw/k=
Content-Type: multipart/mixed; boundary="===============8088751522148384130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.10.2 SUCCEEDED
Message-ID: <010101910f320af2-ab718dbf-b1d4-4e5c-a5f1-cffd2c74320d-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202785

--===============8088751522148384130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ccache* to *4.10.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.10.1-4.10.2.patch
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
From 4b9451a0fd9a0a3da41545509ec433f5ee9e2d81 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 09:15:01 +0000
Subject: [PATCH] ccache: upgrade 4.10.1 -> 4.10.2

---
 .../ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.10.1.bb => ccache_4.10.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.10.1.bb b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.10.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.10.2.bb
index 6ae85af4f5..361c1643f9 100644
--- a/meta/recipes-devtools/ccache/ccache_4.10.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.10.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "8f8ad60d9363857812aa8af3fa7fb72be5ea5cf193f824d16d237a8a79256be4"
+SRC_URI[sha256sum] = "108100960bb7e64573ea925af2ee7611701241abb36ce0aae3354528403a7d87"
 
 inherit cmake github-releases
 
-- 
2.44.0


--===============8088751522148384130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.10.1-4.10.2.patch"

RnJvbSA0Yjk0NTFhMGZkOWEwYTNkYTQxNTQ1NTA5ZWM0MzNmNWVlOWUyZDgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwOToxNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNj
YWNoZTogdXBncmFkZSA0LjEwLjEgLT4gNC4xMC4yCgotLS0KIC4uLi9jY2FjaGUve2NjYWNoZV80
LjEwLjEuYmIgPT4gY2NhY2hlXzQuMTAuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9jY2FjaGUve2NjYWNoZV80LjEwLjEuYmIgPT4gY2NhY2hlXzQuMTAuMi5i
Yn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjEwLjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjEwLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NjYWNoZS9jY2FjaGVfNC4xMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Y2NhY2hlL2NjYWNoZV80LjEwLjIuYmIKaW5kZXggNmFlODVhZjRmNS4uMzYxYzE2NDNmOSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9jY2FjaGVfNC4xMC4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuMTAuMi5iYgpAQCAtMTcs
NyArMTcsNyBAQCBERVBFTkRTID0gInpzdGQgZm10IHh4aGFzaCIKIAogU1JDX1VSSSA9ICIke0dJ
VEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7QlB9LnRhci5neiIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjhmOGFkNjBkOTM2Mzg1NzgxMmFhOGFmM2ZhN2ZiNzJiZTVlYTVjZjE5M2Y4
MjRkMTZkMjM3YThhNzkyNTZiZTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTA4MTAwOTYwYmI3
ZTY0NTczZWE5MjVhZjJlZTc2MTE3MDEyNDFhYmIzNmNlMGFhZTMzNTQ1Mjg0MDNhN2Q4NyIKIAog
aW5oZXJpdCBjbWFrZSBnaXRodWItcmVsZWFzZXMKIAotLSAKMi40NC4wCgo=

--===============8088751522148384130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ccache/ccache-dbg: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-dbg: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-dev: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-dev: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-doc: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-doc: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-locale: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-locale: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-src: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-src: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache-staticdev: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache/ccache: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache/ccache: PKGV changed from 4.10.1 [default] to 4.10.2 [default]
packages/core2-64-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases//download/v4.10.1/ccache-4.10.1.tar.gz" to "https://github.com/ccache/ccache/releases//download/v4.10.2/ccache-4.10.2.tar.gz"
packages/core2-64-poky-linux/ccache: PV changed from "4.10.1" to "4.10.2"
packages/core2-64-poky-linux/ccache: PKGV changed from 4.10.1 [default] to 4.10.2 [default]

--===============8088751522148384130==--

