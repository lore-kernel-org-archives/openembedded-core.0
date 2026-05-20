Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF06CCD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 09:10:23 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] Add missing SRCREV check for SCM URIs
To: openembedded-core@lists.openembedded.org
From: "Sai Sneha" <saisneha196@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (103.117.236.194)
X-Originating-Platform: Windows Edge 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 May 2026 02:10:20 -0700
References: <20260519103249.236132-1-saisneha196@gmail.com> <3135866948b9f03fd55f43509a5e803261caef5c.camel@geanix.com>
In-Reply-To: <3135866948b9f03fd55f43509a5e803261caef5c.camel@geanix.com>
Message-ID: <2273658.1779268220252598968@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oy1pyKZSKX1Ff9E2fwO7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 09:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237434

--oy1pyKZSKX1Ff9E2fwO7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul, Martin,

Thank you for the detailed review and suggestions.

You are right about the duplicated logic across the three patches. I will r=
ework the series to factor the SRCREV detection into a shared helper and in=
tegrate the yocto-check-layer enforcement through CHECKLAYER_REQUIRED_TESTS=
 instead of reimplementing the check separately.

I will also address the style and cleanup comments:

* simplify the control flow and return logic
* improve variable naming
* use f-strings where appropriate
* add changelogs for the next revision
* clarify the wording around Corentin's earlier work

I=E2=80=99ll send an updated revision shortly.

Thanks,
Sai Sneha

--oy1pyKZSKX1Ff9E2fwO7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"isSelectedEnd"><span>Hi Paul, Martin,</span></p>
<p class=3D"isSelectedEnd"><span>Thank you for the detailed review and sugg=
estions.</span></p>
<p class=3D"isSelectedEnd"><span>You are right about the duplicated logic a=
cross the three patches. I will rework the series to factor the SRCREV dete=
ction into a shared helper and integrate the yocto-check-layer enforcement =
through CHECKLAYER_REQUIRED_TESTS instead of reimplementing the check separ=
ately.</span></p>
<p class=3D"isSelectedEnd"><span>I will also address the style and cleanup =
comments:</span></p>
<ul data-spread=3D"false">
<li><span>simplify the control flow and return logic</span></li>
<li><span>improve variable naming</span></li>
<li><span>use f-strings where appropriate</span></li>
<li><span>add changelogs for the next revision</span></li>
<li><span>clarify the wording around Corentin's earlier work</span></li>
</ul>
<p class=3D"isSelectedEnd"><span>I&rsquo;ll send an updated revision shortl=
y.</span></p>
<p><span>Thanks,</span><br /><span>Sai Sneha</span></p>

--oy1pyKZSKX1Ff9E2fwO7--

