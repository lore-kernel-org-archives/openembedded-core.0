Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D7CC54798
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:34:02 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.88276.1705340029273637622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lp905e+P;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dOdCj00p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018d0e2fc5c5-3830b94f-0867-4bd9-ade2-63d0193436f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xLXtrwxhcKX/0vYwYrl1KdYDFxxTEfxqlfE3jBLTR7o=;
	b=Lp905e+P6Uxn5wF+yWmA8QJTNLYwd6fxYFakhsKK70tp03fzG4fCPnOPaxBT3xrH
	M33CDt/f6jfrjsLqTb2xXJtVAkg0cSsjjuhIpCBl7FjRCUhMGhsXyVDaPQ4zXYUFVTv
	W4DcLoKR6iv4KLyehoBSmRTtuLVHkwz/VMf4PfQ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1705340028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xLXtrwxhcKX/0vYwYrl1KdYDFxxTEfxqlfE3jBLTR7o=;
	b=dOdCj00pfIeEB+bZzW2mkRsnTfRbYOcjPzZPCySuV5pMmc/01yBdBHqwCOLcjKW/
	cobXi/Lutm1Nqx9xQY9j8nezAcWWNezyyBH4jpIX0H/v3OF97Fbtg5c/GEyKr6Ujk3p
	M1oFMG7N9AUvwEv+4PtRcxu5+LBZymEuTZiP2o5I=
Content-Type: multipart/mixed; boundary="===============8179478689986313845=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.7.0 SUCCEEDED
Message-ID: <0101018d0e2fc5c5-3830b94f-0867-4bd9-ade2-63d0193436f5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jan 2024 17:33:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193697

--===============8179478689986313845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.6.0-6.7.0.patch
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
From a740e395e6003428897c7418d21107b1fcf936e1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jan 2024 05:26:18 +0000
Subject: [PATCH] iproute2: upgrade 6.6.0 -> 6.7.0

