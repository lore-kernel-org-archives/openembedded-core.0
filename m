Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA35D5CCBB
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17389.1765872134497055278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mCTjaoIU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sUTfqmLo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019b262ea1b3-429dd2ff-d493-42d6-8202-5dc1ad4ec10b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oCnN29cKryYqc9qW3WJg5x0KPCL+lFY6wpOacZ5GJi4=;
	b=mCTjaoIU37OFbowpd49wezM/ql62FILaAH6BQqwi3teVALCRkfs6Atd7I5GfBDzd
	tOjakAl+mpHxRYUN5m6nHRKUvhtbrL8l6luTrq4hPMA95fCzWxdBmBjOFW0NSjgk3ds
	7G96Db13iBi+mKgr/pkhS4D1/U8dMoizOtcIpt1E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oCnN29cKryYqc9qW3WJg5x0KPCL+lFY6wpOacZ5GJi4=;
	b=sUTfqmLo53w0obTBSEPLgaMLk4dI2oV9PrRDqfwP7RP71Da42QwPQdgzCdYY/uMS
	BCMFIWjOns4YJM4Xk4b6Prya+YUBzHR1vqSWRqGXBzWoQ/shrwmrK6HOQGw5SKMwGP8
	OO70fxfzUtfQG3+Wx7ZQmPzxtorI/h1uxIgg4eUw=
Content-Type: multipart/mixed; boundary="===============3463676501994371209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.8.0 SUCCEEDED
Message-ID: <0101019b262ea1b3-429dd2ff-d493-42d6-8202-5dc1ad4ec10b-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227827

--===============3463676501994371209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLXRlc3R0b29scyogdG8gKjIuOC4wKiBoYXMgU3VjY2VlZGVkLgoKTmV4dCBz
dGVwczoKICAgIC0gYXBwbHkgdGhlIHBhdGNoOiBnaXQgYW0gMDAwMS1weXRob24zLXRlc3R0b29s
cy11cGdyYWRlLTIuNy4yLTIuOC4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFuZ2VzIHRvIHVw
c3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQgbWVzc2FnZSwK
ICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdlCiAgICAtIHBl
cmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBhdGNoIGFuZCBz
aWduIGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5kCiAgICAtIHNl
bmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRpdmVseSwgaWYg
eW91IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0IHRoaXMgdGlt
ZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVj
aXBlIGZpbGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9uZ2VyIGJlIGF0
dGVtcHRlZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBmdXJ0aGVyIGlu
Zm9ybWF0aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVtIHBsZWFzZSBm
aWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcu
Y2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJkcywKVGhlIFVw
Z3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDNhMTFlN2NhNmQ3ZGMwY2E4ZTU0YTY3YWQ5NzAw
ZjgzNjIwOTViNjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3JhZGUgSGVscGVy
IDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogVHVlLCAxNiBEZWMgMjAyNSAwMTozMDoyOCAr
MDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtdGVzdHRvb2xzOiB1cGdyYWRlIDIuNy4yIC0+
IDIuOC4wCgotLS0KIC4uLmxzXzIuNy4yLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOC4wLmJi
fSB8IDM0ICsrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
e3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4yLmJiID0+IHB5dGhvbjMtdGVzdHRvb2xzXzIuOC4wLmJi
fSAoMjYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My10ZXN0dG9vbHNfMi43LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdGVzdHRvb2xzXzIuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggMjYlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi43LjIuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10ZXN0dG9vbHNfMi44
LjAuYmIKaW5kZXggOGQ3NzU5YjRhNy4uZDE4YjUzYWIwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjcuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4wLmJiCkBAIC0x
LDE0ICsxLDQ0IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBi
ZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMg
UGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUg
dGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6
JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRh
dGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQorIyArKysgTElDRU5T
RQorIyBAQCAtMjEsNiArMjEsNyBAQAorIyAgICogVHJpc3RhbiBTZWxpZ21hbm4KKyMgICAqIEp1
bGlhbiBFZHdhcmRzCisjICAgKiBKb25hdGhhbiBKYWNvYnMKKyMgKyAqIEplbG1lciBWZXJub2/E
sworIyAgCisjICBhbmQgYXJlIGNvbGxlY3RpdmVseSByZWZlcnJlZCB0byBhcyAidGVzdHRvb2xz
IGRldmVsb3BlcnMiLgorIyAgCisjIEBAIC00Miw3ICs0Myw3IEBACisjICBPVVQgT0YgT1IgSU4g
Q09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdT
IElOIFRIRQorIyAgU09GVFdBUkUuCisjICAKKyMgLVNvbWUgY29kZSBpbiB0ZXN0dG9vbHMvcnVu
LnB5IHRha2VuIGZyb20gUHl0aG9uJ3MgdW5pdHRlc3QgbW9kdWxlOgorIyArU29tZSBjb2RlIGlu
IHRlc3R0b29scy9ydW4ucHkgYW5kIHRlc3R0b29scy90ZXN0Y2FzZS5weSB0YWtlbiBmcm9tIFB5
dGhvbidzIHVuaXR0ZXN0IG1vZHVsZToKKyMgIENvcHlyaWdodCAoYykgMTk5OS0yMDAzIFN0ZXZl
IFB1cmNlbGwKKyMgIENvcHlyaWdodCAoYykgMjAwMy0yMDEwIFB5dGhvbiBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uCisjICAKKyMgCisjCisKIFNVTU1BUlkgPSAiRXh0ZW5zaW9ucyB0byB0aGUgUHl0aG9u
IHN0YW5kYXJkIGxpYnJhcnkgdW5pdCB0ZXN0aW5nIGZyYW1ld29yayIKIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC90ZXN0dG9vbHMvIgogU0VDVElPTiA9ICJkZXZlbC9weXRo
b24iCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT1lMmM5ZDNlOGJhNzE0MWM4M2JmZWYxOTBlMGI5Mzc5YSIKK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWQ2ZmQ3ZDU3ZDJiZGM4Njc4ZGU4MjRmYjQwNGNi
MWE0IgogCiBERVBFTkRTICs9ICJweXRob24zLWhhdGNoLXZjcy1uYXRpdmUiCiAKIGluaGVyaXQg
cHlwaSBweXRob25faGF0Y2hsaW5nCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YmU1YmJjMWYw
ZmEwZjhiNjBhY2E2Y2VlYzA3ODQ1ZDQxZDBjNDc1Y2Y0NDViZmFkYjRkMmM0NWVjMzk3ZWEzIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImI0NDk2ZjE0N2E3Yjc5NDQwMjQyNDk2ODg5YTczNDE3OTc5
NWRmMzQ1YjU3ZDVhYTQwNmEwOWM5MDU3MmRiYTEiCiAKIFJERVBFTkRTOiR7UE59ICs9ICJcCiAg
ICAgcHl0aG9uMy1jb21wcmVzc2lvbiBcCi0tIAoyLjQ3LjEKCg==

