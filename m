Return-Path: <rpeuvergne@free.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9CFEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 13:03:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by mx.groups.io with SMTP id smtpd.web11.17614.1686834183448174547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 06:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 212.27.42.3, mailfrom: remi.peuvergne@non.se.com)
Received: from localhost.localdomain (unknown [80.214.152.232])
	(Authenticated sender: rpeuvergne@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 17BFC13F8E2
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 15:03:00 +0200 (CEST)
From: Remi Peuvergne <remi.peuvergne@non.se.com>
To: openembedded-core@lists.openembedded.org
Subject: Backport fixes for embedding initramfs in FIT images
Date: Thu, 15 Jun 2023 15:01:59 +0200
Message-Id: <20230615130201.1875914-1-remi.peuvergne@non.se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 13:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182858

Backport initramfs fixes from master/Kirkstone for building FIT images.
This allows embedding an initramfs either as an entry in the FIT image,
or embedded along with the kernel.

Backporting patch #1 required some adaptation to the Dunfell branch.

Testing done:
generate a FIT image with INITRAMFS_IMAGE_BUNDLE=3D0 and 1, and check FIT=
 image
contents with dumpimage tool. Build 2 times in a row changing INITRAMFS_I=
MAGE_BUNDLE
and check we never end with a FIT image containing the initramfs twice.



