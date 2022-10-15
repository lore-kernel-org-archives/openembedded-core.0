Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7C8C3A589
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:13:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.24672.1665871975299186191
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L0DFJcAG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddb510d5-42c932c6-c24c-4d3b-8ff2-e1a1575eee0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XNTOKSwSBy/vm4f24/1ISPKCB40/BlN1xUY7GasG56s=;
	b=L0DFJcAGreWdEX5z8mDZ922DUAOTsTXQN4Ui7VMaL5wRAIe1fryUP4ZG+o7CxLv/
	u3AuxYUSRZVdAjJuJWC8X+di8JTj8LnWT5xq0BSvUf131CpXVOENF7wr0tj19RCO/UY
	ISfX0phGHxX0rMDg48HHlg6eSQM1az2dG18R4oqg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XNTOKSwSBy/vm4f24/1ISPKCB40/BlN1xUY7GasG56s=;
	b=GUpL0gKGMaBLEnBtf9H53MYnEo+ElmQag2GYzI+PyZo2wkDZ1X8ORuG0jfbf2Jd9
	yBcvkbCcubPS39TxPaBhLtGwfu4NoXYF1cOcZhm9VonqHjsqwfWsfGVcZTK5/v1EWJH
	pUsZpHAiJ3MVWvjrjzXCCMV1TiN9Y4ix/JVau7eE=
Content-Type: multipart/mixed; boundary="===============7682455065406032758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libbsd: upgrading to 0.11.7 SUCCEEDED
Message-ID: <01010183ddb510d5-42c932c6-c24c-4d3b-8ff2-e1a1575eee0f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171871

--===============7682455065406032758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libbsd* to *0.11.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libbsd-upgrade-0.11.6-0.11.7.patch
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
--===============7682455065406032758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libbsd/libbsd: FILELIST: removed "/usr/lib/libbsd.so.0.11.6", added "/usr/lib/libbsd.so.0.11.7"
Changes to packages/core2-32-poky-linux/libbsd (sysroot):
  /usr/lib/libbsd.so.0 changed symlink target from libbsd.so.0.11.6 to libbsd.so.0.11.7
  /usr/lib/libbsd.so.0.11.6 moved to /usr/lib/libbsd.so.0.11.7

--===============7682455065406032758==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libbsd-upgrade-0.11.6-0.11.7.patch"