--===============3463676501994371209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info -> /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/testtools/__pycache__/utils.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/utils.py"
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info moved to /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info
  /usr/lib/python3.13/site-packages/testtools/__pycache__/utils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/utils.py was removed

--===============3463676501994371209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-testtools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.7.2.tar.gz;downloadfilename=testtools-2.7.2.tar.gz" to "https://files.pythonhosted.org/packages/source/t/testtools/testtools-2.8.0.tar.gz;downloadfilename=testtools-2.8.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-testtools: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dbg: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-dev: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-doc: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-locale: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-src: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools-staticdev: PV changed from "2.7.2" to "2.8.0"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: FILELIST: directory renamed /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info -> /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info, removed "/usr/lib/python3.13/site-packages/testtools/__pycache__/utils.cpython-313.pyc /usr/lib/python3.13/site-packages/testtools/utils.py"
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGSIZE changed from 1812715 to 1827244 (+1%)
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PKGV changed from 2.7.2 [default] to 2.8.0 [default]
packages/x86-64-v3-poky-linux/python3-testtools/python3-testtools: PV changed from "2.7.2" to "2.8.0"
Changes to packages/x86-64-v3-poky-linux/python3-testtools (sysroot):
  /usr/lib/python3.13/site-packages/testtools-2.7.2.dist-info moved to /usr/lib/python3.13/site-packages/testtools-2.8.0.dist-info
  /usr/lib/python3.13/site-packages/testtools/__pycache__/utils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/testtools/utils.py was removed

--===============3463676501994371209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-testtools-upgrade-2.7.2-2.8.0.patch"

