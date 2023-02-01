Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5D0C761A6
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.30349.1675272853313208942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=V31kqI5Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101860e0b235b-1bbbda81-3b4c-4aa6-8aee-ed2e413a82fb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7wtL1/Hm9Ebrf4BcIK4vIkzcMIkINZI+1eoyqzAJ2lY=;
	b=V31kqI5Qe3/TAXpkr4XD3doquk89GFTRRhjukNW3keV9kNOG5BpItlgadXWwF4No
	A5sSoPLaIDMqqIYg+h6YQMXSZ78MvFPlK9Rf+gMzXH6mDabgHeyvbzVb9uEgnOs/6u9
	sV/+6bGpd1LZiX8glsphFl4Nx7KV07X/nBakB+oQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7wtL1/Hm9Ebrf4BcIK4vIkzcMIkINZI+1eoyqzAJ2lY=;
	b=j/OLbJxr9d3MH4yL7ShSLCaMpA3cg2rAsdqqX/InXydYTpHgR1cEnZ0m4zwhpibl
	aiCRGJO79ZsERwUid9v62c0XeI4jeJOti4eNhfphiEL2qyfpcVTtxnAGmvzl0KZzw1v
	II2rTFe75ud8S32fj3Qr1eVPRrElSpJcLuMs8MZQ=
Content-Type: multipart/mixed; boundary="===============0881816703353070616=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.14.2 SUCCEEDED
Message-ID: <010101860e0b235b-1bbbda81-3b4c-4aa6-8aee-ed2e413a82fb-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176614

--===============0881816703353070616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fontconfig* to *2.14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.14.1-2.14.2.patch
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
--===============0881816703353070616==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.14.1-2.14.2.patch"

RnJvbSBiN2FmNWVjYWYxZTVmMTgzNmIzZDcwYmJlOGQ0MTA0OGI2YmVkMWRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDo1MjozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnRjb25maWc6IHVwZ3JhZGUgMi4xNC4xIC0+IDIuMTQuMgoKLS0tCiAuLi50Y29uZmlnXzIuMTQu
MS5iYiA9PiBmb250Y29uZmlnXzIuMTQuMi5iYn0gfCAzMSArKysrKysrKysrKysrKysrKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy97Zm9udGNvbmZpZ18yLjE0LjEuYmIgPT4g
Zm9udGNvbmZpZ18yLjE0LjIuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdy
YXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDc4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmln
XzIuMTQuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9u
dGNvbmZpZ18yLjE0LjIuYmIKaW5kZXggYWU1YTQ1YmU1NC4uYTljZTdiY2Q5MyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjEuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjIu
YmIKQEAgLTEsMyArMSwzMCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVz
IGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5n
IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRl
eHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3Vt
bWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2Ut
VXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVh
cnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIHNyYy9mY2NhY2hlLmMK
KyMgKysrIHNyYy9mY2NhY2hlLmMKKyMgQEAgLTEsNiArMSwzIEBACisjIC0gICAgaWYgKGZkICE9
IC0xKQorIyAtICAgIHsKKyMgLSNpZiBkZWZpbmVkKF9XSU4zMikKKyMgIAlfbG9ja2luZyAoZmQs
IF9MS19VTkxDSywgMSk7CisjICAjZWxzZQorIyAgCXN0cnVjdCBmbG9jayBmbDsKKyMgQEAgLTE0
LDMgKzExLDYgQEAKKyMgICNlbmRpZgorIyAgCWNsb3NlIChmZCk7CisjICAgICAgfQorIyArfQor
IyArCisjICsvKgorIyAKKyMKKwogU1VNTUFSWSA9ICJHZW5lcmljIGZvbnQgY29uZmlndXJhdGlv
biBsaWJyYXJ5IgogREVTQ1JJUFRJT04gPSAiRm9udGNvbmZpZyBpcyBhIGZvbnQgY29uZmlndXJh
dGlvbiBhbmQgY3VzdG9taXphdGlvbiBsaWJyYXJ5LCB3aGljaCBcCiBkb2VzIG5vdCBkZXBlbmQg
b24gdGhlIFggV2luZG93IFN5c3RlbS4gSXQgaXMgZGVzaWduZWQgdG8gbG9jYXRlIFwKQEAgLTE0
LDcgKzQxLDcgQEAgQlVHVFJBQ0tFUiA9ICJodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL2Vu
dGVyX2J1Zy5jZ2k/cHJvZHVjdD1mb250Y29uZmlnIgogTElDRU5TRSA9ICJNSVQgJiBNSVQgJiBQ
RCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTAwMjUyZmQyNzJiZjJl
NzIyOTI1NjEzYWQ3NGNiNmM3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9mY2Zy
ZWV0eXBlLmM7ZW5kbGluZT00NTttZDU9Y2U5NzZiMzEwYTAxM2E2YWNlNmI2MGFmYTcxODUxYzEg
XAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vc3JjL2ZjY2FjaGUuYztiZWdpbmxpbmU9MTY3
MTtlbmRsaW5lPTE2ODY7bWQ1PTkwNmMyZjA0YjBjNzlhMWJjYzg0ZWNmY2E0ZGU1NjE5IFwKKyAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9mY2NhY2hlLmM7YmVnaW5saW5lPTE2NzE7ZW5k
bGluZT0xNjg2O21kNT1iMmQwYzVjZWJkMGU5N2ExMTFhZWI1NDEyODczMDUxMSBcCiAgICAgICAg
ICAgICAgICAgICAgICIKIAogU0VDVElPTiA9ICJsaWJzIgpAQCAtMjUsNyArNTIsNyBAQCBTUkNf
VVJJID0gImh0dHA6Ly9mb250Y29uZmlnLm9yZy9yZWxlYXNlL2ZvbnRjb25maWctJHtQVn0udGFy
Lmd6IFwKICAgICAgICAgICAgZmlsZTovL3JldmVydC1zdGF0aWMtcGtnY29uZmlnLnBhdGNoIFwK
ICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWU0ODBlOWNhMzQzODI3OTAz
MTJmZjA2MmM2MjVlYzcwZGY5NGQ2ZDlhOTM2NmUyYjJiM2Q1MjVmN2Y5MDM4NyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICIzYmEyZGQ5MjE1ODcxOGFjZWM1Y2FhZjFhNzE2MDQzYjVhYTA1NWMyN2Iw
ODFkOTE0YWYzY2NiNDBkY2U4YTU1IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJmb250Y29u
ZmlnLSg/UDxwdmVyPlxkK1wuXGQrXC4oPyE5XGQrKVxkKykiCiAKLS0gCjIuMzcuMwoK