---
 .../iproute2/0001-libc-compat.h-add-musl-workaround.patch       | 2 +-
 .../iproute2/{iproute2_6.6.0.bb => iproute2_6.7.0.bb}           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_6.6.0.bb => iproute2_6.7.0.bb} (97%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
index 74e3de1ce9..13a58dc384 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/0001-libc-compat.h-add-musl-workaround.patch
@@ -1,4 +1,4 @@
-From c25f8d1f7a6203dfeb10b39f80ffd314bb84a58d Mon Sep 17 00:00:00 2001
+From fa5ed41fa9c3454846b146a4de67ed10e1d2df32 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Thu, 22 Dec 2016 15:26:30 +0200
 Subject: [PATCH] libc-compat.h: add musl workaround
diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
similarity index 97%
rename from meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
index 417702e627..640b3013f1 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.6.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.7.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-libc-compat.h-add-musl-workaround.patch \
            "
 
-SRC_URI[sha256sum] = "8738c804afd09f0bf756937f0c3de23117832a98d8cbbf50386cf5005cd613ce"
+SRC_URI[sha256sum] = "ff942dd9828d7d1f867f61fe72ce433078c31e5d8e4a78e20f02cb5892e8841d"
 
 inherit update-alternatives bash-completion pkgconfig
 
-- 
2.42.0


--===============8179478689986313845==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.6.0-6.7.0.patch"

RnJvbSBhNzQwZTM5NWU2MDAzNDI4ODk3Yzc0MThkMjExMDdiMWZjZjkzNmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSmFuIDIwMjQgMDU6MjY6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjYuMCAtPiA2LjcuMAoKLS0tCiAuLi4vaXByb3V0ZTIvMDAwMS1s
aWJjLWNvbXBhdC5oLWFkZC1tdXNsLXdvcmthcm91bmQucGF0Y2ggICAgICAgfCAyICstCiAuLi4v
aXByb3V0ZTIve2lwcm91dGUyXzYuNi4wLmJiID0+IGlwcm91dGUyXzYuNy4wLmJifSAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL3tpcHJvdXRlMl82
LjYuMC5iYiA9PiBpcHJvdXRlMl82LjcuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtbGliYy1jb21wYXQuaC1h
ZGQtbXVzbC13b3JrYXJvdW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJv
dXRlMi9pcHJvdXRlMi8wMDAxLWxpYmMtY29tcGF0LmgtYWRkLW11c2wtd29ya2Fyb3VuZC5wYXRj
aAppbmRleCA3NGUzZGUxY2U5Li4xM2E1OGRjMzg0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyLzAwMDEtbGliYy1jb21wYXQuaC1hZGQtbXVz
bC13b3JrYXJvdW5kLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0
ZTIvaXByb3V0ZTIvMDAwMS1saWJjLWNvbXBhdC5oLWFkZC1tdXNsLXdvcmthcm91bmQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGMyNWY4ZDFmN2E2MjAzZGZlYjEwYjM5ZjgwZmZkMzE0YmI4
NGE1OGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZhNWVkNDFmYTljMzQ1NDg0NmIx
NDZhNGRlNjdlZDEwZTFkMmRmMzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBCYXJ1
Y2ggU2lhY2ggPGJhcnVjaEB0a29zLmNvLmlsPgogRGF0ZTogVGh1LCAyMiBEZWMgMjAxNiAxNToy
NjozMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBsaWJjLWNvbXBhdC5oOiBhZGQgbXVzbCB3b3Jr
YXJvdW5kCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lw
cm91dGUyXzYuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJv
dXRlMl82LjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuNi4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuNy4wLmJiCmluZGV4IDQx
NzcwMmU2MjcuLjY0MGIzMDEzZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvaXByb3V0ZTIvaXByb3V0ZTJfNi42LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjcuMC5iYgpAQCAtMTUsNyArMTUsNyBAQCBTUkNfVVJJ
ID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvbmV0LyR7QlBOfS8ke0JQfS50YXIu
eHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJjLWNvbXBhdC5oLWFkZC1tdXNsLXdvcmth
cm91bmQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NzM4
YzgwNGFmZDA5ZjBiZjc1NjkzN2YwYzNkZTIzMTE3ODMyYTk4ZDhjYmJmNTAzODZjZjUwMDVjZDYx
M2NlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmOTQyZGQ5ODI4ZDdkMWY4NjdmNjFmZTcyY2U0
MzMwNzhjMzFlNWQ4ZTRhNzhlMjBmMDJjYjU4OTJlODg0MWQiCiAKIGluaGVyaXQgdXBkYXRlLWFs
dGVybmF0aXZlcyBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0gCjIuNDIuMAoK

--===============8179478689986313845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8291224 to 8294216 (+0%)
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-dev: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-doc: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-genl: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-ip: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 710556 to 706460 (-1%)
packages/core2-64-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-locale: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-routel: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-routel: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3629796 to 3627174 (-0%)
packages/core2-64-poky-linux/iproute2/iproute2-src: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netfilter_ipv4 -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netfilter_ipv4, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/can -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/asm-generic -> /usr/src/debug/iproute2/6.7.0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.6.0/genl -> /usr/src/debug/iproute2/6.7.0/genl, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netfilter/ipset, di
 rectory renamed /usr/src/debug/iproute2/6.6.0/tc -> /usr/src/debug/iproute2/6.7.0/tc, directory renamed /usr/src/debug/iproute2/6.6.0/devlink -> /usr/src/debug/iproute2/6.7.0/devlink, directory renamed /usr/src/debug/iproute2/6.6.0/bridge -> /usr/src/debug/iproute2/6.7.0/bridge, directory renamed /usr/src/debug/iproute2/6.6.0/include -> /usr/src/debug/iproute2/6.7.0/include, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.6.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/6.7.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.6.0/tipc -> /usr/src/debug/iproute2/6.7.0/tipc, directory renamed /usr/src/debug/iproute2/6.6.0/misc -> /usr/src/debug/iproute2/6.7.0/misc, directory renamed /usr/src/debug/iproute2/6.6.0/lib -> /usr/src/debug/iproute2/6.7.0/lib, directory renamed /usr/src/debug/iproute2/6.6.0/ip -> /usr/src/debug/iproute2/6.7
 .0/ip, removed "/usr/src/debug/iproute2/6.6.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_link.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/nexthop.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/seg6_local.h /usr/src/debug/iproute2/6.6.0/include/
 uapi/linux/net_namespace.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/xdp_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/can.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/fou.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_packet.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/6.6.0/include/ua
 pi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ax25.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/rpl_iptunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/snmp.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/seg6_hmac.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/inet_diag.h /usr/src/deb
 ug/iproute2/6.6.0/include/uapi/linux/rose.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/types.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/seg6_iptunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_alg.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_tunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/ila.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/6.6.0/include/uapi/
 linux/socket.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/veth.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/sctp.h /usr/src/debug/iproute2/6.6.0/include/uapi/linux/if_addrlabel.h", added "/usr/src/debug/iproute2/6.7.0/include/uapi/linux/tipc.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/devlink.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_link.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_addr.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/genetlink.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_vlan.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ife.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/mptcp.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netconf.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netlink.h /usr/src/debug/iproute2/6.7.0/include/uapi
 /linux/nexthop.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_bridge.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_macsec.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/rtnetlink.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/wwan.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/seg6_local.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ip.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/bpf.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tcp.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/gen_stats.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/rpl.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/xdp_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tipc_netlink.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/amt.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/can.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tls.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netlink_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/lin
 ux/fou.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/pkt_cls.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/netfilter.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/fib_rules.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tipc_sockets_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ax25.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_bonding.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/rpl_iptunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/snmp.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/pkt_sched.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ioam6_genl.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/neighbour.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/sysinfo.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/net_namespace.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/btf.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/tcp_metrics.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if.h /usr/src/debug/iprou
 te2/6.7.0/include/uapi/linux/seg6_hmac.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ip6_tunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/packet_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/inet_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/rose.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ioam6.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/sock_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/unix_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/mpls.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/types.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/mpls_iptunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ioam6_iptunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/batman_adv.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/seg6_iptunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/vm_sockets_diag.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/filter.h /usr/src/debug/iproute2/6.7.0/include/u
 api/linux/if_alg.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_tunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/ila.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/seg6_genl.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/socket.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/xfrm.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/l2tp.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/lwtunnel.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/mptcp_pm.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/veth.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/seg6.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/sctp.h /usr/src/debug/iproute2/6.7.0/include/uapi/linux/if_addrlabel.h"
packages/core2-64-poky-linux/iproute2/iproute2-ss: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tc: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2/iproute2: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2/iproute2: PKGV changed from 6.6.0 [default] to 6.7.0 [default]
packages/core2-64-poky-linux/iproute2: PV changed from "6.6.0" to "6.7.0"
packages/core2-64-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.6.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.7.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-64-poky-linux/iproute2: PKGV changed from 6.6.0 [default] to 6.7.0 [default]

--===============8179478689986313845==--

