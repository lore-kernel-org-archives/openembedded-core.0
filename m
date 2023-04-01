Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E287FCA9EB1
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.32129.1680384533739890735
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LQBP458f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101873eb9211d-040f6edf-e0dc-4de9-be09-0f6966883b5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D9asQyy9V3yl1XC9YmfJynokyzmxWRye02b5CmrC+0g=;
	b=LQBP458f2Q4bTOvgNw5WYF/AZkHTU9bxWIIqimQApcYfgyW4y7L1UGfDZyp/LggC
	YCNABvwVotkmkLFbsJHTgYodmY1QIa1BgSjj2GVARRzv3nnTtrRAoJZfTx9L6gQkrex
	0G51LrsigI9kU4JlthmwjyceKExl40edGsXSfBvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384533;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D9asQyy9V3yl1XC9YmfJynokyzmxWRye02b5CmrC+0g=;
	b=YhXWp1rleFWxiojCoslk/3LVPc38nAT44KDX0jdvUiJTEiNTBGO/7k3ZhvkH0arU
	+y3tTwYxdLOaXNnQZIBvhDvOyAFcyDoV3Ro6rAt7Wy1L0bRg655DS5xHJ6kjrNafLWV
	WMnxfSXNkQmT3/k8SJRR3m4/xlWfEjJGlTB/vU5M=
Content-Type: multipart/mixed; boundary="===============6725924861837362015=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 253.2 SUCCEEDED
Message-ID: <010101873eb9211d-040f6edf-e0dc-4de9-be09-0f6966883b5d-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179477

--===============6725924861837362015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *253.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-253.1-253.2.patch
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
--===============6725924861837362015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 73 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============6725924861837362015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: SRC_URI changed from "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v253-stable file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch file://0025-systemctl-explicitly-cast-the-constants-to-uint64_t.patch" to "git://github.com/systemd/systemd-stable.git;protocol=https;branch=v253-stable file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch"
packages/core2-32-poky-linux/systemd-boot: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "253.1" to "253.2"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 253.1 [default] to 253.2 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "253.1" to "253.2"

--===============6725924861837362015==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-253.1-253.2.patch"

