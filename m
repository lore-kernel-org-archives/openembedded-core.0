Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFA5C18E72
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.6040.1689456456215025293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PcQmNdSX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73b023-c5933994-106a-42d2-8af2-fd0de6efdcaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OJS3nOy9LWIV1aOnO0YAvS4O/y2tA7Wh19WCXpUsIn4=;
	b=PcQmNdSXvWWc0fkVrUsvnIpUrXt6M4QfP/wUT1SHOI4rTyRR1NABGLqSboEzhGzN
	YCeoSjJgl2MlzIVrgfsBI4/ObQSZBVwYJ3fYHchhIf+stwLOu+uD78JIkjqrLo9SZQq
	vSSpNS/nleaFodFw7JZUo48uwvd61wU7UYZCaDo0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OJS3nOy9LWIV1aOnO0YAvS4O/y2tA7Wh19WCXpUsIn4=;
	b=ILjyLTfQ8N6AHwS8hg3jOlPK6NrCdmWEM79fzZ0oN12xATmzLIjf4RhOqpmkGkMp
	NnSqbnpgEAo0LdSlC2rbPiCHqxMVEEr4wMdVtstfvqCmI/rubgCiN3WV+OwVSX0GMsf
	v5ieJf1aFgwYgb43b6YI7tBy8Z7ieQ9I8s+kLIrY=
Content-Type: multipart/mixed; boundary="===============1953725658618647261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to ed58dfbd12be34fa3dab97a7a2987b890e0637f1
 SUCCEEDED
Message-ID: <010101895b73b023-c5933994-106a-42d2-8af2-fd0de6efdcaf-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184389

--===============1953725658618647261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *ed58dfbd12be34fa3dab97a7a2987b890e0637f1* has Succeeded.

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
From 635a9e1081bd80b66b374cc3ec97fa56541f59f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 18:22:46 +0000
Subject: [PATCH] piglit: upgrade to latest revision

---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index cd97ee5354..325ed03713 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "5036601c43fff63f7be5cd8ad7b319a5c1f6652c"
+SRCREV = "ed58dfbd12be34fa3dab97a7a2987b890e0637f1"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.39.2


--===============1953725658618647261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+5036601c43 [default] to 1.0+gitrAUTOINC+ed58dfbd12 [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-doc: PKGSIZE changed from 22594 to 22650 (+0%)
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+5036601c43" to "1.0+gitrAUTOINC+ed58dfbd12"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/builtins/glsl-fs-clamp-abs.shader_test /usr/lib/piglit/bin/depth-clear-with-copy /usr/lib/piglit/tests/spec/glsl-1.10/execution/builtins/glsl-fs-clamp-neg.shader_test /usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-pow2-and-zero.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2050727412 to 2050742804 (+0%)

--===============1953725658618647261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+5036601c43 to 1.0+gitr0+ed58dfbd12
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/depth-clear-with-copy /usr/lib/piglit/tests/spec/glsl-1.10/execution/builtins/glsl-fs-clamp-abs.shader_test /usr/lib/piglit/tests/spec/arb_gpu_shader5/execution/built-in-functions/fs-bitfieldInsert-pow2-and-zero.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/builtins/glsl-fs-clamp-neg.shader_test"

--===============1953725658618647261==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA2MzVhOWUxMDgxYmQ4MGI2NmIzNzRjYzNlYzk3ZmE1NjU0MWY1OWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTg6MjI6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCBjZDk3ZWU1MzU0Li4zMjVlZDAzNzEzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gIjUwMzY2MDFjNDNmZmY2M2Y3YmU1Y2Q4YWQ3YjMxOWE1YzFmNjY1MmMi
CitTUkNSRVYgPSAiZWQ1OGRmYmQxMmJlMzRmYTNkYWI5N2E3YTI5ODdiODkwZTA2MzdmMSIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============1953725658618647261==--

