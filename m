Return-Path: <ciaran.courtney@activeenergy.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99672ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 12:30:26 +0000 (UTC)
Subject: Re: [PATCH] wic: swap partitions are not added to fstab
To: openembedded-core@lists.openembedded.org
From: ciaran.courtney@activeenergy.ie
X-Originating-Location: Dublin, Leinster, IE (95.45.31.11)
X-Originating-Platform: Windows Chrome 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Oct 2022 05:30:23 -0700
References: <46ff03e8d48871ae8bced43c7f38337114dbb7a2.camel@yadro.com>
In-Reply-To: <46ff03e8d48871ae8bced43c7f38337114dbb7a2.camel@yadro.com>
Message-ID: <7402.1666960223491891015@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0cbSj2JvvfFRPSOjkJTT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 12:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172253

--0cbSj2JvvfFRPSOjkJTT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I believe its common practice to add swap to fstab in order for it to be mo=
unted, and that would have been the case before=C2=A07aa678ce804c21dc1dc51b=
9be442671bc33c4041 .

I'm developing a systemd based distro, which parses fstab at boot for disks=
 to mount. I'm not sure what the non-systemd practice is.

--0cbSj2JvvfFRPSOjkJTT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I believe its common practice to add swap to fstab in order for it to be mo=
unted, and that would have been the case before&nbsp;7aa678ce804c21dc1dc51b=
9be442671bc33c4041 .<br /><br />I'm developing a systemd based distro, whic=
h parses fstab at boot for disks to mount. I'm not sure what the non-system=
d practice is.

--0cbSj2JvvfFRPSOjkJTT--

