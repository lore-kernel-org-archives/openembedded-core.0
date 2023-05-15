Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FCDCA9EC7
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3763.1684186747398878690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BZUt0oGR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010188215a5270-ee55145e-a40e-4015-ac40-29d30c166595-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ry9+6eMSO+eZwAknJUK9XuvUkJXTJTZcAqdbpXbdNw4=;
	b=BZUt0oGRHZSpnUfp+eaZ8CGw4NNBAeKPJbg5AQ26MuY9o04Q87q3R4cmNIwWEv08
	yRcBqBuOUP42TqOezsIij2eNOjxwgpAqLUTsqPEsPDwFE6jyjj9vxWabMVBazijdFJ6
	IRQv49VXoTZ+4PuNHXeug5YNQx9hjbcLnxJ7bsmk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ry9+6eMSO+eZwAknJUK9XuvUkJXTJTZcAqdbpXbdNw4=;
	b=omP98QvjIaVUmfeElXQo0TKi1skSXRf57x+vc6v4zJ/DuIVKI/Jdm8gTvP5FVozV
	aRNAcF3lJ1g2lkfHO1kC5hSN1zfxM+AsrDJLdXmYHCKwN16PrB7p8MwsL/CbASYDF73
	N4vEuC1cp0oGi7G0dTvSo+xmWdy9FUel7VnF/2a8=
Content-Type: multipart/mixed; boundary="===============0874127934616567409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.5.0 SUCCEEDED
Message-ID: <01010188215a5270-ee55145e-a40e-4015-ac40-29d30c166595-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181306

--===============0874127934616567409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyasn1* to *0.5.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch
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
--===============0874127934616567409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.4.8.tar.gz;downloadfilename=pyasn1-0.4.8.tar.gz file://run-ptest file://0001-Fix-DeprecationWarning-__int__-returned-non-int-on-P.patch" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.5.0.tar.gz;downloadfilename=pyasn1-0.5.0.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 311524 to 319281 (+2%)
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.4.8" to "0.5.0"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.4.8 [default] to 0.5.0 [default]
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/binary.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc", added "/usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 786820 to 841150 (+7%)
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============0874127934616567409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_binary.py", added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_streaming.py"
packages/core2-32-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info -> /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info, removed "/usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py /usr/lib/python3.11/site-packages/pyasn1/compat/string.py /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py", added "/usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py"
Changes to packages/core2-32-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.11/site-packages/pyasn1-0.4.8.dist-info moved to /usr/lib/python3.11/site-packages/pyasn1-0.5.0.dist-info
  /usr/lib/python3.11/site-packages/pyasn1/codec/__pycache__/streaming.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/pyasn1/codec/streaming.py was added
  /usr/lib/python3.11/site-packages/pyasn1/compat/binary.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/calling.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/dateandtime.py was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/binary.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/calling.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/dateandtime.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/__pycache__/string.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/pyasn1/compat/string.py was removed

--===============0874127934616567409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.4.8-0.5.0.patch"