RnJvbSAzYTExZTdjYTZkN2RjMGNhOGU1NGE2N2FkOTcwMGY4MzYyMDk1YjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6MzA6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRlc3R0b29sczogdXBncmFkZSAyLjcuMiAtPiAyLjguMAoKLS0tCiAuLi5sc18yLjcu
Mi5iYiA9PiBweXRob24zLXRlc3R0b29sc18yLjguMC5iYn0gfCAzNCArKysrKysrKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXRlc3R0b29sc18yLjcu
Mi5iYiA9PiBweXRob24zLXRlc3R0b29sc18yLjguMC5iYn0gKDI2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRlc3R0b29sc18yLjguMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDI2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuNy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdGVzdHRvb2xzXzIuOC4wLmJiCmluZGV4IDhkNzc1OWI0YTcu
LmQxOGI1M2FiMDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy10ZXN0dG9vbHNfMi43LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXRlc3R0b29sc18yLjguMC5iYgpAQCAtMSwxNCArMSw0NCBAQAorIyBGSVhNRTog
dGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29s
IHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhl
IG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VO
U0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBj
b21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xp
Y2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdl
czoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UKKyMgQEAgLTIxLDYgKzIxLDcgQEAK
KyMgICAqIFRyaXN0YW4gU2VsaWdtYW5uCisjICAgKiBKdWxpYW4gRWR3YXJkcworIyAgICogSm9u
YXRoYW4gSmFjb2JzCisjICsgKiBKZWxtZXIgVmVybm9vxLMKKyMgIAorIyAgYW5kIGFyZSBjb2xs
ZWN0aXZlbHkgcmVmZXJyZWQgdG8gYXMgInRlc3R0b29scyBkZXZlbG9wZXJzIi4KKyMgIAorIyBA
QCAtNDIsNyArNDMsNyBAQAorIyAgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09G
VFdBUkUgT1IgVEhFIFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUKKyMgIFNPRlRXQVJFLgor
IyAgCisjIC1Tb21lIGNvZGUgaW4gdGVzdHRvb2xzL3J1bi5weSB0YWtlbiBmcm9tIFB5dGhvbidz
IHVuaXR0ZXN0IG1vZHVsZToKKyMgK1NvbWUgY29kZSBpbiB0ZXN0dG9vbHMvcnVuLnB5IGFuZCB0
ZXN0dG9vbHMvdGVzdGNhc2UucHkgdGFrZW4gZnJvbSBQeXRob24ncyB1bml0dGVzdCBtb2R1bGU6
CisjICBDb3B5cmlnaHQgKGMpIDE5OTktMjAwMyBTdGV2ZSBQdXJjZWxsCisjICBDb3B5cmlnaHQg
KGMpIDIwMDMtMjAxMCBQeXRob24gU29mdHdhcmUgRm91bmRhdGlvbgorIyAgCisjIAorIworCiBT
VU1NQVJZID0gIkV4dGVuc2lvbnMgdG8gdGhlIFB5dGhvbiBzdGFuZGFyZCBsaWJyYXJ5IHVuaXQg
dGVzdGluZyBmcmFtZXdvcmsiCiBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3Qv
dGVzdHRvb2xzLyIKIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJBcGFjaGUt
Mi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTJjOWQzZThiYTcx
NDFjODNiZmVmMTkwZTBiOTM3OWEiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT1kNmZkN2Q1N2QyYmRjODY3OGRlODI0ZmI0MDRjYjFhNCIKIAogREVQRU5EUyArPSAicHl0
aG9uMy1oYXRjaC12Y3MtbmF0aXZlIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWJlNWJiYzFmMGZhMGY4YjYwYWNhNmNlZWMwNzg0NWQ0
MWQwYzQ3NWNmNDQ1YmZhZGI0ZDJjNDVlYzM5N2VhMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJi
NDQ5NmYxNDdhN2I3OTQ0MDI0MjQ5Njg4OWE3MzQxNzk3OTVkZjM0NWI1N2Q1YWE0MDZhMDljOTA1
NzJkYmExIgogCiBSREVQRU5EUzoke1BOfSArPSAiXAogICAgIHB5dGhvbjMtY29tcHJlc3Npb24g
XAotLSAKMi40Ny4xCgo=

--===============3463676501994371209==--

