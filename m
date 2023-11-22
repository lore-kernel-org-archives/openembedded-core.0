Return-Path: <tobias.jakobi@compleo-cs.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63922C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 15:21:00 +0000 (UTC)
Subject: Re: [Kirkstone] joe editor broken with current ncurses
To: openembedded-core@lists.openembedded.org
From: "Tobias Jakobi" <tobias.jakobi@compleo-cs.com>
X-Originating-Location: Dortmund, North Rhine-Westphalia, DE (84.60.164.225)
X-Originating-Platform: Linux Firefox 119
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 22 Nov 2023 07:20:53 -0800
References: <CANNYZj838MaaBeaxBttEmpiv8-29yXP8BTE4bW5LgL6fmHOBfw@mail.gmail.com>
In-Reply-To: <CANNYZj838MaaBeaxBttEmpiv8-29yXP8BTE4bW5LgL6fmHOBfw@mail.gmail.com>
Message-ID: <31510.1700666453230126567@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 15:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191112

OK, that was easier than expected. So I followed the guide, but I just buil=
d core-image-full-cmdline. I added the meta-oe layer (git master) to it and=
 added joe to CORE_IMAGE_EXTRA_INSTALL. Same issue with this setup.

