Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE27C021AA
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 23:39:15 +0000 (UTC)
Subject: Re: [PATCH V3] setuptools3-base.bbclass: override default subprocess timeout
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 15:39:09 -0800
References: <DAC5A0B2-4F3D-4338-9EC0-68037A53FBBF@arm.com>
In-Reply-To: <DAC5A0B2-4F3D-4338-9EC0-68037A53FBBF@arm.com>
Message-ID: <24821.1739835549438079665@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Nn2YOwxIdELAPdgwMrxB"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 23:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211558

--Nn2YOwxIdELAPdgwMrxB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It happens occasionally, in our build farm, similar Yocto Autobuilder, the =
build test controller=C2=A0 starts up multiple containers for the build on =
the host, and each container is allocated for the world build.
It should be some kind of limit testing or stress testing for yocto build

--Nn2YOwxIdELAPdgwMrxB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>It happens occasionally, in our build farm, similar Yocto Autobuilder,=
 the build test controller&nbsp; starts up multiple containers for the buil=
d on the host, and each container is allocated for the world build.</div>
<div>It should be some kind of limit testing or stress testing for yocto bu=
ild</div>

--Nn2YOwxIdELAPdgwMrxB--

