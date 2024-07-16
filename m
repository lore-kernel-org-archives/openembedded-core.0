Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA056C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 11:01:59 +0000 (UTC)
Subject: Re: [PATCH v3] bluez5: upgrade 5.72 -> 5.77
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jul 2024 04:01:57 -0700
References: <22262.1721064263985592663@lists.openembedded.org>
In-Reply-To: <22262.1721064263985592663@lists.openembedded.org>
Message-ID: <19409.1721127717782088316@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9QkAN53x0j1une7x7w2Z"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 11:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202106

--9QkAN53x0j1une7x7w2Z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

A bit off topic but, wanted to share something I'm thinking about:

Am wondering about one section in the do_install:append . Not sure if we sh=
ould remove it or not? It feels wrong to keep referencing Python 2 at least=
:

# Patch python tools to use Python 3; they should be source compatible, but
# still refer to Python 2 in the shebang
sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*

Previously, the shebangs were very inconsistent and usually used /usr/bin/p=
ython

But today, they are consistently set to *usr/bin/env python3* , I didn't se=
e this symlink in my testing so I'm not sure if removing this section from =
do_install is OK.

Thoughts?

--9QkAN53x0j1une7x7w2Z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>A bit off topic but, wanted to share something I'm thinking about:</di=
v>
<div>&nbsp;</div>
<div>Am wondering about one section in the do_install:append . Not sure if =
we should remove it or not? It feels wrong to keep referencing Python 2 at =
least:</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; # Patch python tools to use Python 3; they should be sou=
rce compatible, but<br />&nbsp; &nbsp; # still refer to Python 2 in the she=
bang<br />&nbsp; &nbsp; sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${=
D}${libdir}/bluez/test/*</div>
<div>&nbsp;</div>
<div>Previously, the shebangs were very inconsistent and usually used /usr/=
bin/python</div>
<div>&nbsp;</div>
<div>But today, they are consistently set to <strong>usr/bin/env python3</s=
trong>, I didn't see this symlink in my testing so I'm not sure if removing=
 this section from do_install is OK.</div>
<div>&nbsp;</div>
<div>Thoughts?</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--9QkAN53x0j1une7x7w2Z--