RnJvbSBhZDNjNWYxOTA0MjQ0N2UwNDBkNTNkMDNhNzIxODZkZTM1NjYwN2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMjA6MzI6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJic2Q6IHVwZ3JhZGUgMC4xMS42IC0+IDAuMTEuNwoKLS0tCiAuLi4ve2xpYmJzZF8wLjExLjYu
YmIgPT4gbGliYnNkXzAuMTEuNy5iYn0gICAgfCA2NiArKysrKysrKysrKysrKysrKystCiAxIGZp
bGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJic2Qve2xpYmJzZF8wLjExLjYuYmIgPT4gbGliYnNkXzAuMTEu
Ny5iYn0gKDMxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGli
YnNkXzAuMTEuNi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmJzZC9saWJic2RfMC4xMS43
LmJiCnNpbWlsYXJpdHkgaW5kZXggMzElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2xpYmJzZC9saWJic2RfMC4xMS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJic2QvbGliYnNkXzAuMTEuNy5iYgppbmRleCA3NGZjOGVmNGU1Li5jMzNiMmJiODBmIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTEuNi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJic2QvbGliYnNkXzAuMTEuNy5iYgpAQCAtMSwzICsx
LDY1IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVw
ZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNl
IHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNo
YW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcu
CisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicp
CisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBA
QCAtMjMsMzkgKzIzLDYgQEAKKyMgICAzLiBBbGwgYWR2ZXJ0aXNpbmcgbWF0ZXJpYWxzIG1lbnRp
b25pbmcgZmVhdHVyZXMgb3IgdXNlIG9mIHRoaXMgc29mdHdhcmUKKyMgICAgICBtdXN0IGRpc3Bs
YXkgdGhlIGZvbGxvd2luZyBhY2tub3dsZWRnZW1lbnQ6CisjICAgICAgICBUaGlzIHByb2R1Y3Qg
aW5jbHVkZXMgc29mdHdhcmUgZGV2ZWxvcGVkIGJ5IE5pZWxzIFByb3Zvcy4KKyMgLSA0LiBUaGUg
bmFtZSBvZiB0aGUgYXV0aG9yIG1heSBub3QgYmUgdXNlZCB0byBlbmRvcnNlIG9yIHByb21vdGUg
cHJvZHVjdHMKKyMgLSAgICBkZXJpdmVkIGZyb20gdGhpcyBzb2Z0d2FyZSB3aXRob3V0IHNwZWNp
ZmljIHByaW9yIHdyaXR0ZW4gcGVybWlzc2lvbi4KKyMgLSAuCisjIC0gVEhJUyBTT0ZUV0FSRSBJ
UyBQUk9WSURFRCBCWSBUSEUgQVVUSE9SIGBgQVMgSVMnJyBBTkQgQU5ZIEVYUFJFU1MgT1IKKyMg
LSBJTVBMSUVEIFdBUlJBTlRJRVMsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUg
SU1QTElFRCBXQVJSQU5USUVTCisjIC0gT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRSBBUkUgRElTQ0xBSU1FRC4KKyMgLSBJTiBOTyBFVkVOVCBT
SEFMTCBUSEUgQVVUSE9SIEJFIExJQUJMRSBGT1IgQU5ZIERJUkVDVCwgSU5ESVJFQ1QsCisjIC0g
SU5DSURFTlRBTCwgU1BFQ0lBTCwgRVhFTVBMQVJZLCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMg
KElOQ0xVRElORywgQlVUCisjIC0gTk9UIExJTUlURUQgVE8sIFBST0NVUkVNRU5UIE9GIFNVQlNU
SVRVVEUgR09PRFMgT1IgU0VSVklDRVM7IExPU1MgT0YgVVNFLAorIyAtIERBVEEsIE9SIFBST0ZJ
VFM7IE9SIEJVU0lORVNTIElOVEVSUlVQVElPTikgSE9XRVZFUiBDQVVTRUQgQU5EIE9OIEFOWQor
IyAtIFRIRU9SWSBPRiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQ09OVFJBQ1QsIFNUUklDVCBMSUFC
SUxJVFksIE9SIFRPUlQKKyMgLSAoSU5DTFVESU5HIE5FR0xJR0VOQ0UgT1IgT1RIRVJXSVNFKSBB
UklTSU5HIElOIEFOWSBXQVkgT1VUIE9GIFRIRSBVU0UgT0YKKyMgLSBUSElTIFNPRlRXQVJFLCBF
VkVOIElGIEFEVklTRUQgT0YgVEhFIFBPU1NJQklMSVRZIE9GIFNVQ0ggREFNQUdFLgorIyAtCisj
IC1GaWxlczoKKyMgLSBtYW4vZ2V0cHJvZ25hbWUuM2JzZAorIyAtQ29weXJpZ2h0OgorIyAtIENv
cHlyaWdodCDCqSAyMDAxIENocmlzdG9waGVyIEcuIERlbWV0cmlvdQorIyAtIEFsbCByaWdodHMg
cmVzZXJ2ZWQuCisjIC1MaWNlbnNlOiBCU0QtNC1jbGF1c2UtQ2hyaXN0b3BoZXItRy1EZW1ldHJp
b3UKKyMgLSBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1z
LCB3aXRoIG9yIHdpdGhvdXQKKyMgLSBtb2RpZmljYXRpb24sIGFyZSBwZXJtaXR0ZWQgcHJvdmlk
ZWQgdGhhdCB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnMKKyMgLSBhcmUgbWV0OgorIyAtIDEuIFJl
ZGlzdHJpYnV0aW9ucyBvZiBzb3VyY2UgY29kZSBtdXN0IHJldGFpbiB0aGUgYWJvdmUgY29weXJp
Z2h0CisjIC0gICAgbm90aWNlLCB0aGlzIGxpc3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxv
d2luZyBkaXNjbGFpbWVyLgorIyAtIDIuIFJlZGlzdHJpYnV0aW9ucyBpbiBiaW5hcnkgZm9ybSBt
dXN0IHJlcHJvZHVjZSB0aGUgYWJvdmUgY29weXJpZ2h0CisjIC0gICAgbm90aWNlLCB0aGlzIGxp
c3Qgb2YgY29uZGl0aW9ucyBhbmQgdGhlIGZvbGxvd2luZyBkaXNjbGFpbWVyIGluIHRoZQorIyAt
ICAgIGRvY3VtZW50YXRpb24gYW5kL29yIG90aGVyIG1hdGVyaWFscyBwcm92aWRlZCB3aXRoIHRo
ZSBkaXN0cmlidXRpb24uCisjIC0gMy4gQWxsIGFkdmVydGlzaW5nIG1hdGVyaWFscyBtZW50aW9u
aW5nIGZlYXR1cmVzIG9yIHVzZSBvZiB0aGlzIHNvZnR3YXJlCisjIC0gICAgbXVzdCBkaXNwbGF5
IHRoZSBmb2xsb3dpbmcgYWNrbm93bGVkZ2VtZW50OgorIyAtICAgICAgICAgIFRoaXMgcHJvZHVj
dCBpbmNsdWRlcyBzb2Z0d2FyZSBkZXZlbG9wZWQgZm9yIHRoZQorIyAtICAgICAgICAgIE5ldEJT
RCBQcm9qZWN0LiAgU2VlIGh0dHA6Ly93d3cubmV0YnNkLm9yZy8gZm9yCisjIC0gICAgICAgICAg
aW5mb3JtYXRpb24gYWJvdXQgTmV0QlNELgorIyAgIDQuIFRoZSBuYW1lIG9mIHRoZSBhdXRob3Ig
bWF5IG5vdCBiZSB1c2VkIHRvIGVuZG9yc2Ugb3IgcHJvbW90ZSBwcm9kdWN0cworIyAgICAgIGRl
cml2ZWQgZnJvbSB0aGlzIHNvZnR3YXJlIHdpdGhvdXQgc3BlY2lmaWMgcHJpb3Igd3JpdHRlbiBw
ZXJtaXNzaW9uLgorIyAgIC4KKyMgQEAgLTQwMiw3ICszNjksNyBAQAorIyAgIENvcHlyaWdodCDC
qSAyMDE0IFRoZW8gZGUgUmFhZHQgPGRlcmFhZHRAb3BlbmJzZC5vcmc+CisjICAgQ29weXJpZ2h0
IMKpIDIwMTQgR29vZ2xlIEluYy4KKyMgICBDb3B5cmlnaHQgwqkgMjAxNSBNaWNoYWVsIEZlbHQg
PGFpeHRvb2xzQGdtYWlsLmNvbT4KKyMgLSBDb3B5cmlnaHQgwqkgMjAxNSBHdWlsbGVtIEpvdmVy
IDxndWlsbGVtQGhhZHJvbnMub3JnPgorIyArIENvcHlyaWdodCDCqSAyMDE1LCAyMDIyIEd1aWxs
ZW0gSm92ZXIgPGd1aWxsZW1AaGFkcm9ucy5vcmc+CisjICBMaWNlbnNlOiBJU0MKKyMgICBQZXJt
aXNzaW9uIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBhbmQgZGlzdHJpYnV0ZSB0aGlzIHNvZnR3YXJl
IGZvciBhbnkKKyMgICBwdXJwb3NlIHdpdGggb3Igd2l0aG91dCBmZWUgaXMgaGVyZWJ5IGdyYW50
ZWQsIHByb3ZpZGVkIHRoYXQgdGhlIGFib3ZlCisjIAorIworCiAjIENvcHlyaWdodCAoQykgMjAx
MyBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIyBSZWxlYXNlZCB1bmRlciB0aGUgTUlU
IGxpY2Vuc2UgKHNlZSBDT1BZSU5HLk1JVCBmb3IgdGhlIHRlcm1zKQogCkBAIC0yOSwxMiArOTEs
MTIgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9saWJic2QuZnJlZWRlc2t0b3Aub3JnL3dpa2kvIgog
IyBMaWNlbnNlOiBwdWJsaWMtZG9tYWluLUNvbGluLVBsdW1iCiBMSUNFTlNFID0gIkJTRC0zLUNs
YXVzZSAmIEJTRC00LUNsYXVzZSAmIElTQyAmIFBEIgogTElDRU5TRToke1BOfSA9ICJCU0QtMy1D
bGF1c2UgJiBJU0MgJiBQRCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1
PWMyYzYzNWI5NGM4ZGNkMzU5M2Y1M2UxMGZhOGE0OTllIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9NzVlODVjNWE1NThmODZkMTBmYmQ1YWJjNTY3ZWE1ZTYiCiBTRUNU
SU9OID0gImxpYnMiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9saWJic2QuZnJlZWRlc2t0b3Aub3Jn
L3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIx
OWIzOGYzMTcyZWFmNjkzZTZlMWM2ODcxNDYzNjE5MGM3ZTQ4ODUxZTQ1MjI0ZDcyMGIzYjViYzA0
OTliNWRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjliYWExODYwNTllYmJmMjVjMDYzMDhlOWY5
OTFmZGEzMWY3MTgzYzBmMjQ5MzE4MjZkODNhYTZhYmQ4YTAyNjEiCiAKIGluaGVyaXQgYXV0b3Rv
b2xzIHBrZ2NvbmZpZwogCi0tIAoyLjMxLjEKCg==

