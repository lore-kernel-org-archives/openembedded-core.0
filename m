Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B53FC8302C
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Subject: create-spdx: question about virtual/kernel dependency
To: openembedded-core@lists.openembedded.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
X-Originating-Location: Zenson di Piave, Veneto, IT (87.5.19.5)
X-Originating-Platform: Linux Firefox 99
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 02:53:28 -0700
Message-ID: <LgTp.1650534808496385241.DMV0@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Rf9NCcn7fL5rUPfF19QY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164752

--Rf9NCcn7fL5rUPfF19QY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

I'm currently having a problem with this ( https://git.openembedded.org/ope=
nembedded-core/tree/meta/classes/create-spdx.bbclass?h=3Dkirkstone#n38 ) de=
pendency in create-spdx.bbclass.
When building Linux everything is fine but using FreeRTOS brakes the build =
because there is no "virtual/kernel" provided.
My question now is, is it really a necessary thing to have or not?

Thanks for the help,

Davide

--Rf9NCcn7fL5rUPfF19QY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,<br /><br />I'm currently having a problem with <a href=3D"https:=
//git.openembedded.org/openembedded-core/tree/meta/classes/create-spdx.bbcl=
ass?h=3Dkirkstone#n38" target=3D"_blank" rel=3D"noopener">this</a> dependen=
cy in create-spdx.bbclass.<br />When building Linux everything is fine but =
using FreeRTOS brakes the build because there is no "virtual/kernel" provid=
ed.<br />My question now is, is it really a necessary thing to have or not?=
<br /><br />Thanks for the help,<br /><br />Davide

--Rf9NCcn7fL5rUPfF19QY--

