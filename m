Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A963C88CAE
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.24033.1677681914033756317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XbQYKyzL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101869da26cf4-d7d0cbb0-7887-4b63-8bd7-29decfb71dac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7MlTJsZX4NEGaLLnF4VWpYekxm7gU6WvC3BnsDFdOsI=;
	b=XbQYKyzLClZHJiKROH8sUc3Xs2TBEN6W+5o3Z3RNCu/YG+JlgipfED1NiKffXJTw
	U/YmDxEZR05s8usys9rXPcfHPHek5ie8EhS6V4FxdpdWvKR22O7wDVeHUAMPIXlquoS
	a2xwVeql5y01TQc0iFm8ZsmpDJgwdtEWrLv5l0F8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7MlTJsZX4NEGaLLnF4VWpYekxm7gU6WvC3BnsDFdOsI=;
	b=egFLkGW+ixgDMyr1S4jEytgAb0iWvjJYMb1WYazbNvXhoHvqqnZBxFL+PJBfSSU8
	AeL8+/8g4aqp35LMr2d0uIMlfAZ1rFDdzZVQU/XAioPvoh9de2wCTqHOjBM/rg9Vkyn
	LBeMnJNiuVv54YWoBnXgQ481r0w3GqxP3heOl3ws=
Content-Type: multipart/mixed; boundary="===============5492816190935392990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf-archive: upgrading to 2023.02.20 SUCCEEDED
Message-ID: <010101869da26cf4-d7d0cbb0-7887-4b63-8bd7-29decfb71dac-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177893

--===============5492816190935392990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf-archive* to *2023.02.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-autoconf-archive-upgrade-2022.09.03-2023.02.20.patch
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
--===============5492816190935392990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-autoconf-archive-upgrade-2022.09.03-2023.02.20.patch"

RnJvbSBlNGVkMWE1NzM5Nzg2NDE2NTYwZTRiNWUxZjUxYTVhMDQ4YTg1ODIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwNzo0NzoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGF1
dG9jb25mLWFyY2hpdmU6IHVwZ3JhZGUgMjAyMi4wOS4wMyAtPiAyMDIzLjAyLjIwCgotLS0KIC4u
Lm9uZi1hcmNoaXZlXzIwMjIuMDkuMDMuYmIgPT4gYXV0b2NvbmYtYXJjaGl2ZV8yMDIzLjAyLjIw
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL3thdXRvY29u
Zi1hcmNoaXZlXzIwMjIuMDkuMDMuYmIgPT4gYXV0b2NvbmYtYXJjaGl2ZV8yMDIzLjAyLjIwLmJi
fSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNo
aXZlL2F1dG9jb25mLWFyY2hpdmVfMjAyMi4wOS4wMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmVfMjAyMy4wMi4yMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYt
YXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjIuMDkuMDMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25mLWFyY2hpdmVfMjAyMy4wMi4y
MC5iYgppbmRleCA2NTk1YWM5OGJhLi42YmE3Y2RmM2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjIuMDkuMDMu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYt
YXJjaGl2ZV8yMDIzLjAyLjIwLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT0xMWNjMmQzZWU1NzRmOWQ2YjdlZTc5N2JkY2U0ZDQyMyBcCiAg
ICAgZmlsZTovL0NPUFlJTkcuRVhDRVBUSU9OO21kNT1mZGVmMTY4ZWJmZjNiYzJmMTM2NjRjMzY1
YTVmYjUxNSIKIAogU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9LyR7QlBOfS8ke0JQTn0tJHtQVn0u
dGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUwNzQ1NGYwMGQ4Y2FlNzkwN2JlZDQyZDA3
NDc3OTg5Mjc4MDk5NDc2ODRkOTRjMzcyMDdhNGQ2M2EzMmY0MjMiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzFkNDA0ODQ3OWFlMjhmMWY1Nzk0NjE5YzNkNzJkZjljMDFkZjQ5YjFjNjI4ZWY4NWZk
ZTM3NTk2ZGMzMWEzMyIKIAogaW5oZXJpdCBhdXRvdG9vbHMgYWxsYXJjaCB0ZXhpbmZvCiAKLS0g
CjIuMzkuMgoK

--===============5492816190935392990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PV changed from "2022.09.03" to "2023.02.20"
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGV changed from 2022.09.03 [default] to 2023.02.20 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGSIZE changed from 46804 to 46923 (+0%)
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PV changed from "2022.09.03" to "2023.02.20"
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PKGV changed from 2022.09.03 [default] to 2023.02.20 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive: PV changed from "2022.09.03" to "2023.02.20"
packages/all-poky-linux/autoconf-archive/autoconf-archive: FILELIST: added "/usr/share/aclocal/ax_c_restrict.m4"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGV changed from 2022.09.03 [default] to 2023.02.20 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGSIZE changed from 2126266 to 2130155 (+0%)
packages/all-poky-linux/autoconf-archive: SRC_URI changed from "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2022.09.03.tar.xz" to "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2023.02.20.tar.xz"
packages/all-poky-linux/autoconf-archive: PV changed from "2022.09.03" to "2023.02.20"
packages/all-poky-linux/autoconf-archive: PKGV changed from 2022.09.03 [default] to 2023.02.20 [default]
Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_c_restrict.m4 was added
Changes to packages/x86_64-linux/autoconf-archive-native (sysroot):
  /usr/share/aclocal/ax_c_restrict.m4 was added

--===============5492816190935392990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive: FILELIST: added "/usr/share/aclocal/ax_c_restrict.m4"
Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_c_restrict.m4 was added
Changes to packages/x86_64-linux/autoconf-archive-native (sysroot):
  /usr/share/aclocal/ax_c_restrict.m4 was added

--===============5492816190935392990==--

