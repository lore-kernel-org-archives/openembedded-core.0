Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E122C352AA
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 17:15:22 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web12.19020.1652634914374815183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 10:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KyaQrtPP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010180c8b78c4c-c2bdb688-735d-423f-9888-43b0d28fcbd2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BpLHIPZ0YgrQHVPAfOqJI3EU0QONIY4iWkEYYLLVcDI=;
	b=KyaQrtPPj+aHCDQL3o6iT3Z+r1pvg/QoLoC5HJC7714qSKSp1xCVWMxjBN157bCN
	ak/deMwo+bW9YHbxiAiXu493DC2J9FUGA4nZtJ/oyf394JBg1jWWJGhR4izh6XsakcR
	dFbQNkj1+4xp46+6L3o+ImaQjBs7lsDQuuAD8Imo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1652634913;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BpLHIPZ0YgrQHVPAfOqJI3EU0QONIY4iWkEYYLLVcDI=;
	b=CmQEewqXhTy4JuI1HslyXAgodvb4m4clJCVOe98gRH9TFNJW0+Crxobx1vMw9jw1
	PYjuAWKu/24ONKeYFSQTmW0OHgFVHVxEWDjJoKjAzWCHWEJMyRAAURkDlAkSMRIySew
	qQfk1nE5mcQK6wBbG6LvsuUzC0dZhntcKZ2JFdyM=
Content-Type: multipart/mixed; boundary="===============6255161699199240276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-ugly: upgrading to 1.20.2 SUCCEEDED
Message-ID: 
 <01010180c8b78c4c-c2bdb688-735d-423f-9888-43b0d28fcbd2-000000@us-west-2.amazonses.com>
Date: Sun, 15 May 2022 17:15:13 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 17:15:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165643

--===============6255161699199240276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-ugly* to *1.20.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-ugly-upgrade-1.20.1-1.20.2.patch
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
--===============6255161699199240276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-a52dec: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-apps: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-asf: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dbg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-doc: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdlpcmdec: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-dvdsub: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-glib: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-af: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ast: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-az: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-bg: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ca: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-cs: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-da: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-de: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-el: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-en-gb: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eo: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-es: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-eu: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-fur: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-gl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-hu: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-id: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-it: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ja: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lt: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-lv: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ms: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-mt: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nb: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-nl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-or: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-pt-br: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ro: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ru: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sk: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sl: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sq: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-sv: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-ta: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-tr: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-uk: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-vi: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-cn: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-locale-zh-tw: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-meta: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-mpeg2dec: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-realmedia: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-src: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-staticdev: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-xingmux: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly-xingmux: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly/gstreamer1.0-plugins-ugly: PKGV changed from 1.20.1 [default] to 1.20.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.1.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.20.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PV changed from "1.20.1" to "1.20.2"
packages/core2-32-poky-linux/gstreamer1.0-plugins-ugly: PKGV changed from 1.20.1 [default] to 1.20.2 [default]

--===============6255161699199240276==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-ugly-upgrade-1.20.1-1.20.2.patch"

From 72e0aeb7a7059ee0cfc8f67a258f11bfee800b3e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 May 2022 15:20:27 +0000
Subject: [PATCH] gstreamer1.0-plugins-ugly: upgrade 1.20.1 -> 1.20.2

---
 ...ugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
index b0746c087a..edc2ece979 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19"
+SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.31.1


--===============6255161699199240276==--

