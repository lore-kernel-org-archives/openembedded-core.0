Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A282BC79FAC
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 06:03:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.956.1788847404329191663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 23:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=b7/vsnQ4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DkKke5jk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a07f9d30b7-833ff293-e1a7-4caf-860b-c3d8ace56155-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788847403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ltHvO7wBdC/uNZIeARlxshTcHoWIuiAedkbAm31sRmA=;
	b=b7/vsnQ4HiYRHUPy0/9H5vI7LsC7bMyYZjDontTwIdmkDkAoyPXCP7XhwtsBRHnw
	spdDA0uJQWroXRenQpoYnmTkPq6aEWqM6tIxLoD+JaxcWHpnl5H/+pqGVpybaLchJMO
	42XiEjNLjMhBYSf8fHYqEc4Mh3TcXdn100LNfq8w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788847403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ltHvO7wBdC/uNZIeARlxshTcHoWIuiAedkbAm31sRmA=;
	b=DkKke5jkSt1wLfrUpLuve3XngZiS3fN6Qcym4edNmigHPsAIyBLx9IDtReR+/MS9
	WCIOOTyMTDV8AzjJm+aeTUW8baYWwNDUWMKkvrKycg4P6nWw3U8lH8BMKw6ziKY46QQ
	sduY/LlTNEdg9nKBn0739szah9Ir2y+Kb0eyGtPQ=
Content-Type: multipart/mixed; boundary="===============5813441932113755705=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.21.0 SUCCEEDED
Message-ID: <010101a07f9d30b7-833ff293-e1a7-4caf-860b-c3d8ace56155-000000@us-west-2.amazonses.com>
Date: Tue, 8 Sep 2026 06:03:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.08-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 06:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245321

--===============5813441932113755705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

