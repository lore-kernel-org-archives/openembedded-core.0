Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C42C63719
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.24450.1665871393223029195
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FDkkDbd/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010183ddac363c-32104527-38a0-418e-945c-7c8a75baf32a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uj3phZgoLXFZH2LTmsSYlEeircH/s51djvvD2luLwsY=;
	b=FDkkDbd/fqw2kBHCSgz7e2zd8g7YoWhoN35jm/7sDH5zzT7y/j1iqDTaBg6terGj
	FcTQeC1Rl4LaoSqq7q1o8R0QkdN4VjERtJ997tlnTp5oDy4trOEJXlRhvr2S5+SyUz5
	3m09x3qrnnXEBLEWQuHaMkMgTp0XE7AGhV6R+3uM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uj3phZgoLXFZH2LTmsSYlEeircH/s51djvvD2luLwsY=;
	b=a6DpN4ZkWRKkB6NOXLhqgFv3JyTneMITqFQYRoV9kTLScGgo8VrLnNVLDMl/vXP9
	3Ivmq/hpl40DCHZXJXVRsQ/n7le8mSZ47MrYXHNgTwtHTv5StwA6L9yxog6SF3cIAY7
	TsR8iKrW8xVRM5k62r7PUm44T4Jfok2hqD4mDjz0=
Content-Type: multipart/mixed; boundary="===============2926929102922328114=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.0 SUCCEEDED
Message-ID: <01010183ddac363c-32104527-38a0-418e-945c-7c8a75baf32a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171804

--===============2926929102922328114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-5.19-6.0.patch
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
--===============2926929102922328114==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-5.19-6.0.patch"

RnJvbSAwZTJlMGQ1ZTIxMDM5MjdjZmZmZTkzOWRiZjg0NWM0NDVhOGM3OTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTI6MjA6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDUuMTkgLT4gNi4wCgotLS0KIC4uLi9ldGh0b29sL2V0aHRvb2wvYXZv
aWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggICAgICAgICAgICAgIHwgNiArKystLS0KIC4uLi9ldGh0
b29sL3tldGh0b29sXzUuMTkuYmIgPT4gZXRodG9vbF82LjAuYmJ9ICAgICAgICAgICAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wve2V0aHRvb2xfNS4xOS5iYiA9PiBldGh0
b29sXzYuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBm
ODcwM2Q4MTQ1Li44NTlkYjEzZDk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
ZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDJjZWVhNzI5ODEwNDc1Y2E4OTg4ZTI5NTVkYzMzYjU4NDM1
MjBlNmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDUwYmFiYjBiMGI1YWM0NzQyMWM0
YjEzYTY2YzM1MTFmZDQ3MzA0YWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRv
ciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMjggTWF5IDIwMTQg
MTg6NTk6NTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXRodG9vbDogdXNlIHNlcmlhbC10ZXN0
cyBjb25maWcgbmVlZGVkIGJ5IHB0ZXN0LgpAQCAtMTUsMTEgKzE1LDExIEBAIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1p
bmRleCBjYzM1MjVjLi44NzNhZjliIDEwMDY0NAoraW5kZXggODlkMGU3MC4uYWIyYmU5YyAxMDA2
NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMiw3ICsyLDcg
QEAgZG5sIFByb2Nlc3MgdGhpcyBmaWxlIHdpdGggYXV0b2NvbmYgdG8gcHJvZHVjZSBhIGNvbmZp
Z3VyZSBzY3JpcHQuCi0gQUNfSU5JVChldGh0b29sLCA1LjE5LCBuZXRkZXZAdmdlci5rZXJuZWwu
b3JnKQorIEFDX0lOSVQoZXRodG9vbCwgNi4wLCBuZXRkZXZAdmdlci5rZXJuZWwub3JnKQogIEFD
X1BSRVJFUSgyLjUyKQogIEFDX0NPTkZJR19TUkNESVIoW2V0aHRvb2wuY10pCiAtQU1fSU5JVF9B
VVRPTUFLRShbZ251IHN1YmRpci1vYmplY3RzXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNS4xOS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2xfNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNS4xOS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjAuYmIKaW5kZXggOGM5OTViMjFl
MS4uOGYzNjUyMGIwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wv
ZXRodG9vbF81LjE5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRv
b2xfNi4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9S
fS9zb2Z0d2FyZS9uZXR3b3JrL2V0aHRvb2wvZXRodG9vbC0ke1BWfS50YXIuZ3ogXAogICAgICAg
ICAgICBmaWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDQxMmRjZDRhYzg4NjE3N2FiZDY4MjgyZWZhOTg5MTRh
NGRkMjQ5NzIxOGUyOThlNzA0OWU5Y2I3MmIyMzM2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImYy
MTY4ZTJiNDVkN2U1OGVkNWI3NmU1NTMzZmQ2MDdjYTA3MjBjOWU2MzFmNDI3MWJmZTk5N2JmNzIz
MzA3OTYiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1
Yi9zb2Z0d2FyZS9uZXR3b3JrL2V0aHRvb2wvIgogCi0tIAoyLjMxLjEKCg==

--===============2926929102922328114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3442276 to 3455360 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1482732 to 1482706 (-0%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1292476 to 1292597 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 5.19 [default] to 6.0 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "5.19" to "6.0"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-5.19.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.0.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-32-poky-linux/ethtool: PKGV changed from 5.19 [default] to 6.0 [default]

--===============2926929102922328114==--

