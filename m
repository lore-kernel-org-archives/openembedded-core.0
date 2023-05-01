Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F42C7EE31
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.107434.1682976351683100654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Mz20a341;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010187d9352e07-abbbc2c9-235b-4838-930c-0c6cef6a9a68-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mfsJqWNnCSQpYPkXT4YFccIBAZ+fg510PKSc+eByHl4=;
	b=Mz20a341Yu9msUIXS26PfRzkOr+A9ARya0VUNRJYvwqNeJFFmaoBG/hCoOZ3Vgep
	fufsFZQ7gpKZ1WNcvUztxDQCNcsMqAzMTCixXf0VaMtlWQaeUaIdmnkDZt1iVtvKDuj
	LH5jhPcGRDkZEn9USJQnONor/wUvbSw1ZmYpIEx0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mfsJqWNnCSQpYPkXT4YFccIBAZ+fg510PKSc+eByHl4=;
	b=CCvhcNwMWQTnGvdXG5y/lOkBaashtX+bGl88Az7wIt+kvlaFXPWE3VDXVd4oucp0
	+3lBX4VCfgN35MY4dVnvcNC39F8fmY54W+OJGdWXc1BVmTu4CJ893zxrLAOMiGfMyN8
	QWlPft6W1RK4KMlvRmQl0VC9RjQtUyOrzeJRxqZM=
Content-Type: multipart/mixed; boundary="===============0007210468102337809=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0: upgrading to 1.22.2 SUCCEEDED
Message-ID: <01010187d9352e07-abbbc2c9-235b-4838-930c-0c6cef6a9a68-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180703

--===============0007210468102337809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-upgrade-1.22.0-1.22.2.patch
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
--===============0007210468102337809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-bash-completion: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: FILELIST: removed "/usr/lib/.debug/libgstbase-1.0.so.0.2200.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2200.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2200.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2200.0 /usr/lib/.debug/libgstreamer-1.0.so.0.2200.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2200.0", added "/usr/lib/.debug/libgstreamer-1.0.so.0.2202.0 /usr/lib/.debug/libgstcheck-1.0.so.0.2202.0 /usr/lib/.debug/libgstbase-1.0.so.0.2202.0 /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2202.0-gdb.py /usr/lib/.debug/libgstnet-1.0.so.0.2202.0 /usr/lib/.debug/libgstcontroller-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGSIZE changed from 11878230 to 11879498 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGSIZE changed from 6030399 to 6031309 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-af: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ast: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-az: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-be: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-bg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ca: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-cs: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-da: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-de: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-el: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-en-gb: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eo: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-es: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-eu: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fi: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGSIZE changed from 16426 to 27990 (+70%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-gl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-hu: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-id: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-it: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ja: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ka: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ko: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-lt: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nb: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-nl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-pt-br: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ro: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-ru: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-rw: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sk: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sl: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sq: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGSIZE changed from 50518 to 50816 (+1%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-sv: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-tr: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-uk: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-vi: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-cn: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-zh-tw: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-ptest: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGSIZE changed from 9382833 to 9386370 (+0%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcheck-1.0.so.0.2200.0 /usr/lib/libgstcontroller-1.0.so.0.2200.0 /usr/lib/libgstbase-1.0.so.0.2200.0 /usr/lib/libgstnet-1.0.so.0.2200.0 /usr/lib/libgstreamer-1.0.so.0.2200.0", added "/usr/lib/libgstcontroller-1.0.so.0.2202.0 /usr/lib/libgstreamer-1.0.so.0.2202.0 /usr/lib/libgstcheck-1.0.so.0.2202.0 /usr/lib/libgstnet-1.0.so.0.2202.0 /usr/lib/libgstbase-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.0.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3" to "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.22.2.tar.xz file://run-ptest file://0001-tests-respect-the-idententaion-used-in-meson.patch file://0002-tests-add-support-for-install-the-tests.patch file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3"
packages/core2-32-poky-linux/gstreamer1.0: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2200.0 to libgstbase-1.0.so.0.2202.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2200.0 to libgstcheck-1.0.so.0.2202.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2200.0 to libgstcontroller-1.0.so.0.2202.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2200.0 to libgstnet-1.0.so.0.2202.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2200.0 to libgstreamer-1.0.so.0.2202.0
  /usr/lib/libgstbase-1.0.so.0.2200.0 moved to /usr/lib/libgstbase-1.0.so.0.2202.0
  /usr/lib/libgstcheck-1.0.so.0.2200.0 moved to /usr/lib/libgstcheck-1.0.so.0.2202.0
  /usr/lib/libgstcontroller-1.0.so.0.2200.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2202.0
  /usr/lib/libgstnet-1.0.so.0.2200.0 moved to /usr/lib/libgstnet-1.0.so.0.2202.0
  /usr/lib/libgstreamer-1.0.so.0.2200.0 moved to /usr/lib/libgstreamer-1.0.so.0.2202.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2200.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2202.0-gdb.py

