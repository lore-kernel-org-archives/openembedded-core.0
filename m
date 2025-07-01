Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53ACC83F2D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.1417.1751386815398132227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZdRFvKEp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JG0mukGk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010197c6ca16c5-36aeb6b8-da12-40d3-80bb-479f92b4d75a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=onQO3DpoXqE3CajXawWAo1FMSS4XNLeDuJNFhbHwL8U=;
	b=ZdRFvKEpOzdZqvzcLMbm6faAIAAN95HdYSMdcGG4HlSssByIv4tBc9a7gjbyz6+x
	piBKQROjbFiAEH9NMhtAxW33AFtN8Swu8Q2OLIABTCQ4FDMXe+3V7dpPxJGAbpJcI/7
	n6SD3lnfdTD3j0sJm0zOaQ+tYsGuEi/JMYuwx0kE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=onQO3DpoXqE3CajXawWAo1FMSS4XNLeDuJNFhbHwL8U=;
	b=JG0mukGka30Xf9tf5iw7NHHwqhBKLSfdoTc95e2knKo9KdMwy3W1sBNub9pjLMJj
	cF3AEm2RiSZ7qXtDZVWSueGDa1rPJ2Mp7q75yeFlm5J6Ssho6bF+12qo4gIEfKKs00u
	BBZ3rCxKfBHuzZUIsRSc9l+o2J8TI9XnSY/qEuuQ=
Content-Type: multipart/mixed; boundary="===============5957502671945943061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.1 SUCCEEDED
Message-ID: <01010197c6ca16c5-36aeb6b8-da12-40d3-80bb-479f92b4d75a-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219662

--===============5957502671945943061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-screen-upgrade-5.0.0-5.0.1.patch
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
From 083f444c5e158fbb8e95b04e41f2f1602403b5ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 11:22:12 +0000
Subject: [PATCH] screen: upgrade 5.0.0 -> 5.0.1

---
 .../screen/{screen_5.0.0.bb => screen_5.0.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.0.bb => screen_5.0.1.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.0.bb b/meta/recipes-extended/screen/screen_5.0.1.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.0.bb
rename to meta/recipes-extended/screen/screen_5.0.1.bb
index fec5663fc2..69f4098519 100644
--- a/meta/recipes-extended/screen/screen_5.0.0.bb
+++ b/meta/recipes-extended/screen/screen_5.0.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971"
+SRC_URI[sha256sum] = "2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d"
 
 inherit autotools-brokensep texinfo
 
-- 
2.47.1


--===============5957502671945943061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.0", added "/usr/bin/screen-5.0.1"

--===============5957502671945943061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-screen-upgrade-5.0.0-5.0.1.patch"

RnJvbSAwODNmNDQ0YzVlMTU4ZmJiOGU5NWIwNGU0MWYyZjE2MDI0MDNiNWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMToyMjoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmVlbjogdXBncmFkZSA1LjAuMCAtPiA1LjAuMQoKLS0tCiAuLi4vc2NyZWVuL3tzY3JlZW5fNS4w
LjAuYmIgPT4gc2NyZWVuXzUuMC4xLmJifSAgICAgICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc2NyZWVuL3tzY3JlZW5fNS4wLjAuYmIgPT4gc2NyZWVuXzUuMC4xLmJifSAo
OTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUu
MC4wLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NjcmVlbi9zY3JlZW5fNS4wLjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NjcmVl
bi9zY3JlZW5fNS4wLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4v
c2NyZWVuXzUuMC4xLmJiCmluZGV4IGZlYzU2NjNmYzIuLjY5ZjQwOTg1MTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUuMC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUuMC4xLmJiCkBAIC0yMCw3ICsyMCw3IEBA
IFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9zY3JlZW4vc2NyZWVuLSR7UFZ9LnRhci5neiBcCiAg
ICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywg
J2ZpbGU6Ly9zY3JlZW4ucGFtJywgJycsIGQpfSBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gImYwNGEzOWQwMGEwZTVjN2M4NmE1NTMzODgwODkwMzA4MmFkNWRmNGQ3M2Rm
MWEyZmQzNDI1OTc2YWVkOTQ5NzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmRhZTM2ZjRkYjM3
OWZmY2QxNGI2OTE1OTZiYTZlYzE4YWMzYTllMjJiYzQ3YWMyMzk3ODlhYjU4NDA5ODY5ZCIKIAog
aW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIHRleGluZm8KIAotLSAKMi40Ny4xCgo=

--===============5957502671945943061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/screen: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/screen/screen-5.0.0.tar.gz file://screen.pam" to "https://ftpmirror.gnu.org/gnu/screen/screen-5.0.1.tar.gz file://screen.pam"
packages/core2-64-poky-linux/screen/screen-dbg: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-dbg: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-dbg: PKGSIZE changed from 1352688 to 1354776 (+0%)
packages/core2-64-poky-linux/screen/screen-dbg: FILELIST: removed "/usr/bin/.debug/screen-5.0.0", added "/usr/bin/.debug/screen-5.0.1"
packages/core2-64-poky-linux/screen/screen-dev: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-dev: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-doc: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-doc: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-doc: PKGSIZE changed from 165722 to 165922 (+0%)
packages/core2-64-poky-linux/screen/screen-locale: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-locale: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-src: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-src: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-src: PKGSIZE changed from 942487 to 944647 (+0%)
packages/core2-64-poky-linux/screen/screen-staticdev: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-staticdev: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen: PKGSIZE changed from 744708 to 744740 (+0%)
packages/core2-64-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.0", added "/usr/bin/screen-5.0.1"

--===============5957502671945943061==--

