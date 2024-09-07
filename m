Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B16E6FE4F
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 06:55:26 +0000 (UTC)
Subject: Re: [kirkstone][PATCH 1/3] expat: fix CVE-2024-45490
To: openembedded-core@lists.openembedded.org
From: "Siddharth Doshi" <sdoshi@mvista.com>
X-Originating-Location: IN (157.32.44.142)
X-Originating-Platform: Linux Chrome 128
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 23:55:24 -0700
References: <20240906132930.2926495-1-archana.polampalli@windriver.com>
In-Reply-To: <20240906132930.2926495-1-archana.polampalli@windriver.com>
Message-ID: <7911.1725692124940297642@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sfJ042xDLjBj0UwXkYuo"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Sep 2024 06:55:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204293

--sfJ042xDLjBj0UwXkYuo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Archana,

The fix for this CVE consists of 3 commits (fix in file, test to check for =
issue and doc update)
(ref-> https://github.com/libexpat/libexpat/pull/890/commits )

Out of which you have backported only 2 (Fix in file and doc update). the c=
ommit for "test to check len<0" is not added in the patch

is there any specific reason to exclude it ? if not, could you send a v2 in=
corporting the missing commit too ?

BR,
Siddharth

--sfJ042xDLjBj0UwXkYuo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Archana,</div>
<div>&nbsp;</div>
<div>The fix for this CVE consists of 3 commits (fix in file, test to check=
 for issue and doc update)&nbsp;<br />(ref-&gt; <a href=3D"https://github.c=
om/libexpat/libexpat/pull/890/commits" target=3D"_blank" rel=3D"noopener">h=
ttps://github.com/libexpat/libexpat/pull/890/commits</a>)<br /><br />Out of=
 which you have backported only 2 (Fix in file and doc update). the commit =
for "test to check len&lt;0" is not added in the patch<br /><br />is there =
any specific reason to exclude it ? if not, could you send a v2 incorportin=
g the missing commit too ?<br /><br />BR,</div>
<div>Siddharth&nbsp;&nbsp;</div>

--sfJ042xDLjBj0UwXkYuo--

