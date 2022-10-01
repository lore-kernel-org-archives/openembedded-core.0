Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03C3C54EE9
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.341.1664643226234381834
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bBVBf840;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101839477d66e-bb1f2c64-b26b-43b6-8203-8177640b11a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=feTs8crSicg/LrvtnoWlxWqOBwuDnDHUSa9unn3+vxQ=;
	b=bBVBf840eeGkxODg+F2mD2cL1fA8f0mIhbZ2Pj8vCGy/+NI9p7UDEMNZn19ZtinC
	f2orX3RWJZn7CMORfJquguBizxZ9jVDUrAJamhKoqbI+vN5/kklNHQCaVe+vRgnYTlV
	VxiDbEdIhhYeYwuYgL5qFnC+Z7B+H9FA7bZNf6uI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=feTs8crSicg/LrvtnoWlxWqOBwuDnDHUSa9unn3+vxQ=;
	b=JfkgxjvRK+PoGed8s2uvD2TvtFSmkApwzd5kWR5c9KjVzmU4t7Q3TYffALkUqqxC
	jgFHIjHfTh25JNCO+1lFTJ053ZykvXFDcvN5XnjCm/a8uqfmKA/3ZXayrn3+pSvEB3R
	TUPMAEgCIpKhZiUj/uYf6MHk/TNhCKjU9r+SZcWw=
Content-Type: multipart/mixed; boundary="===============8977502102192516641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus: upgrading to 1.14.2 SUCCEEDED
Message-ID: 
 <010101839477d66e-bb1f2c64-b26b-43b6-8203-8177640b11a1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171255

--===============8977502102192516641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus* to *1.14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-upgrade-1.14.0-1.14.2.patch
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
--===============8977502102192516641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dbus/dbus-common: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-common: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-dbg: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 7184180 to 7231028 (+1%)
packages/core2-32-poky-linux/dbus/dbus-dev: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-dev: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-dev: PKGSIZE changed from 154794 to 155003 (+0%)
packages/core2-32-poky-linux/dbus/dbus-doc: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-doc: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-lib: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-lib: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-locale: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-locale: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-ptest: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3545916 to 3562300 (+0%)
packages/core2-32-poky-linux/dbus/dbus-src: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-src: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-src: PKGSIZE changed from 4331669 to 4333912 (+0%)
packages/core2-32-poky-linux/dbus/dbus-staticdev: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-staticdev: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus-tools: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus-tools: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus/dbus: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus/dbus: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/dbus: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/dbus: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.0.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init" to "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.2.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init"

--===============8977502102192516641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-upgrade-1.14.0-1.14.2.patch"

