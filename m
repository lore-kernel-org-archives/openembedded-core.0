Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EEDC6FD1A
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:57 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web08.12622.1662040785796198475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=kK9U4QQY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182f959c4bc-7b1e19de-2876-4dd0-aa57-d797ea44994d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nyIPk97dpcRexiuDzAFyiVM9BY8GqQxaBn+0v+ql+Ss=;
	b=kK9U4QQYV5aaXJWrD4OFDPIGZ3bArmqPsW/Z2Yj/fForPRg/4w2eKVYPQbDGsltL
	4xoEZ81SXRg+9YYBC65Cgz5wwKvcHE0K+K4xH5fLs1GGM5da6sIqG8fB19wFl4+7gbY
	zZQFbqiI/L6tBiIlXYp8Pdxf539AWLlKWZgJBqfI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040786;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nyIPk97dpcRexiuDzAFyiVM9BY8GqQxaBn+0v+ql+Ss=;
	b=ZuRBGmryWcQFViQk1hvYxZyvp8XbsveZvsPiGTSJ6L5UiQkvV/6u9hnLndgF36KV
	Q7OyYgZBX06hWXsFV7FgkJPE80bWCZ/A7F8OkzHUks2xsx2BdVQ27QTbSGW10vNdvHo
	/6u07loeaAuxq5B0zYGH8tZLYcHLqA6Lpds8mLqo=
Content-Type: multipart/mixed; boundary="===============6837390655340199914=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsdl2: upgrading to 2.24.0 FAILED
Message-ID: 
 <01010182f959c4bc-7b1e19de-2876-4dd0-aa57-d797ea44994d-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170182

--===============6837390655340199914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsdl2* to *2.24.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libsdl2-upgrade-2.0.22-2.24.0.patch
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
--===============6837390655340199914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9259bdac703a871da6a72f2dd6b21aad869766aa"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9259bdac703a871da6a72f2dd6b21aad869766aa"
workspace            = "master:4c2f9073d6a8fb8bca198ff1f602c37c5afa691e"

Initialising tasks...done.
Sstate summary: Wanted 194 Local 187 Mirrors 0 Missed 7 Current 381 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1773 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_fetch)
NOTE: recipe libsdl2-2.24.0-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 1990 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_unpack)
NOTE: Running task 1991 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.24.0-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1992 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_patch)
NOTE: recipe libsdl2-2.24.0-r0: task do_patch: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1993 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1994 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_generate_toolchain_file)
NOTE: Running task 1995 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_populate_lic)
NOTE: recipe libsdl2-2.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsdl2-2.24.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_populate_lic: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsdl2-2.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1996 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_configure)
NOTE: recipe libsdl2-2.24.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libsdl2-2.24.0-r0: task do_configure: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_configure: Succeeded
NOTE: Running task 1997 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_compile)
NOTE: recipe libsdl2-2.24.0-r0: task do_compile: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_compile: Succeeded
NOTE: Running task 1998 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_install)
NOTE: recipe libsdl2-2.24.0-r0: task do_install: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_install: Succeeded
NOTE: Running task 1999 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_package)
NOTE: Running task 2000 of 2004 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_populate_sysroot)
NOTE: recipe libsdl2-2.24.0-r0: task do_package: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsdl2-2.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsdl2-2.24.0-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 2000 tasks of which 1988 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_package
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libsdl2-2.24.0-r0 do_package: QA Issue: libsdl2: Files/directories were installed but not shipped in any package:
  /usr/share/licenses
  /usr/share/licenses/SDL2
  /usr/share/licenses/SDL2/LICENSE.txt
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libsdl2: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: libsdl2-2.24.0-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libsdl2/2.24.0-r0/temp/log.do_package.1734901
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libsdl2/libsdl2_2.24.0.bb:do_package) failed with exit code '1'

--===============6837390655340199914==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsdl2-upgrade-2.0.22-2.24.0.patch"

