Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617A3CAC5A0
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.30920.1757937278974749706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WzEQJlOf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MVd3GJ4/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101994d3a38f2-e0f750b3-f408-4a3b-9566-eb7fae83df18-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wcjXeGiEvLuC8n+JPsjZbP6DNWf18pwkh9EMWPs/6ao=;
	b=WzEQJlOf9P5oqhOnjfWnfpinaP8fgXLQJsfY0Aaml0hdpe6L4g4beuuJckEWQFn6
	rxApSJ1xbR4b8oW/H5XBQgbv/hA9hiGt4drDqa6IDQDtbhsWKwU67j/NMWwYZg2IfJ9
	NbPj8uh+mcbbXQPde4ecbEya/wXB09ElHFIKdLxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wcjXeGiEvLuC8n+JPsjZbP6DNWf18pwkh9EMWPs/6ao=;
	b=MVd3GJ4/N/+oByh8haFqD+eEj/1X+NMiWJ6XtR1ksrgWOIOlH+7afGRVkKNBW/I3
	Bs1lYmimTiSRIB3Jbwp0mpj9VC1Dg7jL1ExVBu3tfxFV/ujL56M9mJBlVGbsTMeo3bt
	WfMvgT81TQfFJJXiwSDhd9pVNgCbMHjwI5JC+d7w=
Content-Type: multipart/mixed; boundary="===============8791731479231425403=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.82 SUCCEEDED
Message-ID: <010101994d3a38f2-e0f750b3-f408-4a3b-9566-eb7fae83df18-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223440

--===============8791731479231425403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.82* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.81-1.4.82.patch
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
From 52c1a6c5183c6d33b60b8ae782fd738173998cb8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:57:20 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.81 -> 1.4.82

---
 .../lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.81.bb => lighttpd_1.4.82.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
index 40abef784b..8221d30283 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.81.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "d7d42c3fd2fd94b63c915aa7d18f4da3cac5937ddba33e909f81cf50842a5840"
+SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============8791731479231425403==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.81-1.4.82.patch"

RnJvbSA1MmMxYTZjNTE4M2M2ZDMzYjYwYjhhZTc4MmZkNzM4MTczOTk4Y2I4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6NTc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuODEgLT4gMS40LjgyCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjgxLmJiID0+IGxpZ2h0dHBkXzEuNC44Mi5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjgxLmJiID0+IGxpZ2h0dHBk
XzEuNC44Mi5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjgxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC44Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgyLmJiCmluZGV4IDQw
YWJlZjc4NGIuLjgyMjFkMzAyODMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuODEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44Mi5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkN2Q0MmMzZmQyZmQ5NGI2M2M5MTVhYTdkMThmNGRhM2Nh
YzU5MzdkZGJhMzNlOTA5ZjgxY2Y1MDg0MmE1ODQwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImFi
ZmU3NDM5MWY5Y2JkNjZhYjE1NGVhMDdlNjRmMTk0ZGJlN2U5MDZlZjRlZDQ3ZWIzYjBmM2I0NjI0
NmM5NjIiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============8791731479231425403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.81.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2751424 to 2754112 (+0%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.81 [default] to 1.4.82 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.81" to "1.4.82"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 392439 to 396535 (+1%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.81 [default] to 1.4.82 [default]

--===============8791731479231425403==--