--===============7682455065406032758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libbsd: SRC_URI changed from "https://libbsd.freedesktop.org/releases/libbsd-0.11.6.tar.xz" to "https://libbsd.freedesktop.org/releases/libbsd-0.11.7.tar.xz"
packages/core2-32-poky-linux/libbsd: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-dbg: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-dbg: FILELIST: removed "/usr/lib/.debug/libbsd.so.0.11.6", added "/usr/lib/.debug/libbsd.so.0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-dbg: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-dbg: PKGSIZE changed from 230284 to 230996 (+0%)
packages/core2-32-poky-linux/libbsd/libbsd-dev: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-dev: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-dev: PKGSIZE changed from 135599 to 135776 (+0%)
packages/core2-32-poky-linux/libbsd/libbsd-doc: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-doc: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-doc: PKGSIZE changed from 245437 to 245214 (-0%)
packages/core2-32-poky-linux/libbsd/libbsd-locale: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-locale: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-src: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-src: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd-src: PKGSIZE changed from 282318 to 283012 (+0%)
packages/core2-32-poky-linux/libbsd/libbsd-staticdev: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd-staticdev: PV changed from "0.11.6" to "0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd: PKGV changed from 0.11.6 [default] to 0.11.7 [default]
packages/core2-32-poky-linux/libbsd/libbsd: FILELIST: removed "/usr/lib/libbsd.so.0.11.6", added "/usr/lib/libbsd.so.0.11.7"
packages/core2-32-poky-linux/libbsd/libbsd: PV changed from "0.11.6" to "0.11.7"
Changes to packages/core2-32-poky-linux/libbsd (sysroot):
  /usr/lib/libbsd.so.0 changed symlink target from libbsd.so.0.11.6 to libbsd.so.0.11.7
  /usr/lib/libbsd.so.0.11.6 moved to /usr/lib/libbsd.so.0.11.7

--===============7682455065406032758==--

