Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8FFC67800
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web12.870.1667349631595276587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bnJ2mOVw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018435c852d8-aef78b19-2acf-45be-a30f-baf7d7565498-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349631;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=083Boor/VzsFDwWtfy24gZxWgXaF1PECfvCffxTnYx4=;
	b=bnJ2mOVwKSaQTcePsSzhly0cA5KKK5x/xJNjwpfEy0wE4fW5wwR2+VybC+sdC2Zv
	ECtHVLWAy+sGHCJUBsYADWLHh0rGf5Fcihu1VaSpjXjpsKvLZvMkgQVeMMG1ooKdPbo
	heg6eLDIFvkjomHTay/EdUU798O0DE+x76hREld0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349631;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=083Boor/VzsFDwWtfy24gZxWgXaF1PECfvCffxTnYx4=;
	b=VvNhb/p7YwYIt6wuzfXnr1y105wb+O21A9IHM39I2Cwgwk3jZhGjHqc8gFq6xpc2
	e5EDUBzWQ6B6FXhT1gVEW9sl5tttZq5ZPT06Z7unseHnp4FNRrFPbTmwazjs/j+w4eR
	UMDwIu7NtCaQ0WQ1YYMIYaeuAf/7iYyGrcY6Oh2E=
Content-Type: multipart/mixed; boundary="===============7886023081519552080=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] netbase: upgrading to 6.4 SUCCEEDED
Message-ID: <0101018435c852d8-aef78b19-2acf-45be-a30f-baf7d7565498-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172402

--===============7886023081519552080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *netbase* to *6.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-netbase-upgrade-6.3-6.4.patch
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
--===============7886023081519552080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/netbase: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase: SRC_URI changed from "http://ftp.debian.org/debian/pool/main/n/netbase/netbase_6.3.tar.xz" to "http://ftp.debian.org/debian/pool/main/n/netbase/netbase_6.4.tar.xz"
packages/all-poky-linux/netbase: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-dbg: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-dbg: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase-dev: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-dev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase-doc: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-doc: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase-locale: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-locale: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase-src: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-src: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase-staticdev: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase-staticdev: PKGV changed from 6.3 [default] to 6.4 [default]
packages/all-poky-linux/netbase/netbase: PKGSIZE changed from 18448 to 18721 (+1%)
packages/all-poky-linux/netbase/netbase: PV changed from "6.3" to "6.4"
packages/all-poky-linux/netbase/netbase: PKGV changed from 6.3 [default] to 6.4 [default]

--===============7886023081519552080==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-netbase-upgrade-6.3-6.4.patch"

