Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8763CC07EB9
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8477.1698848702967985255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NerwqyEk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jv0SIMfP;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b8b460bee-bcaf3b01-877d-4ace-92f6-5cffa758d2cc-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IbalHb5uyK16dthgg86OAfvEHw44XSR8f94fgMn1QZw=;
	b=NerwqyEkjtpnRgwwYab2oZRtvH0v5dujXUAcca0OBah5zfm0db+Azi72wT5QVb0z
	kPWUp48he0dPJBjvAIIyEG6/ZwmZCSYpqOFGifE+HR00xONj+f2raS3V8qjCUIGRT32
	7d9rhLszdnPMioWsHXt996xtHlODkJ/Cr+g54KHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848705;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IbalHb5uyK16dthgg86OAfvEHw44XSR8f94fgMn1QZw=;
	b=jv0SIMfPpE5FDY7rC8+erNBqoRdYggR17rpOqUQ8nR4K3DglIskJKtIJcntdkSoQ
	Gq44fNmOmViW830V5otefgU8iQNvDpFgw3RT0dIueVZe8uYd4dJS/mc2ejjHjVU0WgU
	/yGVCOPFrobMTO/lUCI1oYMsmcbWu/Ggrfg2WsQo=
Content-Type: multipart/mixed; boundary="===============0857389300129812452=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 5760ed1f60b39574d8e3ee01d95127074865bf18
 SUCCEEDED
Message-ID: <0101018b8b460bee-bcaf3b01-877d-4ace-92f6-5cffa758d2cc-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189993

--===============0857389300129812452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *5760ed1f60b39574d8e3ee01d95127074865bf18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
From 7f3a9948deae92acb3767a52f403f7beabcd99f3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 12:56:08 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 69294c6c94..c80beb1ae7 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "71c21b1157c4f9a96453bdfcb9f4dda091360afd"
+SRCREV = "5760ed1f60b39574d8e3ee01d95127074865bf18"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr"
 
-- 
2.39.2


--===============0857389300129812452==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA3ZjNhOTk0OGRlYWU5MmFjYjM3NjdhNTJmNDAzZjdiZWFiY2Q5OWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMjo1NjowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBp
Z2xpdDogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3BpZ2xpdC9waWdsaXRfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BpZ2xpdC9waWds
aXRfZ2l0LmJiCmluZGV4IDY5Mjk0YzZjOTQuLmM4MGJlYjFhZTcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9
ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvcGlnbGl0LmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9bWEKICAgICAgICAgICAgIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCi1TUkNSRVYgPSAiNzFjMjFiMTE1N2M0ZjlhOTY0NTNiZGZjYjlmNGRkYTA5MTM2MGFmZCIK
K1NSQ1JFViA9ICI1NzYwZWQxZjYwYjM5NTc0ZDhlM2VlMDFkOTUxMjcwNzQ4NjViZjE4IgogIyAo
d2hlbiBQViBnb2VzIGFib3ZlIDEuMCByZW1vdmUgdGhlIHRyYWlsaW5nIHIpCiBQViA9ICIxLjAr
Z2l0ciIKIAotLSAKMi4zOS4yCgo=

--===============0857389300129812452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22650 to 22661 (+0%)
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_image_dma_buf_import-refcount-multithread /usr/lib/piglit/tests/spec/arb_tessellation_shader/execution/tesslevels-indirect.shader_test /usr/lib/piglit/bin/arb_copy_image-levels-copy /usr/lib/piglit/bin/ext_image_dma_buf_import-modifiers"
packages/core2-64-poky-linux/piglit/piglit: PKGSIZE changed from 2053290878 to 2053363953 (+0%)

--===============0857389300129812452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60
packages/core2-64-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/ext_image_dma_buf_import-refcount-multithread /usr/lib/piglit/bin/arb_copy_image-levels-copy /usr/lib/piglit/bin/ext_image_dma_buf_import-modifiers /usr/lib/piglit/tests/spec/arb_tessellation_shader/execution/tesslevels-indirect.shader_test"
packages/core2-64-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+71c21b1157 to 1.0+gitr0+5760ed1f60

--===============0857389300129812452==--

