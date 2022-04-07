Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2A5C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Subject: Re: [master] meta: rust: Bug fix for target definitions returning
 'NoneType' for arm
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Belgaum, Karnataka, IN (103.197.112.81)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 06 Apr 2022 19:23:39 -0700
References: <20220406145959.60251-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220406145959.60251-1-sundeep.kokkonda@gmail.com>
Message-ID: <23786.1649298219830020061@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bQAyoFZnTsk4YS760FkU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164096

--bQAyoFZnTsk4YS760FkU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

The initial patch includes changes for armv7 also ( https://lists.openembed=
ded.org/g/openembedded-core/message/163881 )
But, this causes build issues for target 'core-image-sato' with 'beaglebone=
-yocto' machine. ( https://lists.openembedded.org/g/openembedded-core/messa=
ge/163954 )

So, I reverted the change for armv7. With 'arm' changes alone I tested for =
both qemuarm and beaglebone-yocto machines and the build was success.

--bQAyoFZnTsk4YS760FkU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,<br /><br />The initial patch includes changes for armv7 also (<a hre=
f=3D"https://lists.openembedded.org/g/openembedded-core/message/163881" tar=
get=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/openembedd=
ed-core/message/163881</a>)<br />But, this causes build issues for target '=
core-image-sato' with 'beaglebone-yocto' machine. (<a href=3D"https://lists=
.openembedded.org/g/openembedded-core/message/163954" target=3D"_blank" rel=
=3D"noopener">https://lists.openembedded.org/g/openembedded-core/message/16=
3954</a>)<br /><br />So, I reverted the change for armv7. With 'arm' change=
s alone I tested for both qemuarm and beaglebone-yocto machines and the bui=
ld was success.<br />

--bQAyoFZnTsk4YS760FkU--

