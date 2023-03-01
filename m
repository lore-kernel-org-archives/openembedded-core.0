Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94650C83002
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24031.1677681915674387580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=j8Tjb6//;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101869da27502-1d5f8cbb-53d9-4e51-9b81-c11e86d85179-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EAgkQDk+qSSZfh0Kk/YzvxubBmpypy82vUBvooPkcSg=;
	b=j8Tjb6//Xdt0QJRhPP0AStpTUE149OmmtEJ9IIWa9PWiJ0sDrFmKS6XEqr5ENXiL
	ofp/rooULZZgPn4DJ6FzX0X/BEAdaziGm/Zu8XBoWqZx3WaNUa6SSGl7PGz+M/czj1Y
	ptCMDHlq4+Qc1kYgeGFWrzL3CVh5XhrNVPI7jCz8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EAgkQDk+qSSZfh0Kk/YzvxubBmpypy82vUBvooPkcSg=;
	b=OvRL2Fd4H/PjTtcGA4/4SfqMJLDpVT64mg0iLF0YESrO8umEgAmts3KQfZNl9F92
	kQaDKZIY0RjJMNRangdnzJC0Llxom0W0USQl/3L1MzZkc+OyEhdzf/h+aQKNR1Ivgd6
	s14ou2OYZT8LyUixAFdgQIFU0TyY2wXPqdoKUpG4=
Content-Type: multipart/mixed; boundary="===============4074476692233540175=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.ujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.13.0 SUCCEEDED
Message-ID: <010101869da27502-1d5f8cbb-53d9-4e51-9b81-c11e86d85179-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177925

--===============4074476692233540175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iso-codes* to *4.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.12.0-4.13.0.patch
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
--===============4074476692233540175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGSIZE changed from 63023 to 62883 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGSIZE changed from 69484 to 69266 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGSIZE changed from 361063 to 360952 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGSIZE changed from 16550 to 17053 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 315789 to 315628 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 88844 to 88791 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGSIZE changed from 40035 to 39817 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGSIZE changed from 177319 to 177101 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 64911 to 64811 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGSIZE changed from 33002 to 32887 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 92048 to 92133 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGSIZE changed from 304615 to 304507 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 93348 to 93977 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 36586 to 36476 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGSIZE changed from 224171 to 224055 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 691544 to 693041 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGSIZE changed from 45217 to 45000 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGSIZE changed from 123408 to 123242 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGSIZE changed from 166579 to 166469 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 118277 to 118166 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 110208 to 110292 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGSIZE changed from 104532 to 104421 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGSIZE changed from 60838 to 60712 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGSIZE changed from 81240 to 81132 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGSIZE changed from 651007 to 650891 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 56163 to 56049 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGSIZE changed from 366660 to 366549 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGSIZE changed from 115799 to 115686 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGSIZE changed from 80763 to 81194 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGSIZE changed from 53598 to 53415 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 149139 to 149022 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 183295 to 183373 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGSIZE changed from 34219 to 34054 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGSIZE changed from 34224 to 34114 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 532082 to 532420 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 234048 to 233932 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 605031 to 607938 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGSIZE changed from 182618 to 182503 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGSIZE changed from 193949 to 194747 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGSIZE changed from 32019 to 32902 (+3%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGSIZE changed from 40084 to 39888 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGSIZE changed from 25562 to 25456 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGSIZE changed from 83935 to 85254 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 169870 to 170068 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGSIZE changed from 77428 to 77306 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGSIZE changed from 35049 to 34889 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGSIZE changed from 74919 to 74723 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGSIZE changed from 496612 to 496426 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGSIZE changed from 51459 to 51357 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGSIZE changed from 36365 to 36201 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 360488 to 360376 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGSIZE changed from 53040 to 52923 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43776 to 43689 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGSIZE changed from 288451 to 288278 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGSIZE changed from 476038 to 475892 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 388194 to 388272 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGSIZE changed from 95813 to 95868 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGSIZE changed from 83556 to 83624 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 102981 to 102871 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 227073 to 226909 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 203521 to 203404 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGSIZE changed from 36523 to 36360 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 82053 to 81937 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGSIZE changed from 156950 to 156835 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGSIZE changed from 8584 to 9402 (+10%)
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 28841 to 52835 (+83%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGSIZE changed from 208739 to 208622 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGSIZE changed from 251067 to 250906 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGSIZE changed from 639094 to 639609 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 507781 to 507609 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGSIZE changed from 71813 to 71624 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 215033 to 214856 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGSIZE changed from 493947 to 498536 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGSIZE changed from 33421 to 33292 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 873607 to 873721 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGSIZE changed from 223050 to 222943 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGSIZE changed from 63307 to 63193 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGSIZE changed from 24306 to 24195 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 198283 to 198605 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGSIZE changed from 57836 to 57738 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 120963 to 120857 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.12.0 [default] to 4.13.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 3012064 to 3012718 (+0%)
packages/all-poky-linux/iso-codes: PV changed from "4.12.0" to "4.13.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.12.0 [default] to 4.13.0 [default]

--===============4074476692233540175==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.12.0-4.13.0.patch"

RnJvbSA0YmVmYjEzZjA0NmIyYTMxMDM4MDQ2ZDNjNWJmZjZkMWQwMzU5OTI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDoxNjowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlz
by1jb2RlczogdXBncmFkZSA0LjEyLjAgLT4gNC4xMy4wCgotLS0KIC4uLi9pc28tY29kZXMve2lz
by1jb2Rlc180LjEyLjAuYmIgPT4gaXNvLWNvZGVzXzQuMTMuMC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy97aXNvLWNvZGVzXzQuMTIuMC5iYiA9PiBpc28tY29k
ZXNfNC4xMy4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lz
by1jb2Rlcy9pc28tY29kZXNfNC4xMi4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNv
ZGVzL2lzby1jb2Rlc180LjEzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNvZGVzL2lzby1jb2Rlc180LjEyLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMy4wLmJiCmlu
ZGV4IDFjODg0YTExNzQuLjE5NTA1ODNmNTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMy4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNF
ID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9z
YWxzYS5kZWJpYW4ub3JnL2lzby1jb2Rlcy10ZWFtL2lzby1jb2Rlcy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW47IgotU1JDUkVWID0gIjVlNGRkZGJkMWY4OTAyYWIwMjUyY2NiYjE5Yjc4
M2NjMDM1OTUwNWEiCitTUkNSRVYgPSAiYWI2YjAxZDViNTZhZjdkYTlmMGQyZDE2MTlhM2NmODRl
NDNlZDc2YSIKIAogIyBpbmhlcml0IGdldHRleHQgY2Fubm90IGJlIHVzZWQsIGJlY2F1c2UgaXQg
YWRkcyBnZXR0ZXh0LW5hdGl2ZSB0byBCQVNFREVQRU5EUyB3aGljaAogIyBhcmUgaW5oaWJpdGVk
IGJ5IGFsbGFyY2gKLS0gCjIuMzkuMgoK

--===============4074476692233540175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGSIZE changed from 28841 to 52835 (+83%)

--===============4074476692233540175==--