SGVsbG8sCgp0aGlzIGVtYWlsIGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFk
ZSBIZWxwZXIKdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBl
KHMpICpweXRob24zLW1lc29uLXB5dGhvbiogdG8gKjAuMjEuMCogaGFzIFN1Y2NlZWRlZC4KCk5l
eHQgc3RlcHM6CiAgICAtIGFwcGx5IHRoZSBwYXRjaDogZ2l0IGFtIDAwMDEtcHl0aG9uMy1tZXNv
bi1weXRob24tdXBncmFkZS0wLjIwLjAtMC4yMS4wLnBhdGNoCiAgICAtIGNoZWNrIHRoZSBjaGFu
Z2VzIHRvIHVwc3RyZWFtIHBhdGNoZXMgYW5kIHN1bW1hcml6ZSB0aGVtIGluIHRoZSBjb21taXQg
bWVzc2FnZSwKICAgIC0gY29tcGlsZSBhbiBpbWFnZSB0aGF0IGNvbnRhaW5zIHRoZSBwYWNrYWdl
CiAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMKICAgIC0gYW1lbmQgdGhlIHBh
dGNoIGFuZCBzaWduIGl0IG9mZjogZ2l0IGNvbW1pdCAtcyAtLXJlc2V0LWF1dGhvciAtLWFtZW5k
CiAgICAtIHNlbmQgaXQgdG8gdGhlIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdAoKQWx0ZXJuYXRp
dmVseSwgaWYgeW91IGJlbGlldmUgdGhlIHJlY2lwZSBzaG91bGQgbm90IGJlIHVwZ3JhZGVkIGF0
IHRoaXMgdGltZSwKeW91IGNhbiBmaWxsIFJFQ0lQRV9OT19VUERBVEVfUkVBU09OIGluIHJlc3Bl
Y3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdAphdXRvbWF0aWMgdXBncmFkZXMgd291bGQgbm8gbG9u
Z2VyIGJlIGF0dGVtcHRlZC4KClBsZWFzZSByZXZpZXcgdGhlIGF0dGFjaGVkIGZpbGVzIGZvciBm
dXJ0aGVyIGluZm9ybWF0aW9uIGFuZCBidWlsZC91cGRhdGUgZmFpbHVyZXMuCkFueSBwcm9ibGVt
IHBsZWFzZSBmaWxlIGEgYnVnIGF0IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9l
bnRlcl9idWcuY2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcgoKUmVnYXJk
cywKVGhlIFVwZ3JhZGUgSGVscGVyCgotLSA+OCAtLQpGcm9tIDE1ZGFlMzAyMDUzZDk5Mjc3NTc4
ZjI5MDJmODczOWEwNGZhYWYzYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206IFVwZ3Jh
ZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4KRGF0ZTogVHVlLCA4IFNlcCAyMDI2IDA1
OjMwOjI5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gcHl0aG9uMy1tZXNvbi1weXRob246IHVwZ3Jh
ZGUgMC4yMC4wIC0+IDAuMjEuMApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU291
cmNlOiBDSEFOR0VMT0cucnN0CgowLjIxLjAKPT09PT09CgotIEFkZCBzdXBwb3J0IGZvciB0aGUg
c3RhYmxlIEFCSSBmb3IgZnJlZS10aHJlYWRlZCBpbnRlcnByZXRlcnMgKGBgYWJpM3RgYCkuCi0g
QWRkIHN1cHBvcnQgZm9yIHRoZSBzdGFibGUgQUJJIGV4dGVuc2lvbiBtb2R1bGVzJyBwbGF0Zm9y
bS1zcGVjaWZpYyBmaWxlbmFtZQogIHN1ZmZpeGVzIGludHJvZHVjZWQgaW4gUHl0aG9uIDMuMTUu
Ci0gQWxsb3cgc3BlY2lmeWluZyBgYGVkaXRhYmxlLXZlcmJvc2VgYCBpbiBgYHB5cHJvamVjdC50
b21sYGAuCi0gSW1wcm92ZSB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiBlZGl0YWJsZSBpbnN0YWxs
cyBieSBjYXB0dXJpbmcgYW5kIHJlcG9ydGluZwogIGJ1aWxkIGVycm9ycyB3aGVuIHJlYnVpbGRp
bmcuCi0gVXNlIGBgLnN0YXJ0YGAgZmlsZXMgKFBFUCA4MjkpIGluc3RlYWQgb2YgYGAucHRoYGAg
ZmlsZXMgdG8gaW1wbGVtZW50IGVkaXRhYmxlCiAgd2hlZWxzIGZvciBQeXRob24gMy4xNSBhbmQg
bGF0ZXIuCgpEYW5pZWxlIE5pY29sb2RpLCBNaWNoYcWCIEfDs3JueSwgUmFsZiBHb21tZXJzIC0t
LSAyNS0wOC0yMDI2LgotLS0KIC4uLm4zLW1lc29uLXB5dGhvbl8wLjIwLjAuYmIgPT4gcHl0aG9u
My1tZXNvbi1weXRob25fMC4yMS4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjAuMC5iYiA9PiBweXRob24zLW1lc29uLXB5dGhv
bl8wLjIxLjAuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWVz
b24tcHl0aG9uXzAuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjAuYmIKaW5kZXggMTk5MDJmNmU0Yy4uNjlmYjQ2
MWMxZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1l
c29uLXB5dGhvbl8wLjIwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW1lc29uLXB5dGhvbl8wLjIxLjAuYmIKQEAgLTEzLDcgKzEzLDcgQEAgREVQRU5EUyA9
ICIgXAogUFlQSV9QQUNLQUdFID0gIm1lc29uX3B5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9tZXNvbnB5Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQ5NzI2YWU2Y2QzN2UyMmYyMTBjNzRi
MzY0YjMwMTgwYTY4YzIwNDQyZTk3ZmYwOWYzYzU2NmE0MTRhZjczOCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1OTVjMmY0MGI3NjY5MmM3ODI3NGM4N2I3MzMzNzlkODY1NjI1ODNlOWZmYjk3NTQ4
N2I5ZWFmYWRhMDMwNTViIgogCiBERVBFTkRTOnJlbW92ZTpjbGFzcy1uYXRpdmUgPSAicHl0aG9u
My1tZXNvbi1weXRob24tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============5813441932113755705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info/licenses/LICENSES, removed "/usr/lib/python3.14/site-packages/mesonpy/_compat.py /usr/lib/python3.14/site-packages/mesonpy/__pycache__/_compat.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info
  /usr/lib/python3.14/site-packages/mesonpy/_compat.py was removed
  /usr/lib/python3.14/site-packages/mesonpy/__pycache__/_compat.cpython-314.pyc was removed

