Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A5CD0D7A3
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.53260.1728588944661100897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=idIMTGFv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0mvY0f4N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019277eef033-78626d24-c8ec-4212-98fe-f128266a270f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UZOt3punQjk9PFnASkP/zCfO54z+tIBaV+ukxUlEElQ=;
	b=idIMTGFvdRfw3dbdetAPwBEkrVchW3eXW/3d/I5xfx5xtdUddNGljYYj//7IBN2g
	LSY9JmQmA8+/KT/0Z32T51lJiKdH8kQN8uTdbFm83V+GuiRN3863jsTwvu9BI0WDTss
	K2NnGffE0/CEZ2T5Of9yd2a2FRf1FPHOaRJTLTUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728589000;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UZOt3punQjk9PFnASkP/zCfO54z+tIBaV+ukxUlEElQ=;
	b=0mvY0f4N0qXR1Dqe0LVjtNumrvbmDOyYbs2qLJiKuYCG+RsuWCInydAOjLlu2qHj
	BcANoe2nkxh4T93wtEo8/aiKqIFUdUAhKYgITRgaUzz6a4BEVAlCEuvCXc/yEQL87+R
	NEPRpdzPCKDCUgsyr3cVR/d1HNjUqwZzyKufJMYg=
Content-Type: multipart/mixed; boundary="===============7256376275657060027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.11 SUCCEEDED
Message-ID: <0101019277eef033-78626d24-c8ec-4212-98fe-f128266a270f-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205625

--===============7256376275657060027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *6.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.10-6.11.patch
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

-- >8 --
From 2b1bb8ecdf9ed40b1d0f1eae512bb61b27e010c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 14:19:04 +0000
Subject: [PATCH] ethtool: upgrade 6.10 -> 6.11

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.10.bb => ethtool_6.11.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.10.bb => ethtool_6.11.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 0fe482545a..303f9eec81 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 74902bef8123b596437587bb48ad9b720cb06f64 Mon Sep 17 00:00:00 2001
+From 0e956bc9d610a76e0180135b52073edfdfbcf29d Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f6fe260..65a0566 100644
+index f9f169e..c722480 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.10, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.11, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.10.bb b/meta/recipes-extended/ethtool/ethtool_6.11.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.10.bb
rename to meta/recipes-extended/ethtool/ethtool_6.11.bb
index 8a7b2607f3..c4808c5856 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.10.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "2b266c45c0fe00e5f5b462ee4e795879fa4247003bf73c5a07a2279d801be058"
+SRC_URI[sha256sum] = "a8bee475d991939cad182b7dbcf3a1f139aeed8cb0add73d72084cd71d43282b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.44.1


--===============7256376275657060027==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.10-6.11.patch"

RnJvbSAyYjFiYjhlY2RmOWVkNDBiMWQwZjFlYWU1MTJiYjYxYjI3ZTAxMGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTQ6MTk6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMTAgLT4gNi4xMQoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2
b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRo
dG9vbC97ZXRodG9vbF82LjEwLmJiID0+IGV0aHRvb2xfNi4xMS5iYn0gICAgICAgICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuMTAuYmIgPT4gZXRo
dG9vbF82LjExLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4
IDBmZTQ4MjU0NWEuLjMwM2Y5ZWVjODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzQ5MDJiZWY4MTIzYjU5NjQzNzU4N2JiNDhhZDliNzIw
Y2IwNmY2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGU5NTZiYzlkNjEwYTc2ZTAx
ODAxMzViNTIwNzNlZGZkZmJjZjI5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1
ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAx
NCAxODo1OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRl
c3RzIGNvbmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMK
LWluZGV4IGY2ZmUyNjAuLjY1YTA1NjYgMTAwNjQ0CitpbmRleCBmOWYxNjllLi5jNzIyNDgwIDEw
MDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0zLDcgKzMs
NyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuMTAsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAt
Myw3ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjExLCBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
KQogIEFDX1BSRVJFUSgyLjUyKQogIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkKICBBQ19DT05G
SUdfU1JDRElSKFtldGh0b29sLmNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbF82LjEwLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wv
ZXRodG9vbF82LjExLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjExLmJiCmluZGV4IDhhN2IyNjA3ZjMuLmM0
ODA4YzU4NTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRv
b2xfNi4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYu
MTEuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjJiMjY2YzQ1YzBmZTAwZTVmNWI0NjJlZTRlNzk1ODc5ZmE0MjQ3
MDAzYmY3M2M1YTA3YTIyNzlkODAxYmUwNTgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYThiZWU0
NzVkOTkxOTM5Y2FkMTgyYjdkYmNmM2ExZjEzOWFlZWQ4Y2IwYWRkNzNkNzIwODRjZDcxZDQzMjgy
YiIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuNDQuMQoK

