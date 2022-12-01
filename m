Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693A3C64EC9
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:34 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.46811.1669908625663220456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mt4eaY4V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010184ce4f752e-eefb4ad0-06b1-47fa-a3e9-77b27eb3576f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gpBGCBDGlCwcbUkP4bCCnb1A+r7gni6YOvGpNYAPO6M=;
	b=mt4eaY4V4ub1JKYBqjnACWB146ZnHYA9p6U/BoGjcXYBohh0WJ/MOUPrcIJu+QdQ
	RaFie944gqv1vixK05LJbzGdzUKzvrkd+QhDGXcrtYxSfTzBduUWVqbmxwTzml5GKKg
	fMDz1nXlkhwclqw7mwtIMsDl8H/cXBsf2wy3BUH8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gpBGCBDGlCwcbUkP4bCCnb1A+r7gni6YOvGpNYAPO6M=;
	b=g3oFUWX/7W5Hruo5hWxTNSZhcJ/c8yMuCfGFu5PWWVDWF6LSkaBxAsEh40DMOp6+
	wcTktsXANzTlCSaIa95tB5wfdanLrnrHAXlw2st2jXc6n0cU9qlqqwVC4WvBAa0pPwc
	ZKvSexBEcoZYyhA1iHfLDQ3dH4c9z7i0e0nmSPuo=
Content-Type: multipart/mixed; boundary="===============7186812941014963544=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.74.2 SUCCEEDED
Message-ID: <01010184ce4f752e-eefb4ad0-06b1-47fa-a3e9-77b27eb3576f-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174127

--===============7186812941014963544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.74.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.74.1-2.74.2.patch
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
--===============7186812941014963544==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.74.1-2.74.2.patch"

RnJvbSA0MTg0NGUyMmEwMjg5MjViNzBjZDk1ZjhjZWNkMmNmNmU2MGY5MWIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAwNzozNjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzQuMSAtPiAyLjc0LjIKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCAgICB8IDQgKystLQogLi4u
L2dsaWItMi4wL3tnbGliLTIuMF8yLjc0LjEuYmIgPT4gZ2xpYi0yLjBfMi43NC4yLmJifSAgICAg
ICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL3tnbGliLTIuMF8yLjc0LjEuYmIg
PT4gZ2xpYi0yLjBfMi43NC4yLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCmluZGV4IDc3
MjNhYzY2NzIuLjM0ZmRlZWM2MjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWIt
Mi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gMGRhMGI2MDhmZGJiMTQ0YzM5MjI1MjMzY2JkZDg5OTk1Yjc2OTA0YiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTFjNzhkYmY0ZWVjNzcyMjEzNGMwZTViZDlmZDhmZGVh
ODhhMDRiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDExIE1hciAyMDE2IDE1OjM1OjU1ICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIGdsaWItMi4wOiByZWxvY2F0ZSB0aGUgR0lPIG1vZHVsZSBkaXJl
Y3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTog
SnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2lvL2dp
b21vZHVsZS5jIGIvZ2lvL2dpb21vZHVsZS5jCi1pbmRleCBmNWRiYjQ1NTUuLmM5MjZlNzdhOCAx
MDA2NDQKK2luZGV4IGY1ZGJiNDUuLmM5MjZlNzcgMTAwNjQ0CiAtLS0gYS9naW8vZ2lvbW9kdWxl
LmMKICsrKyBiL2dpby9naW9tb2R1bGUuYwogQEAgLTU4LDYgKzU4LDggQEAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzQuMS5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc0LjEu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWItMi4wXzIuNzQuMi5i
YgppbmRleCA4ZmQ3ODVhN2ZkLi5kMTBkNmFjNzFmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjBfMi43NC4yLmJiCkBAIC0yMSw3ICsyMSw3IEBAIFNSQ19VUkkgPSAi
JHtHTk9NRV9NSVJST1J9L2dsaWIvJHtTSFJUX1ZFUn0vZ2xpYi0ke1BWfS50YXIueHogXAogICAg
ICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9yZWxvY2F0
ZS1tb2R1bGVzLnBhdGNoIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGFiOTgxNjE4ZDFkYjQ3
ODQ1ZTU2NDE3YjBkN2MxMjNmODFhMzQyN2IyYjljOTNmNWE0NmZmNWJiYjk2NDk2NCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkZGYwM2U5YmM3ZWE1NzE3ZWYzYzJmNzdjMDcxNDkxM2ExNzI2YWRj
MGJmM2U4MjQ3Y2Y0MTQ3NTI4NGVjN2JjIgogCiAjIEZpbmQgYW55IG1lc29uIGNyb3NzIGZpbGVz
IGluIEZJTEVTUEFUSCB0aGF0IGFyZSByZWxldmFudCBmb3IgdGhlIGN1cnJlbnQKICMgYnVpbGQg
KHVzaW5nIHNpdGVpbmZvKSBhbmQgYWRkIHRoZW0gdG8gRVhUUkFfT0VNRVNPTi4KLS0gCjIuMzEu
MQoK