--===============5813441932113755705==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-meson-python-upgrade-0.20.0-0.21.0.patch"

RnJvbSAxNWRhZTMwMjA1M2Q5OTI3NzU3OGYyOTAyZjg3MzlhMDRmYWFmM2JjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgOCBTZXAgMjAyNiAwNTozMDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWVzb24tcHl0aG9uOiB1cGdyYWRlIDAuMjAuMCAtPiAwLjIxLjAKTUlNRS1WZXJzaW9u
OiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKClNvdXJjZTogQ0hBTkdFTE9HLnJzdAoKMC4yMS4wCj09PT09
PQoKLSBBZGQgc3VwcG9ydCBmb3IgdGhlIHN0YWJsZSBBQkkgZm9yIGZyZWUtdGhyZWFkZWQgaW50
ZXJwcmV0ZXJzIChgYGFiaTN0YGApLgotIEFkZCBzdXBwb3J0IGZvciB0aGUgc3RhYmxlIEFCSSBl
eHRlbnNpb24gbW9kdWxlcycgcGxhdGZvcm0tc3BlY2lmaWMgZmlsZW5hbWUKICBzdWZmaXhlcyBp
bnRyb2R1Y2VkIGluIFB5dGhvbiAzLjE1LgotIEFsbG93IHNwZWNpZnlpbmcgYGBlZGl0YWJsZS12
ZXJib3NlYGAgaW4gYGBweXByb2plY3QudG9tbGBgLgotIEltcHJvdmUgdGhlIGRlZmF1bHQgYmVo
YXZpb3Igb2YgZWRpdGFibGUgaW5zdGFsbHMgYnkgY2FwdHVyaW5nIGFuZCByZXBvcnRpbmcKICBi
dWlsZCBlcnJvcnMgd2hlbiByZWJ1aWxkaW5nLgotIFVzZSBgYC5zdGFydGBgIGZpbGVzIChQRVAg
ODI5KSBpbnN0ZWFkIG9mIGBgLnB0aGBgIGZpbGVzIHRvIGltcGxlbWVudCBlZGl0YWJsZQogIHdo
ZWVscyBmb3IgUHl0aG9uIDMuMTUgYW5kIGxhdGVyLgoKRGFuaWVsZSBOaWNvbG9kaSwgTWljaGHF
giBHw7NybnksIFJhbGYgR29tbWVycyAtLS0gMjUtMDgtMjAyNi4KLS0tCiAuLi5uMy1tZXNvbi1w
eXRob25fMC4yMC4wLmJiID0+IHB5dGhvbjMtbWVzb24tcHl0aG9uXzAuMjEuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1lc29uLXB5dGhvbl8wLjIwLjAu
YmIgPT4gcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMS4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMC4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8w
LjIxLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLW1lc29uLXB5dGhvbl8wLjIwLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMS4wLmJi
CmluZGV4IDE5OTAyZjZlNGMuLjY5ZmI0NjFjMWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tZXNvbi1weXRob25fMC4yMS4wLmJiCkBA
IC0xMyw3ICsxMyw3IEBAIERFUEVORFMgPSAiIFwKIFBZUElfUEFDS0FHRSA9ICJtZXNvbl9weXRo
b24iCiAKIGluaGVyaXQgcHlwaSBweXRob25fbWVzb25weQotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjZkOTcyNmFlNmNkMzdlMjJmMjEwYzc0YjM2NGIzMDE4MGE2OGMyMDQ0MmU5N2ZmMDlmM2M1NjZh
NDE0YWY3MzgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTk1YzJmNDBiNzY2OTJjNzgyNzRjODdi
NzMzMzc5ZDg2NTYyNTgzZTlmZmI5NzU0ODdiOWVhZmFkYTAzMDU1YiIKIAogREVQRU5EUzpyZW1v
dmU6Y2xhc3MtbmF0aXZlID0gInB5dGhvbjMtbWVzb24tcHl0aG9uLW5hdGl2ZSIKIAotLSAKMi40
Ny4xCgo=

