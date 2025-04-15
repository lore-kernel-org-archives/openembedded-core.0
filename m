Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEE8C369D7
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.20152.1744723974108996121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TmpMrKAC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jLJi3Loj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019639a73a70-acd79eb6-edc8-4838-be5f-56a9e83d0981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VJ4kUujQ79jPTRLqcqKFV69lYUxuKGHEH1qncpz1LAQ=;
	b=TmpMrKAC/73UWtFtNYTRGlbTUsQMGr0YpckVwO+4JiP3PXs+yHb3WqYaSA7XGorT
	Q9rnzkif6LgNIVU8g2JVKS1qoDiV1OdRpIITcqnGhka1iJCtQn+0EHJ3VHGaE0VVw2v
	73vGz+vXR/cQA/GdHJDjhrEqeo8sVDU71JLJ4wMY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723983;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VJ4kUujQ79jPTRLqcqKFV69lYUxuKGHEH1qncpz1LAQ=;
	b=jLJi3LojZDOuOW02sAW9I8ofJI40AkCmdiQTAOD1brhQKHFdqP3lChxaS/YzOQf9
	C/+Dr8NojIBJBTewB2E5J/S1arQnzq1fWPG4xfgbqDdkwyyi/jTofEcJ86DNLaPl1fr
	Wc1fb2b79DEP3y+47rjS0mqTofuIhBI5saW9obEA=
Content-Type: multipart/mixed; boundary="===============0008168343337324698=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.14 FAILED
Message-ID: <0101019639a73a70-acd79eb6-edc8-4838-be5f-56a9e83d0981-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:33:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214902

--===============0008168343337324698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ethtool* to *6.14* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.11-6.14.patch
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
From 443e7ae00a61021332f2d025bdb042fd8b4d7fb0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 08:48:20 +0000
Subject: [PATCH] ethtool: upgrade 6.11 -> 6.14

