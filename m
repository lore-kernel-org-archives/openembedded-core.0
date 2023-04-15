Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ACCCA9EA0
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.13522.1681581684972964731
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eqpk0MCV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187861434e7-1f416604-8f1d-4888-b0ed-41a69bc8ad57-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=o6oXXQhtzzJSYkHfLeOHZ9TPkHvD06VvKYpf0JAzagM=;
	b=eqpk0MCVcRhP6MIodbQzDnHRdIBc/R5sbhQS/IXfyy6DCU4qSSqy7CM9a72OQJtt
	/15y7uA4qJN7+KulNlLRZRT6ATKzUBY62wlpBM5KeMEKOkECmjYipIECUWSaoBjE1eO
	2LXcmkIwE8ayBGZfcCzSz1rW2yT8dyWHee9z9GqY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=o6oXXQhtzzJSYkHfLeOHZ9TPkHvD06VvKYpf0JAzagM=;
	b=Y1JlcDvSbY9ss/vf7VP1v9geYqCjZfr5NiMji6dq5iZrueg9HGJs5vg6HllDQoZ0
	ShVSZMX6/Bwri8/8RGav2pM9PwRhrk8Gom/GNQ7GxvEeCdqx7Xx9s6EEH4UOIPxxUOk
	EUDKEIYfy5u1SDzT6FSUxuFzPhCJSqw5q9JvnvL0=
Content-Type: multipart/mixed; boundary="===============7397529603112442542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 253.3 SUCCEEDED
Message-ID: <01010187861434e7-1f416604-8f1d-4888-b0ed-41a69bc8ad57-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180037

--===============7397529603112442542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *253.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-253.1-253.3.patch
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
--===============7397529603112442542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v253-stable file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch file://0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch" to "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v253-stable file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "253.1" to "253.3"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 253.1 [default] to 253.3 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "253.1" to "253.3"

--===============7397529603112442542==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-253.1-253.3.patch"

