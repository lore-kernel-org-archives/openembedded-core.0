Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B88FC25B57
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.22325.1701436491932272194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AG+O4cwK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=j1B5I+yc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018c25848066-c971596b-86f5-4dae-b538-c994702b689f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D723YTxDKdYHGDAMVXR3iCqe+rd1xuxaL+p1lrUHkXQ=;
	b=AG+O4cwKE/2kuDnYEolqLaNJZPOlBRWliRosQntk/i0azw6tNKDIOxOSfrjJSCQv
	lo3M2g3GYBLgFvlbHVWYl+4FR7isyyzMlo7ghnOh5K/MSFxlUww6M368pEbCm4/sKg3
	3YNQ0AOAe8ZprAVKnm4N6DwO2LN/FJQHA6T/TJ2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D723YTxDKdYHGDAMVXR3iCqe+rd1xuxaL+p1lrUHkXQ=;
	b=j1B5I+ycK8k7LVrd59fywjDgpqjQU7xmPtIlOPnWOpUpv7SvbXZsmM/iB4RUBH/A
	zzZcqBtxpkyZX0cLqaqC+AqatJMHGRJmNnMk3FiHBFAn9vZKThNO4Cd52cb2ZJosgw8
	vzE2kLbufgEVJd98jMpjI53IcMomt/qNrnWdFzqE=
Content-Type: multipart/mixed; boundary="===============7822604708350866794=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] resolvconf: upgrading to 1.92 SUCCEEDED
Message-ID: <0101018c25848066-c971596b-86f5-4dae-b538-c994702b689f-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191598

--===============7822604708350866794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *resolvconf* to *1.92* has Succeeded.

Next steps:
    - apply the patch: git am 0001-resolvconf-upgrade-1.91-1.92.patch
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
From 382158dd454a403a083348ee95a23cafc7863246 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 05:49:44 +0000
Subject: [PATCH] resolvconf: upgrade 1.91 -> 1.92

---
 .../resolvconf/{resolvconf_1.91.bb => resolvconf_1.92.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.91.bb => resolvconf_1.92.bb} (98%)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
similarity index 98%
rename from meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
rename to meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
index 09a0ab7d27..226cb7ee77 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.92.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=un
            file://0001-avoid-using-m-option-for-readlink.patch \
            "
 
-SRCREV = "859209d573e7aec0e95d812c6b52444591a628d1"
+SRCREV = "86047276c80705c51859a19f0c472102e0822f34"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============7822604708350866794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/resolvconf: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-dbg: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-dbg: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-dev: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-dev: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-doc: PKGSIZE changed from 44024 to 44028 (+0%)
packages/core2-64-poky-linux/resolvconf/resolvconf-locale: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-locale: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-src: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-src: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf-staticdev: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf-staticdev: PV changed from "1.91" to "1.92"
packages/core2-64-poky-linux/resolvconf/resolvconf: PKGV changed from 1.91 [default] to 1.92 [default]
packages/core2-64-poky-linux/resolvconf/resolvconf: PV changed from "1.91" to "1.92"

--===============7822604708350866794==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-resolvconf-upgrade-1.91-1.92.patch"

RnJvbSAzODIxNThkZDQ1NGE0MDNhMDgzMzQ4ZWU5NWEyM2NhZmM3ODYzMjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNTo0OTo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
c29sdmNvbmY6IHVwZ3JhZGUgMS45MSAtPiAxLjkyCgotLS0KIC4uLi9yZXNvbHZjb25mL3tyZXNv
bHZjb25mXzEuOTEuYmIgPT4gcmVzb2x2Y29uZl8xLjkyLmJifSAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi97cmVzb2x2Y29uZl8xLjkxLmJiID0+IHJlc29s
dmNvbmZfMS45Mi5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29uZl8xLjkxLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZfMS45Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYvcmVzb2x2Y29u
Zl8xLjkxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Jlc29sdmNvbmYv
cmVzb2x2Y29uZl8xLjkyLmJiCmluZGV4IDA5YTBhYjdkMjcuLjIyNmNiN2VlNzcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvcmVzb2x2Y29uZi9yZXNvbHZjb25mXzEuOTEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9yZXNvbHZjb25mL3Jlc29sdmNvbmZf
MS45Mi5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlhbi5v
cmcvZGViaWFuL3Jlc29sdmNvbmYuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD11bgogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1hdm9pZC11c2luZy1tLW9wdGlvbi1mb3ItcmVhZGxpbmsucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI4NTkyMDlkNTczZTdhZWMwZTk1ZDgxMmM2YjUy
NDQ0NTkxYTYyOGQxIgorU1JDUkVWID0gIjg2MDQ3Mjc2YzgwNzA1YzUxODU5YTE5ZjBjNDcyMTAy
ZTA4MjJmMzQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============7822604708350866794==--