--===============0007210468102337809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0-locale-fur: PKGSIZE changed from 16426 to 27990 (+70%)
packages/core2-32-poky-linux/gstreamer1.0/gstreamer1.0: FILELIST: removed "/usr/lib/libgstcontroller-1.0.so.0.2200.0 /usr/lib/libgstcheck-1.0.so.0.2200.0 /usr/lib/libgstbase-1.0.so.0.2200.0 /usr/lib/libgstnet-1.0.so.0.2200.0 /usr/lib/libgstreamer-1.0.so.0.2200.0", added "/usr/lib/libgstcontroller-1.0.so.0.2202.0 /usr/lib/libgstreamer-1.0.so.0.2202.0 /usr/lib/libgstnet-1.0.so.0.2202.0 /usr/lib/libgstcheck-1.0.so.0.2202.0 /usr/lib/libgstbase-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0 (sysroot):
  /usr/lib/libgstbase-1.0.so.0 changed symlink target from libgstbase-1.0.so.0.2200.0 to libgstbase-1.0.so.0.2202.0
  /usr/lib/libgstcheck-1.0.so.0 changed symlink target from libgstcheck-1.0.so.0.2200.0 to libgstcheck-1.0.so.0.2202.0
  /usr/lib/libgstcontroller-1.0.so.0 changed symlink target from libgstcontroller-1.0.so.0.2200.0 to libgstcontroller-1.0.so.0.2202.0
  /usr/lib/libgstnet-1.0.so.0 changed symlink target from libgstnet-1.0.so.0.2200.0 to libgstnet-1.0.so.0.2202.0
  /usr/lib/libgstreamer-1.0.so.0 changed symlink target from libgstreamer-1.0.so.0.2200.0 to libgstreamer-1.0.so.0.2202.0
  /usr/lib/libgstbase-1.0.so.0.2200.0 moved to /usr/lib/libgstbase-1.0.so.0.2202.0
  /usr/lib/libgstcheck-1.0.so.0.2200.0 moved to /usr/lib/libgstcheck-1.0.so.0.2202.0
  /usr/lib/libgstcontroller-1.0.so.0.2200.0 moved to /usr/lib/libgstcontroller-1.0.so.0.2202.0
  /usr/lib/libgstnet-1.0.so.0.2200.0 moved to /usr/lib/libgstnet-1.0.so.0.2202.0
  /usr/lib/libgstreamer-1.0.so.0.2200.0 moved to /usr/lib/libgstreamer-1.0.so.0.2202.0
  /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2200.0-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgstreamer-1.0.so.0.2202.0-gdb.py

--===============0007210468102337809==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-upgrade-1.22.0-1.22.2.patch"

RnJvbSA0MjgzNTE3MDRhZWU5MmU4M2I4ZDFkMWU4YTlkNDZmN2RlMGU2N2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDozODoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMDogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4yCgotLS0KIC4uLi97Z3N0cmVhbWVy
MS4wXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjBfMS4yMi4yLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wXzEuMjIuMC5iYiA9
PiBnc3RyZWFtZXIxLjBfMS4yMi4yLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yMi4wLmJiIGIvbWV0YS9yZWNp
cGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMF8xLjIyLjIuYmIKc2ltaWxhcml0
eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVy
L2dzdHJlYW1lcjEuMF8xLjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjBfMS4yMi4yLmJiCmluZGV4IDExMDAyZTY2N2QuLmY2ZGQy
YzE2OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Ry
ZWFtZXIxLjBfMS4yMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjBfMS4yMi4yLmJiCkBAIC0yMiw3ICsyMiw3IEBAIFNSQ19VUkkgPSAiaHR0
cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3RyZWFtZXIvZ3N0cmVhbWVyLSR7
UFZ9LnRhci54CiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXRlc3RzLXVzZS1hLWRpY3Rpb25hcmll
cy1mb3ItZW52aXJvbm1lbnQucGF0Y2g7c3RyaXBsZXZlbD0zIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDQtdGVzdHMtYWRkLWhlbHBlci1zY3JpcHQtdG8tcnVuLXRoZS1pbnN0YWxsZWRfdGVzdHMu
cGF0Y2g7c3RyaXBsZXZlbD0zIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0g
Ijc4ZDIxYjU0NjlhYzkzZWRhZmM2ZDhjZWI2M2JjODJmNmNiYmVlOTRkMmY4NjZjY2E2YjkyNTIx
NTdlZTBhMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjJhZmU3MzYwMzkyMWM2MDhiYTQ4OTY5
ZGJiN2Q3NDM3NzY3NDRiZmU1ZDgwNTllY2UyNDExMzdiN2Y4OGUyMSIKIAogUEFDS0FHRUNPTkZJ
RyA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMn
LCAnJywgZCl9IFwKICAgICAgICAgICAgICAgICAgICBjaGVjayBcCi0tIAoyLjM5LjIKCg==

--===============0007210468102337809==--