RnJvbSAwZWJiOTY4YTRhY2U3ZDBkMGQwNmFhNmU2ZDY4YzhmMDJhYmY2MTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAwOToyMDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNkbDI6IHVwZ3JhZGUgMi4wLjIyIC0+IDIuMjQuMAoKLS0tCiAuLi5kLWluLW5hdGl2ZS1PRS1i
dWlsZHMtYnktbm90LWxvb2tpbmcucGF0Y2ggfCAgNiArKy0tCiAuLi5hYmlsaXR5LXRvLWRpc2Fi
bGUtZmItYWNjZWwtdmlhLWhpbnQucGF0Y2ggfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e2xpYnNkbDJfMi4wLjIyLmJiID0+IGxpYnNkbDJfMi4yNC4wLmJifSAgfCAgNCArLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyLzAwMDEtdmlkZW8t
cmVzdG9yZS1hYmlsaXR5LXRvLWRpc2FibGUtZmItYWNjZWwtdmlhLWhpbnQucGF0Y2gKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi97bGlic2RsMl8yLjAuMjIuYmIgPT4gbGli
c2RsMl8yLjI0LjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2xpYnNkbDIvbGlic2RsMi8wMDAxLURpc2FibGUtbGlidW53aW5kLWluLW5hdGl2ZS1PRS1idWls
ZHMtYnktbm90LWxvb2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9s
aWJzZGwyLzAwMDEtRGlzYWJsZS1saWJ1bndpbmQtaW4tbmF0aXZlLU9FLWJ1aWxkcy1ieS1ub3Qt
bG9va2luZy5wYXRjaAppbmRleCA1N2JjNTIyMzkzLi4xYTUzMjBmZTAxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyLzAwMDEtRGlzYWJsZS1saWJ1bndp
bmQtaW4tbmF0aXZlLU9FLWJ1aWxkcy1ieS1ub3QtbG9va2luZy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyLzAwMDEtRGlzYWJsZS1saWJ1bndpbmQtaW4t
bmF0aXZlLU9FLWJ1aWxkcy1ieS1ub3QtbG9va2luZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMDIzNGM1NDZkODYxNzRmYWZlOWFiMjgwY2Y1ZjQ0ZGU1MGI3MzY3NiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMmVmZDA4ODYyMGY4YTUxNGM1OTllODIxMzg4NjY4YmZmZmFkMDg2
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENhcmxvcyBSYWZhZWwgR2lhbmkgPGNy
Zzc0NzVAbWFpbGJveC5vcmc+CiBEYXRlOiBGcmksIDE4IE1hciAyMDIyIDEyOjA2OjIzICswMTAw
CiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgbGlidW53aW5kIGluIG5hdGl2ZSBPRSBidWlsZHMg
Ynkgbm90IGxvb2tpbmcgZm9yCkBAIC0yMiwxMCArMjIsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtPRSBzcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VM
aXN0cy50eHQKLWluZGV4IDY0NDcxNWEuLmJiZjJlMjggMTAwNjQ0CitpbmRleCA2YjUzNjk5Li5h
Y2M5YTZkIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0
Ci1AQCAtODY5LDcgKzg2OSw3IEBAIGlmKFNETF9MSUJDKQorQEAgLTk1MSw3ICs5NTEsNyBAQCBp
ZihTRExfTElCQykKICAgICAgY2hlY2tfaW5jbHVkZV9maWxlKHN5cy90eXBlcy5oIEhBVkVfU1lT
X1RZUEVTX0gpCiAgICAgIGZvcmVhY2goX0hFQURFUgogICAgICAgICAgICAgIHN0ZGlvLmggc3Rk
bGliLmggc3RkZGVmLmggc3RkYXJnLmggbWFsbG9jLmggbWVtb3J5Lmggc3RyaW5nLmggbGltaXRz
LmggZmxvYXQuaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGli
c2RsMi8wMDAxLXZpZGVvLXJlc3RvcmUtYWJpbGl0eS10by1kaXNhYmxlLWZiLWFjY2VsLXZpYS1o
aW50LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnNkbDIvbGlic2RsMi8wMDAxLXZp
ZGVvLXJlc3RvcmUtYWJpbGl0eS10by1kaXNhYmxlLWZiLWFjY2VsLXZpYS1oaW50LnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmYzc0ZDMwNTU2Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDIvMDAwMS12aWRlby1yZXN0b3Jl
LWFiaWxpdHktdG8tZGlzYWJsZS1mYi1hY2NlbC12aWEtaGludC5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDM2ICswLDAgQEAKLUZyb20gMTRhZDkxNjU4ZmQyOTZlMzRiYjllODMzMjgxZTcyYzg3
MWJmYjE4OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBUdWUsIDMgTWF5IDIwMjIgMTI6MzE6NTAgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSF0gdmlkZW86IHJlc3RvcmUgYWJpbGl0eSB0byBkaXNhYmxlIGZi
IGFjY2VsIHZpYSBoaW50Ci0KLVNvbWV3aGVyZSBpbiBjb2RlIHJlZmFjdG9yaW5nIGJldHdlZW4g
LjIwIGFuZCAuMjIgdGhpcyBjaGVjawotd2FzIGxvc3QsIGFuZCBzbyB0aGUgaGludCBoYWQgbm8g
ZWZmZWN0IGFueW1vcmUuCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGh1Yi5jb20vbGlic2RsLW9yZy9TREwvcHVsbC81NjExXQotU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHNyYy92aWRlby9TRExfdmlk
ZW8uYyB8IDggKysrKysrKysKLSAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCi0KLWRp
ZmYgLS1naXQgYS9zcmMvdmlkZW8vU0RMX3ZpZGVvLmMgYi9zcmMvdmlkZW8vU0RMX3ZpZGVvLmMK
LWluZGV4IDkzYzgwM2UuLmNiZTc2MTYgMTAwNjQ0Ci0tLS0gYS9zcmMvdmlkZW8vU0RMX3ZpZGVv
LmMKLSsrKyBiL3NyYy92aWRlby9TRExfdmlkZW8uYwotQEAgLTI1MDMsNiArMjUwMywxNCBAQCBT
RExfQ3JlYXRlV2luZG93RnJhbWVidWZmZXIoU0RMX1dpbmRvdyAqIHdpbmRvdykKLSAgICAgaWYg
KCFfdGhpcy0+Y2hlY2tlZF90ZXh0dXJlX2ZyYW1lYnVmZmVyKSB7Ci0gICAgICAgICBTRExfYm9v
bCBhdHRlbXB0X3RleHR1cmVfZnJhbWVidWZmZXIgPSBTRExfVFJVRTsKLSAKLSsgICAgICAgIC8q
IFNlZSBpZiB0aGUgdXNlciBvciBhcHBsaWNhdGlvbiB3YW50cyB0byBzcGVjaWZpY2FsbHkgZGlz
YWJsZSB0aGUgZnJhbWVidWZmZXIgKi8KLSsgICAgICAgIGNvbnN0IGNoYXIgKmhpbnQgPSBTRExf
R2V0SGludChTRExfSElOVF9GUkFNRUJVRkZFUl9BQ0NFTEVSQVRJT04pOwotKyAgICAgICAgaWYg
KGhpbnQpIHsKLSsgICAgICAgICAgICBpZiAoKmhpbnQgPT0gJzAnIHx8IFNETF9zdHJjYXNlY21w
KGhpbnQsICJmYWxzZSIpID09IDApIHsKLSsgICAgICAgICAgICAgICAgYXR0ZW1wdF90ZXh0dXJl
X2ZyYW1lYnVmZmVyID0gU0RMX0ZBTFNFOwotKyAgICAgICAgICAgIH0KLSsgICAgICAgIH0KLSsK
LSAgICAgICAgIGlmIChfdGhpcy0+aXNfZHVtbXkpIHsgIC8qIGR1bW15IGRyaXZlciBuZXZlciBo
YXMgR1BVIHN1cHBvcnQsIG9mIGNvdXJzZS4gKi8KLSAgICAgICAgICAgICBhdHRlbXB0X3RleHR1
cmVfZnJhbWVidWZmZXIgPSBTRExfRkFMU0U7Ci0gICAgICAgICB9Ci0tLSAKLTIuMzAuMgotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMC4yMi5i
YiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwyL2xpYnNkbDJfMi4yNC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJzZGwy
L2xpYnNkbDJfMi4wLjIyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2Rs
Mi9saWJzZGwyXzIuMjQuMC5iYgppbmRleCA4NTE5ZTdmNzMyLi5hZjY0M2M5NWNhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMC4yMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlic2RsMi9saWJzZGwyXzIuMjQuMC5iYgpAQCAtMjIs
MTMgKzIyLDEzIEBAIExJQ19GSUxFU19DSEtTVU06YXBwZW5kID0gIiAke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICdhcm0tbmVvbicsICdmCiBQUk9WSURFUyA9ICJ2aXJ0dWFs
L2xpYnNkbDIiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5saWJzZGwub3JnL3JlbGVhc2UvU0RM
Mi0ke1BWfS50YXIuZ3ogXAotICAgICAgICAgICBmaWxlOi8vMDAwMS12aWRlby1yZXN0b3JlLWFi
aWxpdHktdG8tZGlzYWJsZS1mYi1hY2NlbC12aWEtaGludC5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly8wMDAxLURpc2FibGUtbGlidW53aW5kLWluLW5hdGl2ZS1PRS1idWlsZHMtYnktbm90LWxv
b2tpbmcucGF0Y2ggXAogICAgICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUg
PSAiIGZpbGU6Ly8wMDAxLURpc2FibGUtbGlidW53aW5kLWluLW5hdGl2ZS1PRS1idWlsZHMtYnkt
bm90LWxvb2tpbmcucGF0Y2giCiAKIFMgPSAiJHtXT1JLRElSfS9TREwyLSR7UFZ9IgogCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZmU3Y2JmMzEyNzg4MmUzZmM3MjU5YTc1YTBjYjU4NTYyMDI3MmM1
MTc0NWQzODUyYWI5ZGQ4Nzk2MDY5N2YyZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5MWU0YzM0
YjE3NjhmOTJkMzk5YjA3OGUxNzE0NDhjNmFmMThjYWZkYTc0Mzk4N2VkMjA2NGEyODk1NGQ2ZDk3
IgogCiBpbmhlcml0IGNtYWtlIGxpYl9wYWNrYWdlIGJpbmNvbmZpZy1kaXNhYmxlZCBwa2djb25m
aWcKIAotLSAKMi4zMS4xCgo=

--===============6837390655340199914==--