RnJvbSA2MTQ2N2FjYTliYjFjNTBlNDFhNTE4NTI4ZmFmYzI0YTMzYmJhOGRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwNzoyMjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5l
dGJhc2U6IHVwZ3JhZGUgNi4zIC0+IDYuNAoKLS0tCiAuLi4ve25ldGJhc2VfNi4zLmJiID0+IG5l
dGJhc2VfNi40LmJifSAgICAgICAgfCA1OCArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtY29yZS9uZXRiYXNlL3tuZXRiYXNlXzYuMy5iYiA9PiBuZXRiYXNlXzYuNC5iYn0gKDIxJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNi4zLmJiIGIv
bWV0YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRiYXNlXzYuNC5iYgpzaW1pbGFyaXR5IGluZGV4
IDIxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNi4zLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9uZXRiYXNlL25ldGJhc2VfNi40LmJiCmluZGV4
IGJlYzY0OThjZGQuLjRiMDk0NzlmMGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL25l
dGJhc2UvbmV0YmFzZV82LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmV0YmFzZS9uZXRi
YXNlXzYuNC5iYgpAQCAtMSwxNiArMSw2OCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtT
VU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBs
aWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVk
LCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEg
J0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5
cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIGRlYmlh
bi9jb3B5cmlnaHQKKyMgKysrIGRlYmlhbi9jb3B5cmlnaHQKKyMgQEAgLTEsMTEgKzEsMjggQEAK
KyMgLVRoaXMgcGFja2FnZSB3YXMgY3JlYXRlZCBieSBQZXRlciBUb2JpYXMgdG9iaWFzQGV0LWlu
Zi5maG8tZW1kZW4uZGUgb24KKyMgLVdlZCwgMjQgQXVnIDE5OTQgMjE6MzM6MjggKzAyMDAgYW5k
IG1haW50YWluZWQgYnkgQW50aG9ueSBUb3ducworIyAtPGFqdEBkZWJpYW4ub3JnPiB1bnRpbCAy
MDAxLgorIyAtSXQgaXMgY3VycmVudGx5IG1haW50YWluZWQgYnkgTWFyY28gZCdJdHJpIDxtZEBs
aW51eC5pdD4uCisjICtGb3JtYXQ6IGh0dHBzOi8vd3d3LmRlYmlhbi5vcmcvZG9jL3BhY2thZ2lu
Zy1tYW51YWxzL2NvcHlyaWdodC1mb3JtYXQvMS4wLworIyArQ29tbWVudDoKKyMgKyBUaGlzIHBh
Y2thZ2Ugd2FzIGNyZWF0ZWQgYnkgUGV0ZXIgVG9iaWFzIHRvYmlhc0BldC1pbmYuZmhvLWVtZGVu
LmRlIG9uCisjICsgV2VkLCAyNCBBdWcgMTk5NCAyMTozMzoyOCArMDIwMCBhbmQgbWFpbnRhaW5l
ZCBieSBBbnRob255IFRvd25zCisjICsgPGFqdEBkZWJpYW4ub3JnPiB1bnRpbCAyMDAxLgorIyAr
IEl0IGlzIGN1cnJlbnRseSBtYWludGFpbmVkIGJ5IE1hcmNvIGQnSXRyaSA8bWRAbGludXguaXQ+
LgorIyAgCisjIC1Db3B5cmlnaHQgMTk5NC0yMDEwIFBldGVyIFRvYmlhcywgQW50aG9ueSBUb3du
cyBhbmQgTWFyY28gZCdJdHJpCisjIC0KKyMgLVRoZSBwcm9ncmFtcyBpbiB0aGlzIHBhY2thZ2Ug
YXJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VCisjIC1HZW5lcmFsIFB1
YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDIgYXMgZGlzdHJpYnV0ZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUKKyMgLUZvdW5kYXRpb24uIE9uIERlYmlhbiBzeXN0ZW1zLCBhIGNvcHkgb2YgdGhpcyBsaWNl
bnNlIG1heSBiZSBmb3VuZCBpbgorIyAtL3Vzci9zaGFyZS9jb21tb24tbGljZW5zZXMvR1BMLTIu
CisjICtGaWxlczogKgorIyArQ29weXJpZ2h0OgorIyArIENvcHlyaWdodCAoYykgMTk5NC0xOTk4
IFBldGVyIFRvYmlhcworIyArIENvcHlyaWdodCAoYykgMTk5OC0yMDAxIEFudGhvbnkgVG93bnMK
KyMgKyBDb3B5cmlnaHQgKGMpIDIwMDItMjAyMiBNYXJjbyBkJ0l0cmkKKyMgK0xpY2Vuc2U6IEdQ
TC0yCisjICsgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgKyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFzCisjICsgcHVibGlzaGVkIGJ5IHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCisjICsgLgorIyArIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyArIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CisjICsgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQorIyArIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisjICsgLgorIyArIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisjICsgd2l0aCB0aGlzIHByb2dyYW07IGlm
IG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwKKyMgKyBJbmMuLCA1
MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEsIFVT
QS4KKyMgKyAuCisjICsgT24gRGViaWFuIHN5c3RlbXMsIHRoZSBjb21wbGV0ZSB0ZXh0IG9mIHRo
ZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyArIHZlcnNpb24gMiBjYW4gYmUgZm91bmQg
aW4gJy91c3Ivc2hhcmUvY29tbW9uLWxpY2Vuc2VzL0dQTC0yJy4KKyMgCisjCisKIFNVTU1BUlkg
PSAiQmFzaWMgVENQL0lQIG5ldHdvcmtpbmcgc3VwcG9ydCIKIERFU0NSSVBUSU9OID0gIlRoaXMg
cGFja2FnZSBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0dXJlIGZvciBiYXNpYyBU
Q1AvSVAgYmFzZWQgbmV0d29ya2luZyIKIEhPTUVQQUdFID0gImh0dHA6Ly9wYWNrYWdlcy5kZWJp
YW4ub3JnL25ldGJhc2UiCiBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIkdQTC0yLjAtb25s
eSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7bWQ1PTNkZDYx
OTJkMzA2ZjU4MmRlZTc2ODdkYTNkODc0OGFiIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
ZGViaWFuL2NvcHlyaWdodDttZDU9NzhkZDJjN2M2ZjQ4NzM0OGU0YTAwOTJjMTdhMTlkNDIiCiBQ
RSA9ICIxIgogCiBTUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9uLyR7QlBOfS8ke0JQ
Tn1fJHtQVn0udGFyLnh6IgogCiBpbmhlcml0IGFsbGFyY2gKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjdjNDJhNmExY2FmYTBjNjQxMDNjNzFjYWI2NDMxZmM4NjEzMTc5YjI0NDlhMWEwMGU1NWUz
NTg0ZTg2MGQ4MWMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE2NjIxODI2ZmYxMTUwZTU4MWJk
OTBiYzNjOGE0ZWNhZmU1ZGY5MDQwNGYyMDdkYjZkY2RmMmM3NWYyNmFkNyIKIAogVVBTVFJFQU1f
Q0hFQ0tfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9uL25ldGJhc2UvIgogCkBAIC0yMSwz
ICs3Myw1IEBAIGRvX2luc3RhbGwgKCkgewogCWluc3RhbGwgLW0gMDY0NCAke1N9L2V0Yy9zZXJ2
aWNlcyAke0R9JHtzeXNjb25mZGlyfS9zZXJ2aWNlcwogCWluc3RhbGwgLW0gMDY0NCAke1N9L2V0
Yy9ldGhlcnR5cGVzICR7RH0ke3N5c2NvbmZkaXJ9L2V0aGVydHlwZXMKIH0KKworUyA9ICIke1dP
UktESVJ9L25ldGJhc2UiCi0tIAoyLjMxLjEKCg==

--===============7886023081519552080==--

