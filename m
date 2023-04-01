Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBE4C77B6D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.32122.1680384534501442871
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gPygeW4I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101873eb930e0-4a30e37c-cf57-441b-9c3a-fdb88bf526f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZPzGS+78LM+9QRcJCsmRrpQdzY4pWNdxqau4cQTZ+to=;
	b=gPygeW4IQ4lf8abgHCDq+pUxmKoZsdZF1L4Z1bJsOGDE6aNVSUz3GMp9vI2VN+8Y
	MokbOyxraRF6RKbBWgSVNnJzVR2Gf3oIWIc3sDa6LaTM2u4FimRWpimWB/q0Q4TDHJD
	nMyx8Ujwt+f/MK8rR8CJawmbilFnT6wNogL3Akco=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZPzGS+78LM+9QRcJCsmRrpQdzY4pWNdxqau4cQTZ+to=;
	b=l0t8L5fMGwY3bHr8OZ/7yXAmR/rcCh3GNsyybzEyfvibfT4lJJ++3VCxY5/Gi7Qy
	G157Tm6REhCRdrk0d3ixsFJ9R+2vx/Jc224VvURtr+ARQz15VUZJt1l99+kuqSuaBYB
	jXN520iXg5UV34HRZ6ihqfi9d7JCH4Uq6VeunHP4=
Content-Type: multipart/mixed; boundary="===============5011926312214183254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.68 SUCCEEDED
Message-ID: <010101873eb930e0-4a30e37c-cf57-441b-9c3a-fdb88bf526f1-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179567

--===============5011926312214183254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap* to *2.68* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-upgrade-2.67-2.68.patch
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
--===============5011926312214183254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcap: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap: SRC_URI changed from "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.67.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch" to "https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.68.tar.xz file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch file://0002-tests-do-not-run-target-executables.patch"
packages/core2-32-poky-linux/libcap/libcap-bin: PKGSIZE changed from 88912 to 88936 (+0%)
packages/core2-32-poky-linux/libcap/libcap-bin: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-bin: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGSIZE changed from 254980 to 254700 (-0%)
packages/core2-32-poky-linux/libcap/libcap-dbg: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-dbg: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-dbg: FILELIST: removed "/usr/lib/.debug/libpsx.so.2.67 /lib/.debug/libcap.so.2.67", added "/lib/.debug/libcap.so.2.68 /usr/lib/.debug/libpsx.so.2.68"
packages/core2-32-poky-linux/libcap/libcap-dev: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-dev: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-doc: PKGSIZE changed from 76938 to 78206 (+2%)
packages/core2-32-poky-linux/libcap/libcap-doc: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-doc: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-doc: FILELIST: added "/usr/share/man/man3/cap_copy_int_check.3 /usr/share/man/man3/cap_set_syscall.3 /usr/share/man/man3/__psx_syscall.3 /usr/share/man/man3/psx_load_syscalls.3"
packages/core2-32-poky-linux/libcap/libcap-locale: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-locale: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-src: PKGSIZE changed from 218041 to 218354 (+0%)
packages/core2-32-poky-linux/libcap/libcap-src: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-src: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGSIZE changed from 152010 to 152014 (+0%)
packages/core2-32-poky-linux/libcap/libcap-staticdev: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap-staticdev: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap: PKGV changed from 2.67 [default] to 2.68 [default]
packages/core2-32-poky-linux/libcap/libcap: PV changed from "2.67" to "2.68"
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/usr/lib/libpsx.so.2.67 /lib/libcap.so.2.67", added "/lib/libcap.so.2.68 /usr/lib/libpsx.so.2.68"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.67 to libcap.so.2.68
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.67 to libpsx.so.2.68
  /lib/libcap.so.2.67 moved to /lib/libcap.so.2.68
  /usr/lib/libpsx.so.2.67 moved to /usr/lib/libpsx.so.2.68
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.67 to libcap.so.2.68
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.67 to libpsx.so.2.68
  /usr/lib/libcap.so.2.67 moved to /usr/lib/libcap.so.2.68
  /usr/lib/libpsx.so.2.67 moved to /usr/lib/libpsx.so.2.68

--===============5011926312214183254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcap/libcap-doc: FILELIST: added "/usr/share/man/man3/__psx_syscall.3 /usr/share/man/man3/cap_copy_int_check.3 /usr/share/man/man3/psx_load_syscalls.3 /usr/share/man/man3/cap_set_syscall.3"
packages/core2-32-poky-linux/libcap/libcap: FILELIST: removed "/lib/libcap.so.2.67 /usr/lib/libpsx.so.2.67", added "/usr/lib/libpsx.so.2.68 /lib/libcap.so.2.68"
Changes to packages/core2-32-poky-linux/libcap (sysroot):
  /lib/libcap.so.2 changed symlink target from libcap.so.2.67 to libcap.so.2.68
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.67 to libpsx.so.2.68
  /lib/libcap.so.2.67 moved to /lib/libcap.so.2.68
  /usr/lib/libpsx.so.2.67 moved to /usr/lib/libpsx.so.2.68
