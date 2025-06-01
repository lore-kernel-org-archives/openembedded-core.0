Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B69C83000
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:46 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.27800.1748786140825598559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yWh92mSD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=IAx4qy9/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101972bc6e72b-a0cb3bb3-dd84-405b-97d5-cdd5349056a0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3gKAlyVa+eon+n23aA/NNwNUHZtdThnOva1DXRGecpc=;
	b=yWh92mSDZZnippVMNMj5WvsDyH/1zw+j8yZH3Gd7Mo7KEz/rn8rvQ11/KGZFtuDy
	BXSpMwyksaXljWRNx9arLhoayv6eInmBDi4Iy5H8Vz02PLcLfaJkOhpiP0Qj8d/el1b
	FgnpNrg8BW+ebwAbLN75mcq+gsUn7EC7kFAbQFSw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786145;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3gKAlyVa+eon+n23aA/NNwNUHZtdThnOva1DXRGecpc=;
	b=IAx4qy9/eWO7wXvQtUsgEIJMn1TOThyg5Ow2IpB0Icms2fXFsRpJhPsqa7hhE6Kp
	4awgMRyjYUDE29pEZpZ+jYyj+F9ySG+ris/8J3vzIcUQZha9D6r4yMWiQkCPFarJ0JA
	2sQz7F5/uotzT5FZZbvBc9i1J7FPTdILTCQin3So=
Content-Type: multipart/mixed; boundary="===============8074244625218798552=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.19.00 FAILED
Message-ID: <010101972bc6e72b-a0cb3bb3-dd84-405b-97d5-cdd5349056a0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217637

--===============8074244625218798552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *stress-ng* to *0.19.00* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.18.12-0.19.00.patch
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
From 533a533de3293f83a13ee03944cae52527fb8afb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 11:29:42 +0000
Subject: [PATCH] stress-ng: upgrade 0.18.12 -> 0.19.00

---
 .../stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.12.bb => stress-ng_0.19.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb
index b1cfdc371f..ca470e5862 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
            "
-SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
+SRCREV = "2f84dac62da8050901529c4c5c00f99e7a7bbad4"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.47.1


