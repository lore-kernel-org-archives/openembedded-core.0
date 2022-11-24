Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAC2C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 07:41:38 +0000 (UTC)
Subject: Re: [PATCH v3] mesa: enable glvnd support
To: openembedded-core@lists.openembedded.org
From: "Vincent Davis Jr" <vince@underview.tech>
X-Originating-Location: Richmond, Texas, US (99.113.4.128)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 23 Nov 2022 23:41:36 -0800
References: <81C29D2F-9F48-42C5-8195-E5D1C93B91A4@arm.com>
In-Reply-To: <81C29D2F-9F48-42C5-8195-E5D1C93B91A4@arm.com>
Message-ID: <4014.1669275696173398091@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="dm7PyhBDdXNYlEkySJMX"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 07:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173734

--dm7PyhBDdXNYlEkySJMX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Will have change for placing /usr/share/glvnd/egl_vendor.d/50_mesa.json int=
o FILES:libegl-mesa next patch.

To answer first question. I'd say yes, there may be multiple recipes that c=
ontain an implementation of libGLX_VENDOR library
(libGLX_mesa.so, libGLX_nvidia.so, etc...). Although mesa recipe builds lib=
GLX_mesa.so* another recipe may have code or a
link to build/download libGLX_nvidia.so* and package. Would be good to have=
 a PREFERRED_PROVIDER in such cases to
allow for easier selection.

As, for the second question not sure of the history behind

if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)

Believe it's still required as PACKAGECONFIG may not contain egl.

--dm7PyhBDdXNYlEkySJMX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Will have change for placing /usr/share/glvnd/egl_vendor.d/50_mesa.json =
into FILES:libegl-mesa next patch.<br /><br />To answer first question. I'd=
 say yes, there may be multiple recipes that contain an implementation of l=
ibGLX_VENDOR library<br />(libGLX_mesa.so, libGLX_nvidia.so, etc...). Altho=
ugh mesa recipe builds libGLX_mesa.so* another recipe may have code or a<br=
 />link to build/download libGLX_nvidia.so* and package. Would be good to h=
ave a PREFERRED_PROVIDER in such cases to<br />allow for easier selection.<=
br /><br />As, for the second question not sure of the history behind <br /=
><br />if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)<=
br /><br />Believe it's still required as PACKAGECONFIG may not contain egl=
.</p>

--dm7PyhBDdXNYlEkySJMX--