RnJvbSA1ZmJhMDg1ODk5NTNmMjk2MGEzNTNiZGU4N2MzNGRjNWNlYjc4OGRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDg6MDI6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW1kLWJvb3Q6IHVwZ3JhZGUgMjUzLjEgLT4gMjUzLjMKCi0tLQogLi4ubWQtYm9vdF8yNTMu
MS5iYiA9PiBzeXN0ZW1kLWJvb3RfMjUzLjMuYmJ9IHwgIDAKIG1ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC5pbmMgICAgICAgICB8ICAzICstCiAuLi5jaXRseS1jYXN0LXRoZS1jb25z
dGFudHMtdG8tdWludDY0X3QucGF0Y2ggfCA0NCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0NiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3tzeXN0ZW1kLWJvb3RfMjUzLjEuYmIgPT4gc3lzdGVtZC1ib290
XzI1My4zLmJifSAoMTAwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAyNS1zeXN0ZW1jdGwtZXhwbGljaXRseS1jYXN0LXRoZS1jb25zdGFu
dHMtdG8tdWludDY0X3QucGF0Y2gKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQtYm9vdF8yNTMuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC1ib290XzI1My4zLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTMuMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUzLjMuYmIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCmluZGV4IDE0NjA4ZjlhYmMuLmQ1MGYyYzljYmEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwpAQCAtMTQsMTEgKzE0LDEwIEBAIExJQ0VO
U0UgPSAiR1BMLTIuMC1vbmx5ICYgTEdQTC0yLjEtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUxNDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT00ZmJkNjUz
ODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAotU1JDUkVWID0gIjZjMzI3ZDc0YWEwZDM1MDQ4
MmU4MmEyNDdkNzAxODU1OTY5OTc5OGQiCitTUkNSRVYgPSAiZWQxOGMyYWI3OWU4Yjk0MTgyZDVk
Y2YzMWQ1ODQ1Nzc2M2YzZTNlMSIKIFNSQ0JSQU5DSCA9ICJ2MjUzLXN0YWJsZSIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQtc3RhYmxlLmdpdDtwcm90b2NvbD1o
dHRwczticmFuY2g9JHtTUkNCUkFOQ0h9IFwKICAgICAgICAgICAgZmlsZTovLzAwMjYtc3JjLWJv
b3QtZWZpLWVmaS1zdHJpbmcuYy1kZWZpbmUtd2NoYXJfdC1mcm9tLV9fV0NIQS5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDI1LXN5c3RlbWN0bC1leHBsaWNpdGx5LWNhc3QtdGhlLWNvbnN0
YW50cy10by11aW50NjRfdC5wYXRjaCBcCiAgICAgICAgICAgICIKIAogUyA9ICIke1dPUktESVJ9
L2dpdCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDI1
LXN5c3RlbWN0bC1leHBsaWNpdGx5LWNhc3QtdGhlLWNvbnN0YW50cy10by11aW50NjRfdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDI1LXN5c3RlbWN0bC1leHBs
aWNpdGx5LWNhc3QtdGhlLWNvbnN0YW50cy10by11aW50NjRfdC5wYXRjaApkZWxldGVkIGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggZDg0MGRlODcwZi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAyNS1zeXN0ZW1jdGwtZXhwbGljaXRseS1jYXN0LXRo
ZS1jb25zdGFudHMtdG8tdWludDY0X3QucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NCArMCww
IEBACi1Gcm9tIGZhZDI5Y2UxZjVjYzdiMTJiYzEzNjcxZDlhZDgwNzc1NzcxYTY3ZWIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBGcmFudGlzZWsgU3Vtc2FsIDxmcmFudGlzZWtAc3Vt
c2FsLmN6PgotRGF0ZTogRnJpLCAzIE1hciAyMDIzIDEyOjE3OjI3ICswMTAwCi1TdWJqZWN0OiBb
UEFUQ0hdIHN5c3RlbWN0bDogZXhwbGljaXRseSBjYXN0IHRoZSBjb25zdGFudHMgdG8gdWludDY0
X3QKLQotT3RoZXJ3aXNlIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucyBgdmFfYXJnKClgIG1pZ2h0
IGdldCBnYXJiYWdlIGluc3RlYWQKLW9mIHRoZSBleHBlY3RlZCB2YWx1ZSwgaS5lLjoKLQotJCBz
dWRvIGJ1aWxkLW8wL3N5c3RlbWN0bCBkaXNhYmxlIGFzZGZhc2ZhZgotc2RfYnVzX21lc3NhZ2Vf
YXBwZW5kdjogR290IHVpbnQ2NF90OiAwCi1GYWlsZWQgdG8gZGlzYWJsZSB1bml0OiBVbml0IGZp
bGUgYXNkZmFzZmFmLnNlcnZpY2UgZG9lcyBub3QgZXhpc3QuCi0KLSQgc3VkbyBidWlsZC1vMS9z
eXN0ZW1jdGwgZGlzYWJsZSBhc2RmYXNmYWYKLXNkX2J1c19tZXNzYWdlX2FwcGVuZHY6IEdvdCB1
aW50NjRfdDogNzk1NDg3NTcxOTY4MTU3Mjg2NAotRmFpbGVkIHRvIGRpc2FibGUgdW5pdDogSW52
YWxpZCBhcmd1bWVudAotCi0ocmVwcm9kdWNlZCBvbiBhbiBhcm12N2hsIG1hY2hpbmUpCi0KLVJl
c29sdmVzOiAjMjY1NjgKLUZvbGxvdy11cCB0bzogYmYxYmVhNDNmMTUKLVJlbGF0ZWQgaXNzdWU6
IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvcHVsbC8xNDQ3MCNkaXNjdXNzaW9u
X3IzNjI4OTM3MzUKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvYzYzYmZkMDg4NGNmMjBlNDhiZWZiZWU0OWQ0MWY2
Njc2NjBhODgwMl0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0
cm9uaXguZGU+Ci0tLS0KLSBzcmMvc3lzdGVtY3RsL3N5c3RlbWN0bC1lbmFibGUuYyB8IDIgKy0K
LSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAt
LWdpdCBhL3NyYy9zeXN0ZW1jdGwvc3lzdGVtY3RsLWVuYWJsZS5jIGIvc3JjL3N5c3RlbWN0bC9z
eXN0ZW1jdGwtZW5hYmxlLmMKLWluZGV4IDg2ZDlmNjAyZmEuLmY5NGEyODYxMjIgMTAwNjQ0Ci0t
LS0gYS9zcmMvc3lzdGVtY3RsL3N5c3RlbWN0bC1lbmFibGUuYwotKysrIGIvc3JjL3N5c3RlbWN0
bC9zeXN0ZW1jdGwtZW5hYmxlLmMKLUBAIC0yMTEsNyArMjExLDcgQEAgaW50IHZlcmJfZW5hYmxl
KGludCBhcmdjLCBjaGFyICphcmd2W10sIHZvaWQgKnVzZXJkYXRhKSB7Ci0gCi0gICAgICAgICAg
ICAgICAgIGlmIChzZW5kX3J1bnRpbWUpIHsKLSAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
c3RyZXEobWV0aG9kLCAiRGlzYWJsZVVuaXRGaWxlc1dpdGhGbGFnc0FuZEluc3RhbGxJbmZvIikp
Ci0tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByID0gc2RfYnVzX21lc3NhZ2VfYXBw
ZW5kKG0sICJ0IiwgYXJnX3J1bnRpbWUgPyBVTklUX0ZJTEVfUlVOVElNRSA6IDApOwotKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgciA9IHNkX2J1c19tZXNzYWdlX2FwcGVuZChtLCAi
dCIsIGFyZ19ydW50aW1lID8gKHVpbnQ2NF90KSBVTklUX0ZJTEVfUlVOVElNRSA6IFVJTlQ2NF9D
KDApKTsKLSAgICAgICAgICAgICAgICAgICAgICAgICBlbHNlCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByID0gc2RfYnVzX21lc3NhZ2VfYXBwZW5kKG0sICJiIiwgYXJnX3J1bnRp
bWUpOwotICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyIDwgMCkKLS0tIAotMi4zOS4yCi0K
LS0gCjIuMzkuMgoK

--===============7397529603112442542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============7397529603112442542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============7397529603112442542==--

