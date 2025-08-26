Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EE8C8303F
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 03:09:12 +0000 (UTC)
Subject: Re: [PATCH v2] nativesdk-openssl: support multlib libdir
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 20:09:03 -0700
References: <CANNYZj89EdN9FW9QiaHXKdjEvM672xDnjoQiOfvpkYbmXNnYVQ@mail.gmail.com>
In-Reply-To: <CANNYZj89EdN9FW9QiaHXKdjEvM672xDnjoQiOfvpkYbmXNnYVQ@mail.gmail.com>
Message-ID: <2959.1756177743238083995@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8F0RloObsfpanSo9k7fO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222429

--8F0RloObsfpanSo9k7fO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It is customized locally, such as use 64 bit nativesdk-gcc to build 32bit a=
pplication

I have sent the patches months ago [1], but it is not suitable for Yocto, b=
ecause the implement is complicated and the scope of use is small
So we support it locally, but we need Yocto SDK to support the ability of m=
ultilib extension

Commit =C2=A0[2]=C2=A0 is the similar patch to support the ability of multi=
lib extension

[1] https://lists.openembedded.org/g/openembedded-core/topic/110767332#msg2=
10201
[2] https://git.openembedded.org/openembedded-core/commit/?id=3D70318775524=
4b1a45dd9f90aeaf620d4c92a6757

//Hongxu

--8F0RloObsfpanSo9k7fO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>It is customized locally, such as use 64 bit nativesdk-gcc to build 32=
bit application</div>
<div>&nbsp;</div>
<div>I have sent the patches months ago [1], but it is not suitable for Yoc=
to, because the implement is complicated and the scope of use is small</div=
>
<div>So we support it locally, but we need Yocto SDK to support the ability=
 of multilib extension</div>
<div>&nbsp;</div>
<div>Commit &nbsp;[2]&nbsp; is the similar patch to support the ability of =
multilib extension</div>
<div>&nbsp;</div>
<div>[1] <a href=3D"https://lists.openembedded.org/g/openembedded-core/topi=
c/110767332#msg210201" target=3D"_blank" rel=3D"noopener">https://lists.ope=
nembedded.org/g/openembedded-core/topic/110767332#msg210201</a></div>
<div>[2] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3D703187755244b1a45dd9f90aeaf620d4c92a6757" target=3D"_blank" rel=3D"noo=
pener">https://git.openembedded.org/openembedded-core/commit/?id=3D70318775=
5244b1a45dd9f90aeaf620d4c92a6757</a></div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--8F0RloObsfpanSo9k7fO--

