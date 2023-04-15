Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFE3C7EE2F
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13536.1681581687072608332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZpP6sIsZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018786143ecf-fcfb59ce-638c-49d3-afb2-311ba632fd36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwNgpIz8TL7UZBJUiMazigLsoaGigjUX60vDVmtritQ=;
	b=ZpP6sIsZbCi7Y9ZtIksiB3/OPpuRA2nekyqTRXxp3c8rQ8F27pB7Q80vkb5sO9d3
	5R0r/nGgcOj7ISo+TH/qatz+qG+ZFY6o3+ki+w4lPYxKKQ18sA0NJ8ytQW/Jw9jRG7Z
	zdjJ66jATJXCHlC11hHyz5SF3kVOwl32NJeAAn6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwNgpIz8TL7UZBJUiMazigLsoaGigjUX60vDVmtritQ=;
	b=hECbPh0Pf8G8hbbZiQlFBR51mvaC7xPpgvOHkgIVUmqE3rWiqIN2cO14EphHp4Em
	6sSDCKMDpYNHP8npQNVeNG1/nJ7t236OrVhVN74mJv8P0a+cKF6irwCjQroUYmhetZZ
	n4HZpvQ6Eml63lx7OZOdsFRFGT7HxsXn0StfzcrI=
Content-Type: multipart/mixed; boundary="===============1156307532117250898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.2 SUCCEEDED
Message-ID: <0101018786143ecf-fcfb59ce-638c-49d3-afb2-311ba632fd36-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180088

--===============1156307532117250898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-libav* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.22.0-1.22.2.patch
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
--===============1156307532117250898==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.0-1.22.2.patch"

