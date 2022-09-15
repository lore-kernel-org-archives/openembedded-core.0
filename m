Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC833C6FA89
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:32 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.10618.1663251512354019042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=V2MGro4D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183f8bf-d4f10fa1-5fdc-4a9d-bee4-038a589d4ae2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iSy6wWUckbmZnESdHk2KASPpd8jRYZAHHKZtPG90VQs=;
	b=V2MGro4DW0rXnsqNpGncECiI3Q7yQGpFQyTF+ytuNB2PL0LTK8PM9frtnHDxgvFa
	ZH0BRvWSiVwSZG7NQrbX+YKfPl6L2oYbUPt6bLShM5L5CDEOf+57XC5cBibQqrs2M3O
	OTZoue2vpPsoTpHJHcKH3Bk5Y/zKTG6u3oSpSmd4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iSy6wWUckbmZnESdHk2KASPpd8jRYZAHHKZtPG90VQs=;
	b=WREdcxOd1gQNRTtxgiPVkvHTobZLLIgSzLB9Z7/rNorZndiWE8gxt5hc+Ufv9JZ0
	8pkqrtQy12EeBS/xHV/3I/iIVUHOIiSM3i0hUM19U73ovSx9Q1Qs82Y871YcP+4+ST+
	5f/6aaJPv5BdtrWC1JSkcAgxjjn9fYeYDcpwuvSI=
Content-Type: multipart/mixed; boundary="===============0320336793227212774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ccache: upgrading to 4.6.3 SUCCEEDED
Message-ID: 
 <010101834183f8bf-d4f10fa1-5fdc-4a9d-bee4-038a589d4ae2-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170701

--===============0320336793227212774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ccache* to *4.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ccache-upgrade-4.6.2-4.6.3.patch
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
--===============0320336793227212774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ccache/ccache-dbg: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGSIZE changed from 28057036 to 28061532 (+0%)
packages/core2-32-poky-linux/ccache/ccache-dbg: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache-dev: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-dev: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache-doc: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-doc: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache-locale: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-locale: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache-src: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-src: PKGSIZE changed from 1846680 to 1846927 (+0%)
packages/core2-32-poky-linux/ccache/ccache-src: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache-staticdev: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache-staticdev: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache/ccache: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache/ccache: PKGV changed from 4.6.2 [default] to 4.6.3 [default]
packages/core2-32-poky-linux/ccache: PV changed from "4.6.2" to "4.6.3"
packages/core2-32-poky-linux/ccache: SRC_URI changed from "https://github.com/ccache/ccache/releases/download/v4.6.2/ccache-4.6.2.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch file://0001-Include-time.h-for-time_t.patch file://0002-config-Include-sys-types.h-for-mode_t-defintion.patch" to "https://github.com/ccache/ccache/releases/download/v4.6.3/ccache-4.6.3.tar.gz file://0001-xxhash.h-Fix-build-with-gcc-12.patch"
packages/core2-32-poky-linux/ccache: PKGV changed from 4.6.2 [default] to 4.6.3 [default]

--===============0320336793227212774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ccache-upgrade-4.6.2-4.6.3.patch"

