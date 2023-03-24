Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3AAC6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:36:46 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.96682.1679650597160096287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
Subject: Reduce dependency chain when gobject-introspection disabled
Date: Fri, 24 Mar 2023 10:33:23 +0100
Message-ID: <20230324093326.3973899-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <175673>
References: <175673>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 09:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179022

I have extended the patch reducing the dependency chain when g-i is
disabled. It was possible to also condition the dependency on
gobject-introspection-native. I did not manage to condition the
dependency on qemu-native, as that leads to too many failures that
I did not manage to resolve. Anyway, I believe that removing a part
of dependencies is better than nothing. The main goal of this patch
is to remove undesired packages from the target image, which is
accomplished. I don't think qemu-native affects the image at all.



