Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D38C63717
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.874.1667349633845509364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ml/pDboD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c85eb3-9fb168cf-8960-4a5f-a268-870cff48ca19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kWVbC5hWEUP41ZzOAY3Bsjhm70Y/1CHqK0ec9b2fB/A=;
	b=ml/pDboDapVympOZMuVYLw0OOX/WiOcvx35U4vW5LhQV1HC0unnCOS8Ma69JI2wE
	t3OqanaS3DgBqZ0Z0rlYcuvQ8KeMWJNsW9DmZWVH7B4IXR16lgjNT8fmZSjMHZTzE9W
	HEUV7gVLQBJ4dMCKHFL75fvA9c4vbPN2bDibgqXE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kWVbC5hWEUP41ZzOAY3Bsjhm70Y/1CHqK0ec9b2fB/A=;
	b=fiMr0owlrsH40w1lZ78E1ZtnhowGcOtaLEgdIWG5Z63/Br1uA8O9NdvuS1TrsX+R
	NJfWNWbSshNkMqYOpa3+8lSeSNAz6atahkcdt5EACY8lo2XVEn+D+5GL/o0oW1xT9hS
	BrLMypEH6CKJoDY0iuc1neShOeVJJzNJHkntWeCU=
Content-Type: multipart/mixed; boundary="===============5846913557942459149=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fontconfig: upgrading to 2.14.1 SUCCEEDED
Message-ID: <0101018435c85eb3-9fb168cf-8960-4a5f-a268-870cff48ca19-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172464

--===============5846913557942459149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fontconfig* to *2.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fontconfig-upgrade-2.14.0-2.14.1.patch
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
--===============5846913557942459149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PKGSIZE changed from 917784 to 917988 (+0%)
packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-dbg: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-dev: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-dev: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-doc: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-doc: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-zh-cn: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-locale-zh-cn: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PKGSIZE changed from 963495 to 963446 (-0%)
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-src: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-staticdev: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-staticdev: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig-utils: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig-utils: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig: PKGSIZE changed from 470134 to 470776 (+0%)
packages/core2-32-poky-linux/fontconfig/fontconfig: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig/fontconfig: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
packages/core2-32-poky-linux/fontconfig/fontconfig: FILELIST: added "/usr/share/fontconfig/conf.avail/10-no-antialias.conf /usr/share/fontconfig/conf.avail/10-yes-antialias.conf /etc/fonts/conf.d/10-sub-pixel-rgb.conf /etc/fonts/conf.d/10-yes-antialias.conf"
packages/core2-32-poky-linux/fontconfig: SRC_URI changed from "http://fontconfig.org/release/fontconfig-2.14.0.tar.gz file://revert-static-pkgconfig.patch" to "http://fontconfig.org/release/fontconfig-2.14.1.tar.gz file://revert-static-pkgconfig.patch"
packages/core2-32-poky-linux/fontconfig: PACKAGES: added "fontconfig-locale-ka"
packages/core2-32-poky-linux/fontconfig: PV changed from "2.14.0" to "2.14.1"
packages/core2-32-poky-linux/fontconfig: PKGV changed from 2.14.0 [default] to 2.14.1 [default]
Changes to packages/core2-32-poky-linux/fontconfig (sysroot):
  /usr/share/fontconfig/conf.avail/10-no-antialias.conf was added
  /usr/share/fontconfig/conf.avail/10-yes-antialias.conf was added

--===============5846913557942459149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/fontconfig/fontconfig: FILELIST: added "/etc/fonts/conf.d/10-sub-pixel-rgb.conf /usr/share/fontconfig/conf.avail/10-no-antialias.conf /etc/fonts/conf.d/10-yes-antialias.conf /usr/share/fontconfig/conf.avail/10-yes-antialias.conf"
packages/core2-32-poky-linux/fontconfig: PACKAGES: added "fontconfig-locale-ka"
Changes to packages/core2-32-poky-linux/fontconfig (sysroot):
  /usr/share/fontconfig/conf.avail/10-no-antialias.conf was added
  /usr/share/fontconfig/conf.avail/10-yes-antialias.conf was added

--===============5846913557942459149==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fontconfig-upgrade-2.14.0-2.14.1.patch"

RnJvbSA3NjBkYjliNDFjM2QwMjI5NGQ1MjQ5YjE3YThkZDI0ZWJlZmFlYjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNDozOTo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGZv
bnRjb25maWc6IHVwZ3JhZGUgMi4xNC4wIC0+IDIuMTQuMQoKLS0tCiAuLi4vZm9udGNvbmZpZy97
Zm9udGNvbmZpZ18yLjE0LjAuYmIgPT4gZm9udGNvbmZpZ18yLjE0LjEuYmJ9ICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy97Zm9udGNvbmZpZ18yLjE0LjAuYmIgPT4gZm9u
dGNvbmZpZ18yLjE0LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIuMTQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZm9udGNvbmZpZy9mb250Y29uZmlnXzIu
MTQuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNv
bmZpZ18yLjE0LjEuYmIKaW5kZXggODBmOTUyYTAyNC4uYWU1YTQ1YmU1NCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ZvbnRjb25maWcvZm9udGNvbmZpZ18yLjE0LjEuYmIK
QEAgLTI1LDcgKzI1LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vZm9udGNvbmZpZy5vcmcvcmVsZWFz
ZS9mb250Y29uZmlnLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZpbGU6Ly9yZXZlcnQtc3Rh
dGljLXBrZ2NvbmZpZy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImI4ZjYwN2Q1NTZlODI1N2RhMmYzNjE2YjRkNzA0YmUzMGZkNzNiZDcxZTM2NzM1NWNhNzg5
NjNmOWE3ZjA0MzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWU0ODBlOWNhMzQzODI3OTAzMTJm
ZjA2MmM2MjVlYzcwZGY5NGQ2ZDlhOTM2NmUyYjJiM2Q1MjVmN2Y5MDM4NyIKIAogVVBTVFJFQU1f
Q0hFQ0tfUkVHRVggPSAiZm9udGNvbmZpZy0oP1A8cHZlcj5cZCtcLlxkK1wuKD8hOVxkKylcZCsp
IgogCi0tIAoyLjMxLjEKCg==

--===============5846913557942459149==--

