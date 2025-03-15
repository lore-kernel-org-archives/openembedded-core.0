Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3240BC35FF8
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:31 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.10362.1742048296642557333
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MgOmPOsg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Q5wrTkTT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101959a2ba1dc-cec7893b-7a19-4dc4-b4d5-dee05e0f2127-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UyxQm06McwlN+pKzB7M2PPyWdlGMcS6tzaoCNeylp+4=;
	b=MgOmPOsgNoomCP1KGCRJGnHvonFkeF6Dn8f/zhq7JigrN1lTSTcd2TUzJUaOmrn9
	N6wLnjhM2deO99U7jev7zwmcjDV33p5C7A8KuD0eK1hu72VIYf0f/d7Xj9Vj2TMQpOp
	HTw3L8Vxf6n8u6G7k9l9pQHGFGvpUjLki3hUdM5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048305;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UyxQm06McwlN+pKzB7M2PPyWdlGMcS6tzaoCNeylp+4=;
	b=Q5wrTkTTCBcoTlp+zPnU7T3N2+iAPcFSorxlXfylEXQpslgKVFvJp3Fgjlv6q7WC
	QilolOSAyBMt/r2BhnN8eOW6ufa3Fj98NtZlJ2Jt/KIQoFMsvE4kDMdmcZmd1ROUNN5
	+pRd6NulBtiwhiw5rj5KnSBBAPJ6FJFVq0YgIzM8=
Content-Type: multipart/mixed; boundary="===============5170299454432578010=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.7.1 SUCCEEDED
Message-ID: <010101959a2ba1dc-cec7893b-7a19-4dc4-b4d5-dee05e0f2127-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212938

--===============5170299454432578010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sysklogd* to *2.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysklogd-upgrade-2.7.0-2.7.1.patch
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
From 92099ca70e4e94641515a49bff3668de9dc12726 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 10:35:11 +0000
Subject: [PATCH] sysklogd: upgrade 2.7.0 -> 2.7.1

---
 .../sysklogd/{sysklogd_2.7.0.bb => sysklogd_2.7.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.7.0.bb => sysklogd_2.7.1.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
index af8abb56b4..b7e3254277 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.7.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.7.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b45eb487b96935c72fc997d840f82ecf650ed8a5"
+SRCREV = "5552a3ea0d025573a5e212d62ee3e04bd376c7c4"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============5170299454432578010==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysklogd-upgrade-2.7.0-2.7.1.patch"

RnJvbSA5MjA5OWNhNzBlNGU5NDY0MTUxNWE0OWJmZjM2NjhkZTlkYzEyNzI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTA6MzU6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXNrbG9nZDogdXBncmFkZSAyLjcuMCAtPiAyLjcuMQoKLS0tCiAuLi4vc3lza2xvZ2Qve3N5c2ts
b2dkXzIuNy4wLmJiID0+IHN5c2tsb2dkXzIuNy4xLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qve3N5c2tsb2dkXzIuNy4wLmJiID0+IHN5c2tsb2dkXzIu
Ny4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9n
ZC9zeXNrbG9nZF8yLjcuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNr
bG9nZF8yLjcuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvc3lza2xvZ2Qvc3lza2xvZ2RfMi43LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9zeXNrbG9nZC9zeXNrbG9nZF8yLjcuMS5iYgppbmRleCBhZjhhYmI1NmI0
Li5iN2UzMjU0Mjc3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lza2xvZ2Qv
c3lza2xvZ2RfMi43LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c2tsb2dkL3N5
c2tsb2dkXzIuNy4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHVi
LmNvbS90cm9nbG9iaXQvc3lza2xvZ2QuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMK
ICAgICAgICAgICAgZmlsZTovL3N5c2tsb2dkIFwKICAgICAgICAgICAgIgogCi1TUkNSRVYgPSAi
YjQ1ZWI0ODdiOTY5MzVjNzJmYzk5N2Q4NDBmODJlY2Y2NTBlZDhhNSIKK1NSQ1JFViA9ICI1NTUy
YTNlYTBkMDI1NTczYTVlMjEyZDYyZWUzZTA0YmQzNzZjN2M0IgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgogCi0tIAoyLjQ0LjEKCg==

--===============5170299454432578010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/sysklogd: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGSIZE changed from 253864 to 252928 (-0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dbg: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-dev: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGSIZE changed from 110465 to 111015 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-doc: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-locale: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGSIZE changed from 168340 to 168752 (+0%)
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-src: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd-staticdev: PKGV changed from 2.7.0 [default] to 2.7.1 [default]
packages/core2-64-poky-linux/sysklogd/sysklogd: PV changed from "2.7.0" to "2.7.1"
packages/core2-64-poky-linux/sysklogd/sysklogd: PKGV changed from 2.7.0 [default] to 2.7.1 [default]

--===============5170299454432578010==--

