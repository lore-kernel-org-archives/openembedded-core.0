Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30768C88C8E
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24022.1677681914663645025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S83YH4Go;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101869da26d74-a2f6d7ec-9c01-483b-8baf-352912c8df22-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h4FNyDxeOr1kJ49VRPa0q3GK8QcgIZyEC6VxBbBOVPo=;
	b=S83YH4GorHMsN5hMYXwFWsgsj9gvMBe+CkvMiBMxVH/XL8bw/X3r9Oj8oaIfvokR
	5af1jGRZ1iops1wnYaS4W/E+q9rXK5uw5T/gwP/L1yCuPKBP4ozGnxMxA8iXS8sazMy
	uoOOACEfzLtXLgiKGWGzvKxpAOrff3LwRRJjMXAw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h4FNyDxeOr1kJ49VRPa0q3GK8QcgIZyEC6VxBbBOVPo=;
	b=iuJv/9SqLZIeVYdIyG2A/x97M7gUYARJilH96HRfR4p/oekBJDS+p63NaMEn+Fi5
	TTzx6mj8eDtTNvYRjT0wZitPxTu/fD2raXeT1jCbdQPASEVP4JasTZTlymeqYfBps5P
	WtOPCJBAPFmzEBKNmZnEdBccK7eyvBh4uP+fV/Yo=
Content-Type: multipart/mixed; boundary="===============5201787493812951695=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.74.6 SUCCEEDED
Message-ID: <010101869da26d74-a2f6d7ec-9c01-483b-8baf-352912c8df22-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177903

--===============5201787493812951695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.74.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.74.5-2.74.6.patch
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
--===============5201787493812951695==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.74.5-2.74.6.patch"

RnJvbSBkNTI2ZjYwN2U0OWUzYzkyOWZmZGE4M2E3ZjJhZjk0Y2VkYjJhNGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwNzozMTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzQuNSAtPiAyLjc0LjYKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCAgICAgIHwgMiArLQogLi4u
L2dsaWItMi4wL3tnbGliLTIuMF8yLjc0LjUuYmIgPT4gZ2xpYi0yLjBfMi43NC42LmJifSAgICAg
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAve2dsaWItMi4wXzIuNzQuNS5i
YiA9PiBnbGliLTIuMF8yLjc0LjYuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKaW5kZXgg
YWU2ODgxYjYxZS4uNjI5ZjhhNjkxOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBhM2NkZjE3NjQzYmYzM2Q1MzJlYzI2OTkxMzk3NDE5NWUxMzZiN2ZjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMDE4YjljYTNmODIyNWMwNDQxMDlhNjEyYjllN2U0
MGIwMmYwODNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTEgTWFyIDIwMTYgMTU6MzU6NTUgKzAw
MDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2xpYi0yLjA6IHJlbG9jYXRlIHRoZSBHSU8gbW9kdWxlIGRp
cmVjdG9yeSBmb3IgbmF0aXZlIGJ1aWxkcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjBfMi43NC41LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAv
Z2xpYi0yLjBfMi43NC42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzQuNS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43NC42LmJiCmluZGV4IGQ1NGYwNzdjYjAu
LjViNzlhZTQ4MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIt
Mi4wXzIuNzQuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8y
Ljc0LjYuYmIKQEAgLTIxLDcgKzIxLDcgQEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vZ2xp
Yi8ke1NIUlRfVkVSfS9nbGliLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgICIKIFNSQ19VUkk6
YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmlsZTovL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2giCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZWJhODNhNTk5OWNlYjMxYTRjNGZjOTkyMTIwN2NiOWZm
ZmZkMmFiMWQ2ZWMwM2MxNjJkM2Y2MDhhNWMxNGM4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA2
OWNmN2U1MWNkMjYxZWIxNjNhYWYwNmM4ZDE3NTRjNjgzNWYzMTI1MjE4MGFmZjU4MTRlNWFmYzc3
NTdmYmMiCiAKICMgRmluZCBhbnkgbWVzb24gY3Jvc3MgZmlsZXMgaW4gRklMRVNQQVRIIHRoYXQg
YXJlIHJlbGV2YW50IGZvciB0aGUgY3VycmVudAogIyBidWlsZCAodXNpbmcgc2l0ZWluZm8pIGFu
ZCBhZGQgdGhlbSB0byBFWFRSQV9PRU1FU09OLgotLSAKMi4zOS4yCgo=

