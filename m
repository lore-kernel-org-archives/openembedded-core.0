Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0103AC54F85
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.14622.1700059030255471634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AAb6eyuB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=cF4CBquz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a1ea3-6974221d-7e20-4bed-bc55-32b970935709-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qyQ3ODwOWpUP/MMOeLIhCFg/kWL0mgLNxpT1iBw3Diw=;
	b=AAb6eyuBHL1kasGF2W/axFal+ZXfo8qGDNcL+Itu/oohkXO7oLta1M+w3apy449J
	XvhRfm5mkRvcDpLDeRbJk+5WxQh3be1PbhQjdvRRE5Zngvzc95kUPwUufSSQc/9hjH8
	0kIZCxKMrlxYwInIoRwbAiIuDcibQWx78PcvVHtk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qyQ3ODwOWpUP/MMOeLIhCFg/kWL0mgLNxpT1iBw3Diw=;
	b=cF4CBquzawke3YJLQIKqaYrIlJJezRtp5Jd5t3DiDKwHH2IbtFupT/YLg1eh918+
	YwjrkbOobLb8GQ8gqaqGMMsv202/dG0tuhWkvjCa5OMa8QQJk/aYh4GV2ADcYHdbqGU
	jzBqYbw4kJC/CV/36KqjrdnfXGZb0XB5Iu1T/xOU=
Content-Type: multipart/mixed; boundary="===============3118676979203561188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.42.1 SUCCEEDED
Message-ID: <0101018bd36a1ea3-6974221d-7e20-4bed-bc55-32b970935709-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190629

--===============3118676979203561188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.42.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.42.0-2.42.1.patch
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
From 109b25320460465a073bbe01a256c05f02eead44 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 06:31:29 +0000
Subject: [PATCH] git: upgrade 2.42.0 -> 2.42.1

---
 meta/recipes-devtools/git/{git_2.42.0.bb => git_2.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.42.0.bb => git_2.42.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.42.0.bb b/meta/recipes-devtools/git/git_2.42.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.42.0.bb
rename to meta/recipes-devtools/git/git_2.42.1.bb
index c417b11b1e..33269d39a9 100644
--- a/meta/recipes-devtools/git/git_2.42.0.bb
+++ b/meta/recipes-devtools/git/git_2.42.1.bb
@@ -160,4 +160,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "34aedd54210d7216a55d642bbb4cfb22695b7610719a106bf0ddef4c82a8beed"
+SRC_URI[tarball.sha256sum] = "839d75c91ddfa9f7534f7b0888e462e3ad1422bb8ef12ec35f6261cea18efe33"
-- 
2.39.2


--===============3118676979203561188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/git/git-bash-completion: PKGSIZE changed from 82153 to 82222 (+0%)
packages/core2-64-poky-linux/git/git-bash-completion: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-bash-completion: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-dbg: PKGSIZE changed from 90699592 to 90763728 (+0%)
packages/core2-64-poky-linux/git/git-dbg: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-dbg: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-dev: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-dev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-doc: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-doc: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-locale: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-locale: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-perltools: PKGSIZE changed from 273137 to 273158 (+0%)
packages/core2-64-poky-linux/git/git-perltools: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-perltools: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-src: PKGSIZE changed from 9136768 to 9141805 (+0%)
packages/core2-64-poky-linux/git/git-src: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-src: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-staticdev: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-staticdev: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git-tk: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git-tk: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/git: PKGSIZE changed from 23337078 to 23357558 (+0%)
packages/core2-64-poky-linux/git/git: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/git: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git/gitweb: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git/gitweb: PKGV changed from 2.42.0 [default] to 2.42.1 [default]
packages/core2-64-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.42.0.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.42.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-64-poky-linux/git: PV changed from "2.42.0" to "2.42.1"
packages/core2-64-poky-linux/git: PKGV changed from 2.42.0 [default] to 2.42.1 [default]

--===============3118676979203561188==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.42.0-2.42.1.patch"

RnJvbSAxMDliMjUzMjA0NjA0NjVhMDczYmJlMDFhMjU2YzA1ZjAyZWVhZDQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDY6MzE6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi40Mi4wIC0+IDIuNDIuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi40Mi4wLmJiID0+IGdpdF8yLjQyLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuNDIuMC5iYiA9PiBnaXRfMi40Mi4xLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDIuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjQyLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuNDIuMS5iYgppbmRleCBjNDE3YjExYjFl
Li4zMzI2OWQzOWE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjQyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi40Mi4xLmJiCkBA
IC0xNjAsNCArMTYwLDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjM0YWVkZDU0MjEwZDcyMTZh
NTVkNjQyYmJiNGNmYjIyNjk1Yjc2MTA3MTlhMTA2YmYwZGRlZjRjODJhOGJlZWQiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI4MzlkNzVjOTFkZGZhOWY3NTM0ZjdiMDg4OGU0NjJlM2Fk
MTQyMmJiOGVmMTJlYzM1ZjYyNjFjZWExOGVmZTMzIgotLSAKMi4zOS4yCgo=

--===============3118676979203561188==--

