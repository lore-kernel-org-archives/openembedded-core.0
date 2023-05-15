Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A2ACA9EC0
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3715.1684186748012714628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SR9fs3ue;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a50c0-b44fdf30-3627-4b7f-8fca-0887ae2917c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pwRcvpPSY/KJvCbZTJibIx1u0psd5EXTLGaWzzf+OtA=;
	b=SR9fs3ueWKbECRt/PA/ha3RHm4S1LDHIzM1B8EAAKO29l4pD5DIyfe0llbGEBQG+
	rGqsLSs4H2Z7kK+ETgX707ZvAUO+IwZq2065Z15WxIPP+2lSmK2HXN9vh1C7o88V3sp
	n7+4reF2W405WXzrv2E/b4WE4YCOZYH9u+9l7W08=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pwRcvpPSY/KJvCbZTJibIx1u0psd5EXTLGaWzzf+OtA=;
	b=RYlzM+qqEzU4PDs2PdJFK4F8qSMPEYpMzEqSGcoWrwWvHpxKnl9W5o6bC1sUV3FF
	GsKmg7kTFMmG5wvYxDYy85Bss6Xj9MZnLc9fdq24U024QpabDFYOQGwQDjKjsGTzf68
	c/WDjNlh/ir7y2Tm8gmAgwp0UyF3dP4cVHV/EwPM=
Content-Type: multipart/mixed; boundary="===============8136379004489425574=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.20 SUCCEEDED
Message-ID: <01010188215a50c0-b44fdf30-3627-4b7f-8fca-0887ae2917c9-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181313

--===============8136379004489425574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-docutils* to *0.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.19-0.20.patch
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
--===============8136379004489425574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-docutils: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.19.tar.gz;downloadfilename=docutils-0.19.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.20.tar.gz;downloadfilename=docutils-0.20.tar.gz"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.19 [default] to 0.20 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.11/site-packages/docutils-0.19.dist-info -> /usr/lib/python3.11/site-packages/docutils-0.20.dist-info, added "/usr/lib/python3.11/site-packages/docutils/languages/uk.py /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 3964079 to 4007831 (+1%)
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PV changed from "0.19" to "0.20"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.19 [default] to 0.20 [default]
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info moved to /usr/lib/python3.11/site-packages/docutils-0.20.dist-info
  /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py was added

--===============8136379004489425574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.11/site-packages/docutils-0.19.dist-info -> /usr/lib/python3.11/site-packages/docutils-0.20.dist-info, added "/usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc /usr/lib/python3.11/site-packages/docutils/languages/uk.py /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.11/site-packages/docutils-0.19.dist-info moved to /usr/lib/python3.11/site-packages/docutils-0.20.dist-info
  /usr/lib/python3.11/site-packages/docutils/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/languages/uk.py was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/__pycache__/uk.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/docutils/parsers/rst/languages/uk.py was added

--===============8136379004489425574==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.19-0.20.patch"

