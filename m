Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B57C83005
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.24019.1677681913957033896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eo65GSQ6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101869da26fb3-873af234-1b87-4b91-982d-f59dd6cff353-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T+/t6S2AB/Y86M7oiKLHlqb6Ugj/P0r8+i5Pt4AqG6w=;
	b=eo65GSQ6yPwXhhktkGUeqMgp5F4n9uSgED/RfwTNR1XQy1PpabCTHiA7Ut/4w+qo
	/08jH98GMU6l7y4qd0MjSphsfuHHhcsK4X4bJA0wKthzi8vLuMMQCuU/R3Q45+m4NjW
	isEDNGhBgWDaiQvzJP44Sfit2AVZDp19YaJc9YO4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T+/t6S2AB/Y86M7oiKLHlqb6Ugj/P0r8+i5Pt4AqG6w=;
	b=VqIaDn61IxDg83Tp3oQ0CQF3T/qr+DupvOA4qF5nH06u/cACe3z8ttNUOlb6zIZo
	ZRpe4PpXhQHZ0e+dLrff9y2F1nOLz7Ey4/BPWS51sffbZunzdM9DmBsZt5H62zsZSLN
	tJkp3hLg1JSNeaq/0nFA2lALU+OyCAMf9wXXXLEo=
Content-Type: multipart/mixed; boundary="===============4500350696430458822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 67.4.0 SUCCEEDED
Message-ID: <010101869da26fb3-873af234-1b87-4b91-982d-f59dd6cff353-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177899

--===============4500350696430458822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *67.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-67.3.3-67.4.0.patch
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
--===============4500350696430458822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-67.3.3-67.4.0.patch"

RnJvbSA4ODM3N2FhNjIzNjc5NGE3NmE5MDA4NjJlOGFjNzU0NjliMGE5Yjc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODoyODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2Ny4zLjMgLT4gNjcuNC4wCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY3LjMuMy5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjcuNC4wLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182Ny4zLjMuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY3LjQuMC5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCBiMTJlNGY1ZDA1Li45ODNiYWRkM2NmIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDhhNjc3MTAxMzFmYzFiODI0NmVkYzRkYmNkODA3N2VlZDk2ZTEzZjcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGIyNDg5YjQwMTdmMzhkYjdiMDRhNzVlNTNiY2UxNWUwZGQ4
MGRiN2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182Ny4zLjMuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182Ny40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuMy4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182Ny40LjAuYmIKaW5kZXggMDUzYjY3MWUyYS4uMWEyOWQzN2EwMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjcuMy4zLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY3
LjQuMC5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5
LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJlZDRlNzVmYWZlMTAzYzc5YjY5MmYyMTcxNThiYTg3ZWRmMzhkMzEwMDRiOWRiYzE5MTNk
ZWJiNDg3OTNjODI4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImU1ZmQwYTcxMzE0MWE0YTEwNTQx
MjIzM2M2M2RjNGUxN2JhMDA5MGM4ZTgzMzQ1OTRhYzc5MGVjOTc3OTIzMzAiCiAKIERFUEVORFMg
Kz0gIiR7UFlUSE9OX1BOfSIKIAotLSAKMi4zOS4yCgo=

--===============4500350696430458822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.3.3.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-67.4.0.tar.gz file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGSIZE changed from 1375782 to 1387533 (+1%)
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 5289287 to 5294020 (+0%)
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "67.3.3" to "67.4.0"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info -> /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-311.pyc"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 67.3.3 [default] to 67.4.0 [default]
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was added
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was added

--===============4500350696430458822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info -> /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was added
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/__pycache__/_py39compat.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-67.3.3.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-67.4.0.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_vendor/importlib_metadata/_py39compat.py was added

--===============4500350696430458822==--

