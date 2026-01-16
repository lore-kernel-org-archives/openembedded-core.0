Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C53D4898C
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1465.1768526743272598335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oXfuRvfZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fqA7Ke/h;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc4688447-43193251-23db-4622-afc9-80a72d628efc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mUDlKJN1idyCyh+so0P6JWw/pEW60Ld/nBhWBdnVDpo=;
	b=oXfuRvfZ1Fir5o/n81B+jvxlvjdxKNIXwf24oL2tm4kQJEpvzBMTnP3dsDJ8SnQb
	zWG7A0LYB45BnzkekQcVWr2PxzQt55+rbsGVourU/b1mjhOC50PDZXF+vpcKJC//yyy
	jl8AzqcUKlZPPEgEOUPdWB1YaJcRt01QjozdhcX4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mUDlKJN1idyCyh+so0P6JWw/pEW60Ld/nBhWBdnVDpo=;
	b=fqA7Ke/hin3c0r97lR0pfTItEAN2B8yCBubvwB5FTHFZkpGPE2eUQqlvDCd0bUmi
	dNXLNgefseQ4IFzrM977DMHQlItzzq5rO13i5D0+WkkZqA3bSoKtuTu6f2F/000ZO0p
	rDT+TN1nBwS3PUwESxG0M66+VOHoMqsdzQ7iYJ0I=
Content-Type: multipart/mixed; boundary="===============8252281445789354253=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng,libcap-ng-python: upgrading to 0.9,0.9 FAILED
Message-ID: <0101019bc4688447-43193251-23db-4622-afc9-80a72d628efc-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229448

--===============8252281445789354253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng,libcap-ng-python* to *0.9,0.9* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libcap-ng /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1957 entries from dependency cache.
Parsing recipes...done.
Parsing of 953 .bb files complete (951 cached, 2 parsed). 1961 targets, 47 skipped, 0 masked, 0 errors.

INFO: Updating SRCREV in recipe libcap-ng_0.9.bb
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 2177, in finish
    updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                                   ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1872, in _update_recipe
    updated, appendf, removed = _update_recipe_srcrev(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, dry_run_outdir)
                                ~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/scripts/lib/devtool/standard.py", line 1561, in _update_recipe_srcrev
    remove_files = list(del_f.values()) + [value["path"] for value in upd_p.values() if "path" in value] + [value["path"] for value in del_p.values() if "path" in value]
                                                                                                            ~~~~~^^^^^^^^
TypeError: string indices must be integers, not 'str'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8252281445789354253==--