--===============5201787493812951695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgthread-2.0.so.0.7400.5 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.5-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.7400.5 /usr/lib/.debug/libgmodule-2.0.so.0.7400.5 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.5-gdb.py /usr/lib/.debug/libglib-2.0.so.0.7400.5 /usr/lib/.debug/libgio-2.0.so.0.7400.5", added "/usr/lib/.debug/libgthread-2.0.so.0.7400.6 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.6-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7400.6 /usr/lib/.debug/libgobject-2.0.so.0.7400.6 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.6-gdb.py /usr/lib/.debug/libgio-2.0.so.0.7400.6 /usr/lib/.debug/libglib-2.0.so.0.7400.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGSIZE changed from 141101 to 141235 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGSIZE changed from 67242 to 66324 (-1%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PV changed from "2.74.5" to "2.74.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.7400.5 /usr/lib/libgobject-2.0.so.0.7400.5 /usr/lib/libgio-2.0.so.0.7400.5 /usr/lib/libglib-2.0.so.0.7400.5 /usr/lib/libgmodule-2.0.so.0.7400.5", added "/usr/lib/libgthread-2.0.so.0.7400.6 /usr/lib/libgobject-2.0.so.0.7400.6 /usr/lib/libgio-2.0.so.0.7400.6 /usr/lib/libgmodule-2.0.so.0.7400.6 /usr/lib/libglib-2.0.so.0.7400.6"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0: PKGV changed from 2.74.5 [default] to 2.74.6 [default]
packages/core2-32-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.74/glib-2.74.5.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch file://cpp-null.patch file://cpp-null2.patch" to "https://download.gnome.org/sources//glib/2.74/glib-2.74.6.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-
 warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch file://cpp-null.patch file://cpp-null2.patch"
packages/core2-32-poky-linux/glib-2.0: PV changed from "2.74.5" to "2.74.6"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.5 to libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.5 to libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.5 to libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.5 to libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.5 to libgthread-2.0.so.0.7400.6
  /usr/lib/libgio-2.0.so.0.7400.5 moved to /usr/lib/libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0.7400.5 moved to /usr/lib/libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0.7400.5 moved to /usr/lib/libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0.7400.5 moved to /usr/lib/libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0.7400.5 moved to /usr/lib/libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.6-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.6-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.5 to libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.5 to libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.5 to libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.5 to libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.5 to libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.6-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.6-gdb.py
  /usr/lib/libgio-2.0.so.0.7400.5 moved to /usr/lib/libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0.7400.5 moved to /usr/lib/libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0.7400.5 moved to /usr/lib/libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0.7400.5 moved to /usr/lib/libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0.7400.5 moved to /usr/lib/libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0

--===============5201787493812951695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.7400.5 /usr/lib/libgthread-2.0.so.0.7400.5 /usr/lib/libgio-2.0.so.0.7400.5 /usr/lib/libgmodule-2.0.so.0.7400.5 /usr/lib/libglib-2.0.so.0.7400.5", added "/usr/lib/libgthread-2.0.so.0.7400.6 /usr/lib/libgobject-2.0.so.0.7400.6 /usr/lib/libgio-2.0.so.0.7400.6 /usr/lib/libglib-2.0.so.0.7400.6 /usr/lib/libgmodule-2.0.so.0.7400.6"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.5 to libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.5 to libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.5 to libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.5 to libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.5 to libgthread-2.0.so.0.7400.6
  /usr/lib/libgio-2.0.so.0.7400.5 moved to /usr/lib/libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0.7400.5 moved to /usr/lib/libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0.7400.5 moved to /usr/lib/libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0.7400.5 moved to /usr/lib/libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0.7400.5 moved to /usr/lib/libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.6-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.6-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.5 to libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.5 to libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.5 to libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.5 to libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.5 to libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.6-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.5-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.6-gdb.py
  /usr/lib/libgio-2.0.so.0.7400.5 moved to /usr/lib/libgio-2.0.so.0.7400.6
  /usr/lib/libglib-2.0.so.0.7400.5 moved to /usr/lib/libglib-2.0.so.0.7400.6
  /usr/lib/libgmodule-2.0.so.0.7400.5 moved to /usr/lib/libgmodule-2.0.so.0.7400.6
  /usr/lib/libgobject-2.0.so.0.7400.5 moved to /usr/lib/libgobject-2.0.so.0.7400.6
  /usr/lib/libgthread-2.0.so.0.7400.5 moved to /usr/lib/libgthread-2.0.so.0.7400.6
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.5-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.6-r0

--===============5201787493812951695==--

