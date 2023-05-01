Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A210CA9EB0
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.107422.1682976349634992511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fPkmlMud;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d9352bee-c520b1a5-065b-49b6-9a99-731353bf568f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VXSRYWeZgNWmY8FEIdmIsmn36DVzD6xxA1dF+0ScywQ=;
	b=fPkmlMudLXiknjTsg5/bp2KuDu62FtWkciyUn9fFPxR1wSNXMYGmf0qw9ogPUKgd
	WoQJITrtDxKskzacBYLEBtJ3S/jVFNnBy6YELbgRqdcoXZln7Z8Hh8C8253MeI6VuMe
	o6DHqLyRYL5I6/F3pILKk86GiSeTla822bVSNQ7w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VXSRYWeZgNWmY8FEIdmIsmn36DVzD6xxA1dF+0ScywQ=;
	b=ZI7AQkYCCgH3HItUQipWMzBJH4iDKedx+tLA0724lcgAsrKEpuS+exReoy5duzon
	dGeCN7eR41FjtRHBkRgGpTBm80hefR/gDauSqpcfM6TXBCd74LKphRKub9S2kcke52a
	cwZLb+GH82m/aWkKMnekWYuAsA2qVUrUobt52FzU=
Content-Type: multipart/mixed; boundary="===============7229721311208749653=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.22.2 SUCCEEDED
Message-ID: <01010187d9352bee-c520b1a5-065b-49b6-9a99-731353bf568f-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180683

--===============7229721311208749653==
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
--===============7229721311208749653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGSIZE changed from 728824 to 729792 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGSIZE changed from 499251 to 499845 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-libav: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.0.tar.xz file://ffmpeg-6.0.patch" to "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-1.22.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-libav: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-libav: PKGV changed from 1.22.0 [default] to 1.22.2 [default]

--===============7229721311208749653==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.22.0-1.22.2.patch"

