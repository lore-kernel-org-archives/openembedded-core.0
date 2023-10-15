Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAA8C04A97
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.102700.1697399113846607371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LDvluaQz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Xbt2vsIs;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df0c1c-1deb8d12-e8e4-4b10-989a-238cecb26294-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0u2Jgx2ssrRpcuRTHWoI+hQn2JsQqkMeRIHtIqSou5k=;
	b=LDvluaQzST4hNQDp11sEaSRGc5nCA5PEEA2+BnOi4yocxi26UNv9G2t4uAkDh657
	8/FikiXTHTeadmKImgOqLcgShUdP8VeqFPhzgArP2RMyiRPH4jA4CX2GVcKh00CRy5A
	qJtl4TiEX7MtlOm2czMBMsF/dTz3GS1B5QLhMvDw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0u2Jgx2ssrRpcuRTHWoI+hQn2JsQqkMeRIHtIqSou5k=;
	b=Xbt2vsIsadVfmUyXJNl/q+zsU1OiTpDeK/AkOcw7BmyFxfkLkN3VtiVwMy3Li9gJ
	L4nX08nzcl0eBq6mw1m2vIUDBnX00IpSnQgrEehymOX7HciJ0F9nnQZGmjEaDgPDFtK
	Ww1SRzAUUTDOdBpJ/U9h/3Y1BRf+oJpz9NQ9ehWw=
Content-Type: multipart/mixed; boundary="===============0852634736228946744=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnsl2: upgrading to 2.0.1 SUCCEEDED
Message-ID: <0101018b34df0c1c-1deb8d12-e8e4-4b10-989a-238cecb26294-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189205

--===============0852634736228946744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libnsl2* to *2.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnsl2-upgrade-2.0.0-2.0.1.patch
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
From 60910c826a6f0d12b3563585a30a0c4baa358794 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 14:25:37 +0000
Subject: [PATCH] libnsl2: upgrade 2.0.0 -> 2.0.1

---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 7919ef9b24..8cc1f7cec3 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "libtirpc"
 
-PV = "2.0.0"
+PV = "2.0.1"
 
-SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
+SRCREV = "d4b22e54b5e6637a69b26eab5faad2a326c9b182"
 
 SRC_URI = "git://github.com/thkukuk/libnsl;branch=master;protocol=https \
           "
-- 
2.39.2


--===============0852634736228946744==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnsl2-upgrade-2.0.0-2.0.1.patch"

RnJvbSA2MDkxMGM4MjZhNmYwZDEyYjM1NjM1ODVhMzBhMGM0YmFhMzU4Nzk0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTQ6MjU6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJuc2wyOiB1cGdyYWRlIDIuMC4wIC0+IDIuMC4xCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9saWJuc2wvbGlibnNsMl9naXQuYmIgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2xpYm5zbC9saWJuc2wyX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJuc2wv
bGlibnNsMl9naXQuYmIKaW5kZXggNzkxOWVmOWIyNC4uOGNjMWY3Y2VjMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYm5zbC9saWJuc2wyX2dpdC5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbGlibnNsL2xpYm5zbDJfZ2l0LmJiCkBAIC0xMCw5ICsxMCw5IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3
OTAwOGIzNjQ1MTZjIgogU0VDVElPTiA9ICJsaWJzIgogREVQRU5EUyA9ICJsaWJ0aXJwYyIKIAot
UFYgPSAiMi4wLjAiCitQViA9ICIyLjAuMSIKIAotU1JDUkVWID0gIjgyMjQ1YzBjNThhZGQ3OWE4
ZTM0YWIwOTE3MzU4MjE3YTcwZTUxMDAiCitTUkNSRVYgPSAiZDRiMjJlNTRiNWU2NjM3YTY5YjI2
ZWFiNWZhYWQyYTMyNmM5YjE4MiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3Roa3Vr
dWsvbGlibnNsO2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICIKLS0g
CjIuMzkuMgoK

--===============0852634736228946744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libnsl2: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-dbg: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-dbg: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-dbg: PKGSIZE changed from 87096 to 87064 (-0%)
packages/core2-32-poky-linux/libnsl2/libnsl2-dev: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-dev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-doc: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-doc: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-locale: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-locale: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-src: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-src: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2-staticdev: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2-staticdev: PKGV changed from 2.0.0 [default] to 2.0.1 [default]
packages/core2-32-poky-linux/libnsl2/libnsl2: PV changed from "2.0.0" to "2.0.1"
packages/core2-32-poky-linux/libnsl2/libnsl2: PKGV changed from 2.0.0 [default] to 2.0.1 [default]

--===============0852634736228946744==--

