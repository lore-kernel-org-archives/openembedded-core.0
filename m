Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E1FC54EC5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.342.1664643226638919531
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Tb5SQE+d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101839477d707-41dce450-7378-4308-a26c-c0c75002039b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Zmh+ATQOk+0aTJaY3Anf/3RenSJVQcUitCNaunmEUwo=;
	b=Tb5SQE+d6kgJ06158SW7eOJOqX0YgBdK+bmsPgPtozFMFIUyFIzD/zBBB3AIKBGs
	vwxN1BlUu+DetznhDA2G2mrg325Z2y7ODq9Tttum/jA87cVHepK712mEogOa0WS+ira
	7TtGfcMr/XW3XASwH+8ivnE7lqtMa6nJseJzl070=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643225;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Zmh+ATQOk+0aTJaY3Anf/3RenSJVQcUitCNaunmEUwo=;
	b=gMbBPAxnATDKH/XqIeaWjo/Q0FsUWVgv/6/UYuOL5ngdALk21wdRFhpLLizksp8M
	Gyr83Avhcd6jMy4Lgb/S12HtaTpd1QEuAwF11oSVxytxnyTpMZfU//zG1YC3j3+Odv7
	xteR/8RQ/FzpikWDga8MeJRAKATpqTN2TM6LGYs4=
Content-Type: multipart/mixed; boundary="===============8014978076450626152=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] init-system-helpers: upgrading to 1.65.2 SUCCEEDED
Message-ID: 
 <010101839477d707-41dce450-7378-4308-a26c-c0c75002039b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:45 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171262

--===============8014978076450626152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *init-system-helpers* to *1.65.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-init-system-helpers-upgrade-1.64-1.65.2.patch
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
--===============8014978076450626152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dbg: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-dev: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-doc: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-invoke-rc.d: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-locale: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-service: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-src: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers-staticdev: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers/init-system-helpers: PKGV changed from 1.64 [default] to 1.65.2 [default]
packages/core2-32-poky-linux/init-system-helpers: PV changed from "1.64" to "1.65.2"
packages/core2-32-poky-linux/init-system-helpers: PKGV changed from 1.64 [default] to 1.65.2 [default]

--===============8014978076450626152==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-init-system-helpers-upgrade-1.64-1.65.2.patch"

RnJvbSA5NGRhZWYzMGI3MDIzNTA1YjAwNWMwNTFjNDEzMmZmOThjNDY3YmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwNjo0MDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlu
aXQtc3lzdGVtLWhlbHBlcnM6IHVwZ3JhZGUgMS42NCAtPiAxLjY1LjIKCi0tLQogLi4ubml0LXN5
c3RlbS1oZWxwZXJzXzEuNjQuYmIgPT4gaW5pdC1zeXN0ZW0taGVscGVyc18xLjY1LjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvaW5pdHNjcmlwdHMve2luaXQtc3lzdGVtLWhlbHBlcnNfMS42
NC5iYiA9PiBpbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjQu
YmIgYi9tZXRhL3JlY2lwZXMtY29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEu
NjUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjQuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42NS4yLmJiCmlu
ZGV4IDY2M2Q2MGM2ZTAuLjFmYzIzYWNiNzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2luaXRzY3JpcHRzL2luaXQtc3lzdGVtLWhlbHBlcnNfMS42NC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtY29yZS9pbml0c2NyaXB0cy9pbml0LXN5c3RlbS1oZWxwZXJzXzEuNjUuMi5iYgpAQCAtMTYs
NyArMTYsNyBAQCBTRUNUSU9OID0gImJhc2UiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEdQ
TC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2RlYmlhbi9jb3B5cmlnaHQ7
bWQ1PWM0ZWMyMGFhMTU4ZmE5ZGUyNmVlMWFjY2Y3OGRjYWFlIgogCi1TUkNSRVYgPSAiYzQ0MDg5
MzA1MTQwNmMxMWYwYTMxNTA1ODkzOTY1N2Q1OTM3YmU0ZiIKK1NSQ1JFViA9ICIyZjQ0NmI2OWRi
NzI4YjJiZGE2ODI3MGE5YjgxZGU4ODEwMmUxZmRkIgogU1JDX1VSSSA9ICJnaXQ6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9pbml0LXN5c3RlbS1oZWxwZXJzLmdpdDtwcm90b2NvbD1odHRwczti
cmFuY2g9bWFzdGVyIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+KFxk
KyhcLlxkKykrKSkoPyFfZXhwKSIKIAotLSAKMi4zMS4xCgo=

--===============8014978076450626152==--

