Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B62C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 19:24:47 +0000 (UTC)
Subject: Re: [PATCH] package: disable renamed dependency error if allarch is overridden
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: London, England, GB (64.103.40.21)
X-Originating-Platform: Linux Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 25 Jul 2025 12:24:42 -0700
References: <CANNYZj9EJBJoFQ=MzCWYPM-etwcjkbh1eGEmpS003tt_YreMsw@mail.gmail.com>
In-Reply-To: <CANNYZj9EJBJoFQ=MzCWYPM-etwcjkbh1eGEmpS003tt_YreMsw@mail.gmail.com>
Message-ID: <22749.1753471482928656004@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qAnPly1K76MScbClE7Rh"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 19:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220933

--qAnPly1K76MScbClE7Rh
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Alex,

Do you mean removing the conditional or removing allarch inherit?
I don't think I can find the time to work on either of those as it would in=
volve additional research and testing to make sure nothing breaks in the pr=
ocess.
While I would like to help, doing major changes or large refactoring to add=
ress an issue already solved is likely outside the scope of my job responsi=
bilities.
As downstream users of the code, we were hoping the patch could be merged, =
as we would then not have to maintain it on our side.

I suggest to merge it as-is and then have somebody else work on proposed ch=
anges.
Otherwise, I would like to open a bug report so that when the issue is even=
tually resolved, we could drop the patch.

--qAnPly1K76MScbClE7Rh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Alex,</div>
<div>&nbsp;</div>
<div>Do you mean removing the conditional or removing allarch inherit?</div=
>
<div>I don't think I can find the time to work on either of those as it wou=
ld involve additional research and testing to make sure nothing breaks in t=
he process.</div>
<div>While I would like to help, doing major changes or large refactoring t=
o address an issue already solved is likely outside the scope of my job res=
ponsibilities.</div>
<div>As downstream users of the code, we were hoping the patch could be mer=
ged, as we would then not have to maintain it on our side.</div>
<div>&nbsp;</div>
<div>I suggest to merge it as-is and then have somebody else work on propos=
ed changes.</div>
<div>Otherwise, I would like to open a bug report so that when the issue is=
 eventually resolved, we could drop the patch.</div>

--qAnPly1K76MScbClE7Rh--