RnJvbSA0ZTJmOTdlYzg2YzExMDFlZWI0ZThjZGQ4MWIxODRiZmVkMTY5YWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6NTE6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtbGliYXY6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMgoKLS0tCiAuLi4vZ3N0
cmVhbWVyMS4wLWxpYmF2L2ZmbXBlZy02LjAucGF0Y2ggICAgICAgfCA0OSAtLS0tLS0tLS0tLS0t
LS0tLS0tCiAuLi4xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjIuMi5iYn0gfCAg
NiArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkK
IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2L2ZmbXBlZy02LjAucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJhdl8xLjIyLjAuYmIgPT4gZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuMi5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2L2ZmbXBlZy02LjAucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2L2Zm
bXBlZy02LjAucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDBhMDY1NDBmYjQu
LjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdi9mZm1wZWctNi4wLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDkgKzAs
MCBAQAotRnJvbSBjZGUzMWQyM2MwNzFlZTkzZmFlOTYzMzE4MDVmNjk2ODU2MDg0MjU0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogIlUuIEFydGllIEVvZmYiIDx1bGx5c3Nlcy5hLmVv
ZmZAaW50ZWwuY29tPgotRGF0ZTogTW9uLCAxMyBGZWIgMjAyMyAxNzowMjowMSAtMDUwMAotU3Vi
amVjdDogW1BBVENIXSBhdnZpZGRlYzogY2hhbmdlCi0gQVZfQ09ERUNfQ0FQX0FVVE9fVEhSRUFE
Uy0+QVZfQ09ERUNfQ0FQX09USEVSX1RIUkVBRFMKLQotVGhpcyBmaXhlcyBhIGNvbXBpbGUgZXJy
b3Igd2l0aCByZWNlbnQgdXBzdHJlYW0gRkZtcGVnLgotCi1UaGUgQVZfQ09ERUNfQ0FQX0FVVE9f
VEhSRUFEUyB3YXMgZGVwcmVjYXRlZCBhbmQgcmVuYW1lZCB0bwotQVZfQ09ERUNfQ0FQX09USEVS
X1RIUkVBRFMgaW4gRkZtcGVnIHVwc3RyZWFtIGNvbW1pdAotN2QwOTU3OTE5MGRlIChsYXZjIDU4
LjEzMi4xMDApLgotCi1UaGUgQVZfQ09ERUNfQ0FQX0FVVE9fVEhSRUFEUyB3YXMgZmluYWxseSBy
ZW1vdmVkIGluIEZGbXBlZyB1cHN0cmVhbQotY29tbWl0IDEwYzlhMDg3NGNiMyAobGF2YyA1OS42
My4xMDApLgotCi1QYXJ0LW9mOiA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2dzdHJl
YW1lci9nc3RyZWFtZXIvLS9tZXJnZV9yZXF1ZXN0cy8zOTY0PgotCi1VcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0IFtodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdHJl
YW1lci8tL2NvbW1pdC9jZGUzMWQyM2MwNzFlZTkzZmFlOTYzMzE4MDVmNjk2ODU2MDg0MjU0P21l
cmdlX3JlcXVlc3RfaWlkPTM5NjRdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gZXh0L2xpYmF2L2dzdGF2dmlkZGVjLmMgfCA2ICsr
KysrLQotIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKLQot
ZGlmZiAtLWdpdCBhL2V4dC9saWJhdi9nc3RhdnZpZGRlYy5jIGIvZXh0L2xpYmF2L2dzdGF2dmlk
ZGVjLmMKLWluZGV4IDQzY2VhNDU2YWU4Li42ZDdjNGNkMGRlOCAxMDA2NDQKLS0tLSBhL2V4dC9s
aWJhdi9nc3RhdnZpZGRlYy5jCi0rKysgYi9leHQvbGliYXYvZ3N0YXZ2aWRkZWMuYwotQEAgLTM1
LDYgKzM1LDEwIEBACi0gCi0gR1NUX0RFQlVHX0NBVEVHT1JZX1NUQVRJQyAoR1NUX0NBVF9QRVJG
T1JNQU5DRSk7Ci0gCi0rI2lmIExJQkFWQ09ERUNfVkVSU0lPTl9JTlQgPCBBVl9WRVJTSU9OX0lO
VCg1OCwxMzIsMTAwKQotKyNkZWZpbmUgQVZfQ09ERUNfQ0FQX09USEVSX1RIUkVBRFMgQVZfQ09E
RUNfQ0FQX0FVVE9fVEhSRUFEUwotKyNlbmRpZgotKwotICNkZWZpbmUgR1NUX0ZGTVBFR19WSURF
T19DT0RFQ19GUkFNRV9GTEFHX0FMTE9DQVRFRCAoMTw8MTUpCi0gCi0gI2RlZmluZSBNQVhfVFNf
TUFTSyAweGZmCi1AQCAtNjE1LDcgKzYxOSw3IEBAIGdzdF9mZm1wZWd2aWRkZWNfc2V0X2Zvcm1h
dCAoR3N0VmlkZW9EZWNvZGVyICogZGVjb2RlciwKLSAgIGlmIChmZm1wZWdkZWMtPm1heF90aHJl
YWRzID09IDApIHsKLSAgICAgLyogV2hlbiB0aHJlYWQgdHlwZSBpcyBGRl9USFJFQURfRlJBTUUs
IGV4dHJhIGxhdGVuY3kgaXMgaW50cm9kdWNlZCBlcXVhbAotICAgICAgKiB0byBvbmUgZnJhbWUg
cGVyIHRocmVhZC4gV2UgdGh1cyBuZWVkIHRvIGNhbGN1bGF0ZSB0aGUgdGhyZWFkIGNvdW50IG91
cnNlbHZlcyAqLwotLSAgICBpZiAoKCEob2NsYXNzLT5pbl9wbHVnaW4tPmNhcGFiaWxpdGllcyAm
IEFWX0NPREVDX0NBUF9BVVRPX1RIUkVBRFMpKSB8fAotKyAgICBpZiAoKCEob2NsYXNzLT5pbl9w
bHVnaW4tPmNhcGFiaWxpdGllcyAmIEFWX0NPREVDX0NBUF9PVEhFUl9USFJFQURTKSkgfHwKLSAg
ICAgICAgIChmZm1wZWdkZWMtPmNvbnRleHQtPnRocmVhZF90eXBlICYgRkZfVEhSRUFEX0ZSQU1F
KSkKLSAgICAgICBmZm1wZWdkZWMtPmNvbnRleHQtPnRocmVhZF9jb3VudCA9Ci0gICAgICAgICAg
IE1JTiAoZ3N0X2ZmbXBlZ19hdXRvX21heF90aHJlYWRzICgpLCAxNik7Ci0tLSAKLUdpdExhYgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1saWJhdl8xLjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2XzEuMjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxpYmF2XzEu
MjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdl8xLjIyLjIuYmIKaW5kZXggZDFkY2U2NzM5ZC4uZWQzZGJhY2EyMiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1s
aWJhdl8xLjIyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjIyLjIuYmIKQEAgLTExLDEwICsxMSw4IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5Zjdh
NzcwIFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2V4dC9saWJhdi9nc3Rhdi5oO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MTg7bWQ1PWE3NTJjMzUyNjdkODI3NmZkOWNhM2RiNjk5NGZjYTljIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCi1TUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHogXAotICAg
ICAgICAgICBmaWxlOi8vZmZtcGVnLTYuMC5wYXRjaCBcCi0gICAgICAgICAgIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjBlNDg0MDdiNDkwNTIyN2EyNjAyMTNkYmRhODRjYmEzODEyZjA1MzBmYzdh
NzViNDM4MjkxMDJlZjgyODEwZjEiCitTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVk
ZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZmNhYWY5ODc4ZmU4ZjNiYzgyMzE3ZWYxM2ExNTU4ODI0Y2I2OGRmMWY4
OTY4YzY3OTdmNTU2YzVlMzNiY2ZmZCIKIAogUyA9ICIke1dPUktESVJ9L2dzdC1saWJhdi0ke1BW
fSIKIAotLSAKMi4zOS4yCgo=

--===============1156307532117250898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 728824 to 729792 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 499251 to 499845 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.0.tar.xz file://ffmpeg-6.0.patch" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.2.tar.xz"

--===============1156307532117250898==--

