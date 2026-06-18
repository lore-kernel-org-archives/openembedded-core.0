Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE54CD98DE
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 05:53:31 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13245.1781762008843975971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 22:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FfoCgCQz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eU+LcnOB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ed94aa36e-a610de7a-730a-4348-a12b-a29ead0f6ae4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QNLldFWVolzvIsA0hIfesGJlnIajsiyAeC4hvNVMj6A=;
	b=FfoCgCQzVtvN5CyoFCU2fVmMO/rdk5Q1pq9nrLnYoHfUQxzF2Sjcly2TcCcRDI71
	JbE5eogxTniewUZISkp5dqaLQZZpm4Sdt4j7z3iotppBVf1iFXxkBvM/zDjjVi3ZOeN
	thU0kKqxpHF6TvLW+3WLBow9wku7PO4fWV8KeRVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781762008;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QNLldFWVolzvIsA0hIfesGJlnIajsiyAeC4hvNVMj6A=;
	b=eU+LcnOBygLEmFbjHpitvKKPPlTdfo8jQpUcZJXFCEBcIsIzLPmGQj0jU3BeV8J+
	HHZVy1JusNe2NXHXAVvRUSXRGNMCDhyYMgLJ7HKoFCZVDTHlryWGKTZsa/p3ESvsjU8
	p4M37OtBF0u8Cwv1jJ0id8lDdrM3ayY9fcLh+crA=
Content-Type: multipart/mixed; boundary="===============4792249720901901143=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.84 SUCCEEDED
Message-ID: <0101019ed94aa36e-a610de7a-730a-4348-a12b-a29ead0f6ae4-000000@us-west-2.amazonses.com>
Date: Thu, 18 Jun 2026 05:53:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.18-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 05:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239048

--===============4792249720901901143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.84* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.83-1.4.84.patch
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
From e92b93030c84dad786c707a6f33864768f182781 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 18 Jun 2026 05:39:17 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.83 -> 1.4.84

---
 .../lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.84.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.83.bb => lighttpd_1.4.84.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
index a1a7bee227..289ecef333 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b3f878156480079f8a93903bd24d456074a0fbedb9b4d99fcd65df33b1f566f0"
+SRC_URI[sha256sum] = "076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead2400b56efaa026f70"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============4792249720901901143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.83.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.84.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2981456 to 2981296 (-0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.83/src/compat -> /usr/src/debug/lighttpd/1.4.84/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.83/src -> /usr/src/debug/lighttpd/1.4.84/src, directory renamed /usr/src/debug/lighttpd/1.4.83/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.84/src/ls-hpack
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3229831 to 3229847 (+0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.83" to "1.4.84"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.83 [default] to 1.4.84 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.83" to "1.4.84"

--===============4792249720901901143==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.83-1.4.84.patch"

RnJvbSBlOTJiOTMwMzBjODRkYWQ3ODZjNzA3YTZmMzM4NjQ3NjhmMTgyNzgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTggSnVuIDIwMjYgMDU6Mzk6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuODMgLT4gMS40Ljg0CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjgzLmJiID0+IGxpZ2h0dHBkXzEuNC44NC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjgzLmJiID0+IGxpZ2h0dHBk
XzEuNC44NC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjgzLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC44NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgzLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40Ljg0LmJiCmluZGV4IGEx
YTdiZWUyMjcuLjI4OWVjZWYzMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuODMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44NC5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiM2Y4NzgxNTY0ODAwNzlmOGE5MzkwM2JkMjRkNDU2MDc0
YTBmYmVkYjliNGQ5OWZjZDY1ZGYzM2IxZjU2NmYwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA3
NmRkNDNiZWM4ZjJiYTljZTZkYjdlN2NhN2U4YWQ3MjI3MWNkNTI5ODA1ZWFkMjQwMGI1NmVmYWEw
MjZmNzAiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============4792249720901901143==--