--===============7186812941014963544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgmodule-2.0.so.0.7400.1 /usr/lib/.debug/libgio-2.0.so.0.7400.1 /usr/lib/.debug/libgthread-2.0.so.0.7400.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.1-gdb.py /usr/lib/.debug/libglib-2.0.so.0.7400.1 /usr/lib/.debug/libgobject-2.0.so.0.7400.1 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.1-gdb.py", added "/usr/lib/.debug/libgio-2.0.so.0.7400.2 /usr/lib/.debug/libglib-2.0.so.0.7400.2 /usr/lib/.debug/libgobject-2.0.so.0.7400.2 /usr/lib/.debug/libgthread-2.0.so.0.7400.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.2-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7400.2 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.2-gdb.py"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 18215580 to 18223912 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGSIZE changed from 2371925 to 2371957 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGSIZE changed from 10614 to 10816 (+2%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGSIZE changed from 89126 to 89647 (+1%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGSIZE changed from 175669 to 174641 (-1%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 23189699 to 23198683 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.7400.1 /usr/lib/libgio-2.0.so.0.7400.1 /usr/lib/libglib-2.0.so.0.7400.1 /usr/lib/libgobject-2.0.so.0.7400.1 /usr/lib/libgmodule-2.0.so.0.7400.1", added "/usr/lib/libgmodule-2.0.so.0.7400.2 /usr/lib/libglib-2.0.so.0.7400.2 /usr/lib/libgobject-2.0.so.0.7400.2 /usr/lib/libgthread-2.0.so.0.7400.2 /usr/lib/libgio-2.0.so.0.7400.2"
packages/core2-32-poky-linux/glib-2.0: PKGV changed from 2.74.1 [default] to 2.74.2 [default]
packages/core2-32-poky-linux/glib-2.0: PV changed from "2.74.1" to "2.74.2"
packages/core2-32-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.74/glib-2.74.1.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch file://cpp-null.patch file://cpp-null2.patch" to "https://download.gnome.org/sources//glib/2.74/glib-2.74.2.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-
 warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch file://cpp-null.patch file://cpp-null2.patch"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.1 to libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.1 to libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.1 to libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.1 to libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.1 to libgthread-2.0.so.0.7400.2
  /usr/lib/libgio-2.0.so.0.7400.1 moved to /usr/lib/libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0.7400.1 moved to /usr/lib/libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0.7400.1 moved to /usr/lib/libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0.7400.1 moved to /usr/lib/libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0.7400.1 moved to /usr/lib/libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.1 to libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.1 to libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.1 to libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.1 to libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.1 to libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.2-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.2-gdb.py
  /usr/lib/libgio-2.0.so.0.7400.1 moved to /usr/lib/libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0.7400.1 moved to /usr/lib/libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0.7400.1 moved to /usr/lib/libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0.7400.1 moved to /usr/lib/libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0.7400.1 moved to /usr/lib/libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0

--===============7186812941014963544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.7400.1 /usr/lib/libgthread-2.0.so.0.7400.1 /usr/lib/libgobject-2.0.so.0.7400.1 /usr/lib/libgio-2.0.so.0.7400.1 /usr/lib/libgmodule-2.0.so.0.7400.1", added "/usr/lib/libgmodule-2.0.so.0.7400.2 /usr/lib/libgobject-2.0.so.0.7400.2 /usr/lib/libgthread-2.0.so.0.7400.2 /usr/lib/libgio-2.0.so.0.7400.2 /usr/lib/libglib-2.0.so.0.7400.2"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.1 to libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.1 to libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.1 to libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.1 to libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.1 to libgthread-2.0.so.0.7400.2
  /usr/lib/libgio-2.0.so.0.7400.1 moved to /usr/lib/libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0.7400.1 moved to /usr/lib/libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0.7400.1 moved to /usr/lib/libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0.7400.1 moved to /usr/lib/libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0.7400.1 moved to /usr/lib/libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7400.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7400.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7400.1 to libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7400.1 to libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7400.1 to libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7400.1 to libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7400.1 to libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7400.2-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7400.2-gdb.py
  /usr/lib/libgio-2.0.so.0.7400.1 moved to /usr/lib/libgio-2.0.so.0.7400.2
  /usr/lib/libglib-2.0.so.0.7400.1 moved to /usr/lib/libglib-2.0.so.0.7400.2
  /usr/lib/libgmodule-2.0.so.0.7400.1 moved to /usr/lib/libgmodule-2.0.so.0.7400.2
  /usr/lib/libgobject-2.0.so.0.7400.1 moved to /usr/lib/libgobject-2.0.so.0.7400.2
  /usr/lib/libgthread-2.0.so.0.7400.1 moved to /usr/lib/libgthread-2.0.so.0.7400.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.1-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.74.2-r0

--===============7186812941014963544==--

