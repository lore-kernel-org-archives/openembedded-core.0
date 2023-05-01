Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8E8CA9ECF
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.107905.1682976353147322824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jUwEal4J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010187d93530b1-1da47c97-f145-4414-89f6-cee2cb321937-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JABSO8Gm31GYsMsDxw0dGLHp56ZZx9OUYqNgJUKsPPU=;
	b=jUwEal4J+O7fLEEPIK4MQzwOV96BmIuXUXc+JQyThE2JR2T522JmDH4sFRr3aSkL
	6LglBCXdg/9swY0n0zX7a1fYOu3FOjPHWD6U5oI7RbIxNJm89boC4YdukI0SqOwEeL8
	KKp0XgL+L+CBgVaSM3kRNrqboxKieUBYq2znhWx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JABSO8Gm31GYsMsDxw0dGLHp56ZZx9OUYqNgJUKsPPU=;
	b=XhJJaDtFU5p9YzaNuuxjM5sMITzjT126mILejvussDyCK8ScDRyO10ZSCtTb7P9X
	iFrvQ9P/ULNxj0pNnWOuZ8uCnFKIhxeSCgV1MpXDC/2xg5QUdx53rYUXqdRKJZ5zVvu
	G/6QknavSTrSRnj2EalNDli7fieVrAyqmuKoDe+8=
Content-Type: multipart/mixed; boundary="===============4256222196619282861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.72.1 SUCCEEDED
Message-ID: <01010187d93530b1-1da47c97-f145-4414-89f6-cee2cb321937-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180705

--===============4256222196619282861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.72.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.72.0-0.72.1.patch
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
--===============4256222196619282861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.72.0-0.72.1.patch"

RnJvbSBhM2IzMDJkYzUzZjNhZWQ3MThmMjZjZmM1ZTkyYjNlMGI2M2QzNGU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMToyNTo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjcyLjAgLT4gMC43Mi4xCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS97dnRlXzAuNzIuMC5iYiA9PiB2dGVfMC43Mi4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS97dnRlXzAuNzIuMC5iYiA9PiB2dGVfMC43Mi4xLmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4wLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdnRlL3Z0ZV8wLjcyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjcyLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4xLmJiCmluZGV4IDVlYWZmOTkxNTkuLmI5ZmYz
MTgzYzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4xLmJiCkBAIC0yMSw3ICsy
MSw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB1cHN0cmVh
bS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyCiAKICMgdmFwaWdlbi5tNCBpcyByZXF1aXJl
ZCB3aGVuIHZhbGEgaXMgbm90IHByZXNlbnQgKGJ1dCB0aGUgb25lIGZyb20gdmFsYSBzaG91bGQg
YmUgdXNlZCBub3JtYWxseSkKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjQwZmU5MTRkNmM3MGRiMzQxNzZjOTIyNzI1YjZjNmVhMTVkNWYzY2IyYTliNDRj
NTdlMjAwYTVmOTUwYTY3MzYiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwNTU0Zjlm
ODhkNTZjZTJkNzgzOThmY2M3ZjY5YmMwMGU1M2JiYmM1ZjY5NGUwYWUxZGNhZjUyODZmODlkN2U0
IgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAot
LSAKMi4zOS4yCgo=

--===============4256222196619282861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.72/vte-0.72.0.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.72/vte-0.72.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7200.0", added "/usr/lib/libvte-2.91.so.0.7200.1"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7200.0 to libvte-2.91.so.0.7200.1
  /usr/lib/libvte-2.91.so.0.7200.0 moved to /usr/lib/libvte-2.91.so.0.7200.1
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 6411696 to 6411632 (-0%)
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7200.0", added "/usr/lib/.debug/libvte-2.91.so.0.7200.1"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ab: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ab: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGSIZE changed from 1509 to 1504 (-0%)
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2208729 to 2209045 (+0%)
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.72.0 [default] to 0.72.1 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.72.0" to "0.72.1"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.72.0 [default] to 0.72.1 [default]

--===============4256222196619282861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7200.0", added "/usr/lib/libvte-2.91.so.0.7200.1"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7200.0 to libvte-2.91.so.0.7200.1
  /usr/lib/libvte-2.91.so.0.7200.0 moved to /usr/lib/libvte-2.91.so.0.7200.1

--===============4256222196619282861==--