RnJvbSA1NmJkODJlNzJiNzI5OTljNDdiZmIwNTU4NTQ2MTc4ODZmMDA1NzAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxOTozODowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4yCgotLS0KIC4uLi9nc3Ry
ZWFtZXIxLjAtbGliYXYvZmZtcGVnLTYuMC5wYXRjaCAgICAgICB8IDQ5IC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLjEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yMi4yLmJifSB8ICA2
ICstLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtbGliYXYvZmZtcGVnLTYuMC5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2XzEuMjIuMC5iYiA9PiBnc3RyZWFt
ZXIxLjAtbGliYXZfMS4yMi4yLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXYvZmZtcGVnLTYuMC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXYvZmZt
cGVnLTYuMC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMGEwNjU0MGZiNC4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2L2ZmbXBlZy02LjAucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0OSArMCww
IEBACi1Gcm9tIGNkZTMxZDIzYzA3MWVlOTNmYWU5NjMzMTgwNWY2OTY4NTYwODQyNTQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiAiVS4gQXJ0aWUgRW9mZiIgPHVsbHlzc2VzLmEuZW9m
ZkBpbnRlbC5jb20+Ci1EYXRlOiBNb24sIDEzIEZlYiAyMDIzIDE3OjAyOjAxIC0wNTAwCi1TdWJq
ZWN0OiBbUEFUQ0hdIGF2dmlkZGVjOiBjaGFuZ2UKLSBBVl9DT0RFQ19DQVBfQVVUT19USFJFQURT
LT5BVl9DT0RFQ19DQVBfT1RIRVJfVEhSRUFEUwotCi1UaGlzIGZpeGVzIGEgY29tcGlsZSBlcnJv
ciB3aXRoIHJlY2VudCB1cHN0cmVhbSBGRm1wZWcuCi0KLVRoZSBBVl9DT0RFQ19DQVBfQVVUT19U
SFJFQURTIHdhcyBkZXByZWNhdGVkIGFuZCByZW5hbWVkIHRvCi1BVl9DT0RFQ19DQVBfT1RIRVJf
VEhSRUFEUyBpbiBGRm1wZWcgdXBzdHJlYW0gY29tbWl0Ci03ZDA5NTc5MTkwZGUgKGxhdmMgNTgu
MTMyLjEwMCkuCi0KLVRoZSBBVl9DT0RFQ19DQVBfQVVUT19USFJFQURTIHdhcyBmaW5hbGx5IHJl
bW92ZWQgaW4gRkZtcGVnIHVwc3RyZWFtCi1jb21taXQgMTBjOWEwODc0Y2IzIChsYXZjIDU5LjYz
LjEwMCkuCi0KLVBhcnQtb2Y6IDxodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVh
bWVyL2dzdHJlYW1lci8tL21lcmdlX3JlcXVlc3RzLzM5NjQ+Ci0KLVVwc3RyZWFtLVN0YXR1czog
QmFja3BvcnQgW2h0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9nc3RyZWFtZXIvZ3N0cmVh
bWVyLy0vY29tbWl0L2NkZTMxZDIzYzA3MWVlOTNmYWU5NjMzMTgwNWY2OTY4NTYwODQyNTQ/bWVy
Z2VfcmVxdWVzdF9paWQ9Mzk2NF0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4QGxpbnV0cm9uaXguZGU+Ci0tLS0KLSBleHQvbGliYXYvZ3N0YXZ2aWRkZWMuYyB8IDYgKysr
KystCi0gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1k
aWZmIC0tZ2l0IGEvZXh0L2xpYmF2L2dzdGF2dmlkZGVjLmMgYi9leHQvbGliYXYvZ3N0YXZ2aWRk
ZWMuYwotaW5kZXggNDNjZWE0NTZhZTguLjZkN2M0Y2QwZGU4IDEwMDY0NAotLS0tIGEvZXh0L2xp
YmF2L2dzdGF2dmlkZGVjLmMKLSsrKyBiL2V4dC9saWJhdi9nc3RhdnZpZGRlYy5jCi1AQCAtMzUs
NiArMzUsMTAgQEAKLSAKLSBHU1RfREVCVUdfQ0FURUdPUllfU1RBVElDIChHU1RfQ0FUX1BFUkZP
Uk1BTkNFKTsKLSAKLSsjaWYgTElCQVZDT0RFQ19WRVJTSU9OX0lOVCA8IEFWX1ZFUlNJT05fSU5U
KDU4LDEzMiwxMDApCi0rI2RlZmluZSBBVl9DT0RFQ19DQVBfT1RIRVJfVEhSRUFEUyBBVl9DT0RF
Q19DQVBfQVVUT19USFJFQURTCi0rI2VuZGlmCi0rCi0gI2RlZmluZSBHU1RfRkZNUEVHX1ZJREVP
X0NPREVDX0ZSQU1FX0ZMQUdfQUxMT0NBVEVEICgxPDwxNSkKLSAKLSAjZGVmaW5lIE1BWF9UU19N
QVNLIDB4ZmYKLUBAIC02MTUsNyArNjE5LDcgQEAgZ3N0X2ZmbXBlZ3ZpZGRlY19zZXRfZm9ybWF0
IChHc3RWaWRlb0RlY29kZXIgKiBkZWNvZGVyLAotICAgaWYgKGZmbXBlZ2RlYy0+bWF4X3RocmVh
ZHMgPT0gMCkgewotICAgICAvKiBXaGVuIHRocmVhZCB0eXBlIGlzIEZGX1RIUkVBRF9GUkFNRSwg
ZXh0cmEgbGF0ZW5jeSBpcyBpbnRyb2R1Y2VkIGVxdWFsCi0gICAgICAqIHRvIG9uZSBmcmFtZSBw
ZXIgdGhyZWFkLiBXZSB0aHVzIG5lZWQgdG8gY2FsY3VsYXRlIHRoZSB0aHJlYWQgY291bnQgb3Vy
c2VsdmVzICovCi0tICAgIGlmICgoIShvY2xhc3MtPmluX3BsdWdpbi0+Y2FwYWJpbGl0aWVzICYg
QVZfQ09ERUNfQ0FQX0FVVE9fVEhSRUFEUykpIHx8Ci0rICAgIGlmICgoIShvY2xhc3MtPmluX3Bs
dWdpbi0+Y2FwYWJpbGl0aWVzICYgQVZfQ09ERUNfQ0FQX09USEVSX1RIUkVBRFMpKSB8fAotICAg
ICAgICAgKGZmbXBlZ2RlYy0+Y29udGV4dC0+dGhyZWFkX3R5cGUgJiBGRl9USFJFQURfRlJBTUUp
KQotICAgICAgIGZmbXBlZ2RlYy0+Y29udGV4dC0+dGhyZWFkX2NvdW50ID0KLSAgICAgICAgICAg
TUlOIChnc3RfZmZtcGVnX2F1dG9fbWF4X3RocmVhZHMgKCksIDE2KTsKLS0tIAotR2l0TGFiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LWxpYmF2XzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjAtbGliYXZfMS4yMi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZfMS4y
Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjIuMi5iYgppbmRleCBkMWRjZTY3MzlkLi5lZDNkYmFjYTIyIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLWxpYmF2XzEuMjIuMi5iYgpAQCAtMTEsMTAgKzExLDggQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjkzMzNkYWEwNDRjYjc3ZTQ4NmNjMzYxMjlmN2E3
NzAgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vZXh0L2xpYmF2L2dzdGF2Lmg7YmVnaW5s
aW5lPTE7ZW5kbGluZT0xODttZDU9YTc1MmMzNTI2N2Q4Mjc2ZmQ5Y2EzZGI2OTk0ZmNhOWMgXAog
ICAgICAgICAgICAgICAgICAgICAiCiAKLVNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJl
ZWRlc2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiBcCi0gICAg
ICAgICAgIGZpbGU6Ly9mZm1wZWctNi4wLnBhdGNoIFwKLSAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiMGU0ODQwN2I0OTA1MjI3YTI2MDIxM2RiZGE4NGNiYTM4MTJmMDUzMGZjN2E3
NWI0MzgyOTEwMmVmODI4MTBmMSIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRl
c2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJmY2FhZjk4NzhmZThmM2JjODIzMTdlZjEzYTE1NTg4MjRjYjY4ZGYxZjg5
NjhjNjc5N2Y1NTZjNWUzM2JjZmZkIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LWxpYmF2LSR7UFZ9
IgogCi0tIAoyLjM5LjIKCg==

--===============7229721311208749653==--

