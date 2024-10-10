Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F8ECFD314
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:55 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.53271.1728588950418991073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gBxlfKUn;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=uKce4V+o;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019277ee3b14-885ad11a-ab13-45a7-bb98-9cd7e0c8e936-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xNplSAo1pplMgYDMcUejWMS4XSEU33JNXfyIyumP75o=;
	b=gBxlfKUn13o8feXWkVmVYo/BcOr+1+V44Q0SvJ1fcIi/eT4fJOl7tAr8S4YJyw+9
	JyEQ19hoxV1LsUYprZ+bPGuGe+yoEI5h8KCRyHHn8cWAmvNENQxCZIPbe29NOS7QTfy
	cyQokAGo2UmRXfWWLVhjwogebcgNB/Z4EEJmEviU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588954;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xNplSAo1pplMgYDMcUejWMS4XSEU33JNXfyIyumP75o=;
	b=uKce4V+oWN9twpAxo1aJd0VD7MrZg4KxdwsY0qVN9V6YYJ8aeLPGo0ZxHViUTBQl
	eLH3R+yqLlArY5OoTILq7F4kTLmZ96/16neSopnqQfGdEO1Z+WcKc8I/IRdby6i6Rrd
	YlgvxhqaXhjOZxfiHFf28PVu5cANdqPIR8yq9zDI=
Content-Type: multipart/mixed; boundary="===============6318381636811645199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.2 SUCCEEDED
Message-ID: <0101019277ee3b14-885ad11a-ab13-45a7-bb98-9cd7e0c8e936-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205477

--===============6318381636811645199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.1-1.8.2.patch
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
From 6f0de3193ea5c450c1174a56b466bbe2e3e433a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 00:57:42 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.1 -> 1.8.2

---
 .../erofs-utils/{erofs-utils_1.8.1.bb => erofs-utils_1.8.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.1.bb => erofs-utils_1.8.2.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
index 50d6e3b38e..4d8689f87c 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.1.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "ddbed14463fb798eff71fd4d4395357eb598e175"
+SRCREV = "8bedd862edfbb9a5e54dd37abede29020dd8fdfb"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.44.1


--===============6318381636811645199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.1-1.8.2.patch"

RnJvbSA2ZjBkZTMxOTNlYTVjNDUwYzExNzRhNTZiNDY2YmJlMmUzZTQzM2E3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDA6NTc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cm9mcy11dGlsczogdXBncmFkZSAxLjguMSAtPiAxLjguMgoKLS0tCiAuLi4vZXJvZnMtdXRpbHMv
e2Vyb2ZzLXV0aWxzXzEuOC4xLmJiID0+IGVyb2ZzLXV0aWxzXzEuOC4yLmJifSAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMve2Vyb2ZzLXV0aWxzXzEuOC4xLmJiID0+IGVy
b2ZzLXV0aWxzXzEuOC4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRp
bHNfMS44LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9l
cm9mcy11dGlsc18xLjguMi5iYgppbmRleCA1MGQ2ZTNiMzhlLi40ZDg2ODlmODdjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS44LjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEu
OC4yLmJiCkBAIC01LDcgKzUsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT03MzAwMWQ4MDRlYTFlM2Q4NDM2NWY2NTIyNDJjY2EyMCIK
IEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdC90cmVlL1JFQURNRSIKIAotU1JDUkVWID0gImRkYmVk
MTQ0NjNmYjc5OGVmZjcxZmQ0ZDQzOTUzNTdlYjU5OGUxNzUiCitTUkNSRVYgPSAiOGJlZGQ4NjJl
ZGZiYjlhNWU1NGRkMzdhYmVkZTI5MDIwZGQ4ZmRmYiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hpYW5nL2Vyb2ZzLXV0aWxzLmdpdDti
cmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdF
WCA9ICJ2KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCi0tIAoyLjQ0LjEKCg==

--===============6318381636811645199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 1640400 to 1647592 (+0%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 11696 to 12187 (+4%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGSIZE changed from 554033 to 558629 (+1%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 455896 to 455992 (+0%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.1 [default] to 1.8.2 [default]
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.8.1" to "1.8.2"
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.8.1 [default] to 1.8.2 [default]

--===============6318381636811645199==--