--===============0881816703353070616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 918124 to 920412 (+0%)
packages/core2-32-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-dev: PKGSIZE changed from 38204 to 38311 (+0%)
packages/core2-32-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-ka: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-ka: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 963446 to 966246 (+0%)
packages/core2-32-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig/fontconfig: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig: FILELIST: removed "/usr/share/fontconfig/conf.avail/10-no-sub-pixel.conf /etc/fonts/conf.d/10-sub-pixel-rgb.conf", added "/etc/fonts/conf.d/10-sub-pixel-none.conf /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf"
packages/core2-32-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 470776 to 470777 (+0%)
packages/core2-32-poky-linux/fontconfig: PV changed from "2.14.1" to "2.14.2"
packages/core2-32-poky-linux/fontconfig: PKGV changed from 2.14.1 [default] to 2.14.2 [default]
packages/core2-32-poky-linux/fontconfig: SRC_URI changed from "http://fontconfig.org/release/fontconfig-2.14.1.tar.gz file://revert-static-pkgconfig.patch" to "http://fontconfig.org/release/fontconfig-2.14.2.tar.gz file://revert-static-pkgconfig.patch"
Changes to packages/core2-32-poky-linux/fontconfig (sysroot):
  /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf was added
  /usr/share/fontconfig/conf.avail/10-no-sub-pixel.conf was removed

--===============0881816703353070616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/fontconfig/fontconfig: FILELIST: removed "/etc/fonts/conf.d/10-sub-pixel-rgb.conf /usr/share/fontconfig/conf.avail/10-no-sub-pixel.conf", added "/usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf /etc/fonts/conf.d/10-sub-pixel-none.conf"
Changes to packages/core2-32-poky-linux/fontconfig (sysroot):
  /usr/share/fontconfig/conf.avail/10-sub-pixel-none.conf was added
  /usr/share/fontconfig/conf.avail/10-no-sub-pixel.conf was removed

--===============0881816703353070616==--