RnJvbSA1ZjUyYTY0OTA3NjIyYTQ4M2Y5ZTQwZGE4Y2YwNjE3MDUwYmU3NDY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwNzoyNDozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTMuMSAtPiAyNTMuMgoKLS0tCiAuLi5tZC1ib290XzI1My4x
LmJiID0+IHN5c3RlbWQtYm9vdF8yNTMuMi5iYn0gfCAgMAogbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kLmluYyAgICAgICAgIHwgIDMgKy0KIC4uLmNpdGx5LWNhc3QtdGhlLWNvbnN0
YW50cy10by11aW50NjRfdC5wYXRjaCB8IDQ0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQ2IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQve3N5c3RlbWQtYm9vdF8yNTMuMS5iYiA9PiBzeXN0ZW1kLWJvb3Rf
MjUzLjIuYmJ9ICgxMDAlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC8wMDI1LXN5c3RlbWN0bC1leHBsaWNpdGx5LWNhc3QtdGhlLWNvbnN0YW50
cy10by11aW50NjRfdC5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC1ib290XzI1My4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0
ZW1kLWJvb3RfMjUzLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1My4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTMuMi5iYgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYyBiL21ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC5pbmMKaW5kZXggMTQ2MDhmOWFiYy4uNmYyNDE5YjBjNCAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYworKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jCkBAIC0xNCwxMSArMTQsMTAgQEAgTElDRU5T
RSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJhYWJhYTg4MmJiZSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7bWQ1PTRmYmQ2NTM4
MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiNmMzMjdkNzRhYTBkMzUwNDgy
ZTgyYTI0N2Q3MDE4NTU5Njk5Nzk4ZCIKK1NSQ1JFViA9ICJiZmMwM2NhZTQxYWUwNTFjOWVlZGNi
NDhmNjZiMzI2NjM0NjcxOWFhIgogU1JDQlJBTkNIID0gInYyNTMtc3RhYmxlIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0O3Byb3RvY29sPWh0
dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0gXAogICAgICAgICAgICBmaWxlOi8vMDAyNi1zcmMtYm9v
dC1lZmktZWZpLXN0cmluZy5jLWRlZmluZS13Y2hhcl90LWZyb20tX19XQ0hBLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovLzAwMjUtc3lzdGVtY3RsLWV4cGxpY2l0bHktY2FzdC10aGUtY29uc3Rh
bnRzLXRvLXVpbnQ2NF90LnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTID0gIiR7V09SS0RJUn0v
Z2l0IgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjUt
c3lzdGVtY3RsLWV4cGxpY2l0bHktY2FzdC10aGUtY29uc3RhbnRzLXRvLXVpbnQ2NF90LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjUtc3lzdGVtY3RsLWV4cGxp
Y2l0bHktY2FzdC10aGUtY29uc3RhbnRzLXRvLXVpbnQ2NF90LnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBkODQwZGU4NzBmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDI1LXN5c3RlbWN0bC1leHBsaWNpdGx5LWNhc3QtdGhl
LWNvbnN0YW50cy10by11aW50NjRfdC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDQ0ICswLDAg
QEAKLUZyb20gZmFkMjljZTFmNWNjN2IxMmJjMTM2NzFkOWFkODA3NzU3NzFhNjdlYiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEZyYW50aXNlayBTdW1zYWwgPGZyYW50aXNla0BzdW1z
YWwuY3o+Ci1EYXRlOiBGcmksIDMgTWFyIDIwMjMgMTI6MTc6MjcgKzAxMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gc3lzdGVtY3RsOiBleHBsaWNpdGx5IGNhc3QgdGhlIGNvbnN0YW50cyB0byB1aW50NjRf
dAotCi1PdGhlcndpc2UgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zIGB2YV9hcmcoKWAgbWlnaHQg
Z2V0IGdhcmJhZ2UgaW5zdGVhZAotb2YgdGhlIGV4cGVjdGVkIHZhbHVlLCBpLmUuOgotCi0kIHN1
ZG8gYnVpbGQtbzAvc3lzdGVtY3RsIGRpc2FibGUgYXNkZmFzZmFmCi1zZF9idXNfbWVzc2FnZV9h
cHBlbmR2OiBHb3QgdWludDY0X3Q6IDAKLUZhaWxlZCB0byBkaXNhYmxlIHVuaXQ6IFVuaXQgZmls
ZSBhc2RmYXNmYWYuc2VydmljZSBkb2VzIG5vdCBleGlzdC4KLQotJCBzdWRvIGJ1aWxkLW8xL3N5
c3RlbWN0bCBkaXNhYmxlIGFzZGZhc2ZhZgotc2RfYnVzX21lc3NhZ2VfYXBwZW5kdjogR290IHVp
bnQ2NF90OiA3OTU0ODc1NzE5NjgxNTcyODY0Ci1GYWlsZWQgdG8gZGlzYWJsZSB1bml0OiBJbnZh
bGlkIGFyZ3VtZW50Ci0KLShyZXByb2R1Y2VkIG9uIGFuIGFybXY3aGwgbWFjaGluZSkKLQotUmVz
b2x2ZXM6ICMyNjU2OAotRm9sbG93LXVwIHRvOiBiZjFiZWE0M2YxNQotUmVsYXRlZCBpc3N1ZTog
aHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzE0NDcwI2Rpc2N1c3Npb25f
cjM2Mjg5MzczNQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5j
b20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC9jNjNiZmQwODg0Y2YyMGU0OGJlZmJlZTQ5ZDQxZjY2
NzY2MGE4ODAyXQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KLS0tLQotIHNyYy9zeXN0ZW1jdGwvc3lzdGVtY3RsLWVuYWJsZS5jIHwgMiArLQot
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0t
Z2l0IGEvc3JjL3N5c3RlbWN0bC9zeXN0ZW1jdGwtZW5hYmxlLmMgYi9zcmMvc3lzdGVtY3RsL3N5
c3RlbWN0bC1lbmFibGUuYwotaW5kZXggODZkOWY2MDJmYS4uZjk0YTI4NjEyMiAxMDA2NDQKLS0t
LSBhL3NyYy9zeXN0ZW1jdGwvc3lzdGVtY3RsLWVuYWJsZS5jCi0rKysgYi9zcmMvc3lzdGVtY3Rs
L3N5c3RlbWN0bC1lbmFibGUuYwotQEAgLTIxMSw3ICsyMTEsNyBAQCBpbnQgdmVyYl9lbmFibGUo
aW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgdm9pZCAqdXNlcmRhdGEpIHsKLSAKLSAgICAgICAgICAg
ICAgICAgaWYgKHNlbmRfcnVudGltZSkgewotICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChz
dHJlcShtZXRob2QsICJEaXNhYmxlVW5pdEZpbGVzV2l0aEZsYWdzQW5kSW5zdGFsbEluZm8iKSkK
LS0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHIgPSBzZF9idXNfbWVzc2FnZV9hcHBl
bmQobSwgInQiLCBhcmdfcnVudGltZSA/IFVOSVRfRklMRV9SVU5USU1FIDogMCk7Ci0rICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByID0gc2RfYnVzX21lc3NhZ2VfYXBwZW5kKG0sICJ0
IiwgYXJnX3J1bnRpbWUgPyAodWludDY0X3QpIFVOSVRfRklMRV9SVU5USU1FIDogVUlOVDY0X0Mo
MCkpOwotICAgICAgICAgICAgICAgICAgICAgICAgIGVsc2UKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHIgPSBzZF9idXNfbWVzc2FnZV9hcHBlbmQobSwgImIiLCBhcmdfcnVudGlt
ZSk7Ci0gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHIgPCAwKQotLS0gCi0yLjM5LjIKLQot
LSAKMi4zOS4yCgo=

--===============6725924861837362015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1797 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============6725924861837362015==--

