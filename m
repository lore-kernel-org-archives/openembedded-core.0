Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246FFC4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 09:15:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.5003.1648631735023216772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=lfR42xVW;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-084-059-085-148.084.059.pools.vodafone-ip.de
 [84.59.85.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B93CC811D8;
	Wed, 30 Mar 2022 11:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1648631732;
	bh=/kxsu1jJVzj+BaUSsgbfYWPFaWpsTD83UFvzHe152FQ=;
	h=From:To:Cc:Subject:Date:From;
	b=lfR42xVWL+r9PPt59DUO2c7KGD0nlR14fa64a1SJ4h73VXqto0qP9N/3SkSVbge4Q
	 cKMTVZ8dmagqflMedrEO/j/BaWx/sh/Lld266gqt3W3usZgAxod++xBZIaKhyaH+yc
	 emf15S7Zh4ticfAK7yKln3l1esysH8m2wzM/haY5GqeDyK6QoYqm5UAZerLXgkG25W
	 r1f3vkaXy1UM7Bf5ve5OHXJXO0nPbgXGZxMpX0zZqH7mc/qlKgvGp9Ml1edmudQw3w
	 O1d1lAQ8rDMHw4vVqULZ1I++rH/kHC2+r4bxZNIy3QZNZcdyQzezZCxYefvo3PU1OE
	 NuHdVzQysLYIg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Claudius Heine <ch@denx.de>
Subject: [RFC PATCH 0/1] Packaging a fitimage with initramfs
Date: Wed, 30 Mar 2022 11:15:21 +0200
Message-Id: <20220330091522.795083-1-ch@denx.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 09:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163779

Hi,

I am currently investigating how to package a fitimage with embedded
initramfs and came up with the following recipe.

The recipe will have issues because its version is not linked to the
kernel version, so updating via package repos will not work.
But that would not be important for my use-case.

Is there some other way to solve this or any ideas how to get around its
limitations?

My goal is to have the fitImage embedded into the rootfs partition
reachable via /boot/fitImage.

thanks and regards,
Claudius

Claudius Heine (1):
  kernel: add kernel-image-fitimage-initramfs

 .../kernel-image-fitimage-initramfs_0.1.0.bb  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-image-fitimage-initramfs/k=
ernel-image-fitimage-initramfs_0.1.0.bb

--=20
2.33.1