--===============7256376275657060027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (0 cached, 917 parsed). 1872 targets, 51 skipped, 0 masked, 0 errors.
Removing 69 recipes from the core2-64 sysroot...done.
Removing 74 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:96ba1acf75848fc795eda766af2312db361062d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 305 Local 295 Mirrors 0 Missed 10 Current 188 (96% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 195 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 196 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 199 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 200 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 203 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 211 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_populate_lic_setscene)
NOTE: Running setscene task 214 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 216 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 217 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 218 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 219 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_populate_lic_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 222 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 223 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 290 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 291 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.2.32-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 302 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 312 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb:do_packagedata_setscene)
NOTE: recipe ethtool-6.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 350 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 317 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe ethtool-6.11-r0: task do_fetch: Started
NOTE: recipe ethtool-6.11-r0: task do_fetch: Succeeded
NOTE: Running task 351 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/bash/5.2.32/temp/log.do_packagedata_setscene.914074
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 337 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running task 699 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_patch)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_patch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_package_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_patch: Succeeded
NOTE: Running task 821 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_deploy_source_date_epoch)
NOTE: recipe ethtool-6.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe ethtool-6.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_deploy_source_date_epoch unihash changed to 3fb06b5a7b56049db62212cd50f1b1e13ae790e2bf7c51aba3701a701db21010
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.32-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 434 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.32-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 451 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 475 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1177 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1291 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_packagedata)
NOTE: Running task 1340 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_collect_spdx_deps)
NOTE: recipe ethtool-6.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata: Started
NOTE: recipe ethtool-6.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe ethtool-6.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1370 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_configure)
NOTE: recipe ethtool-6.11-r0: task do_configure: Started
NOTE: recipe bash-5.2.32-r0: task do_packagedata: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_configure: Succeeded
NOTE: Running task 1378 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_configure_ptest_base)
NOTE: recipe ethtool-6.11-r0: task do_configure_ptest_base: Started
NOTE: recipe ethtool-6.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1379 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_compile)
NOTE: recipe ethtool-6.11-r0: task do_compile: Started
NOTE: recipe ethtool-6.11-r0: task do_compile: Succeeded
NOTE: Running task 1380 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_compile_ptest_base)
NOTE: recipe ethtool-6.11-r0: task do_compile_ptest_base: Started
NOTE: recipe ethtool-6.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1381 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_install)
NOTE: recipe ethtool-6.11-r0: task do_install: Started
NOTE: recipe ethtool-6.11-r0: task do_install: Succeeded
NOTE: Running task 1382 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_install_ptest_base)
NOTE: recipe ethtool-6.11-r0: task do_install_ptest_base: Started
NOTE: recipe ethtool-6.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1383 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package)
NOTE: Running task 1384 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_populate_sysroot)
NOTE: recipe ethtool-6.11-r0: task do_populate_sysroot: Started
NOTE: recipe ethtool-6.11-r0: task do_package: Started
NOTE: recipe ethtool-6.11-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_populate_sysroot unihash changed to 2f8834830dd2a08c13f1a6aa627cf3bc7cbe9fb992ca7935f72d6ab46a896876
NOTE: Setscene tasks completed
NOTE: recipe ethtool-6.11-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package unihash changed to 9a1a99bbb916f33e662dd40c13a4466ca2ac4aa29f727d9c08839b1812f3b12a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_deb became valid
NOTE: Running setscene task 489 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 490 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 491 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 492 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_package_write_rpm_setscene)
NOTE: recipe ethtool-6.11-r0: task do_package_qa_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ethtool-6.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 493 of 493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_packagedata_setscene)
NOTE: recipe ethtool-6.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ethtool-6.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1386 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_create_spdx)
NOTE: recipe ethtool-6.11-r0: task do_create_spdx: Started
NOTE: recipe ethtool-6.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 1391 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_create_package_spdx)
NOTE: recipe ethtool-6.11-r0: task do_create_package_spdx: Started
NOTE: recipe ethtool-6.11-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1392 of 1392 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.11.bb:do_build)
NOTE: Tasks Summary: Attempted 1392 tasks of which 1374 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 49 ERROR messages, returning a non-zero exit code.
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-src went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-dbg went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-ptest went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-staticdev went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-dev went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-doc went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-af went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-bg went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ca went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-cs went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-da went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-de went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-el went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-en+boldquot went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-en+quot went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-eo went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-es went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-et went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-fi went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-fr went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ga went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-gl went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-hr went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-hu went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-id went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-it went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ja went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ko went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-lt went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-nb went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-nl went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-pl went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-pt went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-pt-br went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ro went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-ru went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-sk went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-sl went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-sr went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-sv went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-tr went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-uk went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-vi went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-zh-cn went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-locale-zh-tw went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-loadable went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: QA Issue: Package version for package bash-bashbug went backwards which would break package feeds (from 0:5.2.37-r0 to 0:5.2.32-r0) [version-going-backwards]
ERROR: bash-5.2.32-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7256376275657060027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24728 to 25203 (+2%)
packages/core2-64-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 4471576 to 4515016 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool-dbg: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-dev: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 48875 to 50880 (+4%)
packages/core2-64-poky-linux/ethtool/ethtool-doc: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-locale: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-ptest: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1438921 to 1459429 (+1%)
packages/core2-64-poky-linux/ethtool/ethtool-src: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool/ethtool: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool/ethtool: PV changed from "6.10" to "6.11"
packages/core2-64-poky-linux/ethtool: PKGV changed from 6.10 [default] to 6.11 [default]
packages/core2-64-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.10.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.11.tar.gz file://run-ptest file://avoid_parallel_tests.patch"
packages/core2-64-poky-linux/ethtool: PV changed from "6.10" to "6.11"

--===============7256376275657060027==--