RnJvbSBhYWU4ZjA3YjNjZWQzMGFiMmM2OTEyMTBhY2RmYzhmNmU3NjBlNDZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNjozMzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRi
dXM6IHVwZ3JhZGUgMS4xNC4wIC0+IDEuMTQuMgoKLS0tCiAuLi4vZGJ1cy97ZGJ1c18xLjE0LjAu
YmIgPT4gZGJ1c18xLjE0LjIuYmJ9ICAgfCAyNiArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS9kYnVzL3tkYnVzXzEuMTQuMC5iYiA9PiBkYnVzXzEuMTQuMi5iYn0gKDg4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC4wLmJiIGIvbWV0
YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC4yLmJiCmluZGV4IDAwNDZiOWZkYTIu
LjlkODIyZGVkYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1c18xLjE0
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuMi5iYgpAQCAtMSwz
ICsxLDIyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVu
IHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxl
YXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhl
IGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0
YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVk
LicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORwor
IyBAQCAtMSw0ICsxLDQgQEAKKyMgLUQtQnVzIGlzIGxpY2Vuc2VkIHRvIHlvdSB1bmRlciB5b3Vy
IGNob2ljZSBvZiB0aGUgQWNhZGVtaWMgRnJlZQorIyArZGJ1cyBpcyBsaWNlbnNlZCB0byB5b3Ug
dW5kZXIgeW91ciBjaG9pY2Ugb2YgdGhlIEFjYWRlbWljIEZyZWUKKyMgIExpY2Vuc2UgdmVyc2lv
biAyLjEsIG9yIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIKKyMgIChv
ciwgYXQgeW91ciBvcHRpb24gYW55IGxhdGVyIHZlcnNpb24pLgorIyAgCisjIAorIworCiBTVU1N
QVJZID0gIkQtQnVzIG1lc3NhZ2UgYnVzIgogREVTQ1JJUFRJT04gPSAiRC1CdXMgaXMgYSBtZXNz
YWdlIGJ1cyBzeXN0ZW0sIGEgc2ltcGxlIHdheSBmb3IgYXBwbGljYXRpb25zIHRvIHRhbGsgdG8g
b25lIGFub3RoZXIuIEluIGFkZGl0aW9uIHRvIGludGVycHJvY2VzcyBjb21tdW5pY2F0aW9uLCBE
LUJ1cyBoZWxwcyBjb29yZGluYXRlIHByb2Nlc3MgbGlmZWN5Y2xlOyBpdCBtYWtlcyBpdCBzaW1w
bGUgYW5kIHJlbGlhYmxlIHRvIGNvZGUgYSBcInNpbmdsZSBpbnN0YW5jZVwiIGFwcGxpY2F0aW9u
IG9yIGRhZW1vbiwgYW5kIHRvIGxhdW5jaCBhcHBsaWNhdGlvbnMgYW5kIGRhZW1vbnMgb24gZGVt
YW5kIHdoZW4gdGhlaXIgc2VydmljZXMgYXJlIG5lZWRlZC4iCiBIT01FUEFHRSA9ICJodHRwczov
L2RidXMuZnJlZWRlc2t0b3Aub3JnIgpAQCAtNiw4ICsyNSw5IEBAIFNFQ1RJT04gPSAiYmFzZSIK
IGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZyBnZXR0ZXh0IHVwc3RyZWFtLXZlcnNpb24taXMt
ZXZlbiBwdGVzdC1nbm9tZQogCiBMSUNFTlNFID0gIkFGTC0yLjEgfCBHUEwtMi4wLW9yLWxhdGVy
IgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MTBkZGVkM2I1ODE0OGYz
ZjFmZDgwNGIyNjM1NGFmM2UgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZGJ1cy9kYnVz
Lmg7YmVnaW5saW5lPTY7ZW5kbGluZT0yMDttZDU9ODY2NzM5ODM3Y2NkODM1MzUwYWY5NGRjY2Q2
NDU3ZDgiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT02NDIzZGNkNzRk
N2JlOTcxNWIwZGIyNDdmZDg4OWRhMyBcCisgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9kYnVz
L2RidXMuaDtiZWdpbmxpbmU9NjtlbmRsaW5lPTIwO21kNT04NjY3Mzk4MzdjY2Q4MzUzNTBhZjk0
ZGNjZDY0NTdkOCBcCisgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VSSSA9ICJodHRwczov
L2RidXMuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzL2RidXMvZGJ1cy0ke1BWfS50YXIueHogXAog
ICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKQEAgLTE1LDcgKzM1LDcgQEAgU1JDX1VSSSA9
ICJodHRwczovL2RidXMuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzL2RidXMvZGJ1cy0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vZGJ1cy0xLmluaXQgXAogIgogCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiY2NkN2NjZTM3NTk2ZTBhMTk1NThmZDY2NDhkMTI3MmFiNDNmMDExZDgwYzg2
MzVhZWE4ZmQwYmFkNThhZWJkNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwNzM1MTgzOWEzNmIz
YzgzM2IzYWZlNDA1YzQ0MjBlN2VlMzY3ZjJlY2Y1N2M3YWMzNjMzZTUzMTEwZDc5OWZhIgogCiBF
WFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLXhtbC1kb2NzIFwKICAgICAgICAgICAgICAgICAtLWRp
c2FibGUtZG94eWdlbi1kb2NzIFwKLS0gCjIuMzEuMQoK

--===============8977502102192516641==--

