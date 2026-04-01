Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF6710FCAC3
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:06 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14741.1775054156498712645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dXoyW8Yt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=F+ecdH8u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d4978edb0-ee178f92-45e3-482a-ba3e-6a7541545d3f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0kd4yaLkkS2efm0pFz0C4p41/mDN6eWCNYu7bCjTvSg=;
	b=dXoyW8Yt0bi8h0L22HGh/euDklEhT/EItxHOpKUXWsPUFDFoF3MsWJlMunfici6n
	XXyjYoLhlYy6scCM5R3ZXmRMuBLoKMBE8giTdRVepLkMk+o65l1S9jgsvp0mpk5LOic
	6ZP4H/3H+PbNMplRqRH7w3Nr4fTZXGoVy/D/zvw8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054155;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0kd4yaLkkS2efm0pFz0C4p41/mDN6eWCNYu7bCjTvSg=;
	b=F+ecdH8uP282LPQwaVfVB4Xl4Lif8zroTx4emZ2WOCaG54728fhXslVxm5rVeIQ0
	C0pGdBrFeoylzRV+tX12wpdUbA1e/uprrFmLtFfzCgZCPbeyap53T88s8g1ql83voSZ
	caLDIQ5na/OS5ge+2SBHZWpvk+MH+ePdgIjzq09k=
Content-Type: multipart/mixed; boundary="===============6029845126537085037=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Benjamin Robin <benjamin.robin@bootlin.com>, 
	Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native:
 upgrading to 2026,2026.04.01 FAILED
Message-ID: <0101019d4978edb0-ee178f92-45e3-482a-ba3e-6a7541545d3f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:35:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234361

--===============6029845126537085037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sbom-cve-check-update-cvelist-native,sbom-cve-check-update-nvd-native* to *2026,2026.04.01* has Failed(other errors).

Detailed error information:

' bitbake sbom-cve-check-update-cvelist-native sbom-cve-check-update-nvd-native' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1970 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:e6a1c9f8fbf8323e1121ab59bb4fe8fde7117f5e"
meta-yocto-bsp       
meta-poky            = "master:ac300baea7314ea3c80f2330b2a993f729f32150"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 13 Local 3 Mirrors 0 Missed 10 Current 2 (23% match, 33% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 11 of 15 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 14 of 15 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb:do_recipe_qa_setscene)
NOTE: Running task 11 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_create_recipe_spdx)
NOTE: Running task 12 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_deploy_source_date_epoch)
NOTE: Running task 13 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb:do_create_recipe_spdx)
NOTE: Running task 14 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb:do_deploy_source_date_epoch)
NOTE: Running task 15 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_populate_lic)
NOTE: Running task 16 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb:do_populate_lic)
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_populate_lic: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_populate_lic: Started
WARNING: sbom-cve-check-update-nvd-native-1.0-r0 do_populate_lic: Could not copy license file /srv/pokybuild/yocto-worker/auh/build/build/tmp/deploy/sbom-cve-check/databases/nvd-fkie/LICENSES/cve-tou.md to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sbom-cve-check-update-nvd-native/1.0/license-destdir/sbom-cve-check-update-nvd-native/cve-tou.md: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/deploy/sbom-cve-check/databases/nvd-fkie/LICENSES/cve-tou.md'
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 18 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_fetch)
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 20 of 28 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb:do_fetch)
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_fetch: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_fetch: Started
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_populate_lic: Failed
NOTE: recipe sbom-cve-check-update-nvd-native-1.0-r0: task do_fetch: Succeeded
NOTE: recipe sbom-cve-check-update-cvelist-native-1.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 20 tasks of which 12 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401061023.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260401061023.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sbom-cve-check-update-nvd-native/1.0/temp/log.do_populate_lic.2528500
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: sbom-cve-check-update-nvd-native-1.0-r0 do_populate_lic: QA Issue: sbom-cve-check-update-nvd-native: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/auh/build/build/tmp/deploy/sbom-cve-check/databases/nvd-fkie/LICENSES/cve-tou.md [license-checksum]
ERROR: sbom-cve-check-update-nvd-native-1.0-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sbom-cve-check-update-nvd-native/1.0/temp/log.do_populate_lic.2528500
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb:do_populate_lic) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6029845126537085037==--

