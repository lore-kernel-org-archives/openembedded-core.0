Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8005C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:35:17 +0000 (UTC)
Subject: Re: [PATCH v4 6/6] recipes-connectivity: Drop dbus from RDEPENDS:${PN}
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (46.182.184.194)
X-Originating-Platform: iPhone Safari 18.4
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 07:35:07 -0700
References: <20250401140430.13837-6-niko.mauno@vaisala.com>
In-Reply-To: <20250401140430.13837-6-niko.mauno@vaisala.com>
Message-ID: <27416.1743518107824629818@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="SWROFJLlHQHQsEwrWPqy"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214137

--SWROFJLlHQHQsEwrWPqy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

BlueZ depends on dbus at runtime. Shouldn=E2=80=99t the recipe therefore ex=
plicitly list it in RDEPENDS? It seems weird to me to have the dependency c=
ome from a RRECOMMENDS in different recipe.

--SWROFJLlHQHQsEwrWPqy
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>BlueZ depends on dbus at runtime. Shouldn&rsquo;t the recipe therefore=
 explicitly list it in RDEPENDS? It seems weird to me to have the dependenc=
y come from a RRECOMMENDS in different recipe.</div>

--SWROFJLlHQHQsEwrWPqy--

