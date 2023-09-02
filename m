Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C4ACCF970
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.5723.1693650552678996678
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HczISukW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=a+75EUS9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a55708d40-ff19487a-5239-41b2-aa33-d14a7d59d508-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JKVBhYHaviZARaHHo5kda5gLWJjiG9mRW/QhbLvBcz4=;
	b=HczISukWTzSAuYCiEkg3muBWSBtvnIAlAKCctwl43IpPAa2GNF65SXVo3/BLR5uX
	IL2W4GkmSJuRZU1E8XsBkEmF5zMYkKj0M478DeINiOzmxUHdwu2Ml3F+U0Y38W7XRQ3
	uw7ZrCxrLA6NLl2d9EI4e0Ifp59/NyEJqU/VHEpU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JKVBhYHaviZARaHHo5kda5gLWJjiG9mRW/QhbLvBcz4=;
	b=a+75EUS9f3OomHKGlrsyNbqj9X0k89MDmMaBw7xwQ9jvaYEBVwmCcd4FT1nY7Uvw
	TmrzJXOkUi8pJusSpgRM6y6MGGRBM44s9V+PyqCuXGZeCnsXSYuFMORm2DOhVcDtGkH
	Z01X65Nfoc15BgA6O2+sy0OWlpNZV3xvoy1+OYPk=
Content-Type: multipart/mixed; boundary="===============2295715354477389890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libconvert-asn1-perl: upgrading to 0.34 SUCCEEDED
Message-ID: <0101018a55708d40-ff19487a-5239-41b2-aa33-d14a7d59d508-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187095

--===============2295715354477389890==
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
From 038a04ae8edc5baac3e2cd2eb3eba8ce2f806ab2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 20:37:39 +0000
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


--===============2295715354477389890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libconvert-asn1-perl: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl: SRC_URI changed from "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.33.tar.gz file://ptest-perl/run-ptest" to "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-0.34.tar.gz file://ptest-perl/run-ptest"
packages/core2-32-poky-linux/libconvert-asn1-perl: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dbg: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-dev: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PKGSIZE changed from 17915 to 17916 (+0%)
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-doc: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-locale: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-ptest: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-src: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl-staticdev: PV changed from "0.33" to "0.34"
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGV changed from 0.33 [default] to 0.34 [default]
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PKGSIZE changed from 83491 to 83571 (+0%)
packages/core2-32-poky-linux/libconvert-asn1-perl/libconvert-asn1-perl: PV changed from "0.33" to "0.34"

--===============2295715354477389890==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libconvert-asn1-perl-upgrade-0.33-0.34.patch"

RnJvbSAwMzhhMDRhZThlZGM1YmFhYzNlMmNkMmViM2ViYThjZTJmODA2YWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMDozNzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNvbnZlcnQtYXNuMS1wZXJsOiB1cGdyYWRlIDAuMzMgLT4gMC4zNAoKLS0tCiAuLi5pYmNvbnZl
cnQtYXNuMS1wZXJsXzAuMzMuYmIgPT4gbGliY29udmVydC1hc24xLXBlcmxfMC4zNC5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC97bGliY29udmVydC1hc24xLXBlcmxfMC4zMy5i
YiA9PiBsaWJjb252ZXJ0LWFzbjEtcGVybF8wLjM0LmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzMuYmIgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9saWJjb252ZXJ0LWFzbjEtcGVybF8wLjM0LmJiCnNp
bWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wZXJs
L2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRl
bmRlZC9wZXJsL2xpYmNvbnZlcnQtYXNuMS1wZXJsXzAuMzQuYmIKaW5kZXggZDgyNjkyYzAzMy4u
NmU5Zjg4MTc3MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BlcmwvbGliY29u
dmVydC1hc24xLXBlcmxfMC4zMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGVybC9s
aWJjb252ZXJ0LWFzbjEtcGVybF8wLjM0LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9SRUFETUUubWQ7YmVnaW5saW5lPTkxO2VuZGxpbmU9OTc7bWQ1PWNlZmY3
ZmQyODZlYjZkOAogCiBTUkNfVVJJID0gImh0dHBzOi8vY3Bhbi5tZXRhY3Bhbi5vcmcvYXV0aG9y
cy9pZC9UL1RJL1RJTUxFR0dFL0NvbnZlcnQtQVNOMS0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICIxZmRmMDA0NTIwYzc5ZTNhMjQ0Y2Y5Njg4NjE2MjkzNTE2YzExNzkzZDc0
NmM3NjFmMzY3NDk2ZWIzZDA2MDc2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE2MjhkN2M5ZDM5
MDU2OGZiNzYzNTk5NzVmYTAzZjYyNmNlNTdmMTBkYzE3OTgwZThlMzU4N2Q3NzEzZTRlZTciCiAK
IFMgPSAiJHtXT1JLRElSfS9Db252ZXJ0LUFTTjEtJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============2295715354477389890==--

