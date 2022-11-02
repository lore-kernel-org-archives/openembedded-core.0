Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550F8C4167D
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.874.1667349632493927510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BbjzEqaD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c86283-5f3b708c-55f4-4619-bbae-1a25f0e6525d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KiuXyNN9U2HD6boBGP4O6+gZXsbhrhk1eN1yews8M9s=;
	b=BbjzEqaDVy8Oypnm1BcPsYqfG5ht/NysMnwCz1XsjG0FCD4CMQf+QmZ35F9NHqUN
	dceoKCjs6uF8t7vX4AsyxMf0F4RZUC3hN+eX5hdXez6J6XjUsMRnavwYHvXUaV1DgnF
	Zbs5PH/2HlrZyyaiD8UpjxOcht/75yuzsEzpCcb8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KiuXyNN9U2HD6boBGP4O6+gZXsbhrhk1eN1yews8M9s=;
	b=I99HmTgS+kCykYfqFPM8P0fRdfp9Do0WDXkHV2By/NvfizcQuAX2BTPKWSusGB5z
	er3KGHTUa4SInp2X1hbE44G3DOhh9H/uVMuC/t7Dxh5f79ZwSfqHAeyQiLruDdlDIyJ
	lSt2aN3QSaFLNhBwxgivvguc18gLj6nVgz2GK+Go=
Content-Type: multipart/mixed; boundary="===============6509398886364108997=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.13.7 SUCCEEDED
Message-ID: <0101018435c86283-5f3b708c-55f4-4619-bbae-1a25f0e6525d-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172501

--===============6509398886364108997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.13.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-modules-upgrade-2.13.5-2.13.7.patch
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
--===============6509398886364108997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-clock-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-clock-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-clock-plugin-test-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-32-modular-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-counter-client-percpu-64-modular-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-kprobes-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-kprobes-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-kretprobes-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-kretprobes-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-lib-ring-buffer-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-block-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-block-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-btrfs-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-compaction-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-ext4-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-gpio-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-i2c-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-irq-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-jbd2-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-kmem-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-module-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-module-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-module-5.19.14-yocto-standard: PKGSIZE changed from 15016 to 15080 (+0%)
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-napi-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-net-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-net-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-power-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-power-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-printk-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-rcu-5.19.14-yocto-standard: PKGSIZE changed from 48368 to 48496 (+0%)
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-regmap-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sched-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-scsi-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-signal-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-skb-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sock-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-statedump-5.19.14-yocto-standard: PKGSIZE changed from 48236 to 48300 (+0%)
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-sunrpc-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-timer-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-udp-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-vmscan-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-workqueue-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-exceptions-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-exceptions-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-probe-x86-irq-vectors-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-discard-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-discard-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-mmap-overwrite-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-client-overwrite-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-event-notifier-client-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-client-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-ring-buffer-metadata-mmap-client-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-statedump-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-statedump-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-test-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-test-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-tracer-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-tracer-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-tracer-5.19.14-yocto-standard: PKGSIZE changed from 1330068 to 1333488 (+0%)
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-uprobes-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-uprobes-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-wrapper-5.19.14-yocto-standard: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/kernel-module-lttng-wrapper-5.19.14-yocto-standard: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules: SRC_URI changed from "https://lttng.org/files/lttng-modules/lttng-modules-2.13.5.tar.bz2 file://0009-Rename-genhd-wrapper-to-blkdev.patch file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch" to "https://lttng.org/files/lttng-modules/lttng-modules-2.13.7.tar.bz2 file://0009-Rename-genhd-wrapper-to-blkdev.patch file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
packages/qemux86-poky-linux/lttng-modules: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-dbg: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-dbg: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-dbg: PKGSIZE changed from 1083292 to 1083896 (+0%)
packages/qemux86-poky-linux/lttng-modules/lttng-modules-dev: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-dev: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-doc: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-doc: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-locale: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-locale: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-src: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-src: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules-staticdev: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules-staticdev: PV changed from "2.13.5" to "2.13.7"
packages/qemux86-poky-linux/lttng-modules/lttng-modules: PKGV changed from 2.13.5 [default] to 2.13.7 [default]
packages/qemux86-poky-linux/lttng-modules/lttng-modules: PV changed from "2.13.5" to "2.13.7"

--===============6509398886364108997==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-modules-upgrade-2.13.5-2.13.7.patch"

RnJvbSBiZjc5MjQ4Njc5MGFhMjQ2OWY2YjNlNmNmZTNhOGQ2MmRmMDE0NDIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxODoxNTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx0
dG5nLW1vZHVsZXM6IHVwZ3JhZGUgMi4xMy41IC0+IDIuMTMuNwoKLS0tCiAuLi4vbHR0bmcve2x0
dG5nLW1vZHVsZXNfMi4xMy41LmJiID0+IGx0dG5nLW1vZHVsZXNfMi4xMy43LmJifSAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL3tsdHRuZy1tb2R1bGVzXzIuMTMuNS5iYiA9PiBsdHRu
Zy1tb2R1bGVzXzIuMTMuNy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2Vy
bmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy41LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy41LmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXNfMi4xMy43LmJi
CmluZGV4IDAwMDk1ZDZhYjcuLjQ5YzU4NGRmZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1r
ZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlc18yLjEzLjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtl
cm5lbC9sdHRuZy9sdHRuZy1tb2R1bGVzXzIuMTMuNy5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNf
VVJJID0gImh0dHBzOi8vbHR0bmcub3JnL2ZpbGVzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLmJ6
MiBcCiAjIFVzZSA6YXBwZW5kIGhlcmUgc28gdGhhdCB0aGUgcGF0Y2ggaXMgYXBwbGllZCBhbHNv
IHdoZW4gdXNpbmcgZGV2dXBzdHJlYW0KIFNSQ19VUkk6YXBwZW5kID0gIiBmaWxlOi8vMDAwMS1z
cmMtS2J1aWxkLWNoYW5nZS1taXNzaW5nLUNPTkZJR19UUkFDRVBPSU5UUy10by13YXJuLnBhdGNo
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWNlYjM0MjhkODBlODVhOWYwMDg0MjViZWI5NTI2
MTk1YzlmN2YwMmIzMDJmMjhhZGQ1NmRmNTNhZWYzZTcwOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI1YTk5Njc5ZGY3OTAzMTYwY2JkZTM5MThmZWU1YWY5MGZmYWZjOTBmYzk2Y2NkZWZhYTU3Y2Yy
MzA0OTJiMjM0IgogCiBleHBvcnQgSU5TVEFMTF9NT0RfRElSPSJrZXJuZWwvbHR0bmctbW9kdWxl
cyIKIAotLSAKMi4zMS4xCgo=

--===============6509398886364108997==--