---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_6.11.bb => ethtool_6.14.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.11.bb => ethtool_6.14.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 0fe482545a..a723b9a050 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 74902bef8123b596437587bb48ad9b720cb06f64 Mon Sep 17 00:00:00 2001
+From 4225d062fddf737ec4b06044705b630218fa1f77 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f6fe260..65a0566 100644
+index db71394..5e93135 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.10, netdev@vger.kernel.org)
+@@ -3,7 +3,7 @@ AC_INIT(ethtool, 6.14, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR([ethtool.c])
diff --git a/meta/recipes-extended/ethtool/ethtool_6.11.bb b/meta/recipes-extended/ethtool/ethtool_6.14.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.11.bb
rename to meta/recipes-extended/ethtool/ethtool_6.14.bb
index c4808c5856..9b7282d923 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.11.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.14.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "a8bee475d991939cad182b7dbcf3a1f139aeed8cb0add73d72084cd71d43282b"
+SRC_URI[sha256sum] = "3dbfc910513d1fef683f27ab12325cc88551abffae66d0ad3afe2a13317d2339"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.47.1


--===============0008168343337324698==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ethtool-upgrade-6.11-6.14.patch"

RnJvbSA0NDNlN2FlMDBhNjEwMjEzMzJmMmQwMjViZGIwNDJmZDhiNGQ3ZmIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDg6NDg6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
dGh0b29sOiB1cGdyYWRlIDYuMTEgLT4gNi4xNAoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2
b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRo
dG9vbC97ZXRodG9vbF82LjExLmJiID0+IGV0aHRvb2xfNi4xNC5iYn0gICAgICAgICAgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuMTEuYmIgPT4gZXRo
dG9vbF82LjE0LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9l
dGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4
IDBmZTQ4MjU0NWEuLmE3MjNiOWEwNTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzQ5MDJiZWY4MTIzYjU5NjQzNzU4N2JiNDhhZDliNzIw
Y2IwNmY2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNDIyNWQwNjJmZGRmNzM3ZWM0
YjA2MDQ0NzA1YjYzMDIxOGZhMWY3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFR1
ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogV2VkLCAyOCBNYXkgMjAx
NCAxODo1OTo1NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBldGh0b29sOiB1c2Ugc2VyaWFsLXRl
c3RzIGNvbmZpZyBuZWVkZWQgYnkgcHRlc3QuCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMK
LWluZGV4IGY2ZmUyNjAuLjY1YTA1NjYgMTAwNjQ0CitpbmRleCBkYjcxMzk0Li41ZTkzMTM1IDEw
MDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0zLDcgKzMs
NyBAQCBBQ19JTklUKGV0aHRvb2wsIDYuMTAsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCitAQCAt
Myw3ICszLDcgQEAgQUNfSU5JVChldGh0b29sLCA2LjE0LCBuZXRkZXZAdmdlci5rZXJuZWwub3Jn
KQogIEFDX1BSRVJFUSgyLjUyKQogIEFDX0NPTkZJR19NQUNST19ESVIoW200XSkKICBBQ19DT05G
SUdfU1JDRElSKFtldGh0b29sLmNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2V0aHRvb2wvZXRodG9vbF82LjExLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wv
ZXRodG9vbF82LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2xfNi4xMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjE0LmJiCmluZGV4IGM0ODA4YzU4NTYuLjli
NzI4MmQ5MjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL2V0aHRv
b2xfNi4xMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYu
MTQuYmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IGZpbGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImE4YmVlNDc1ZDk5MTkzOWNhZDE4MmI3ZGJjZjNhMWYxMzlhZWVk
OGNiMGFkZDczZDcyMDg0Y2Q3MWQ0MzI4MmIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2RiZmM5
MTA1MTNkMWZlZjY4M2YyN2FiMTIzMjVjYzg4NTUxYWJmZmFlNjZkMGFkM2FmZTJhMTMzMTdkMjMz
OSIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3Nv
ZnR3YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuNDcuMQoK

--===============0008168343337324698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d19d6d813c01cad836c0548504d7d707e5167161"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 213 Local 201 Mirrors 0 Missed 12 Current 337 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1106 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_recipe_qa)
NOTE: recipe ethtool-6.14-r0: task do_recipe_qa: Started
NOTE: recipe ethtool-6.14-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1516 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_fetch)
NOTE: recipe ethtool-6.14-r0: task do_fetch: Started
NOTE: recipe ethtool-6.14-r0: task do_fetch: Succeeded
NOTE: Running task 1541 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_unpack)
NOTE: Running task 1542 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ethtool-6.14-r0: task do_unpack: Started
NOTE: recipe ethtool-6.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ethtool-6.14-r0: task do_unpack: Succeeded
NOTE: Running task 1543 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_patch)
NOTE: Running task 1544 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_collect_spdx_deps)
NOTE: recipe ethtool-6.14-r0: task do_patch: Started
NOTE: recipe ethtool-6.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe ethtool-6.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ethtool-6.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ethtool-6.14-r0: task do_patch: Succeeded
NOTE: Running task 1545 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1546 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_populate_lic)
NOTE: recipe ethtool-6.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ethtool-6.14-r0: task do_populate_lic: Started
NOTE: recipe ethtool-6.14-r0: task do_populate_lic: Succeeded
NOTE: recipe ethtool-6.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1547 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_configure)
NOTE: recipe ethtool-6.14-r0: task do_configure: Started
NOTE: recipe ethtool-6.14-r0: task do_configure: Succeeded
NOTE: Running task 1548 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_configure_ptest_base)
NOTE: recipe ethtool-6.14-r0: task do_configure_ptest_base: Started
NOTE: recipe ethtool-6.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1549 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_compile)
NOTE: recipe ethtool-6.14-r0: task do_compile: Started
NOTE: recipe ethtool-6.14-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_compile_ptest_base)
NOTE: recipe ethtool-6.14-r0: task do_compile_ptest_base: Started
NOTE: recipe ethtool-6.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1551 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_install)
NOTE: recipe ethtool-6.14-r0: task do_install: Started
NOTE: recipe ethtool-6.14-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_install_ptest_base)
NOTE: recipe ethtool-6.14-r0: task do_install_ptest_base: Started
NOTE: recipe ethtool-6.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1553 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_package)
NOTE: Running task 1554 of 1562 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_populate_sysroot)
NOTE: recipe ethtool-6.14-r0: task do_populate_sysroot: Started
NOTE: recipe ethtool-6.14-r0: task do_package: Started
NOTE: recipe ethtool-6.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ethtool-6.14-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1554 tasks of which 1538 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415084758.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250415084758.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_package
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ethtool/6.14/temp/log.do_package.394763
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: ethtool-6.14-r0 do_package: QA Issue: ethtool: Files/directories were installed but not shipped in any package:
  /usr/share/metainfo
  /usr/share/metainfo/org.kernel.software.network.ethtool.metainfo.xml
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
ethtool: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: ethtool-6.14-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/ethtool/6.14/temp/log.do_package.394763
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/ethtool/ethtool_6.14.bb:do_package) failed with exit code '1'

--===============0008168343337324698==--

