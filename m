Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394F1C2FC18
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.174043.1692224350437148824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RqRVGdpE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pEsGRVfY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a006e65b0-cc63f82d-bf0a-4e6a-ba00-4cca598cdf9c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zv4kJPRaaXpChIKDKyGpxsSa6CajrUqi7PSFnrjvQlU=;
	b=RqRVGdpEkeGVIRB5466mjUBfL8KBVB9KZ0yzgL5QLNGzs6MoH+hiciBqy00rDvWa
	pTbvbyR140rG6aSddM79j/GPTN7TLzqRUQmWMj8dI36e49oEi/Ro0fV5ygsiM3/FNB/
	hajWwoZfqM41qZQv4k3Gnplj1xlJOeEt2/y7KwSc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zv4kJPRaaXpChIKDKyGpxsSa6CajrUqi7PSFnrjvQlU=;
	b=pEsGRVfYeW8BIapYWiIkp9vfjgpp/gkfS2xjOH9B9GEwEtG03meE7W31b3piNdmW
	YyjVU1ENAHAj8ULWg71aQiLKvOC+xFECUDAXvUAP+Fx5/b40St4sSIBy+o7Al4thPYb
	WwPjltrgxXvwEfraMgiKnMK04Lhz3xB542zsfUjg=
Content-Type: multipart/mixed; boundary="===============3490451117235645136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.1 SUCCEEDED
Message-ID: <0101018a006e65b0-cc63f82d-bf0a-4e6a-ba00-4cca598cdf9c-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186213

--===============3490451117235645136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.5.0-2.5.1.patch
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
From a474a9cd828147edddcee06b4704f4c000f4833d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 08:57:41 +0000
Subject: [PATCH] sysklogd: upgrade 2.5.0 -> 2.5.1

---
 .../sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
index 096bd376d7..6bfc6772ab 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b6d1ae26671a85e6087c98ec8b630855fc52886a"
+SRCREV = "4b36ea16a3bad76bcef04b58889e1cc23ba6d57d"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============3490451117235645136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 170792 to 170380 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-dev: PKGSIZE changed from 9554 to 9557 (+0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 92563 to 93558 (+1%)
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 149287 to 148991 (-0%)
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.5.0" to "2.5.1"
packages/core2-32-poky-linux/sysklogd/sysklogd: PKGV changed from 2.5.0 [default] to 2.5.1 [default]
packages/core2-32-poky-linux/sysklogd/sysklogd: PV changed from "2.5.0" to "2.5.1"

--===============3490451117235645136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.5.0-2.5.1.patch"

RnJvbSBhNDc0YTljZDgyODE0N2VkZGRjZWUwNmI0NzA0ZjRjMDAwZjQ4MzNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDg6NTc6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjUuMCAtPiAyLjUuMQoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNS4wLmJiID0+IHN5c2tsb2dkXzIuNS4xLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNS4wLmJiID0+IHN5c2tsb2dkXzIu
NS4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjUuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi41LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjUuMS5iYgppbmRleCAwOTZiZDM3NmQ3
Li42YmZjNjc3MmFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNS4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
YjZkMWFlMjY2NzFhODVlNjA4N2M5OGVjOGI2MzA4NTVmYzUyODg2YSIKK1NSQ1JFViA9ICI0YjM2
ZWExNmEzYmFkNzZiY2VmMDRiNTg4ODllMWNjMjNiYTZkNTdkIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjM5LjIKCg==

--===============3490451117235645136==--