RnJvbSBjMjQxZjM4NTgyYjE2ZmI3MmI0YjI1OWNhMTYyYmE0YjQ4ZWVkODdmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDc6MTQ6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
Y2FjaGU6IHVwZ3JhZGUgNC42LjIgLT4gNC42LjMKCi0tLQogLi4uL3tjY2FjaGVfNC42LjIuYmIg
PT4gY2NhY2hlXzQuNi4zLmJifSAgICAgIHwgIDYgKystLQogLi4uLzAwMDEtSW5jbHVkZS10aW1l
LmgtZm9yLXRpbWVfdC5wYXRjaCAgICAgIHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4udWRl
LXN5cy10eXBlcy5oLWZvci1tb2RlX3QtZGVmaW50aW9uLnBhdGNoIHwgMjUgLS0tLS0tLS0tLS0t
LS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDU4IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUve2NjYWNoZV80LjYuMi5iYiA9PiBj
Y2FjaGVfNC42LjMuYmJ9ICg4MCUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2NjYWNoZS9maWxlcy8wMDAxLUluY2x1ZGUtdGltZS5oLWZvci10aW1lX3QucGF0Y2gK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2ZpbGVzLzAw
MDItY29uZmlnLUluY2x1ZGUtc3lzLXR5cGVzLmgtZm9yLW1vZGVfdC1kZWZpbnRpb24ucGF0Y2gK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjYuMi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2NhY2hlXzQuNi4zLmJiCnNpbWlsYXJp
dHkgaW5kZXggODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvY2Nh
Y2hlXzQuNi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNo
ZV80LjYuMy5iYgppbmRleCBkYmFjMDIyNDNjLi41ZWQ0NmNkYzE5IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjYuMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY2NhY2hlL2NjYWNoZV80LjYuMy5iYgpAQCAtMTMsMTAgKzEzLDggQEAgREVQ
RU5EUyA9ICJ6c3RkIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9jY2FjaGUvY2Nh
Y2hlL3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BWfS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS14eGhhc2guaC1GaXgtYnVpbGQtd2l0aC1nY2MtMTIucGF0Y2ggXAotICAgICAg
ICAgICBmaWxlOi8vMDAwMS1JbmNsdWRlLXRpbWUuaC1mb3ItdGltZV90LnBhdGNoIFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDItY29uZmlnLUluY2x1ZGUtc3lzLXR5cGVzLmgtZm9yLW1vZGVfdC1k
ZWZpbnRpb24ucGF0Y2ggXAotIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZhNzQ2YTliZWQwMTU4
NTM4OGI2OGUyZDU4YWYyZTc3NzQxZmM4ZDY2YmMzNjBiNWEwYjRjNDFmYzI4NGRhZmUiCisgICAg
ICAgICAgICIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNDZiYTM3MDZhZDgwYzMwZDRkNTg3NGRl
ZTJiZjkyMjdhN2ZjZDBjY2FhYzMxYjUxOTE5YTMwNTNkODRiZDA1IgogCiBVUFNUUkVBTV9DSEVD
S19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2NjYWNoZS9jY2FjaGUvcmVsZWFzZXMvIgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2NhY2hlL2ZpbGVzLzAwMDEtSW5jbHVk
ZS10aW1lLmgtZm9yLXRpbWVfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUv
ZmlsZXMvMDAwMS1JbmNsdWRlLXRpbWUuaC1mb3ItdGltZV90LnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBkNzUyZWIwNjUxLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jY2FjaGUvZmlsZXMvMDAwMS1JbmNsdWRlLXRpbWUuaC1mb3ItdGltZV90LnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjkgKzAsMCBAQAotRnJvbSA1OTBjNjU2ODM4YTliMzc2
OWE3YTg1NWZiMTg5MWJmYThkODg3OGFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFR1ZSwgMjMgQXVnIDIwMjIgMTA6
Mjc6MjEgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gSW5jbHVkZSB0aW1lLmggZm9yIHRpbWVfdAot
Ci1GaXhlcwotc3JjL2NvcmUvU3RhdGlzdGljcy5ocHA6NDE6Mzc6IGVycm9yOiAndGltZV90JyBo
YXMgbm90IGJlZW4gZGVjbGFyZWQKLXwgICAgNDEgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB0aW1lX3QgbGFzdF91cGRhdGVkLAotfCAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRl
ZCBbaHR0cHM6Ly9naXRodWIuY29tL2NjYWNoZS9jY2FjaGUvcHVsbC8xMTQ1XQotU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLQotLS0tCi0gc3JjL2NvcmUvU3Rh
dGlzdGljcy5ocHAgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlm
ZiAtLWdpdCBhL3NyYy9jb3JlL1N0YXRpc3RpY3MuaHBwIGIvc3JjL2NvcmUvU3RhdGlzdGljcy5o
cHAKLWluZGV4IDU0ZjMyZTkuLmViODBlMWMgMTAwNjQ0Ci0tLS0gYS9zcmMvY29yZS9TdGF0aXN0
aWNzLmhwcAotKysrIGIvc3JjL2NvcmUvU3RhdGlzdGljcy5ocHAKLUBAIC0yMSw2ICsyMSw3IEBA
Ci0gI2luY2x1ZGUgPGNvcmUvU3RhdGlzdGljc0NvdW50ZXJzLmhwcD4KLSAKLSAjaW5jbHVkZSA8
Y3N0ZGludD4KLSsjaW5jbHVkZSA8Y3RpbWU+Ci0gI2luY2x1ZGUgPHN0cmluZz4KLSAjaW5jbHVk
ZSA8dW5vcmRlcmVkX21hcD4KLSAjaW5jbHVkZSA8dmVjdG9yPgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2NjYWNoZS9maWxlcy8wMDAyLWNvbmZpZy1JbmNsdWRlLXN5cy10eXBl
cy5oLWZvci1tb2RlX3QtZGVmaW50aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Nj
YWNoZS9maWxlcy8wMDAyLWNvbmZpZy1JbmNsdWRlLXN5cy10eXBlcy5oLWZvci1tb2RlX3QtZGVm
aW50aW9uLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwZmQ3NzYwMmRmLi4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jY2FjaGUvZmlsZXMvMDAwMi1j
b25maWctSW5jbHVkZS1zeXMtdHlwZXMuaC1mb3ItbW9kZV90LWRlZmludGlvbi5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDI1ICswLDAgQEAKLUZyb20gZjk4YjM5MGEyZDMyM2Y3ZjkyZmIwNDky
YjA5NDNkMjAxYWZlNWI4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBUdWUsIDIzIEF1ZyAyMDIyIDEwOjQwOjUzIC0w
NzAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZzogSW5jbHVkZSBzeXMvdHlwZXMuaCBmb3IgbW9k
ZV90IGRlZmludGlvbgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRo
dWIuY29tL2NjYWNoZS9jY2FjaGUvcHVsbC8xMTQ1XQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KLQotLS0tCi0gc3JjL0NvbmZpZy5ocHAgfCAyICsrCi0gMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvc3JjL0NvbmZpZy5o
cHAgYi9zcmMvQ29uZmlnLmhwcAotaW5kZXggYTllMDhlYy4uOWU3YWY0MCAxMDA2NDQKLS0tLSBh
L3NyYy9Db25maWcuaHBwCi0rKysgYi9zcmMvQ29uZmlnLmhwcAotQEAgLTI1LDYgKzI1LDggQEAK
LSAKLSAjaW5jbHVkZSAidGhpcmRfcGFydHkvbm9uc3RkL29wdGlvbmFsLmhwcCIKLSAKLSsjaW5j
bHVkZSA8c3lzL3R5cGVzLmg+Ci0rCi0gI2luY2x1ZGUgPGNzdGRpbnQ+Ci0gI2luY2x1ZGUgPGZ1
bmN0aW9uYWw+Ci0gI2luY2x1ZGUgPGxpbWl0cz4KLS0gCjIuMzEuMQoK

--===============0320336793227212774==--

