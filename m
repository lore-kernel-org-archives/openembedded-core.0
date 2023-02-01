Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A68DC6FD1B
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.30362.1675272857668199153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MaOkG2i3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101860e0b229c-3e4c7e63-34af-41dc-9a08-8dd97d281bb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I5m2lo0Dhq4XkNIs41vLjAced407GvIjJSSLXA+5X3g=;
	b=MaOkG2i3dRnYxHnM0s975At6l+6Ap+qmmMvoP1QGqQjaCvF/s7Ju+s7N2S/Pefm0
	JLP+OzyU2AEFRz8nZrk4/uoetda8934JlvSVoxE+onlHVvB/0XFDnzylrK2lWN4pYL/
	dqe5x5wvn8HWN1pu3MGYqUci92PsRvRpRvzANdTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I5m2lo0Dhq4XkNIs41vLjAced407GvIjJSSLXA+5X3g=;
	b=enPFnrcPhxIOj2nMpMn8cKbj7qI5yFRW5Acxr3o6EgbaI8wdX4fDfTDnKk8i+PLX
	hovGE+hnL3mXTAdIgel5b/6dRSSz4k3t97pkyaUD/5Y8Ys+2EV0L7T/E9BO0JiheSSx
	po0AlAtxf6y4Fg3fB2BhAGVxLVgadrS6yWtJnB/s=
Content-Type: multipart/mixed; boundary="===============6614786520214866667=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.6.2 SUCCEEDED
Message-ID: <010101860e0b229c-3e4c7e63-34af-41dc-9a08-8dd97d281bb4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176624

--===============6614786520214866667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysstat* to *12.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.6.1-12.6.2.patch
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
--===============6614786520214866667==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.6.1-12.6.2.patch"

RnJvbSAyZjI2MGFiNWE4OWMwYThhODY0YzcyNWI3MTQ0MzZiZmZhMGIzNjgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNDozNjo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3N0YXQ6IHVwZ3JhZGUgMTIuNi4xIC0+IDEyLjYuMgoKLS0tCiAuLi4vc3lzc3RhdC97c3lzc3Rh
dF8xMi42LjEuYmIgPT4gc3lzc3RhdF8xMi42LjIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC97c3lzc3RhdF8xMi42LjEuYmIgPT4gc3lzc3RhdF8xMi42
LjIuYmJ9ICg2NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQv
c3lzc3RhdF8xMi42LjEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0
XzEyLjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDY1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvc3lzc3RhdC9zeXNzdGF0XzEyLjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdF8xMi42LjIuYmIKaW5kZXggNmRmN2JkYmI4My4uZjll
NTc3OGU3NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3Rh
dF8xMi42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N5c3N0YXQvc3lzc3RhdF8x
Mi42LjIuYmIKQEAgLTQsNCArNCw0IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PWEyM2E3NGIzZjRjYWY5NjE2MjMwNzg5ZDk0MjE3YWNiIgogCiBTUkNfVVJJICs9ICJm
aWxlOi8vMDAwMS1jb25maWd1cmUuaW4tcmVtb3ZlLWNoZWNrLWZvci1jaGtjb25maWcucGF0Y2gi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxOGZmNWE0ZTE0OWUyNTY4ZTQzMzg1NjM3ZjcyNDM3
ZmU2YmFmY2MxMzIyYTkzZDEzZDE5ODFlOTQ2NGEwMzQyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjNlNzcxMzRhZWRhYTZmYzU3ZDk3NDVkYTY3ZWRmZDg5OTBlMTlhZGVlNzFhYzQ3MTk2MjI5MjYx
YzU2M2ZiNDgiCi0tIAoyLjM3LjMKCg==

--===============6614786520214866667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysstat: SRC_URI changed from "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.6.1.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch" to "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.6.2.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch"
packages/core2-32-poky-linux/sysstat: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 1834188 to 1834216 (+0%)
packages/core2-32-poky-linux/sysstat/sysstat-dev: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-doc: FILELIST: removed "/usr/share/doc/sysstat/sysstat-12.6.1.lsm", added "/usr/share/doc/sysstat/sysstat-12.6.2.lsm"
packages/core2-32-poky-linux/sysstat/sysstat-doc: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 255846 to 256005 (+0%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-src: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1798573 to 1798745 (+0%)
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.6.1 [default] to 12.6.2 [default]
packages/core2-32-poky-linux/sysstat/sysstat: PV changed from "12.6.1" to "12.6.2"
packages/core2-32-poky-linux/sysstat/sysstat: PKGV changed from 12.6.1 [default] to 12.6.2 [default]

--===============6614786520214866667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sysstat/sysstat-doc: FILELIST: removed "/usr/share/doc/sysstat/sysstat-12.6.1.lsm", added "/usr/share/doc/sysstat/sysstat-12.6.2.lsm"

--===============6614786520214866667==--

