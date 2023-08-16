Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B888C2FC14
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.174044.1692224350664665775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VlWmFWQ9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KDWXNvLA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018a006e66e0-27cc02f9-1cc8-40b8-a2b7-84a08de681ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6Lx9MWY0jETLugZECsRBAVxxGbGwGxtSVIEGc4RRyDo=;
	b=VlWmFWQ9RD9v8cq7LedAn2dLM4k7xXETP29S1hMKEcCW9rdwOIFM5yjJdOJ/rxjd
	eMhT4DzKeRZTm1XA5AmKOihVmVg/hv0ngSFm4GJHzAbYA8y3Y6Z0eHHKqrTSJ2Sf7eN
	O2mzgKTYj2FAZFhXcDeXTFaRqiJi9NRPMkfAEOzo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6Lx9MWY0jETLugZECsRBAVxxGbGwGxtSVIEGc4RRyDo=;
	b=KDWXNvLAQv6Ha0boA9sUQWCxCc2JULJ/Mu1ZCMHTiBiSiZp9bYMCVQ+Kx9oJ/Em6
	0ip+wrvnZACYYf0QxiwvCaUjAwnojZMgZgEvt2OjN4xzjl2XNc7u7Jg1XQzRram4qtZ
	2sJ+XKF0/OnGkKCi5opQV57zzFGCXHiA2597nF34=
Content-Type: multipart/mixed; boundary="===============5307888379140946338=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconvert-asn1-perl: upgrading to 0.34 SUCCEEDED
Message-ID: <0101018a006e66e0-27cc02f9-1cc8-40b8-a2b7-84a08de681ea-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186217

--===============5307888379140946338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libconvert-asn1-perl* to *0.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libconvert-asn1-perl-upgrade-0.33-0.34.patch
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
From 6bfcb3310da463ead26894a7a55006aa560883ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 08:39:46 +0000
Subject: [PATCH] libconvert-asn1-perl: upgrade 0.33 -> 0.34

---
 ...ibconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index d82692c033..6e9f881773 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076"
+SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
2.39.2


--===============5307888379140946338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libconvert-asn1-perl: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.33.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.34.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGSIZE changed from 17915 to 17916 (+0%)
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGSIZE changed from 83491 to 83571 (+0%)
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGV changed from 0.33 [default] to 0.34 [default]

--===============5307888379140946338==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconvert-asn1-perl-upgrade-0.33-0.34.patch"

RnJvbSA2YmZjYjMzMTBkYTQ2M2VhZDI2ODk0YTdhNTUwMDZhYTU2MDg4M2VmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDg6Mzk6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjb252ZXJ0LWFzbjEtcGVybDogdXBncmFkZSAwLjMzIC0+IDAuMzQKCi0tLQogLi4uaWJjb252
ZXJ0LWFzbjEtcGVybF8wLjMzLmJiID0+IGxpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzQuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Blcmwve2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzMu
YmIgPT4gbGliY29udmVydC1hc24xLXBlcmxfMC4zNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjMzLmJiIGIv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGliY29udmVydC1hc24xLXBlcmxfMC4zNC5iYgpz
aW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVy
bC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjMzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjM0LmJiCmluZGV4IGQ4MjY5MmMwMzMu
LjZlOWY4ODE3NzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNv
bnZlcnQtYXNuMS1wZXJsXzAuMzMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Blcmwv
bGliY29udmVydC1hc24xLXBlcmxfMC4zNC5iYgpAQCAtNyw3ICs3LDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vUkVBRE1FLm1kO2JlZ2lubGluZT05MTtlbmRsaW5lPTk3O21kNT1jZWZm
N2ZkMjg2ZWI2ZDgKIAogU1JDX1VSSSA9ICJodHRwczovL2NwYW4ubWV0YWNwYW4ub3JnL2F1dGhv
cnMvaWQvVC9USS9USU1MRUdHRS9Db252ZXJ0LUFTTjEtJHtQVn0udGFyLmd6IgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMWZkZjAwNDUyMGM3OWUzYTI0NGNmOTY4ODYxNjI5MzUxNmMxMTc5M2Q3
NDZjNzYxZjM2NzQ5NmViM2QwNjA3NiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNjI4ZDdjOWQz
OTA1NjhmYjc2MzU5OTc1ZmEwM2Y2MjZjZTU3ZjEwZGMxNzk4MGU4ZTM1ODdkNzcxM2U0ZWU3Igog
CiBTID0gIiR7V09SS0RJUn0vQ29udmVydC1BU04xLSR7UFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============5307888379140946338==--

