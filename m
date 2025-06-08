Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6914C5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 12:25:48 +0000 (UTC)
Subject: Re: [PATCH] python3: drop old nis module dependencies
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: =?UTF-8?B?R2Fyw7BhYmFlciwgQ2FwaXRhbCBSZWdpb24sIElT?= (81.15.100.92)
X-Originating-Platform: Windows Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 05:25:39 -0700
References: <20250608122244.3093502-1-gudni.m.g@gmail.com>
In-Reply-To: <20250608122244.3093502-1-gudni.m.g@gmail.com>
Message-ID: <6607.1749385539177849960@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ruH7bI4X0EgvYqMhzHys"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 12:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218218

--ruH7bI4X0EgvYqMhzHys
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm 90% sure these build dependencies are not needed anymore, See: https://=
github.com/python/cpython/pull/104897

Hopefully I didn't missing anything. The build succeeds locally for me. It =
would be nice to have another set of eyes to review this :) Fewer dependenc=
ies is always nice if possible.

--ruH7bI4X0EgvYqMhzHys
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I'm 90% sure these build dependencies are not needed anymore, See: <a =
href=3D"https://github.com/python/cpython/pull/104897" target=3D"_blank" re=
l=3D"noopener">https://github.com/python/cpython/pull/104897</a></div>
<div>&nbsp;</div>
<div>Hopefully I didn't missing anything. The build succeeds locally for me=
. It would be nice to have another set of eyes to review this :) Fewer depe=
ndencies is always nice if possible.</div>

--ruH7bI4X0EgvYqMhzHys--

