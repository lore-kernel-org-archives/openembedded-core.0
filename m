Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A07C678D8
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20657.1672605966184846856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=idfOD1eX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f15a687-77df5c09-d982-4acb-a483-99aa321deaad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HsOgTgXACbvX08jhTcYRpsrcJqiZ4dmri6w66O2iTY8=;
	b=idfOD1eXUYoOXj7Pww/pPijC4+z826Sx/3Eg2cLqCwMzAt7u9s69sfTmCKH79TYG
	3waGIWyzXl7GDtTksJlGyBhDdfLMcn46IEZ/5BRshKnpH7peUajT5frgf/Qfd5heZKp
	rMT9OoFGm1sjWfUiIUjHsYdJpxuvOgLc0SVrG3b8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HsOgTgXACbvX08jhTcYRpsrcJqiZ4dmri6w66O2iTY8=;
	b=acneUdXyargyei4H7bKK/5pBEV20azlsJ/Gfd8oYlTCkBubQm+3VhFwmNxndCrfH
	cy9Tntk1ZECmpRbAuJjR3ZyzdH6aaNb8iT1mLNszqNj1kDQDgAKYveEGrMraCeqGcCm
	o+Z75MkSqm/VTj9WvimI3T4tfs2jGkadi9RfCqiQ=
Content-Type: multipart/mixed; boundary="===============5164536477364729728=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pango: upgrading to 1.50.12 SUCCEEDED
Message-ID: <010101856f15a687-77df5c09-d982-4acb-a483-99aa321deaad-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175290

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pango* to *1.50.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-pango-upgrade-1.50.11-1.50.12.patch
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
--===============5164536477364729728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pango-upgrade-1.50.11-1.50.12.patch"

