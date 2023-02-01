Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F76C7618D
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.30017.1675272857126769122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=USYhggSP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101860e0b22e3-d2c5c059-af0b-452f-a545-3561c2db381c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KWi1FgfZFYGvY1PLZtnPMGNfVtt/EQUV/TTKh9M946w=;
	b=USYhggSPaC0N08i+iFrtUgBcwqtxEQ5+Gdtro+UAoOc85h+37JyLlLPsJTP7JUkm
	uF+axt9r3vg8RR0dbPDaTG99QD6gpwcSgEwvfJtqv899h/4QovNG3Hfc3JjedesN7xW
	BFfYRTKvUTuP6Na0ReILSTRfJLhWi06vN+/6bjBY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KWi1FgfZFYGvY1PLZtnPMGNfVtt/EQUV/TTKh9M946w=;
	b=iECLahNTawnvotYkSTubu/qQLK4b5lk8gSGgkhI+76tlZEcRLJqdl8Wn8NAkKXY1
	m636eLyuif0Qt7B6TqbZ3I6KHkAZgjCy/WJ7BVxXkjVtjXMVMQ1ZujawCDxixo0acGf
	RJtJ9GLqEQref/94iACK/DigFj6PB/d6TE/IE644=
Content-Type: multipart/mixed; boundary="===============6274543000143577812=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] texinfo: upgrading to 7.0.2 SUCCEEDED
Message-ID: <010101860e0b22e3-d2c5c059-af0b-452f-a545-3561c2db381c-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176618

--===============6274543000143577812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *texinfo* to *7.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-texinfo-upgrade-7.0.1-7.0.2.patch
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
--===============6274543000143577812==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-texinfo-upgrade-7.0.1-7.0.2.patch"

RnJvbSBmM2U2ZjRjODkzZjY1NDYzNDAwMzg1NWQ1MDgxYzc5ZWM1ZDdjZTA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDo0NTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRl
eGluZm86IHVwZ3JhZGUgNy4wLjEgLT4gNy4wLjIKCi0tLQogLi4uL3RleGluZm8ve3RleGluZm9f
Ny4wLjEuYmIgPT4gdGV4aW5mb183LjAuMi5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3RleGluZm8ve3RleGluZm9fNy4wLjEuYmIgPT4gdGV4aW5mb183LjAuMi5i
Yn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhp
bmZvXzcuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAu
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGV4aW5mby90ZXhpbmZvXzcuMC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvdGV4aW5mby90ZXhpbmZvXzcuMC4yLmJiCmluZGV4IGYwZjkyMTE1OTQuLmRhNDU1ZGY0YmIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC90ZXhpbmZvL3RleGluZm9fNy4wLjEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3RleGluZm8vdGV4aW5mb183LjAuMi5iYgpA
QCAtMzUsNyArMzUsNyBAQCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vdGV4aW5mby8ke0JQfS50
YXIuZ3ogXAogICAgICAgICAgICAke1RBUkdFVF9QQVRDSH0gXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICI1M2MwMWRkMzRjOWJmMTE2ODY2ZDAzYWFiZDM4YzVjZDllZTk1
YWMxMDA0M2Q2MWFhMzNkZWMwZDI3ODI1ZDhkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImE5YzY0
NmJjNGY2YmIzMTg0M2YxMjlmODQwOGEzYTYyNzMzNDU3NWZhZjdiMjJlYmM0MTZiZTVjYjE1NzA1
NTMiCiAKIHRleF90ZXhpbmZvID0gInRleG1mL3RleC90ZXhpbmZvIgogCi0tIAoyLjM3LjMKCg==

--===============6274543000143577812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/texinfo/info-doc: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/info-doc: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/info-doc: PKGSIZE changed from 118239 to 118228 (-0%)
packages/core2-32-poky-linux/texinfo/info: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/info: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo: SRC_URI changed from "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.1.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch" to "https://ftp.gnu.org/gnu/texinfo/texinfo-7.0.2.tar.gz file://disable-native-tools.patch file://link-zip.patch file://dont-depend-on-help2man.patch file://use_host_makedoc.patch"
packages/core2-32-poky-linux/texinfo: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo: PACKAGES: added "texinfo-locale-sk"
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-dbg: PKGSIZE changed from 1136940 to 1136716 (-0%)
packages/core2-32-poky-linux/texinfo/texinfo-dev: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-dev: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-doc: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-doc: PKGSIZE changed from 1949021 to 1948992 (-0%)
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca.us-ascii: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ca: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-cs: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-da: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de.us-ascii: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-de: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-el: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-eo: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-es: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fi: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-fr: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-he: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hr: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-hu: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-id: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-it: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ja: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nb: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-nl: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-no.us-ascii: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pl: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br.us-ascii: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt-br: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt.us-ascii: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-pt: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ro: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-ru: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-rw: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sl: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sr: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-sv: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-tr: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-uk: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-vi: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-cn: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-locale-zh-tw: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-src: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo-src: PKGSIZE changed from 1599984 to 1600105 (+0%)
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo-staticdev: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo: PV changed from "7.0.1" to "7.0.2"
packages/core2-32-poky-linux/texinfo/texinfo: PKGV changed from 7.0.1 [default] to 7.0.2 [default]
packages/core2-32-poky-linux/texinfo/texinfo: PKGSIZE changed from 6255161 to 6255159 (-0%)

--===============6274543000143577812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/texinfo: PACKAGES: added "texinfo-locale-sk"

--===============6274543000143577812==--

