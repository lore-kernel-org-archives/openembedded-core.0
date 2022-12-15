Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C37C63709
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.145445.1671136352896646719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TNAG0P+I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d1646-b9e6d013-45c9-4d01-9041-f99bce4dfda9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FyNreUHPS2AWbb8U/UlTbe5I/3PxkMwNOAK9mp4oMa8=;
	b=TNAG0P+Ip1hW1pI66GorfzDDQccF43XZ1+uPrw5pilUVRpo4Kyy1cH0F1ncbp+bm
	WsqB/2KQRAvPRwfAeTZX5wUU3ItpSWyRa57YZM3sOnDfIYlb2vtzBIxboC8Xlbxi0Fy
	NrucbPdy4FDMhjCDJREE2uluMZeWJgnvMLbe/AwU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FyNreUHPS2AWbb8U/UlTbe5I/3PxkMwNOAK9mp4oMa8=;
	b=BiwQI3O9cy7XrsiKCVRGguM4VqsMGED9XjCB9jrIDpEkG33bbIQaSIlWZKVql6Mw
	dOwph90urwcz/VDvw0qUa49IE36tMDJDYGAY4g465tvuSPu59Xa2LLUi9yc7B2Icopk
	Kx2KISUr+e4rPVZfD+e0ea49tgZRlw8sY4TkW8eM=
Content-Type: multipart/mixed; boundary="===============4323787615869086189=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.1.3 FAILED
Message-ID: <01010185177d1646-b9e6d013-45c9-4d01-9041-f99bce4dfda9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174675

--===============4323787615869086189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ruby* to *3.1.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ruby-upgrade-3.1.2-3.1.3.patch
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
--===============4323787615869086189==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ruby-upgrade-3.1.2-3.1.3.patch"

