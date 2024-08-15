Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE17C54736
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.131109.1723748335314807613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IRkupgdw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=qux8qrxl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019157683c92-9d260502-c549-4c8f-a9e8-07960d1b1cd9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gzfprb9F1XN3NToe8mpn/aBOzeSc3ixDPyuK6T21Oew=;
	b=IRkupgdw+7iVEzk/sah1Sx0LkDkI7PzaqYh6HaNSHtjH9STziOiX0ZYrFzXliNSc
	HxRBf1bgQLxeFPhovmCmTSVxdU/EeGVHeJLGGCaumgSd9XkVF3xAf2xkVuhojq345bP
	IRkBeY3dgQrHSgV7XwwMwhOF+XMizLJRrZZN0N6w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748334;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gzfprb9F1XN3NToe8mpn/aBOzeSc3ixDPyuK6T21Oew=;
	b=qux8qrxlxWCimbwvlSUm/ddm3gVtfjexOEpk62KYjfCfZSgoIoPfyxVAmkEkfKGp
	DhvJds0R4TLHEU7d2KV0ZclxPrLjQhFJYJU0eWynsKbHo92G8OlFP8srj4ARF5zhrWo
	wA8aYL1YayUBs4zp7pQoph1W697VQmIFtRr1DQzQ=
Content-Type: multipart/mixed; boundary="===============8727868473197787598=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.6.1 SUCCEEDED
Message-ID: <0101019157683c92-9d260502-c549-4c8f-a9e8-07960d1b1cd9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203394

--===============8727868473197787598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.6.0-2.6.1.patch
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
From 00b6a7d99a98dbbaf6391a212a4c921970e715d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 13:35:12 +0000
Subject: [PATCH] sysklogd: upgrade 2.6.0 -> 2.6.1

---
 .../sysklogd/{sysklogd_2.6.0.bb => sysklogd_2.6.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.6.0.bb => sysklogd_2.6.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
index ab0581ec8c..99454b8230 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.6.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.6.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "6b44b9822e8551114e1ed38c38c51b8e95188599"
+SRCREV = "c2bc519697aaa94f7b5e658a31ff55b9d54e7c8d"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============8727868473197787598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 207512 to 207544 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 96825 to 97164 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 149881 to 149954 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.6.0" to "2.6.1"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.6.0 [default] to 2.6.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.6.0" to "2.6.1"

--===============8727868473197787598==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.6.0-2.6.1.patch"

RnJvbSAwMGI2YTdkOTlhOThkYmJhZjYzOTFhMjEyYTRjOTIxOTcwZTcxNWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTM6MzU6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjYuMCAtPiAyLjYuMQoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNi4wLmJiID0+IHN5c2tsb2dkXzIuNi4xLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNi4wLmJiID0+IHN5c2tsb2dkXzIu
Ni4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjYuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi42LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjYuMS5iYgppbmRleCBhYjA1ODFlYzhj
Li45OTQ1NGI4MjMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi42LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNi4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
NmI0NGI5ODIyZTg1NTExMTRlMWVkMzhjMzhjNTFiOGU5NTE4ODU5OSIKK1NSQ1JFViA9ICJjMmJj
NTE5Njk3YWFhOTRmN2I1ZTY1OGEzMWZmNTViOWQ1NGU3YzhkIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjQ0LjAKCg==

--===============8727868473197787598==--

