Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA6EECAAA1
	for <webhook@archiver.kernel.org>; Sun, 23 Oct 2022 17:06:01 +0000 (UTC)
Subject: Re: [PATCH] libglvnd: add new recipe libglvnd v1.5.0
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 23 Oct 2022 10:05:54 -0700
References: <CANNYZj__oO_F=t3DZDupCwFi8L_Q8FEZG=p8+iA48A_UY4xzuQ@mail.gmail.com>
In-Reply-To: <CANNYZj__oO_F=t3DZDupCwFi8L_Q8FEZG=p8+iA48A_UY4xzuQ@mail.gmail.com>
Message-ID: <1878.1666544754793887571@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="1QXsFdjEJa4tWxIsQAIA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Oct 2022 17:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172069

--1QXsFdjEJa4tWxIsQAIA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Okay, yes this is an optional dependency of mesa. This recipe will allow fo=
r glvnd support in mesa.
Thus, giving access to the GLX window-system API library and related librar=
ies, mesa will build
libGLX_mesa.so.*.* and libEGL_mesa.so.*.* when added. There may be applicat=
ions that require
direct access to the GLX window-system API library in order to build/execut=
e. This will allow for
multiple layers to have generic support for libraries in libglvnd (GLX wind=
ow-system API library, etc...)
without needing to implement their own version of the libglvnd recipe.

Question, since the goal is to support glvnd in mesa.
Should I be creating a patch series for this or just leave it as individual=
 patches?

Also, I'll update commit message with above response

--1QXsFdjEJa4tWxIsQAIA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Okay, yes this is an optional dependency of mesa. This recipe will allow fo=
r glvnd support in mesa.<br />Thus, giving access to the GLX window-system =
API library and related libraries, mesa will build<br />libGLX_mesa.so.*.* =
and libEGL_mesa.so.*.* when added. There may be applications that require<b=
r />direct access to the GLX window-system API library in order to build/ex=
ecute. This will allow for<br />multiple layers to have generic support for=
 libraries in libglvnd (GLX window-system API library, etc...)<br />without=
 needing to implement their own version of the libglvnd recipe.<br /><br />=
Question, since the goal is to support glvnd in mesa.<br />Should I be crea=
ting a patch series for this or just leave it as individual patches?<br /><=
br />Also, I'll update commit message with above response

--1QXsFdjEJa4tWxIsQAIA--