RnJvbSBmMGMzZTRhYTVjMzBlODU5MGYwM2ZlYzIyZjM5Y2VlYjg4Y2Y3NjExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTI6MTI6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5YXNuMTogdXBncmFkZSAwLjQuOCAtPiAwLjUuMAoKLS0tCiAuLi4vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMgfCAxMiArKysrLS0tLQogLi4uYXJuaW5n
LV9faW50X18tcmV0dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoIHwgMjggLS0tLS0tLS0tLS0tLS0t
LS0tLQogLi4uL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYiAgICAgICAgICAgIHwgIDIg
LS0KIC4uLi9weXRob24vcHl0aG9uMy1weWFzbjFfMC41LjAuYmIgICAgICAgICAgICB8IDIyICsr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAzNyBkZWxl
dGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlhc24xLzAwMDEtRml4LURlcHJlY2F0aW9uV2FybmluZy1fX2ludF9fLXJldHVy
bmVkLW5vbi1pbnQtb24tUC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC40LjguYmIKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcHlhc24xLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXB5YXNuMS5pbmMKaW5kZXgg
MTI2ZDAzODhlZi4uMDkzMWU3NzM0MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24tcHlhc24xLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbi1weWFzbjEuaW5jCkBAIC0xLDEwICsxLDkgQEAKIFNVTU1BUlkgPSAiUHl0aG9u
IGxpYnJhcnkgaW1wbGVtZW50aW5nIEFTTi4xIHR5cGVzLiIKIEhPTUVQQUdFID0gImh0dHA6Ly9w
eWFzbjEuc291cmNlZm9yZ2UubmV0LyIKIExJQ0VOU0UgPSAiQlNELTItQ2xhdXNlIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1PWExNDQ4MmQxNWMyMjQ5ZGUzYjZm
MGU4YTQ3ZTAyMWZkIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PTE5MGY3OTI1MzkwOGM5ODZlNmNhY2YzODBjM2E1ZjZkIgogCi1TUkNfVVJJW21kNXN1bV0gPSAi
ZGZmYWU0ZmY5Zjk5N2E4MzMyNGIzZjMzZmU2MmJlNTQiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YWVmNzdjOWZiOTRhM2FjNTg4ZTg3ODQxMjA4YmRlYzQ2NDQ3MWQ5ODcxYmQ1MDUwYTI4N2NjOWE0
NzVjZDBiYSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5N2I3MjkwY2E2OGU2MmE4MzI1NThlYzM5
NzZmMTVjYmY5MTFiZjVkN2M3MDM5ZDhiODYxYzJhMGVjZTY5ZmRlIgogCiBSREVQRU5EUzoke1BO
fTpjbGFzcy10YXJnZXQgKz0gIiBcCiAgICAgJHtQWVRIT05fUE59LWNvZGVjcyBcCkBAIC0xNywx
MCArMTYsOSBAQCBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCiAKIGluaGVyaXQg
cHRlc3QKIAotU1JDX1VSSSArPSAiIFwKLQlmaWxlOi8vcnVuLXB0ZXN0IFwKLQlmaWxlOi8vMDAw
MS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18tcmV0dXJuZWQtbm9uLWludC1vbi1QLnBh
dGNoIFwKLSIKK1NSQ19VUkkgPSAiJHtQWVBJX1NSQ19VUkl9IFwKKyAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCisgICAgICAgICAgICIKIAogUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gIiBc
CiAJJHtQWVRIT05fUE59LXB5dGVzdCBcCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xLzAwMDEtRml4LURlcHJlY2F0aW9uV2FybmluZy1fX2lu
dF9fLXJldHVybmVkLW5vbi1pbnQtb24tUC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18t
cmV0dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAzMGFjOWE2Njg0Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1weWFzbjEvMDAwMS1GaXgtRGVwcmVjYXRpb25XYXJuaW5nLV9faW50X18tcmV0
dXJuZWQtbm9uLWludC1vbi1QLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjggKzAsMCBAQAot
RnJvbSBkYjhmMWE3OTMwYzZiNTgyNjM1NzY0Njc0NjMzN2RhZmM5ODNmOTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogSWx5YSBFdGluZ29mIDxldGluZ29mQGdtYWlsLmNvbT4KLURh
dGU6IFNhdCwgMjEgTWFyIDIwMjAgMTk6MDU6MDMgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4
IGBEZXByZWNhdGlvbldhcm5pbmc6IF9faW50X18gcmV0dXJuZWQgbm9uLWludGAgb24gUHkzCi0K
LUluIGBCaXRTdHJpbmcuX19pbnRfXygpYAotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2ln
bmVkLW9mZi1ieTogWXVsb25nIExpdSA8eXVsb25nLmxpdUB3aW5kcml2ZXIuY29tPgotLS0tCi0g
cHlhc24xL3R5cGUvdW5pdi5weSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL3B5YXNuMS90eXBlL3VuaXYucHkgYi9w
eWFzbjEvdHlwZS91bml2LnB5Ci1pbmRleCAxMDkyNGMzLi40ODgyNDFmIDEwMDY0NAotLS0tIGEv
cHlhc24xL3R5cGUvdW5pdi5weQotKysrIGIvcHlhc24xL3R5cGUvdW5pdi5weQotQEAgLTU1MSw3
ICs1NTEsNyBAQCBjbGFzcyBCaXRTdHJpbmcoYmFzZS5TaW1wbGVBc24xVHlwZSk6Ci0gICAgICAg
ICByZXR1cm4gc2VsZi5jbG9uZShTaXplZEludGVnZXIoc2VsZi5fdmFsdWUgPj4gY291bnQpLnNl
dEJpdExlbmd0aChtYXgoMCwgbGVuKHNlbGYuX3ZhbHVlKSAtIGNvdW50KSkpCi0gCi0gICAgIGRl
ZiBfX2ludF9fKHNlbGYpOgotLSAgICAgICAgcmV0dXJuIHNlbGYuX3ZhbHVlCi0rICAgICAgICBy
ZXR1cm4gaW50KHNlbGYuX3ZhbHVlKQotIAotICAgICBkZWYgX19mbG9hdF9fKHNlbGYpOgotICAg
ICAgICAgcmV0dXJuIGZsb2F0KHNlbGYuX3ZhbHVlKQotLS0gCi0yLjI1LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC40LjguYmIKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGE1ZTJhNzEzNjIuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjQuOC5iYgorKysg
L2Rldi9udWxsCkBAIC0xLDIgKzAsMCBAQAotaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCi1yZXF1
aXJlIHB5dGhvbi1weWFzbjEuaW5jCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXB5YXNuMV8wLjUuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi41MWNlNDMyMjYxCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjUuMC5iYgpAQCAtMCwwICsxLDIyIEBACisj
IEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkg
J2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0
d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0
aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4K
KyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFt
cGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRo
ZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRS5yc3QKKyMgKysrIExJQ0VOU0UucnN0CisjIEBA
IC0xLDQgKzEsNCBAQAorIyAtQ29weXJpZ2h0IChjKSAyMDA1LTIwMTksIElseWEgRXRpbmdvZiA8
ZXRpbmdvZkBnbWFpbC5jb20+CisjICtDb3B5cmlnaHQgKGMpIDIwMDUtMjAyMCwgSWx5YSBFdGlu
Z29mIDxldGluZ29mQGdtYWlsLmNvbT4KKyMgIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMg
IFJlZGlzdHJpYnV0aW9uIGFuZCB1c2UgaW4gc291cmNlIGFuZCBiaW5hcnkgZm9ybXMsIHdpdGgg
b3Igd2l0aG91dAorIyAKKyMKKworaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCityZXF1aXJlIHB5
dGhvbi1weWFzbjEuaW5jCisKLS0gCjIuMzkuMgoK

--===============0874127934616567409==--

