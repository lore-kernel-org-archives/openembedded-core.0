Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABB3FF60F0
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 08:54:55 +0000 (UTC)
Subject: Re: [scarthgap] [PATCH V2 1/2] vim: Fix CVE-2026-25749
To: openembedded-core@lists.openembedded.org
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 31 Mar 2026 01:54:47 -0700
References: <131089.1773220389419496773@lists.openembedded.org> <20260311094528.2744479-1-adongare@cisco.com> <DH75VU1XGMU1.177LB3T02RJF1@smile.fr> <173697.1774894874030687760@lists.openembedded.org> <DHGEY5KEC0UG.1XDWZWAJC5ZTL@smile.fr>
In-Reply-To: <DHGEY5KEC0UG.1XDWZWAJC5ZTL@smile.fr>
Message-ID: <173697.1774947287519751568@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="a1FexxI38cQnI55BqpCF"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 08:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234272

--a1FexxI38cQnI55BqpCF
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thank you for the detailed explanation! That makes perfect sense now. I mis=
understood and was looking at the source code indentation rather than the u=
nified diff format itself. I clearly see now via cat -t that the context li=
ne indicator was a tab instead of a space.

I will regenerate the patch properly (I'll look into using devtool as you r=
ecommended) and send out an updated version.

Going forward, besides manually checking the diff, is there a specific scri=
pt or tool (like a patch checker) you recommend using to verify the patch f=
ormat is strictly correct before sending it to the mailing list?

Thanks again for your patience and help!

Best regards, Anil

--a1FexxI38cQnI55BqpCF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p data-path-to-node=3D"2,0">Hi Yoann,</p>
<p data-path-to-node=3D"2,1">Thank you for the detailed explanation! That m=
akes perfect sense now. I misunderstood and was looking at the source code =
indentation rather than the unified diff format itself. I clearly see now v=
ia <code data-path-to-node=3D"2,1" data-index-in-node=3D"199">cat -t</code>=
 that the context line indicator was a tab instead of a space.</p>
<p data-path-to-node=3D"2,2">I will regenerate the patch properly (I'll loo=
k into using <code data-path-to-node=3D"2,2" data-index-in-node=3D"59">devt=
ool</code> as you recommended) and send out an updated version.</p>
<p data-path-to-node=3D"2,3">Going forward, besides manually checking the d=
iff, is there a specific script or tool (like a patch checker) you recommen=
d using to verify the patch format is strictly correct before sending it to=
 the mailing list?</p>
<p data-path-to-node=3D"2,4">Thanks again for your patience and help!</p>
<p data-path-to-node=3D"2,5">Best regards, Anil</p>
</div>

--a1FexxI38cQnI55BqpCF--

