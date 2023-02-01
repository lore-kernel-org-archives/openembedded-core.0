Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F397C7EE24
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30355.1675272854493522198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T2Ue2+uU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b22a2-6b26e74b-b2e7-453e-9f08-d6125519ed22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cTjo5RXPxf+vjb6F1+ltMQsXOgcFfXuMN+6TJJg3ZB4=;
	b=T2Ue2+uUdxCU1GT8J3PvAU9uyWnb7Ab1szQuhAcBZQ5i6nhTdwNI+5YgRBRm2/rd
	xVvLuLY5qWlH5+I2VvUw3WN3VrcjstzYLeTCm2YjFKEHAbmQp/Ypz66dQxES5MO89mu
	i7j/Eh7iJdX7IXC7qVd8JaRqSsq6MhwfsPio7MBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cTjo5RXPxf+vjb6F1+ltMQsXOgcFfXuMN+6TJJg3ZB4=;
	b=SyTP/Jc9DXV11n0VnHEU55briqgvPeE+dZbqgYJh49eQTtepuFIyT/QV+vPMTmuW
	30BOJr3kTNqUgAREFzFIHmRuPwfcXcJKrDbGxPNKSiMYoqB94Luk5341PMVXfa2sUzm
	mpMh+XYFMSWp2IwPv0Ocho/WOMkXxvzckTuqw/qk=
Content-Type: multipart/mixed; boundary="===============1138469707097334836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.12p2 SUCCEEDED
Message-ID: <010101860e0b22a2-6b26e74b-b2e7-453e-9f08-d6125519ed22-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176612

--===============1138469707097334836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.12p2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.12p1-1.9.12p2.patch
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
--===============1138469707097334836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.12p1-1.9.12p2.patch"

RnJvbSA0NjNhOWUzMWIxNTk0ZDMwM2U0YmFiMDkyY2NhMTRkM2QyMDdkMGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDozMjo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjEycDEgLT4gMS45LjEycDIKCi0tLQogLi4uL3N1ZG8ve3N1ZG9fMS45
LjEycDEuYmIgPT4gc3Vkb18xLjkuMTJwMi5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjEycDEuYmIgPT4gc3Vkb18xLjkuMTJwMi5i
Yn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEu
OS4xMnAxLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkb18xLjkuMTJwMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vk
by9zdWRvXzEuOS4xMnAxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9z
dWRvXzEuOS4xMnAyLmJiCmluZGV4IDE0OTViNjdiOGIuLmFlNzIwN2MwODEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjEycDEuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkb18xLjkuMTJwMi5iYgpAQCAtOCw3ICs4LDcgQEAgU1JD
X1VSSSA9ICJodHRwczovL3d3dy5zdWRvLndzL2Rpc3Qvc3Vkby0ke1BWfS50YXIuZ3ogXAogCiBQ
QU1fU1JDX1VSSSA9ICJmaWxlOi8vc3Vkby5wYW0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0
NzVhMThhOGViM2RhOGIyOTE3Y2VhYjA2M2E2YmFmNTFlYTA5MTI4YzNjNDdlM2UwZTMzYWI3NDk3
YmFiN2Q4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5YTBiMWFlMGYxZGRkOWJlN2YzZWFmZTcw
YmUwNWVlODFmNTcyZjZmNTM2NjMyYzQ0Y2Q0MTAxYmIyYTg1MzkiCiAKIERFUEVORFMgKz0gIiB2
aXJ0dWFsL2NyeXB0ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFt
JywgJ2xpYnBhbScsICcnLCBkKX0iCiBSREVQRU5EUzoke1BOfSArPSAiICR7QGJiLnV0aWxzLmNv
bnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgJ3BhbS1wbHVnaW4tbGltaXRzIHBhbS1w
bHVnaW4ta2V5aW5pdCcsICcnLCBkKX0iCi0tIAoyLjM3LjMKCg==

--===============1138469707097334836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.12p1.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch" to "https://www.sudo.ws/dist/sudo-1.9.12p2.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 4262476 to 4263756 (+0%)
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 2975220 to 2977972 (+0%)
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 980668 to 984764 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 3455376 to 3456557 (+0%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.12p1" to "1.9.12p2"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.12p1 [default] to 1.9.12p2 [default]
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.12p1" to "1.9.12p2"

--===============1138469707097334836==--

