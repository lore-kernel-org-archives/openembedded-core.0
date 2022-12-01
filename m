Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E76C64E7C
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.46827.1669908627213691691
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lfA26jbk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010184ce4f7c33-54ebdaff-c18a-426a-941e-9c92e3800df0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NfFzjJwcox1kjSrqi8xFqKnCBNZy6V7sJspc7QisA4k=;
	b=lfA26jbkeZRgzYSI4UnCHGo4lRPoMgRmhiT/lMgClnoSv9QG+vhh+3hWob5l4MtY
	JUq8n419XF8mMNJ7YvQpCMUlYCEE5XA+WTEcggoEY30EnLV2z1JxnYClDfvtyxufh7+
	d2WeDAgDb0kxM56N6R1gWkl3mlU2EZgq4vUQoRr8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NfFzjJwcox1kjSrqi8xFqKnCBNZy6V7sJspc7QisA4k=;
	b=IWO4SQXWG5VF8uhbpklLTHXMtg7dDy3ORDPpJtD/mF/3SRR5yjaSLyP2Wv1O01Vw
	GKL3FfipebEogWtSJUWzR3vPZlDAZWTN5W6braMC4ycOmMLrsaCHWp/cfLuTdJnz5eO
	/IOzuJ83McbSD/aAhfPuqtKWw0u8DIlWJxJ7O9BU=
Content-Type: multipart/mixed; boundary="===============8651650632493116199=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 65.6.3 SUCCEEDED
Message-ID: <01010184ce4f7c33-54ebdaff-c18a-426a-941e-9c92e3800df0-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174151

--===============8651650632493116199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools* to *65.6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch
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
--===============8651650632493116199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.5.1.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch" to "https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-65.6.3.tar.gz file://0001-change-shebang-to-python3.patch file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
packages/core2-32-poky-linux/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-pkg-resources: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dbg: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-dev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-doc: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-locale: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-src: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools-staticdev: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PV changed from "65.5.1" to "65.6.3"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py"
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGV changed from 65.5.1 [default] to 65.6.3 [default]
packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: PKGSIZE changed from 6071920 to 6076889 (+0%)
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============8651650632493116199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-setuptools/python3-setuptools: FILELIST: directory renamed /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info -> /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info, added "/usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py"
Changes to packages/core2-32-poky-linux/python3-setuptools (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added
  /usr/lib/python3.11/site-packages/setuptools/_distutils/__pycache__/_log.cpython-311.pyc was added
Changes to packages/x86_64-linux/python3-setuptools-native (sysroot):
  /usr/lib/python3.11/site-packages/setuptools-65.5.1.dist-info moved to /usr/lib/python3.11/site-packages/setuptools-65.6.3.dist-info
  /usr/lib/python3.11/site-packages/setuptools/_distutils/_log.py was added

--===============8651650632493116199==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-65.5.1-65.6.3.patch"

RnJvbSA2ODZjNjIwNzZiZmQxM2JmOTQzY2IwNDZlYTVmMzVkYTdmMzk5Y2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDowMzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29sczogdXBncmFkZSA2NS41LjEgLT4gNjUuNi4zCgotLS0KIC4uLi8wMDAx
LWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoICB8
IDIgKy0KIC4uLnl0aG9uMy1zZXR1cHRvb2xzXzY1LjUuMS5iYiA9PiBweXRob24zLXNldHVwdG9v
bHNfNjUuNi4zLmJifSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhv
bjMtc2V0dXB0b29sc182NS41LjEuYmIgPT4gcHl0aG9uMy1zZXR1cHRvb2xzXzY1LjYuMy5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9p
bnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2RlLWJ5LWVhc3lfaW5zdGFs
bC5wYXRjaAppbmRleCAxYjVmOWM3NTc3Li5mYTRiZGUwMTI5IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFs
bHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAwMDEtY29uZGl0aW9uYWxs
eS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGEwZTA4NzNhOGVlNjY3NGQ0M2U2MDRkNjZiZjY2ZDk0ZmM4ZWViNmYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGY0NjMzM2JjOGJmZWU5YTk4NTQ0NmVmMDY5MDc3MTA3YmQw
MTM4ODAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUu
amlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4IDEwOjEzOjM4ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZldGNoIGNvZGUgYnkgZWFz
eV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtc2V0dXB0b29sc182NS41LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtc2V0dXB0b29sc182NS42LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNS4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29sc182NS42LjMuYmIKaW5kZXggOGRjNzI0ZTU1YS4uYThiY2IzYTYwMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHNfNjUuNS4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzXzY1
LjYuMy5iYgpAQCAtMTEsNyArMTEsNyBAQCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAi
IGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZQogU1JDX1VS
SSArPSAiZmlsZTovLzAwMDEtY2hhbmdlLXNoZWJhbmctdG8tcHl0aG9uMy5wYXRjaCBcCiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTE5N2ExOWFh
OGVjOTcyMjkyOGYyMjA2ZjhkZTc1MmRlZjBlNGM5ZmM2OTUzNTI3MzYwZDFjMzZkOTRkZGIyZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhNzYyMDc1N2JmOTg0YjU4ZGVhZjMyZmM4YTQ1NzdhOWJi
YzA4NTBjZjkyYzIwZTFjZTQxYzM4YzE5ZTVmYjc1IgogCiBERVBFTkRTICs9ICIke1BZVEhPTl9Q
Tn0iCiAKLS0gCjIuMzEuMQoK

--===============8651650632493116199==--