RnJvbSAyYjg2YjU4N2JiM2M0N2Y4YTBjMDlkODdkYzI5MGE3Nzc3OTM5ZmUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTA6NTI6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRvY3V0aWxzOiB1cGdyYWRlIDAuMTkgLT4gMC4yMAoKLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtZG9jdXRpbHNfMC4xOS5iYiAgICAgICAgICAgfCAgMTEgLS0KIC4uLi9weXRob24vcHl0
aG9uMy1kb2N1dGlsc18wLjIwLmJiICAgICAgICAgICB8IDEwOCArKysrKysrKysrKysrKysrKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1
dGlsc18wLjE5LmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjAuYmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4xOS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjE5LmJiCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCA3YWU5M2FiNTU3Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1kb2N1dGlsc18wLjE5LmJiCisrKyAvZGV2L251bGwKQEAg
LTEsMTEgKzAsMCBAQAotU1VNTUFSWSA9ICJEb2N1dGlscyBpcyBhIG1vZHVsYXIgc3lzdGVtIGZv
ciBwcm9jZXNzaW5nIGRvY3VtZW50YXRpb24gaW50byB1c2VmdWwgZm9ybWF0cyIKLUhPTUVQQUdF
ID0gImh0dHA6Ly9kb2N1dGlscy5zb3VyY2Vmb3JnZS5uZXQiCi1TRUNUSU9OID0gImRldmVsL3B5
dGhvbiIKLUxJQ0VOU0UgPSAiUFNGLTIuMCAmIEJTRC0yLUNsYXVzZSAmIEdQTC0zLjAtb25seSIK
LUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcudHh0O21kNT00MTAwMWIyOTZhODli
YjI3ODBiYmUzMDZlOTQ3ZWNlZSIKLQotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzOTk1YTY3NTNj
MzBiN2Y1NzdmZWJmYzJjNTA0MTFmZWM2YWFjN2Y3ZmZlYjdjNGNmZTU5OTEwNzJkY2Y5ZTYiCi0K
LWluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwotCi1CQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRp
dmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
ZG9jdXRpbHNfMC4yMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1k
b2N1dGlsc18wLjIwLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjNh
YzkxNDAyYjcKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZG9jdXRpbHNfMC4yMC5iYgpAQCAtMCwwICsxLDEwOCBAQAorIyBGSVhNRTogdGhl
IExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVw
Z3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9s
ZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0Ug
dmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21t
aXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vu
c2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoK
KyMKKyMgLS0tIENPUFlJTkcudHh0CisjICsrKyBDT1BZSU5HLnR4dAorIyBAQCAtMSwxNyArMSwx
OSBAQAorIyArLi4gaW5jbHVkZTo6IGRvY3MvaGVhZGVyMC50eHQKKyMgKworIyAgPT09PT09PT09
PT09PT09PT09CisjICAgQ29weWluZyBEb2N1dGlscworIyAgPT09PT09PT09PT09PT09PT09Cisj
ICAKKyMgIDpBdXRob3I6IERhdmlkIEdvb2RnZXIKKyMgIDpDb250YWN0OiBnb29kZ2VyQHB5dGhv
bi5vcmcKKyMgLTpEYXRlOiAkRGF0ZTogMjAyMi0wNS0zMCAxODo1NDo0NiArMDIwMCAoTW8sIDMw
LiBNYWkgMjAyMikgJAorIyArOkRhdGU6ICREYXRlOiAyMDIyLTExLTI5IDAwOjU1OjI1ICswMTAw
IChEaSwgMjkuIE5vdiAyMDIyKSAkCisjICA6V2ViIHNpdGU6IGh0dHBzOi8vZG9jdXRpbHMuc291
cmNlZm9yZ2UuaW8vCisjICA6Q29weXJpZ2h0OiBUaGlzIGRvY3VtZW50IGhhcyBiZWVuIHBsYWNl
ZCBpbiB0aGUgcHVibGljIGRvbWFpbi4KKyMgIAorIyAgTW9zdCBvZiB0aGUgZmlsZXMgaW5jbHVk
ZWQgaW4gdGhpcyBwcm9qZWN0IGhhdmUgYmVlbiBwbGFjZWQgaW4gdGhlCisjICBwdWJsaWMgZG9t
YWluLCBhbmQgdGhlcmVmb3JlIGhhdmUgbm8gbGljZW5zZSByZXF1aXJlbWVudHMgYW5kIG5vCisj
ICByZXN0cmljdGlvbnMgb24gY29weWluZyBvciB1c2FnZTsgc2VlIHRoZSBgUHVibGljIERvbWFp
biBEZWRpY2F0aW9uYF8KKyMgLWJlbG93LiAgVGhlcmUgYXJlIGEgZmV3IGV4Y2VwdGlvbnNfLCBs
aXN0ZWQgYmVsb3cuCisjICtiZWxvdy4gIFRoZXJlIGFyZSBleGNlcHRpb25zXywgbGlzdGVkIGJl
bG93LgorIyAgRmlsZXMgaW4gdGhlIFNhbmRib3hfIGFyZSBub3QgZGlzdHJpYnV0ZWQgd2l0aCBE
b2N1dGlscyByZWxlYXNlcyBhbmQKKyMgIG1heSBoYXZlIGRpZmZlcmVudCBsaWNlbnNlIHRlcm1z
LgorIyAgCisjIEBAIC04Nyw4ICs4OSw4IEBACisjICAgIFJlbGVhc2VkIHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgYEJTRCAyLUNsYXVzZSBMaWNlbnNlYF8KKyMgICAgKGBsb2NhbCBjb3B5IDxsaWNl
bnNlcy9CU0QtMi1DbGF1c2UudHh0PmBfXykuCisjICAKKyMgLSogZG9jdXRpbHMvdXRpbHMvbWF0
aC9tYXRoMmh0bWwucHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3QvbWF0
aC5jc3MKKyMgKyogfCBkb2N1dGlscy91dGlscy9tYXRoL21hdGgyaHRtbC5weSwKKyMgKyAgfCBk
b2N1dGlscy93cml0ZXJzL2h0bWw1X3BvbHlnbG90L21hdGguY3NzCisjICAKKyMgICAgQ29weXJp
Z2h0IMKpIDIwMDksMjAxMCBBbGV4IEZlcm7DoW5kZXo7IDIwMjEgR8O8bnRlciBNaWxkZQorIyAg
CisjIEBAIC05OSwyOCArMTAxLDI4IEBACisjICAKKyMgICAgLi4gX2VMeVhlcjogaHR0cHM6Ly9n
aXRodWIuY29tL2FsZXhmZXJuYW5kZXovZWx5eGVyCisjICAKKyMgLSogZG9jdXRpbHMvX19tYWlu
X18ucHksCisjIC0gIGRvY3V0aWxzL3BhcnNlcnMvY29tbW9ubWFya193cmFwcGVyLnB5LAorIyAt
ICBkb2N1dGlscy9wYXJzZXJzL3JlY29tbW9ubWFya193cmFwcGVyLnB5LAorIyAtICBkb2N1dGls
cy91dGlscy9lcnJvcl9yZXBvcnRpbmcucHksCisjIC0gIGRvY3V0aWxzL3V0aWxzL21hdGgvX19p
bml0X18ucHksCisjIC0gIGRvY3V0aWxzL3V0aWxzL21hdGgvbGF0ZXgybWF0aG1sLnB5LAorIyAt
ICBkb2N1dGlscy91dGlscy9tYXRoL3RleDJtYXRobWxfZXh0ZXJuLnB5LAorIyAtICBkb2N1dGls
cy91dGlscy9wdW5jdHVhdGlvbl9jaGFycy5weSwKKyMgLSAgZG9jdXRpbHMvdXRpbHMvc21hcnRx
dW90ZXMucHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3QvX19pbml0X18u
cHksCisjIC0gIGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3QvKi5jc3MsCisjIC0gIGRv
Y3V0aWxzL3dyaXRlcnMvbGF0ZXgyZS9kb2N1dGlscy5zdHksCisjIC0gIGRvY3V0aWxzL3dyaXRl
cnMveGV0ZXgvX19pbml0X18ucHksCisjIC0gIHRlc3QvdGVzdF9wYXJzZXJzL3Rlc3RfcmVjb21t
b25tYXJrL1wqLnB5LAorIyAtICB0ZXN0L3Rlc3RfcGFyc2Vycy90ZXN0X3JzdC90ZXN0X2RpcmVj
dGl2ZXMvdGVzdF9faW5pdF9fLnB5LAorIyAtICB0ZXN0L3Rlc3RfcGFyc2Vycy90ZXN0X3JzdC90
ZXN0X2RpcmVjdGl2ZXMvdGVzdF9jb2RlX3BhcnNpbmcucHksCisjIC0gIHRlc3QvdGVzdF9wYXJz
ZXJzL3Rlc3RfcnN0L3Rlc3RfbGluZV9sZW5ndGhfbGltaXRfZGVmYXVsdC5weSwKKyMgLSAgdGVz
dC90ZXN0X3BhcnNlcnMvdGVzdF9yc3QvdGVzdF9saW5lX2xlbmd0aF9saW1pdC5weSwKKyMgLSAg
dGVzdC90ZXN0X3dyaXRlcnMvdGVzdF9sYXRleDJlX21pc2MucHksCisjIC0gIHRlc3QvdHJhbnNm
b3Jtcy90ZXN0X3NtYXJ0cXVvdGVzLnB5LAorIyAtICB0b29scy9kb2N1dGlscy1jbGkucHksCisj
IC0gIHRvb2xzL3JzdDJodG1sNS5weQorIyArKiB8IGRvY3V0aWxzL19fbWFpbl9fLnB5LAorIyAr
ICB8IGRvY3V0aWxzL3BhcnNlcnMvY29tbW9ubWFya193cmFwcGVyLnB5LAorIyArICB8IGRvY3V0
aWxzL3BhcnNlcnMvcmVjb21tb25tYXJrX3dyYXBwZXIucHksCisjICsgIHwgZG9jdXRpbHMvdXRp
bHMvZXJyb3JfcmVwb3J0aW5nLnB5LAorIyArICB8IGRvY3V0aWxzL3V0aWxzL21hdGgvX19pbml0
X18ucHksCisjICsgIHwgZG9jdXRpbHMvdXRpbHMvbWF0aC9sYXRleDJtYXRobWwucHksCisjICsg
IHwgZG9jdXRpbHMvdXRpbHMvbWF0aC90ZXgybWF0aG1sX2V4dGVybi5weSwKKyMgKyAgfCBkb2N1
dGlscy91dGlscy9wdW5jdHVhdGlvbl9jaGFycy5weSwKKyMgKyAgfCBkb2N1dGlscy91dGlscy9z
bWFydHF1b3Rlcy5weSwKKyMgKyAgfCBkb2N1dGlscy93cml0ZXJzL2h0bWw1X3BvbHlnbG90L19f
aW5pdF9fLnB5LAorIyArICB8IGRvY3V0aWxzL3dyaXRlcnMvaHRtbDVfcG9seWdsb3QvXCouY3Nz
LAorIyArICB8IGRvY3V0aWxzL3dyaXRlcnMvbGF0ZXgyZS9kb2N1dGlscy5zdHksCisjICsgIHwg
ZG9jdXRpbHMvd3JpdGVycy94ZXRleC9fX2luaXRfXy5weSwKKyMgKyAgfCB0ZXN0L3Rlc3RfcGFy
c2Vycy90ZXN0X3JlY29tbW9ubWFyay9cKi5weSwKKyMgKyAgfCB0ZXN0L3Rlc3RfcGFyc2Vycy90
ZXN0X3JzdC90ZXN0X2RpcmVjdGl2ZXMvdGVzdF9faW5pdF9fLnB5LAorIyArICB8IHRlc3QvdGVz
dF9wYXJzZXJzL3Rlc3RfcnN0L3Rlc3RfZGlyZWN0aXZlcy90ZXN0X2NvZGVfcGFyc2luZy5weSwK
KyMgKyAgfCB0ZXN0L3Rlc3RfcGFyc2Vycy90ZXN0X3JzdC90ZXN0X2xpbmVfbGVuZ3RoX2xpbWl0
X2RlZmF1bHQucHksCisjICsgIHwgdGVzdC90ZXN0X3BhcnNlcnMvdGVzdF9yc3QvdGVzdF9saW5l
X2xlbmd0aF9saW1pdC5weSwKKyMgKyAgfCB0ZXN0L3Rlc3Rfd3JpdGVycy90ZXN0X2xhdGV4MmVf
bWlzYy5weSwKKyMgKyAgfCB0ZXN0L3RyYW5zZm9ybXMvdGVzdF9zbWFydHF1b3Rlcy5weSwKKyMg
KyAgfCB0b29scy9kb2N1dGlscy1jbGkucHksCisjICsgIHwgdG9vbHMvcnN0Mmh0bWw1LnB5Cisj
ICAKKyMgICAgQ29weXJpZ2h0IMKpIEfDvG50ZXIgTWlsZGUuCisjICAgIFJlbGVhc2VkIHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgYEJTRCAyLUNsYXVzZSBMaWNlbnNlYF8KKyMgCisjCisKK1NVTU1B
UlkgPSAiRG9jdXRpbHMgaXMgYSBtb2R1bGFyIHN5c3RlbSBmb3IgcHJvY2Vzc2luZyBkb2N1bWVu
dGF0aW9uIGludG8gdXNlZnVsIGZvcm1hdHMiCitIT01FUEFHRSA9ICJodHRwOi8vZG9jdXRpbHMu
c291cmNlZm9yZ2UubmV0IgorU0VDVElPTiA9ICJkZXZlbC9weXRob24iCitMSUNFTlNFID0gIlBT
Ri0yLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9ubHkiCitMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HLnR4dDttZDU9MDhmNWY4YWE2YTFkYjI1MDBjMDhhMmJiNTU4ZTQ1YWYi
CisKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzVhNWE1MmZiY2FjZDgxYjQ3ZTQyODg4YWQyYjM4
MDc0OGFhY2NmYjNmMTNhZjBmZTY5ZGViNzU5ZjAxZWI2IgorCitpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi4zOS4yCgo=

--===============8136379004489425574==--

