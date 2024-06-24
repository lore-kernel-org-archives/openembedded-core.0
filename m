Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9343C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 20:38:20 +0000 (UTC)
Subject: Re: [PATCH] gobject-introspection: split tools and giscanner into a separate package
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 13:38:19 -0700
References: <20240624203215.2470081-1-gudni.m.g@gmail.com>
In-Reply-To: <20240624203215.2470081-1-gudni.m.g@gmail.com>
Message-ID: <2056.1719261499003334744@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3vWmYpgDUTJopzQkR1lV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 20:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201115

--3vWmYpgDUTJopzQkR1lV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Idea for this patch came from this thread: https://lists.openembedded.org/g=
/openembedded-core/topic/patch_python3_setuptools/106764629

( https://lists.openembedded.org/g/openembedded-core/topic/patch_python3_se=
tuptools/106764629 ) I haven't done any runtime tests yet. But this is the =
idea I have so far and it builds without issues. My compressed image shrink=
s by ~1.7MB which is nice if this indeed works.

Any thoughts/feedback on this approach? Am I missing something? I felt that=
 giscanner python module should be included in tools since it requires dist=
utils.

--3vWmYpgDUTJopzQkR1lV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Idea for this patch came from this thread: <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/topic/patch_python3_setuptools/106764629" tar=
get=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/openembedd=
ed-core/topic/patch_python3_setuptools/106764629<br /><br /></a>I haven't d=
one any runtime tests yet. But this is the idea I have so far and it builds=
 without issues. My compressed image shrinks by ~1.7MB which is nice if thi=
s indeed works.<br /><br />Any thoughts/feedback on this approach? Am I mis=
sing something? I felt that giscanner python module should be included in t=
ools since it requires distutils.

--3vWmYpgDUTJopzQkR1lV--

