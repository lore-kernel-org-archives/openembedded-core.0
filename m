Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C8BC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 22:35:15 +0000 (UTC)
Subject: Re: [scarthgap][master] license archiving is failed to tmp/deploy/licenses
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Budapest, HU (188.142.163.175)
X-Originating-Platform: Windows Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Jul 2024 15:35:14 -0700
References: <CANNYZj-DiZRQVPK=_96_8=qw5TQYoHZTVTfi9X7GKUfPno1Dtw@mail.gmail.com>
In-Reply-To: <CANNYZj-DiZRQVPK=_96_8=qw5TQYoHZTVTfi9X7GKUfPno1Dtw@mail.gmail.com>
Message-ID: <4791.1722292240522892465@lists.openembedded.org>
X-Old-Date: Mon, 29 Jul 2024 15:30:40 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 22:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202662
Message-ID: <20240729223514.anB19r_9uL1lw51HnOsOIT6P9R-9q-CD3otsYtBzFjk@z>

No, it is not in my scope. I am not the responsible or mainntainer for it, =
and i do not understand the latest patch what it like to do and what should=
 it resolved. I can not solve it, sorry. It was reported a half year ago, i=
t should be resolved by a real maintainer/developer.

Please, if it is not working as before, do not commit it. Rather revert thi=
s patch which cause a totally buggy license deploying at the moment in the =
latest Scarthgap LTS. LTS branch shall not contains this kind of quality, i=
n normally.

