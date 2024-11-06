Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A601ED59F62
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 18:30:58 +0000 (UTC)
Subject: Re: [PATCH 2/2] python3-setuptols: do parallel builds
To: openembedded-core@lists.openembedded.org
From: "Konrad Weihmann" <kweihmann@outlook.com>
X-Originating-Location: Berlin, Land Berlin, DE (77.183.34.183)
X-Originating-Platform: Linux Chrome 130
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 06 Nov 2024 10:30:56 -0800
References: <20241105215644.1884070-2-ross.burton@arm.com>
In-Reply-To: <20241105215644.1884070-2-ross.burton@arm.com>
Message-ID: <2650.1730917856955683740@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="s9TDSu1dTaq8gL7lyWZM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 18:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206799

--s9TDSu1dTaq8gL7lyWZM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 01:56 PM, Ross Burton wrote:

I find that patch incredibly risky, as there is no really opt-out.
As the main beneficiary is pandas (which is not in core), which not add it =
there as a patch?

Also other suggest that all that can be achieved with =C2=A0--global-option=
=3D"build_ext" --global-option=3D"-j5"
set by PEP517_BUILD_OPTS, which would find the much better options here.

Something like

PARALLEL_PEP517_BUILD ?=3D " --global-option=3D"build_ext" --global-option=
=3D"-j<job count>""
PEP517_BUILD_OPTS:append =3D " ${PARALLEL_PEP517_BUILD}"

--s9TDSu1dTaq8gL7lyWZM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Nov 5, 2024 at 01:56 PM, Ross Burton wrote:<br /><br />I find =
that patch incredibly risky, as there is no really opt-out.<br />As the mai=
n beneficiary is pandas (which is not in core), which not add it there as a=
 patch?&nbsp;<br /><br />Also other suggest that all that can be achieved w=
ith &nbsp;--global-option=3D"build_ext" --global-option=3D"-j5"<br />set by=
 PEP517_BUILD_OPTS, which would find the much better options here.<br /><br=
 />Something like<br /><br />PARALLEL_PEP517_BUILD ?=3D " --global-option=
=3D"build_ext" --global-option=3D"-j&lt;job count&gt;""</div>
<div>PEP517_BUILD_OPTS:append =3D " ${PARALLEL_PEP517_BUILD}"</div>

--s9TDSu1dTaq8gL7lyWZM--

