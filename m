Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224F8C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 07:51:52 +0000 (UTC)
Subject: [dunfell] update_udev_hwdb: postinstall intercept hook failure when using systemd v250
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (87.249.123.12)
X-Originating-Platform: Windows Firefox 111
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Mar 2023 00:51:47 -0700
Message-ID: <x8hg.1679471507115572851.q90S@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178917

When I was trying to include systemd v250 on dunfell I ran into the followi=
ng error when building:
do_rootfs: The postinstall intercept hook 'update_udev_hwdb' failed

On kirkstone this is patched:
https://lists.openembedded.org/g/openembedded-core/message/164429

I have tested this patch on dunfell (using its version of systemd) and as f=
ar as I can tell it works there too.
Would it be alright to send this patch in for dunfell, since there does not=
 seem to be any conflict, but it normally does not apply to it either?

Sincerely,

Jermain Horsman