RnJvbSA0MzY0YzJiZTUwMjIyZWJhMTU0OWMzMzg1NGU5ZmMyOTBmMWI4MTk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxNDoxNDozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHBh
bmdvOiB1cGdyYWRlIDEuNTAuMTEgLT4gMS41MC4xMgoKLS0tCiAuLi5kLWluc3RhbGwtbm9mb250
cy1mb250cy5jb25mLWFzLWl0LWkucGF0Y2ggfCAzNSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4v
e3BhbmdvXzEuNTAuMTEuYmIgPT4gcGFuZ29fMS41MC4xMi5iYn0gICAgfCAgMyArLQogMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzcgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvLzAwMDEtdGVzdHMtbWVzb24u
YnVpbGQtaW5zdGFsbC1ub2ZvbnRzLWZvbnRzLmNvbmYtYXMtaXQtaS5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby97cGFuZ29fMS41MC4xMS5iYiA9PiBwYW5nb18xLjUw
LjEyLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9w
YW5nby8wMDAxLXRlc3RzLW1lc29uLmJ1aWxkLWluc3RhbGwtbm9mb250cy1mb250cy5jb25mLWFz
LWl0LWkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ28vMDAwMS10ZXN0
cy1tZXNvbi5idWlsZC1pbnN0YWxsLW5vZm9udHMtZm9udHMuY29uZi1hcy1pdC1pLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA4ZGFjZDYyMTM4Li4wMDAwMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nby8wMDAxLXRlc3RzLW1lc29uLmJ1aWxk
LWluc3RhbGwtbm9mb250cy1mb250cy5jb25mLWFzLWl0LWkucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwzNSArMCwwIEBACi1Gcm9tIDEzZjhiYTVkNWI2OTlkZjFmODhlZWVhODU5NDA2ZGFiYTZk
Njk0MWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogVHVlLCA4IE5vdiAyMDIyIDE4OjA4OjUxICswMTAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL21lc29uLmJ1aWxkOiBpbnN0YWxsIG5vZm9udHMvZm9u
dHMuY29uZiBhcyBpdCBpcwotIHJlcXVpcmVkIGJ5IHRlc3RzCi0KLVVwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvcGFuZ28vLS9tZXJnZV9y
ZXF1ZXN0cy82NTRdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgotLS0tCi0gdGVzdHMvbWVzb24uYnVpbGQgfCA1ICsrKysrCi0gMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQg
Yi90ZXN0cy9tZXNvbi5idWlsZAotaW5kZXggOGI0YmZhMzguLjZjMWM0NjFiIDEwMDY0NAotLS0t
IGEvdGVzdHMvbWVzb24uYnVpbGQKLSsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkCi1AQCAtMjUwLDYg
KzI1MCwxMCBAQCBmb3JlYWNoIGQ6IHRlc3RfaXRlbXNfZGF0YQotICAgaW5zdGFsbGVkX3Rlc3Rf
aXRlbXNfZGF0YSArPSBkICsgJy5leHBlY3RlZCcKLSBlbmRmb3JlYWNoCi0gCi0raW5zdGFsbGVk
X3Rlc3Rfbm9mb250c19kYXRhID0gWwotKyAgJ25vZm9udHMvZm9udHMuY29uZicsCi0rXQotKwot
IGluc3RhbGxlZF90ZXN0X2RhdGFkaXIgPSBqb2luX3BhdGhzKHBhbmdvX2RhdGFkaXIsICdpbnN0
YWxsZWQtdGVzdHMnLCAncGFuZ28nKQotIGluc3RhbGxlZF90ZXN0X2JpbmRpciA9IGpvaW5fcGF0
aHMocGFuZ29fbGliZXhlY2RpciwgJ2luc3RhbGxlZC10ZXN0cycsICdwYW5nbycpCi0gCi1AQCAt
MjYxLDYgKzI2NSw3IEBAIGlmIGdldF9vcHRpb24oJ2luc3RhbGwtdGVzdHMnKQotICAgaW5zdGFs
bF9kYXRhKGluc3RhbGxlZF90ZXN0X2JyZWFrc19kYXRhLCBpbnN0YWxsX2Rpcjogam9pbl9wYXRo
cyhpbnN0YWxsZWRfdGVzdF9iaW5kaXIsICdicmVha3MnKSkKLSAgIGluc3RhbGxfZGF0YShpbnN0
YWxsZWRfdGVzdF9pdGVtc19kYXRhLCBpbnN0YWxsX2Rpcjogam9pbl9wYXRocyhpbnN0YWxsZWRf
dGVzdF9iaW5kaXIsICdpdGVtaXplJykpCi0gICBpbnN0YWxsX2RhdGEoaW5zdGFsbGVkX3Rlc3Rf
Zm9udHNldHNfZGF0YSwgaW5zdGFsbF9kaXI6IGpvaW5fcGF0aHMoaW5zdGFsbGVkX3Rlc3RfYmlu
ZGlyLCAnZm9udHNldHMnKSkKLSsgIGluc3RhbGxfZGF0YShpbnN0YWxsZWRfdGVzdF9ub2ZvbnRz
X2RhdGEsIGluc3RhbGxfZGlyOiBqb2luX3BhdGhzKGluc3RhbGxlZF90ZXN0X2JpbmRpciwgJ25v
Zm9udHMnKSkKLSBlbmRpZgotIAotIGdlbl9pbnN0YWxsZWRfdGVzdCA9IGZpbGVzKFsgJ2dlbi1p
bnN0YWxsZWQtdGVzdC5weScgXSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9w
YW5nby9wYW5nb18xLjUwLjExLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3Bhbmdv
XzEuNTAuMTIuYmIKc2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
cmFwaGljcy9wYW5nby9wYW5nb18xLjUwLjEyLmJiCmluZGV4IDZmNTk5ZjViNzguLjY3NzlmMzlj
NGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjUwLjEx
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9wYW5nby9wYW5nb18xLjUwLjEyLmJiCkBA
IC0yMiwxMCArMjIsOSBAQCBHSVJfTUVTT05fRElTQUJMRV9GTEFHID0gImRpc2FibGVkIgogCiBT
UkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtU2tp
cC1ydW5uaW5nLXRlc3QtbGF5b3V0LXRlc3QucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAw
MS10ZXN0cy1tZXNvbi5idWlsZC1pbnN0YWxsLW5vZm9udHMtZm9udHMuY29uZi1hcy1pdC1pLnBh
dGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4ODAw
ZjgxMmQ4OWVlNjEzODgxODg3MDMyMDNmM2E3ODc4OTYzYzIyZjg2OTVhYWYxZmEwYTFhMTQyOGQx
N2FlIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiY2FlZjk2ZDI3YmJlNzkyYTZiZTky
NzI3YzczNDY4ZDgzMmIxM2RhNTdjODA3MWVmNzliOWRmNjllZTA1OGZlMyIKIAogREVQRU5EUyA9
ICJnbGliLTIuMCBnbGliLTIuMC1uYXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xp
Ymljb252IGNhaXJvIGhhcmZidXp6IGZyaWJpZGkiCiAKLS0gCjIuMzcuMwoK

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpangoft2-1.0.so.0.5000.11 /usr/lib/libpangocairo-1.0.so.0.5000.11 /usr/lib/libpangoxft-1.0.so.0.5000.11 /usr/lib/libpango-1.0.so.0.5000.11", added "/usr/lib/libpango-1.0.so.0.5000.12 /usr/lib/libpangocairo-1.0.so.0.5000.12 /usr/lib/libpangoft2-1.0.so.0.5000.12 /usr/lib/libpangoxft-1.0.so.0.5000.12"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.11 to libpango-1.0.so.0.5000.12
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.11 to libpangocairo-1.0.so.0.5000.12
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.11 to libpangoft2-1.0.so.0.5000.12
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.11 to libpangoxft-1.0.so.0.5000.12
  /usr/lib/libpango-1.0.so.0.5000.11 moved to /usr/lib/libpango-1.0.so.0.5000.12
  /usr/lib/libpangocairo-1.0.so.0.5000.11 moved to /usr/lib/libpangocairo-1.0.so.0.5000.12
  /usr/lib/libpangoft2-1.0.so.0.5000.11 moved to /usr/lib/libpangoft2-1.0.so.0.5000.12
  /usr/lib/libpangoxft-1.0.so.0.5000.11 moved to /usr/lib/libpangoxft-1.0.so.0.5000.12

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 11 Mirrors 0 Missed 8 Current 526 (57% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 530 of 545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1377 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1567 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1877 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1879 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/harfbuzz/5.3.1-r0/temp/log.do_packagedata_setscene.1370875
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 544 of 545 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1883 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1894 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: Running task 1896 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1897 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1898 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic unihash changed to a74b10860203bdf0f375deb98486525bebf8e6e6adeb87db777507a300336ea9
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1899 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 1900 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1901 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 1902 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1903 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 1904 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1905 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 1906 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1908 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_write_rpm)
NOTE: Running task 1909 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_qa)
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1910 of 1910 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1910 tasks of which 1889 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 84 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 292 Local 284 Mirrors 0 Missed 8 Current 182 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 187 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 192 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 762 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 813 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 827 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: Running setscene task 204 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/harfbuzz/5.3.1-r0/temp/log.do_packagedata_setscene.1469792
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 209 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 845 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 846 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 847 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic unihash changed to a74b10860203bdf0f375deb98486525bebf8e6e6adeb87db777507a300336ea9
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 216 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 217 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 226 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 232 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 238 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 243 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 245 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 246 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 267 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 272 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 283 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 295 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 312 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 328 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 331 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 353 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 362 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 364 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 389 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 424 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 437 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 455 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 467 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 471 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1579 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1643 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: Running task 1665 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1667 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 1668 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1669 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 1670 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1671 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 1672 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1673 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 1674 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 1675 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1676 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_write_rpm)
NOTE: Running task 1677 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_qa)
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1678 of 1678 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1678 tasks of which 1657 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/pango: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango: SRC_URI changed from "https://download.gnome.org/sources//pango/1.50/pango-1.50.11.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch file://0001-tests-meson.build-install-nofonts-fonts.conf-as-it-i.patch" to "https://download.gnome.org/sources//pango/1.50/pango-1.50.12.tar.xz;name=archive file://run-ptest file://0001-Skip-running-test-layout-test.patch"
packages/core2-32-poky-linux/pango/pango-dbg: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-dbg: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-dbg: PKGSIZE changed from 2385776 to 2386112 (+0%)
packages/core2-32-poky-linux/pango/pango-dbg: FILELIST: removed "/usr/lib/.debug/libpangocairo-1.0.so.0.5000.11 /usr/lib/.debug/libpango-1.0.so.0.5000.11 /usr/lib/.debug/libpangoxft-1.0.so.0.5000.11 /usr/lib/.debug/libpangoft2-1.0.so.0.5000.11", added "/usr/lib/.debug/libpango-1.0.so.0.5000.12 /usr/lib/.debug/libpangocairo-1.0.so.0.5000.12 /usr/lib/.debug/libpangoft2-1.0.so.0.5000.12 /usr/lib/.debug/libpangoxft-1.0.so.0.5000.12"
packages/core2-32-poky-linux/pango/pango-dev: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-dev: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-dev: PKGSIZE changed from 1553030 to 1554368 (+0%)
packages/core2-32-poky-linux/pango/pango-doc: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-doc: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-locale: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-locale: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-ptest: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-ptest: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-ptest: PKGSIZE changed from 4090882 to 4090894 (+0%)
packages/core2-32-poky-linux/pango/pango-src: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-src: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango-src: PKGSIZE changed from 2318559 to 2320934 (+0%)
packages/core2-32-poky-linux/pango/pango-staticdev: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango-staticdev: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango: PKGV changed from 1.50.11 [default] to 1.50.12 [default]
packages/core2-32-poky-linux/pango/pango: PV changed from "1.50.11" to "1.50.12"
packages/core2-32-poky-linux/pango/pango: PKGSIZE changed from 853971 to 862179 (+1%)
packages/core2-32-poky-linux/pango/pango: FILELIST: removed "/usr/lib/libpango-1.0.so.0.5000.11 /usr/lib/libpangocairo-1.0.so.0.5000.11 /usr/lib/libpangoxft-1.0.so.0.5000.11 /usr/lib/libpangoft2-1.0.so.0.5000.11", added "/usr/lib/libpangoft2-1.0.so.0.5000.12 /usr/lib/libpangocairo-1.0.so.0.5000.12 /usr/lib/libpangoxft-1.0.so.0.5000.12 /usr/lib/libpango-1.0.so.0.5000.12"
Changes to packages/core2-32-poky-linux/pango (sysroot):
  /usr/lib/libpango-1.0.so.0 changed symlink target from libpango-1.0.so.0.5000.11 to libpango-1.0.so.0.5000.12
  /usr/lib/libpangocairo-1.0.so.0 changed symlink target from libpangocairo-1.0.so.0.5000.11 to libpangocairo-1.0.so.0.5000.12
  /usr/lib/libpangoft2-1.0.so.0 changed symlink target from libpangoft2-1.0.so.0.5000.11 to libpangoft2-1.0.so.0.5000.12
  /usr/lib/libpangoxft-1.0.so.0 changed symlink target from libpangoxft-1.0.so.0.5000.11 to libpangoxft-1.0.so.0.5000.12
  /usr/lib/libpango-1.0.so.0.5000.11 moved to /usr/lib/libpango-1.0.so.0.5000.12
  /usr/lib/libpangocairo-1.0.so.0.5000.11 moved to /usr/lib/libpangocairo-1.0.so.0.5000.12
  /usr/lib/libpangoft2-1.0.so.0.5000.11 moved to /usr/lib/libpangoft2-1.0.so.0.5000.12
  /usr/lib/libpangoxft-1.0.so.0.5000.11 moved to /usr/lib/libpangoxft-1.0.so.0.5000.12

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 11 Mirrors 0 Missed 8 Current 530 (57% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1380 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1575 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1891 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/harfbuzz/5.3.1-r0/temp/log.do_packagedata_setscene.1289845
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 548 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package_setscene)
NOTE: Running task 1894 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1911 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1912 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic unihash changed to a74b10860203bdf0f375deb98486525bebf8e6e6adeb87db777507a300336ea9
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1913 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1915 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1917 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 1918 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1919 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 1920 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1922 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_write_rpm)
NOTE: Running task 1923 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_qa)
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1924 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1924 tasks of which 1903 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1692 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 12 Mirrors 0 Missed 8 Current 529 (60% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 531 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 536 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1380 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1575 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1891 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 1893 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/harfbuzz/5.3.1-r0/temp/log.do_packagedata_setscene.1242254
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 547 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package_setscene)
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Started
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1908 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1910 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: Running task 1911 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1912 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic unihash changed to a74b10860203bdf0f375deb98486525bebf8e6e6adeb87db777507a300336ea9
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1913 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1915 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1917 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 1918 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1919 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 1920 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1922 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_write_rpm)
NOTE: Running task 1923 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_qa)
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1924 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1924 tasks of which 1903 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5164536477364729728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a64756b2dbb8bc82022a7f27c7df9625ac816cd7"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 19 Local 11 Mirrors 0 Missed 8 Current 530 (57% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 534 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_0.303.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1380 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_fetch)
NOTE: Running task 1575 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_write_config)
NOTE: Running task 1893 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Started
NOTE: recipe pango-1.50.12-r0: task do_write_config: Started
NOTE: recipe pango-1.50.12-r0: task do_fetch: Succeeded
NOTE: Running task 1894 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_unpack)
NOTE: recipe pango-1.50.12-r0: task do_write_config: Succeeded
NOTE: recipe cantarell-fonts-0.303.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/harfbuzz/5.3.1-r0/temp/log.do_packagedata_setscene.1414552
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 548 of 549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_package_setscene)
NOTE: recipe pango-1.50.12-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_patch)
NOTE: recipe pango-1.50.12-r0: task do_patch: Started
NOTE: recipe pango-1.50.12-r0: task do_patch: Succeeded
NOTE: Running task 1898 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 1899 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic)
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_lic unihash changed to a74b10860203bdf0f375deb98486525bebf8e6e6adeb87db777507a300336ea9
NOTE: recipe pango-1.50.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1910 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1912 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1913 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure)
NOTE: recipe pango-1.50.12-r0: task do_configure: Started
NOTE: recipe pango-1.50.12-r0: task do_configure: Succeeded
NOTE: Running task 1914 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_configure_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1915 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile)
NOTE: recipe pango-1.50.12-r0: task do_compile: Started
NOTE: recipe pango-1.50.12-r0: task do_compile: Succeeded
NOTE: Running task 1916 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_compile_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1917 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install)
NOTE: recipe pango-1.50.12-r0: task do_install: Started
NOTE: recipe pango-1.50.12-r0: task do_install: Succeeded
NOTE: Running task 1918 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_install_ptest_base)
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.50.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1919 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package)
NOTE: Running task 1920 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.12-r0: task do_package: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package: Succeeded
NOTE: Running task 1921 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_packagedata)
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Started
NOTE: recipe pango-1.50.12-r0: task do_packagedata: Succeeded
NOTE: Running task 1922 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_write_rpm)
NOTE: Running task 1923 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_package_qa)
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Started
NOTE: recipe pango-1.50.12-r0: task do_package_qa: Succeeded
NOTE: recipe pango-1.50.12-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1924 of 1924 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.12.bb:do_build)
NOTE: Tasks Summary: Attempted 1924 tasks of which 1903 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-src went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dbg went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-icu-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-subset went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-staticdev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-dev went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-doc went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-locale went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz-bin went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: QA Issue: Package version for package harfbuzz went backwards which would break package feeds (from 0:6.0.0-r0 to 0:5.3.1-r0) [version-going-backwards]
ERROR: harfbuzz-5.3.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5164536477364729728==--

