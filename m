Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBC4C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:13:25 +0000 (UTC)
Subject: Re: [langdale][master][PATCH v3] rust: Do not use default compiler flags defined in CC crate
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Mac Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 20 Dec 2022 10:13:16 -0800
References: <Y6HS1fEm26XWUMS8@mail.local>
In-Reply-To: <Y6HS1fEm26XWUMS8@mail.local>
Message-ID: <23625.1671559996757632589@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sNGwoyd9aVeNlCZ7WjvD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174872

--sNGwoyd9aVeNlCZ7WjvD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

It looks like in rust classes we don't define compiler parameter not only f=
or native recipes, but for x86 targets also. I need to think about a differ=
ent approach to fix the issue.

Cheers,

Anton

--sNGwoyd9aVeNlCZ7WjvD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Alexandre,</p>
<p>&nbsp; It looks like in rust classes we don't define compiler parameter =
not only for native recipes, but for x86 targets also. I need to think abou=
t a different approach to fix the issue.<br /><br />Cheers,</p>
<p>Anton</p>
<p>&nbsp;</p>

--sNGwoyd9aVeNlCZ7WjvD--

