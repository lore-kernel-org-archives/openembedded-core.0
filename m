Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E39C6FA82
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.876.1667349632093172935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YRx4w56J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c85036-dce0afd3-3dc6-4a2d-b733-50d1e76b7d5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aJmvFTvQ7dessogaOz74Nl8QfvSzx9E+5kuSu9sPXXE=;
	b=YRx4w56JzJwWsOVxVBxo15V55SpSIetaMMu58R+Mqr5U+537QtMxv3fX5Gul94da
	NtBwmCIjeBKIFyLrkXLm8llsW9f96GLSdyc+btm3Ak/t4pZ+w/YlCueG1WfPW620SfO
	8+1SjDDMFN9d0nSkl74UdCahGCpWJMWqmtwohiMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aJmvFTvQ7dessogaOz74Nl8QfvSzx9E+5kuSu9sPXXE=;
	b=O2KbzP2l40glqnWeKAr32jYEl7G4rQfLAuMJznIFjYSenxD1mpKKxGP3TCZCNZoK
	PBFbdb0+hIh4N5I274ObML3yK1LVrlcmSTZrw/bbQkNS+Ix29wvC98uf/ocb2b7G1vV
	b0FcQEc4dxb4hoP9EbyO25hwvqkbcYslvkRSxpeQ=
Content-Type: multipart/mixed; boundary="===============1287360818859239242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] socat: upgrading to 1.7.4.4 SUCCEEDED
Message-ID: <0101018435c85036-dce0afd3-3dc6-4a2d-b733-50d1e76b7d5a-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172400

--===============1287360818859239242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *socat* to *1.7.4.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-socat-upgrade-1.7.4.3-1.7.4.4.patch
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
--===============1287360818859239242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/socat: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat: SRC_URI changed from "http://www.dest-unreach.org/socat/download/socat-1.7.4.3.tar.bz2 file://0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch" to "http://www.dest-unreach.org/socat/download/socat-1.7.4.4.tar.bz2"
packages/core2-32-poky-linux/socat: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-dbg: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-dbg: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-dbg: PKGSIZE changed from 1299344 to 1304512 (+0%)
packages/core2-32-poky-linux/socat/socat-dev: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-dev: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-doc: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-doc: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-doc: PKGSIZE changed from 141274 to 141270 (-0%)
packages/core2-32-poky-linux/socat/socat-locale: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-locale: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-src: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-src: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat-src: PKGSIZE changed from 1063340 to 1074669 (+1%)
packages/core2-32-poky-linux/socat/socat-staticdev: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat-staticdev: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat: PKGV changed from 1.7.4.3 [default] to 1.7.4.4 [default]
packages/core2-32-poky-linux/socat/socat: PV changed from "1.7.4.3" to "1.7.4.4"
packages/core2-32-poky-linux/socat/socat: PKGSIZE changed from 595732 to 599924 (+1%)

--===============1287360818859239242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-socat-upgrade-1.7.4.3-1.7.4.4.patch"