RnJvbSA2Y2FkMzhmYTM5YzdmMGQ4ZTA4ZDViNGZiMjE4NDNmMTc5YTJiOTI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6MjI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
dWJ5OiB1cGdyYWRlIDMuMS4yIC0+IDMuMS4zCgotLS0KIC4uLjAwMS1SZW1vdmUtZGVwZW5kZW5j
eS1vbi1saWJjYXBzdG9uZS5wYXRjaCB8IDM2IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9ydWJ5
L3tydWJ5XzMuMS4yLmJiID0+IHJ1YnlfMy4xLjMuYmJ9ICAgICB8ICA3ICsrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVieS9ydWJ5LzAwMDEtUmVtb3ZlLWRlcGVuZGVu
Y3ktb24tbGliY2Fwc3RvbmUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVi
eS97cnVieV8zLjEuMi5iYiA9PiBydWJ5XzMuMS4zLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1SZW1vdmUtZGVwZW5kZW5jeS1vbi1s
aWJjYXBzdG9uZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnkvMDAwMS1S
ZW1vdmUtZGVwZW5kZW5jeS1vbi1saWJjYXBzdG9uZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggNWQwZjhmY2MwOS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5LzAwMDEtUmVtb3ZlLWRlcGVuZGVuY3ktb24tbGliY2Fwc3RvbmUucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNiArMCwwIEBACi1Gcm9tIDIyMjIwMzI5Nzk2NmYzMTIx
MDllOGVhYTI1MjBmMmNmMmY1OWMwOWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBB
bGFuIFd1IDxYclhyQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNvbT4KLURhdGU6IFRodSwgMzEgTWFy
IDIwMjIgMTc6MjY6MjggLTA0MDAKLVN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIGRlcGVuZGVuY3kg
b24gbGliY2Fwc3RvbmUKLQotV2UgaGF2ZSByZWNlaXZlZCByZXBvcnRzIG9mIGJ1aWxkIGZhaWx1
cmVzIGR1ZSB0byB0aGlzIGNvbmZpZ3VyYXRpb24KLWNoZWNrIG1vZGlmeWluZyBjb21waWxlIGZs
YWdzLiBTaW5jZSBvbmx5IFlKSVQgZGV2cyB1c2UgdGhpcyBsaWJyYXJ5Ci13ZSBjYW4gcmVtb3Zl
IGl0IHRvIG1ha2UgUnVieSBlYXNpZXIgdG8gYnVpbGQgZm9yIHVzZXJzLgotCi1TZWU6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yYmVudi9ydWJ5LWJ1aWxkL2Rpc2N1c3Npb25zLzE5MzMKLQotVXBzdHJl
YW0tU3RhdHVzOiBCYWNrcG9ydAotLS0tCi0gY29uZmlndXJlLmFjIHwgOSAtLS0tLS0tLS0KLSAx
IGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKLQotSW5kZXg6IHJ1YnktMy4xLjIvY29uZmln
dXJlLmFjCi09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Ci0tLS0gcnVieS0zLjEuMi5vcmlnL2NvbmZpZ3VyZS5hYwotKysr
IHJ1YnktMy4xLjIvY29uZmlndXJlLmFjCi1AQCAtMTI0NCwxNSArMTI0NCw2IEBAIEFDX0NIRUNL
X0xJQihkbCwgZGxvcGVuKQkjIER5bmFtaWMgbGlua2kKLSBBQ19DSEVDS19MSUIoZGxkLCBzaGxf
bG9hZCkJIyBEeW5hbWljIGxpbmtpbmcgZm9yIEhQLVVYCi0gQUNfQ0hFQ0tfTElCKHNvY2tldCwg
c2h1dGRvd24pICAjIFN1bk9TL1NvbGFyaXMKLSAKLS1pZiBwa2ctY29uZmlnIC0tZXhpc3RzIGNh
cHN0b25lOyB0aGVuCi0tICAgQ0FQU1RPTkVfQ0ZMQUdTPWBwa2ctY29uZmlnIC0tY2ZsYWdzIGNh
cHN0b25lYAotLSAgIENBUFNUT05FX0xJQl9MPWBwa2ctY29uZmlnIC0tbGlicy1vbmx5LUwgY2Fw
c3RvbmVgCi0tICAgTERGTEFHUz0iJExERkxBR1MgJENBUFNUT05FX0xJQl9MIgotLSAgIENGTEFH
Uz0iJENGTEFHUyAkQ0FQU1RPTkVfQ0ZMQUdTIgotLWZpCi0tCi0tQUNfQ0hFQ0tfTElCKGNhcHN0
b25lLCBjc19vcGVuKSAjIENhcHN0b25lIGRpc2Fzc2VtYmxlciBmb3IgZGVidWdnaW5nIFlKSVQK
LS0KLSBkbmwgQ2hlY2tzIGZvciBoZWFkZXIgZmlsZXMuCi0gQUNfSEVBREVSX0RJUkVOVAotIGRu
bCBBQ19IRUFERVJfU1REQyBoYXMgYmVlbiBjaGVja2VkIGluIEFDX1VTRV9TWVNURU1fRVhURU5T
SU9OUwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjEuMi5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5L3J1YnlfMy4xLjMuYmIKc2ltaWxhcml0eSBp
bmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjEu
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1YnkvcnVieV8zLjEuMy5iYgpp
bmRleCAzODdiZmE5YjQ0Li5hYzM3ZGJhYTg5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcnVieS9ydWJ5XzMuMS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ydWJ5
L3J1YnlfMy4xLjMuYmIKQEAgLTIsNyArMiw5IEBAIHJlcXVpcmUgcnVieS5pbmMKIAogREVQRU5E
UzphcHBlbmQ6bGliYy1tdXNsID0gIiBsaWJ1Y29udGV4dCIKIAotU1JDX1VSSSArPSAiIFwKK1NS
Q19VUkkgKz0gImh0dHA6Ly9jYWNoZS5ydWJ5LWxhbmcub3JnL3B1Yi9ydWJ5LyR7U0hSVF9WRVJ9
L3J1YnktJHtQVn0udGFyLmd6IFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtZXh0bWstZml4LWNy
b3NzLWNvbXBpbGF0aW9uLW9mLWV4dGVybmFsLWdlbXMucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAwMi1PYmV5LUxERkxBR1MtZm9yLXRoZS1saW5rLW9mLWxpYnJ1YnkucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vcmVtb3ZlX2hhc19pbmNsdWRlX21hY3Jvcy5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZW1wbGF0ZS1N
YWtlZmlsZS5pbi1kby1ub3Qtd3JpdGUtaG9zdC1jcm9zcy1jYy1pdGVtLnBhdGNoIFwKQEAgLTEy
LDEwICsxNCw5IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA1LU1hcmst
R2Vtc3BlYy1yZXByb2R1Y2libGUtY2hhbmdlLWZpeGluZy03ODQyMjUtdG9vLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDYtTWFrZS1nZW1zcGVjcy1yZXByb2R1Y2libGUucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS12bV9kdW1wLmMtRGVmaW5lLVJFR19TMS1hbmQtUkVHX1My
LWZvci1tdXNsLXJpc2N2LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlLWRl
cGVuZGVuY3ktb24tbGliY2Fwc3RvbmUucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI2MTg0MzExMjM4OWYwMmI3MzU0MjhiNTNiYjY0Y2Y5ODhhZDlmYjgxODU4
YjgyNDhlMjJlNTczMzZmMjRhODNlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVlYTQ5OGEzNWY0
Y2QxNTg3NTIwMGE1MmRkZTQyYjZlYjE3OWUxMjY0ZTE3ZDc4NzMyYzNhNTdjZDFjNmFiOWUiCiAK
IFBBQ0tBR0VDT05GSUcgPz89ICIiCiBQQUNLQUdFQ09ORklHICs9ICIke0BiYi51dGlscy5maWx0
ZXIoJ0RJU1RST19GRUFUVVJFUycsICdpcHY2JywgZCl9IgotLSAKMi4zNy4zCgo=

--===============4323787615869086189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f9f4e9f3c5b2750d6cc44b5aad12f608660070c4"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 43 Local 34 Mirrors 0 Missed 9 Current 158 (79% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 676 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_fetch)
NOTE: Running task 677 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_fetch)
NOTE: recipe ruby-3.1.3-r0: task do_fetch: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_fetch: Started
NOTE: recipe ruby-3.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 771 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_unpack)
NOTE: recipe ruby-native-3.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 772 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_unpack)
NOTE: Running task 773 of 795 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe ruby-3.1.3-r0: task do_unpack: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_unpack: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ruby-native-3.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ruby-3.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 774 of 795 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch)
NOTE: recipe ruby-3.1.3-r0: task do_patch: Started
NOTE: recipe ruby-3.1.3-r0: task do_patch: Failed
NOTE: recipe ruby-native-3.1.3-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 774 tasks of which 768 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: ruby-3.1.3-r0 do_patch: Applying patch '0001-extmk-fix-cross-compilation-of-external-gems.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/ruby-3.1.3'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-extmk-fix-cross-compilation-of-external-gems.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ruby/3.1.3-r0/temp/log.do_patch.1940952
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ruby/ruby_3.1.3.bb:do_patch) failed with exit code '1'

--===============4323787615869086189==--