Changes to packages/x86_64-linux/libcap-native (sysroot):
  /usr/lib/libcap.so.2 changed symlink target from libcap.so.2.67 to libcap.so.2.68
  /usr/lib/libpsx.so.2 changed symlink target from libpsx.so.2.67 to libpsx.so.2.68
  /usr/lib/libcap.so.2.67 moved to /usr/lib/libcap.so.2.68
  /usr/lib/libpsx.so.2.67 moved to /usr/lib/libpsx.so.2.68

--===============5011926312214183254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-upgrade-2.67-2.68.patch"

RnJvbSBlYWUyMjk4NzJmMjMzMTE1NzlkZDkwNDFkNGFkM2NjZTI4YTQ5OWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDo1NDoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmNhcDogdXBncmFkZSAyLjY3IC0+IDIuNjgKCi0tLQogLi4ubmF0aXZlc2RrLWxpYmNhcC1SYWlz
ZS10aGUtc2l6ZS1vZi1hcnJheXMtY29udGFpbmluZy5wYXRjaCB8IDQgKystLQogLi4uL3JlY2lw
ZXMtc3VwcG9ydC9saWJjYXAve2xpYmNhcF8yLjY3LmJiID0+IGxpYmNhcF8yLjY4LmJifSB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC97bGliY2FwXzIuNjcuYmIgPT4gbGliY2Fw
XzIuNjguYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
L2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1vZi1hcnJheXMtY29u
dGFpbmluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9maWxlcy8wMDAxLW5h
dGl2ZXNkay1saWJjYXAtUmFpc2UtdGhlLXNpemUtb2YtYXJyYXlzLWNvbnRhaW5pbmcucGF0Y2gK
aW5kZXggMmFjMWU2ZTU2MC4uMTEzMjI3MDBkYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGliY2FwL2ZpbGVzLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1v
Zi1hcnJheXMtY29udGFpbmluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvZmlsZXMvMDAwMS1uYXRpdmVzZGstbGliY2FwLVJhaXNlLXRoZS1zaXplLW9mLWFycmF5cy1j
b250YWluaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3MDlhYThlMTU2NDE1MjE1YjBi
YjAzNGQwNWIyYWEyZjQ0YmUwNDRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4YTlj
OTcwNDRkODZlMTU1ZGNlY2VhYWIwZjcxYzZmNmJjYmQyOTNjIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VGh1LCAxNCBPY3QgMjAyMSAxNTo1NzozNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBuYXRpdmVz
ZGstbGliY2FwOiBSYWlzZSB0aGUgc2l6ZSBvZiBhcnJheXMgY29udGFpbmluZyBkbApAQCAtMjAs
NyArMjAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZl
ci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9saWJjYXAvZXhlY2FibGUuaCBiL2xpYmNhcC9leGVjYWJsZS5oCi1pbmRl
eCBmZWUxN2I0Li41YmIwYzU1IDEwMDY0NAoraW5kZXggN2EyZDI0Ny4uNjgyZTBlZSAxMDA2NDQK
IC0tLSBhL2xpYmNhcC9leGVjYWJsZS5oCiArKysgYi9saWJjYXAvZXhlY2FibGUuaAogQEAgLTIz
LDcgKzIzLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJj
YXBfMi42Ny5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9saWJjYXBfMi42OC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJj
YXAvbGliY2FwXzIuNjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNhcC9s
aWJjYXBfMi42OC5iYgppbmRleCAwMDgxODNkOWEwLi5hMzAyYzVhMzY3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAvbGliY2FwXzIuNjcuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliY2FwL2xpYmNhcF8yLjY4LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19V
UkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9saWJzL3NlY3VyaXR5L2xpbnV4LXByaXZz
LyR7QlBOfTIvJHtCUE59LSR7CiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwK
ICAgICAgICAgICAgZmlsZTovLzAwMDEtbmF0aXZlc2RrLWxpYmNhcC1SYWlzZS10aGUtc2l6ZS1v
Zi1hcnJheXMtY29udGFpbmluZy5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJjZTliMjJmZGMyNzFiZWI2ZGFlNzU0M2RhNWY3NGNmMjRjYjgyZTY4NDhjZmQwODhh
NWEwNjlkZWM1ZWE1MTk4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkwYmUzYjZkNDFiZTVmODFh
ZTRiMDNlYzc2MDEyYjBkMjdjODI5MjkzNjg0ZjZjMDViNjVkNWY5Y2NlNzI0YjIiCiAKIFVQU1RS
RUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzL3Nl
Y3VyaXR5L2xpbnV4LXByaXZzLyR7QlBOfTIvIgogCi0tIAoyLjM5LjIKCg==

--===============5011926312214183254==--