--===============5813441932113755705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-meson-python: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.21.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dbg: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-dev: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-doc: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-locale: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-src: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python-staticdev: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PV changed from "0.20.0" to "0.21.0"
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGSIZE changed from 233297 to 233547 (+0%)
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: PKGV changed from 0.20.0 [default] to 0.21.0 [default]
packages/x86-64-v3-poky-linux/python3-meson-python/python3-meson-python: FILELIST: directory renamed /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info -> /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info/licenses/LICENSES -> /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info/licenses/LICENSES, removed "/usr/lib/python3.14/site-packages/mesonpy/__pycache__/_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/mesonpy/_compat.py"
Changes to packages/x86-64-v3-poky-linux/python3-meson-python (sysroot):
  /usr/lib/python3.14/site-packages/meson_python-0.20.0.dist-info moved to /usr/lib/python3.14/site-packages/meson_python-0.21.0.dist-info
  /usr/lib/python3.14/site-packages/mesonpy/_compat.py was removed
  /usr/lib/python3.14/site-packages/mesonpy/__pycache__/_compat.cpython-314.pyc was removed

--===============5813441932113755705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="python3-meson-python-changelog.txt"

Q2hhbmdlbG9nIGZvciBweXRob24zLW1lc29uLXB5dGhvbjogMC4yMC4wIC0+IDAuMjEuMApTb3Vy
Y2U6IENIQU5HRUxPRy5yc3QKCjAuMjEuMAo9PT09PT0KCi0gQWRkIHN1cHBvcnQgZm9yIHRoZSBz
dGFibGUgQUJJIGZvciBmcmVlLXRocmVhZGVkIGludGVycHJldGVycyAoYGBhYmkzdGBgKS4KLSBB
ZGQgc3VwcG9ydCBmb3IgdGhlIHN0YWJsZSBBQkkgZXh0ZW5zaW9uIG1vZHVsZXMnIHBsYXRmb3Jt
LXNwZWNpZmljIGZpbGVuYW1lCiAgc3VmZml4ZXMgaW50cm9kdWNlZCBpbiBQeXRob24gMy4xNS4K
LSBBbGxvdyBzcGVjaWZ5aW5nIGBgZWRpdGFibGUtdmVyYm9zZWBgIGluIGBgcHlwcm9qZWN0LnRv
bWxgYC4KLSBJbXByb3ZlIHRoZSBkZWZhdWx0IGJlaGF2aW9yIG9mIGVkaXRhYmxlIGluc3RhbGxz
IGJ5IGNhcHR1cmluZyBhbmQgcmVwb3J0aW5nCiAgYnVpbGQgZXJyb3JzIHdoZW4gcmVidWlsZGlu
Zy4KLSBVc2UgYGAuc3RhcnRgYCBmaWxlcyAoUEVQIDgyOSkgaW5zdGVhZCBvZiBgYC5wdGhgYCBm
aWxlcyB0byBpbXBsZW1lbnQgZWRpdGFibGUKICB3aGVlbHMgZm9yIFB5dGhvbiAzLjE1IGFuZCBs
YXRlci4KCkRhbmllbGUgTmljb2xvZGksIE1pY2hhxYIgR8Ozcm55LCBSYWxmIEdvbW1lcnMgLS0t
IDI1LTA4LTIwMjYuCg==

--===============5813441932113755705==--

