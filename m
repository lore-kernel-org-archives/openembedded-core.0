Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245F5C88C85
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.32129.1680384535233715827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Qan/2+o7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb92858-f03e4e6e-dab8-4bb2-984e-690e7a4f0157-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Fs5/WuFRY51a9nil0nBiOTgmvEz8TpISv9Qylv+1WA=;
	b=Qan/2+o7+GUplHJjaaHyfiyj/u8bXpcm5I1bgx8JBw4YIjztpcSzlMaSHU5eX+S/
	feOaDr1hVaRHLm9GTcT8Gk6aGAZMnZi6Sff9MTn6o1Z9GGRsY9OoxbOfQ/oibzv1w24
	3dWNm5f9njVr9o0yWD9t/oCjfM4cOH9I+rpXWHw8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Fs5/WuFRY51a9nil0nBiOTgmvEz8TpISv9Qylv+1WA=;
	b=lFOF28jRn3YQNIEDFTXkPRdqcR4uvgoED7XjaWMYiWXOJ5aBCvWm116WNE31N9mX
	dDG3oTVDkM1s9c9jWEsKCpj4Dkd8ZI4H5vsVpckE0gStLJdcC3xHIkAZoT6PR3+AmIT
	TcNMFWhUKSDrbF46/G8M6D6+3puubTe6P+LFrKRY=
Content-Type: multipart/mixed; boundary="===============7475276834987105933=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.0.3 SUCCEEDED
Message-ID: <010101873eb92858-f03e4e6e-dab8-4bb2-984e-690e7a4f0157-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179515

--===============7475276834987105933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *texinfo* to *7.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-texinfo-upgrade-7.0.2-7.0.3.patch
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
--===============7475276834987105933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/texinfo/info-doc: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/info-doc: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/info-doc: PKGSIZE changed from 118228 to 118226 (-0%)
packages/core2-32-poky-linux/texinfo/info: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/info: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo: SRC_URI changed from "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.2.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch" to "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.3.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch"
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGSIZE changed from 1136716 to 1136696 (-0%)
packages/core2-32-poky-linux/texinfo/texinfo-dev: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-dev: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-doc: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGSIZE changed from 1948992 to 1948980 (-0%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PKGSIZE changed from 120737 to 121763 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PKGSIZE changed from 122408 to 123534 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PKGSIZE changed from 117696 to 118771 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PKGSIZE changed from 118851 to 119877 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PKGSIZE changed from 123923 to 125013 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sk: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sk: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PKGSIZE changed from 120055 to 122945 (+2%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PKGSIZE changed from 146627 to 147891 (+1%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-src: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGSIZE changed from 1600105 to 1600157 (+0%)
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo: PKGV changed from 7.0.2 [default] to 7.0.3 [default]
packages/core2-32-poky-linux/texinfo/texinfo: PV changed from "7.0.2" to "7.0.3"
packages/core2-32-poky-linux/texinfo/texinfo: PKGSIZE changed from 6255159 to 6257033 (+0%)

--===============7475276834987105933==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-texinfo-upgrade-7.0.2-7.0.3.patch"

RnJvbSAwNDc2ZDM3ZDJhOTdkODFmN2E3OWQzNTRjY2ZmYmRjMjM0ZjkwZWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxMjoxMjowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRl
eGluZm86IHVwZ3JhZGUgNy4wLjIgLT4gNy4wLjMKCi0tLQogLi4uL3RleGluZm8ve3RleGluZm9f
Ny4wLjIuYmIgPT4gdGV4aW5mb183LjAuMy5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3RleGluZm8ve3RleGluZm9fNy4wLjIuYmIgPT4gdGV4aW5mb183LjAuMy5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhp
bmZvXzcuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAu
My5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGV4aW5mby90ZXhpbmZvXzcuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGV4aW5mby90ZXhpbmZvXzcuMC4zLmJiCmluZGV4IGRhNDU1ZGY0YmIuLmIxNDkxNzdiNzIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90ZXhpbmZvL3RleGluZm9fNy4wLjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAuMy5iYgpA
QCAtMzUsNyArMzUsNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vdGV4aW5mby8ke0JQfS50
YXIuZ3ogXAogICAgICAgICAgICAke1RBUkdFVF9QQVRDSH0gXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJhOWM2NDZiYzRmNmJiMzE4NDNmMTI5Zjg0MDhhM2E2MjczMzQ1
NzVmYWY3YjIyZWJjNDE2YmU1Y2IxNTcwNTUzIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNjYzU3
MDZmYjA4NmI4OTVlMWRjMmI0MDdhYWRlOWY5NWEzYTIzM2ZmODU2MjczZTJiNjU5YjA4OWYxMTc2
ODMiCiAKIHRleF90ZXhpbmZvID0gInRleG1mL3RleC90ZXhpbmZvIgogCi0tIAoyLjM5LjIKCg==

--===============7475276834987105933==--

