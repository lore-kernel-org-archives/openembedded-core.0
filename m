Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121BBC18E18
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.22206.1701436492650182311
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Iu/+Ncat;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SMzbAWUH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018c25848947-a5046604-c015-4f6d-b804-693e30947c18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwWhxSpZBMiWJq1LvJR06oxVyp1gVADUf+xjTLBYr2Y=;
	b=Iu/+Ncatope28f4UlpxSXH4Loa6dYIyhrfO7fKyOD1jk6ILyOBNg057j0s76R+Dg
	mGocg3SXBc9VpfuCJpdb0Ek4QyGB3e0jm3rm++ccWwunTfqkGqvSUPHURtbiy3q9/Ht
	ct/DpKKxSQ+e5w3QX3AHRVx5OFaK80n19Mex3/zg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwWhxSpZBMiWJq1LvJR06oxVyp1gVADUf+xjTLBYr2Y=;
	b=SMzbAWUHQc+Ozm7SY9GLhq9TOEqQ4QVE8GDf8BbSIvhrGDC8lJfskP4cRg7Ey6Mx
	nGPg9MArWdUAWt7xQGUskrVmaoVgwnCfSwZ90UEuil/PzmOWZcD9GZuBUX5LYZPXDYY
	FFx5QO2ViXFNLDrbp/CEacN37NoFC1/nqTu1K42g=
Content-Type: multipart/mixed; boundary="===============2662567936518173994=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsolv: upgrading to 0.7.27 SUCCEEDED
Message-ID: <0101018c25848947-a5046604-c015-4f6d-b804-693e30947c18-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191639

--===============2662567936518173994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsolv* to *0.7.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsolv-upgrade-0.7.26-0.7.27.patch
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
From 48721381822965e78e1290a692a9d00409e8536d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 10:43:33 +0000
Subject: [PATCH] libsolv: upgrade 0.7.26 -> 0.7.27

---
 .../libsolv/{libsolv_0.7.26.bb => libsolv_0.7.27.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.26.bb => libsolv_0.7.27.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.26.bb b/meta/recipes-extended/libsolv/libsolv_0.7.27.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.26.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.27.bb
index bae7960138..2ea80c6ce9 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.27.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "48c985375134d2443eee551613161cadc278af2f"
+SRCREV = "0caa2edb94ba228003bf18960e4574256e92f8fb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.2


--===============2662567936518173994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libsolv: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-dbg: PKGSIZE changed from 2745208 to 2742176 (-0%)
packages/core2-64-poky-linux/libsolv/libsolv-dev: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-dev: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-doc: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-doc: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-locale: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-locale: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-src: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-src: PKGSIZE changed from 1646147 to 1644958 (-0%)
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-staticdev: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv-tools: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv-tools: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolv: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolv: PV changed from "0.7.26" to "0.7.27"
packages/core2-64-poky-linux/libsolv/libsolvext: PKGV changed from 0.7.26 [default] to 0.7.27 [default]
packages/core2-64-poky-linux/libsolv/libsolvext: PV changed from "0.7.26" to "0.7.27"

--===============2662567936518173994==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsolv-upgrade-0.7.26-0.7.27.patch"

RnJvbSA0ODcyMTM4MTgyMjk2NWU3OGUxMjkwYTY5MmE5ZDAwNDA5ZTg1MzZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMDo0MzozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvbHY6IHVwZ3JhZGUgMC43LjI2IC0+IDAuNy4yNwoKLS0tCiAuLi4vbGlic29sdi97bGlic29s
dl8wLjcuMjYuYmIgPT4gbGlic29sdl8wLjcuMjcuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlic29sdi97bGlic29sdl8wLjcuMjYuYmIgPT4gbGlic29sdl8wLjcu
MjcuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYv
bGlic29sdl8wLjcuMjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2
XzAuNy4yNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGlic29sdi9saWJzb2x2XzAuNy4yNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8wLjcuMjcuYmIKaW5kZXggYmFlNzk2MDEzOC4uMmVh
ODBjNmNlOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29s
dl8wLjcuMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYnNvbHYvbGlic29sdl8w
LjcuMjcuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL29w
ZW5TVVNFL2xpYnNvbHYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS11dGlscy1Db25zaWRlLW11c2wtd2hlbi13cmFwcGluZy1xc29ydF9y
LnBhdGNoIFwKICIKIAotU1JDUkVWID0gIjQ4Yzk4NTM3NTEzNGQyNDQzZWVlNTUxNjEzMTYxY2Fk
YzI3OGFmMmYiCitTUkNSRVYgPSAiMGNhYTJlZGI5NGJhMjI4MDAzYmYxODk2MGU0NTc0MjU2ZTky
ZjhmYiIKIAogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQr
KSspIgogCi0tIAoyLjM5LjIKCg==

--===============2662567936518173994==--

