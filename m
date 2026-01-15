Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE4D4661A
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:12:57 +0000 (UTC)
Subject: Re: [PATCH] improve_kerne_cve_report: Add a bbclass support
To: openembedded-core@lists.openembedded.org
From: "vboudevin" <valentin.boudevin@gmail.com>
X-Originating-Location: Laval, Quebec, CA (208.88.110.46)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 11:12:50 -0800
References: <20260106194202.3402355-1-valentin.boudevin@gmail.com> <PA3PR07MB1072143D325ABB3729C5010D88A85A@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: <PA3PR07MB1072143D325ABB3729C5010D88A85A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Message-ID: <659490.1768491691095926188@lists.openembedded.org>
X-Old-Date: Thu, 15 Jan 2026 07:41:31 -0800
Content-Type: multipart/alternative; boundary="IZvIMz9tl2L1nu06CN8N"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229421
Message-ID: <20260115191250.YKkH2rrDY5zibRYuUUXLB-gsVGZPpsmQUmFrSOfBiFk@z>

--IZvIMz9tl2L1nu06CN8N
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I just pushed a V2 of my patch here: https://lists.openembedded.org/g/opene=
mbedded-core/message/229434.
I added variables to add a deterministic entry if wanted, an offline mode b=
ased on DL_DIR, and a second .bbclass for SPDX2.2.

I can't put SPDX 2.2 and SPDX3.0 in the same class as the task scheduling i=
s very different and a single task won't be able to handle both.
I want to add a third class for debug-source scenario but it is going to ta=
ke me some time.

Do you see any other issue to solve for the current two bbclass?

--IZvIMz9tl2L1nu06CN8N
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi Daniel,&nbsp;</div>
<div>&nbsp;</div>
<div>I just pushed a V2 of my patch here: https://lists.openembedded.org/g/=
openembedded-core/message/229434.</div>
<div>I added variables to add a deterministic entry if wanted, an offline m=
ode based on DL_DIR, and a second .bbclass for SPDX2.2.</div>
<div>&nbsp;</div>
<div>I can't put SPDX 2.2 and SPDX3.0 in the same class as the task schedul=
ing is very different and a single task won't be able to handle both.&nbsp;=
</div>
<div>I want to add a third class for debug-source scenario but it is going =
to take me some time.&nbsp;</div>
<div>&nbsp;</div>
<div>Do you see any other issue to solve for the current two bbclass?</div>

--IZvIMz9tl2L1nu06CN8N--

