Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAFFC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 17:22:49 +0000 (UTC)
Subject: Re: [PATCH] mesa: enable glvnd support
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Oct 2022 10:22:47 -0700
References: <C917DA2F-DB15-46D8-901C-B1AEF21AD347@arm.com>
In-Reply-To: <C917DA2F-DB15-46D8-901C-B1AEF21AD347@arm.com>
Message-ID: <27896.1666718567656134623@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bDNlHxIGqsXYMrajktH3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 17:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172139

--bDNlHxIGqsXYMrajktH3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yeah, but I couldn't find where runtime depend for libegl is set and libEGL=
_mesa.* gets include in image as runtime dependency without me directly set=
ting it. A bit of confusion there for me. Feel as if I shouldn't need to RD=
EPENDS:${PN} =3D "libglx" in recipe that requires it. Should just be includ=
ed in image as libegl is. Is there a way to avoid RDEPENDS:${PN} =3D "libgl=
x"?

--bDNlHxIGqsXYMrajktH3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yeah, but I couldn't find where runtime depend for libegl is set and libEGL=
_mesa.* gets include in image as runtime dependency without me directly set=
ting it. A bit of confusion there for me. Feel as if I shouldn't need to RD=
EPENDS:${PN} =3D "libglx" in recipe that requires it. Should just be includ=
ed in image as libegl is. Is there a way to avoid RDEPENDS:${PN} =3D "libgl=
x"?<br />
<table class=3D"highlight tab-size js-file-line-container js-code-nav-conta=
iner js-tagsearch-file" data-hpc=3D"" data-tab-size=3D"8" data-paste-markdo=
wn-skip=3D"" data-tagsearch-lang=3D"BitBake" data-tagsearch-path=3D"recipes=
-graphics/monado/monado_21.0.0.bb">
<tbody>
<tr>
<td id=3D"LC25" class=3D"blob-code blob-code-inner js-file-line">&nbsp;</td=
>
</tr>
</tbody>
</table>

--bDNlHxIGqsXYMrajktH3--