--===============8074244625218798552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:eb45b6b00cc4ec9cea00a0286e20132296c1b3d5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 141 Local 130 Mirrors 0 Missed 11 Current 263 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_recipe_qa_setscene)
NOTE: recipe stress-ng-0.19.00-r0: task do_recipe_qa_setscene: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1040 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_fetch)
NOTE: recipe stress-ng-0.19.00-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_fetch: Succeeded
NOTE: Running task 1163 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_unpack)
NOTE: Running task 1164 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.19.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.19.00-r0: task do_unpack: Succeeded
NOTE: Running task 1165 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_patch)
NOTE: Running task 1166 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_collect_spdx_deps)
NOTE: recipe stress-ng-0.19.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_collect_spdx_deps: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_patch: Succeeded
NOTE: recipe stress-ng-0.19.00-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1167 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 1168 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.19.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe stress-ng-0.19.00-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_deploy_source_date_epoch unihash changed to b9ee0ff403b8b180509307a63ceb4ce1969fd367e46ab816a13f0045acc9afe8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_populate_lic unihash changed to 69ce36f0b1567a40a7b0556f64f8ae67c453256116f94cbc5396e33ff7ad1ee8
NOTE: Setscene tasks completed
NOTE: Running task 1169 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_configure)
NOTE: recipe stress-ng-0.19.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_configure: Succeeded
NOTE: Running task 1170 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_compile)
NOTE: recipe stress-ng-0.19.00-r0: task do_compile: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_compile: Succeeded
NOTE: Running task 1171 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_install)
NOTE: recipe stress-ng-0.19.00-r0: task do_install: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_install: Succeeded
NOTE: Running task 1172 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package)
NOTE: Running task 1173 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_populate_sysroot)
NOTE: recipe stress-ng-0.19.00-r0: task do_populate_sysroot: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_populate_sysroot unihash changed to 731ac26c7f28a0d5cd68053c26f6847d061238b198660b17d74f73933f72d2e1
NOTE: Setscene tasks completed
NOTE: recipe stress-ng-0.19.00-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package unihash changed to 031efbac48d923cdf681accdd26fc104c11f5278fff56e0e3cd17102130514f0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_packagedata became valid
NOTE: Running setscene task 404 of 404 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_packagedata_setscene)
NOTE: recipe stress-ng-0.19.00-r0: task do_packagedata_setscene: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1175 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_create_spdx)
NOTE: Running task 1176 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_ipk)
NOTE: Running task 1177 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_deb)
NOTE: Running task 1178 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_rpm)
NOTE: Running task 1179 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_qa)
NOTE: recipe stress-ng-0.19.00-r0: task do_create_spdx: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_ipk: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_deb: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_rpm: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package_qa: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_create_spdx: Succeeded
NOTE: Running task 1180 of 1181 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_create_package_spdx)
NOTE: recipe stress-ng-0.19.00-r0: task do_create_package_spdx: Started
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_ipk unihash changed to 5f15a96f294fe4635bf0ff3e837c90588c898c3d86741d62f0bd628b530dd969
NOTE: recipe stress-ng-0.19.00-r0: task do_create_package_spdx: Succeeded
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_rpm unihash changed to dd09d7608fdc378c1b08f6f3a25e050a5bb4fa11177c0d823aa3af8b65604f1c
NOTE: recipe stress-ng-0.19.00-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_write_deb unihash changed to 13084c5004bbde22ad4119b9e8c54f528d8af886a6c851fceb5efc12968286fd
NOTE: recipe stress-ng-0.19.00-r0: task do_package_qa: Failed
NOTE: Tasks Summary: Attempted 1180 tasks of which 1162 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601112743.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601112743.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_qa
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.00/temp/log.do_package_qa.2301611
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: stress-ng-0.19.00-r0 do_package_qa: QA Issue: File /usr/bin/stress-ng in package stress-ng contains reference to TMPDIR [buildpaths]
ERROR: stress-ng-0.19.00-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/stress-ng/0.19.00/temp/log.do_package_qa.2301611
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/stress-ng/stress-ng_0.19.00.bb:do_package_qa) failed with exit code '1'

--===============8074244625218798552==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.12-0.19.00.patch"

RnJvbSA1MzNhNTMzZGUzMjkzZjgzYTEzZWUwMzk0NGNhZTUyNTI3ZmI4YWZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMToyOTo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE4LjEyIC0+IDAuMTkuMDAKCi0tLQogLi4uL3N0cmVzcy1uZy97
c3RyZXNzLW5nXzAuMTguMTIuYmIgPT4gc3RyZXNzLW5nXzAuMTkuMDAuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTguMTIuYmIgPT4gc3Ry
ZXNzLW5nXzAuMTkuMDAuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4xMi5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTkuMDAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4x
Mi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mtbmdf
MC4xOS4wMC5iYgppbmRleCBiMWNmZGMzNzFmLi5jYTQ3MGU1ODYyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjEyLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTkuMDAuYmIKQEAgLTcs
NyArNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Q29saW5JYW5LaW5nL3N0cmVzcy1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0
YWc9ViR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImQ0ZWVmOTgyZGM5OGZlOTE1YWE4
MjMwM2MwYTI0MDcwZDBhNTFiMDAiCitTUkNSRVYgPSAiMmY4NGRhYzYyZGE4MDUwOTAxNTI5YzRj
NWMwMGY5OWU3YTdiYmFkNCIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIERFUEVORFMgPSAiY29y
ZXV0aWxzLW5hdGl2ZSBsaWJic2QiCi0tIAoyLjQ3LjEKCg==

--===============8074244625218798552==--