RnJvbSBkMjcxYTZhZjM1MjRjNTFiNDVlNDJhM2IzODExOTMyNjEzNjVkZTg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNjo0MzoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNv
Y2F0OiB1cGdyYWRlIDEuNy40LjMgLT4gMS43LjQuNAoKLS0tCiAuLi5jay1nZXRwcm90b2J5bnVt
YmVyX3Itd2l0aC1BQ19UUllfTEkucGF0Y2ggfCAzNSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e3NvY2F0XzEuNy40LjMuYmIgPT4gc29jYXRfMS43LjQuNC5iYn0gICAgfCAgNiArKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdC8wMDAxLWNvbmZp
Z3VyZS5hYy1jaGVjay1nZXRwcm90b2J5bnVtYmVyX3Itd2l0aC1BQ19UUllfTEkucGF0Y2gKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3tzb2NhdF8xLjcuNC4zLmJiID0+
IHNvY2F0XzEuNy40LjQuYmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9zb2NhdC9zb2NhdC8wMDAxLWNvbmZpZ3VyZS5hYy1jaGVjay1nZXRwcm90b2J5bnVt
YmVyX3Itd2l0aC1BQ19UUllfTEkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3Nv
Y2F0L3NvY2F0LzAwMDEtY29uZmlndXJlLmFjLWNoZWNrLWdldHByb3RvYnludW1iZXJfci13aXRo
LUFDX1RSWV9MSS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZmJmYjA4MTZk
ZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3NvY2F0
LzAwMDEtY29uZmlndXJlLmFjLWNoZWNrLWdldHByb3RvYnludW1iZXJfci13aXRoLUFDX1RSWV9M
SS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM1ICswLDAgQEAKLUZyb20gZDY3ZDZiNGY5ODFk
Yjk2MTJkODA4YmQ3MjMxNzZhMWQyOTk2ZDUzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBNb24sIDE3
IEphbiAyMDIyIDEzOjIxOjMyICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5hYzog
Y2hlY2sgZ2V0cHJvdG9ieW51bWJlcl9yIHdpdGggQUNfVFJZX0xJTksKLQotQUNfVFJZX0NPTVBJ
TEUgd29uJ3QgZXJyb3Igb3V0IGlmIHRoZSBmdW5jdGlvbiBpcyBhbHRvZ2V0aGVyIGFic2VudAot
KGUuZy4gb24gbGludXggbXVzbCBDIGxpYnJhcnkpLCB0aGUgdGVzdCBuZWVkcyB0byBsaW5rIGFs
bCB0aGUgd2F5LgotCi1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbdmlhIGVtYWlsIHRvIHNv
Y2F0QGRlc3QtdW5yZWFjaC5vcmddCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gY29uZmlndXJlLmFjIHwgNiArKystLS0KLSAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0
IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBkNGFjYzllLi45NzNhN2YyIDEw
MDY0NAotLS0tIGEvY29uZmlndXJlLmFjCi0rKysgYi9jb25maWd1cmUuYWMKLUBAIC0xMzcsMTMg
KzEzNywxMyBAQCBBQ19NU0dfUkVTVUxUKCRzY19jdl9oYXZlX3Byb3RvdHlwZV9oc3RyZXJyb3Ip
Ci0gIyBnZXRwcm90b2J5bnVtYmVyX3IoKSBpcyBub3Qgc3RhbmRhcmRpemVkCi0gQUNfTVNHX0NI
RUNLSU5HKGZvciBnZXRwcm90b2J5bnVtYmVyX3IoKSB2YXJpYW50KQotIEFDX0NBQ0hFX1ZBTChz
Y19jdl9nZXRwcm90b2J5bnVtYmVyX3IsCi0tW0FDX1RSWV9DT01QSUxFKFsjaW5jbHVkZSA8c3Rk
ZGVmLmg+Ci0rW0FDX1RSWV9MSU5LKFsjaW5jbHVkZSA8c3RkZGVmLmg+Ci0gI2luY2x1ZGUgPG5l
dGRiLmg+XSxbZ2V0cHJvdG9ieW51bWJlcl9yKDEsTlVMTCxOVUxMLDEwMjQsTlVMTCk7XSwKLSBb
c2NfY3ZfZ2V0cHJvdG9ieW51bWJlcl9yPTE7IHRtcF9ieW51bV92YXJpYW50PUxpbnV4XSwKLS0g
W0FDX1RSWV9DT01QSUxFKFsjaW5jbHVkZSA8c3RkZGVmLmg+Ci0rIFtBQ19UUllfTElOSyhbI2lu
Y2x1ZGUgPHN0ZGRlZi5oPgotICAjaW5jbHVkZSA8bmV0ZGIuaD5dLFtnZXRwcm90b2J5bnVtYmVy
X3IoMSxOVUxMLE5VTEwsMTAyNCk7XSwKLSAgW3NjX2N2X2dldHByb3RvYnludW1iZXJfcj0yOyB0
bXBfYnludW1fdmFyaWFudD1Tb2xhcmlzXSwKLS0gIFtBQ19UUllfQ09NUElMRShbI2luY2x1ZGUg
PHN0ZGRlZi5oPgotKyAgW0FDX1RSWV9MSU5LKFsjaW5jbHVkZSA8c3RkZGVmLmg+Ci0gICAjaW5j
bHVkZSA8bmV0ZGIuaD5dLFtnZXRwcm90b2J5bnVtYmVyX3IoMSxOVUxMLE5VTEwpO10sCi0gICBb
c2NfY3ZfZ2V0cHJvdG9ieW51bWJlcl9yPTM7IHRtcF9ieW51bV92YXJpYW50PUFJWF0sCi0gCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3NvY2F0XzEuNy40LjMu
YmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NvY2F0L3NvY2F0XzEuNy40LjQuYmIKc2lt
aWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9z
b2NhdC9zb2NhdF8xLjcuNC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3NvY2F0L3NvY2F0XzEuNy40LjQuYmIKaW5kZXggYTRhMGE4OTMzZS4uNWEzNzkzODBkMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zb2NhdC9zb2NhdF8xLjcuNC4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc29jYXQvc29jYXRfMS43LjQuNC5iYgpA
QCAtOSwxMSArOSw5IEBAIExJQ0VOU0UgPSAiR1BMLTIuMC13aXRoLU9wZW5TU0wtZXhjZXB0aW9u
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vUkVBRE1FO2Jl
Z2lubGluZT0yNTc7ZW5kbGluZT0yODc7bWQ1PTgyNTIwYjA1MmYzMjJhYzJiNWIzZGZkYzdjN2Vl
YTg2IgogCi1TUkNfVVJJID0gImh0dHA6Ly93d3cuZGVzdC11bnJlYWNoLm9yZy9zb2NhdC9kb3du
bG9hZC9zb2NhdC0ke1BWfS50YXIuYnoyIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmln
dXJlLmFjLWNoZWNrLWdldHByb3RvYnludW1iZXJfci13aXRoLUFDX1RSWV9MSS5wYXRjaCBcCi0g
ICAgICAgICAgICIKK1NSQ19VUkkgPSAiaHR0cDovL3d3dy5kZXN0LXVucmVhY2gub3JnL3NvY2F0
L2Rvd25sb2FkL3NvY2F0LSR7UFZ9LnRhci5iejIiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJk
NDczMTgxMDQ0MTUwNzc2MzUxMTlkZmVlNDRiY2ZiNDFkZTM0OTczNzRhOWEwMDFiMWFmZjZlMmYw
ODU4MDA3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZiZDQyYmQyZjBlNTRhM2FmNmQwMWJkZjE1
Mzg1Mzg0YWI4MmRiYzBlNGYxYTVlMTUzYjNlMGJlMWI2MzgwYWMiCiAKIGluaGVyaXQgYXV0b3Rv
b2xzCiAKLS0gCjIuMzEuMQoK

--===============1287360818859239242==--

