Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D93ACD98DA
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50601.1781195492677805375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c32ImKMF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HcDfYn7O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019eb7865726-cb9d14fc-dc87-4d15-b2bd-3f88a93bbd90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L5h+ipoUJnq1swoQvr/6UkyIhwHRSXggtS4yOePYa2s=;
	b=c32ImKMFPhz7DIKC7Wz2W7v/AiT2IEaLa/Et1OGeFzwfDbIqVsS6noSNpmshJiU0
	PmF9KMlTLaxJofeA59nUq4jPMYpJA6szaRbA7xkBxakkktKUPg5nMO1ssQOaDySpW6w
	AHmWf2jJwb1h9qMUYJicwBAic1xG+/Rk170F6HVc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195495;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L5h+ipoUJnq1swoQvr/6UkyIhwHRSXggtS4yOePYa2s=;
	b=HcDfYn7OiPpMxnXgGu0lrobed6rJSt2EltbvVTXPt0pF6iDllYGNkH4OOLQQqawt
	Gw9ai0Ni2rJb31QAvBd0OkyAHnpRPFBhtO4vYMFLOpgelKczAf7wIHXwhmKCiXxnYDO
	1aekMWq+aa2MAng6Hml90XFnN4hThB+rzKUNRixY=
Content-Type: multipart/mixed; boundary="===============7105523560250521631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] mkfontscale: upgrading to 1.2.4 SUCCEEDED
Message-ID: <0101019eb7865726-cb9d14fc-dc87-4d15-b2bd-3f88a93bbd90-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238456

--===============7105523560250521631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mkfontscale* to *1.2.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mkfontscale-upgrade-1.2.3-1.2.4.patch
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
From b0242866e396ac11685b2ea47f0651cb99131f32 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 07:48:30 +0000
Subject: [PATCH] mkfontscale: upgrade 1.2.3 -> 1.2.4

---
 .../xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
index aa79902a34..42867db65d 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
@@ -18,4 +18,4 @@ BBCLASSEXTEND = "native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
+SRC_URI[sha256sum] = "a01492a17a9b6c0ee3f92ee578850e305315b9f298da5f006a1cd4b51db01a5e"
-- 
2.47.1


--===============7105523560250521631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale: SRC_URI changed from "https://www.x.org/releases//individual/app/mkfontscale-1.2.3.tar.xz" to "https://www.x.org/releases//individual/app/mkfontscale-1.2.4.tar.xz"
packages/x86-64-v3-poky-linux/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGSIZE changed from 106136 to 106400 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dbg: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-dev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGSIZE changed from 10302 to 10284 (-0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-doc: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-locale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGSIZE changed from 74994 to 75264 (+0%)
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: FILELIST: directory renamed /usr/src/debug/mkfontscale/1.2.3 -> /usr/src/debug/mkfontscale/1.2.4
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-src: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale-staticdev: PKGV changed from 1.2.3 [default] to 1.2.4 [default]
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PV changed from "1.2.3" to "1.2.4"
packages/x86-64-v3-poky-linux/mkfontscale/mkfontscale: PKGV changed from 1.2.3 [default] to 1.2.4 [default]

--===============7105523560250521631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mkfontscale-upgrade-1.2.3-1.2.4.patch"

RnJvbSBiMDI0Mjg2NmUzOTZhYzExNjg1YjJlYTQ3ZjA2NTFjYjk5MTMxZjMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMDc6NDg6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
a2ZvbnRzY2FsZTogdXBncmFkZSAxLjIuMyAtPiAxLjIuNAoKLS0tCiAuLi4veG9yZy1hcHAve21r
Zm9udHNjYWxlXzEuMi4zLmJiID0+IG1rZm9udHNjYWxlXzEuMi40LmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve21rZm9udHNjYWxlXzEuMi4zLmJiID0+IG1rZm9u
dHNjYWxlXzEuMi40LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94
b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC9ta2ZvbnRzY2FsZV8xLjIu
NC5iYgppbmRleCBhYTc5OTAyYTM0Li40Mjg2N2RiNjVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAvbWtmb250c2NhbGVfMS4yLjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmctYXBwL21rZm9udHNjYWxlXzEuMi40LmJiCkBAIC0xOCw0ICsxOCw0
IEBAIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9NWE2MGM1OTZkMWI1ZjNkZWU5ZjAwNWI3MDNiMzE4MGQiCiAKIFNSQ19VUklf
RVhUID0gInh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5MjFjZGMzNDRmMWFjZWUwNGJjZDZl
YTFlMjk1NjVjMTMwODI2MzAwNmUxMzRhOWVlMzhjZjljOWQ2ZmU3NWUiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYTAxNDkyYTE3YTliNmMwZWUzZjkyZWU1Nzg4NTBlMzA1MzE1YjlmMjk4ZGE1ZjAw
NmExY2Q0YjUxZGIwMWE1ZSIKLS0gCjIuNDcuMQoK

--===============7105523560250521631==--

