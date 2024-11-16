Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCA0D68BEE
	for <webhook@archiver.kernel.org>; Sat, 16 Nov 2024 13:24:25 +0000 (UTC)
Subject: Re: [PATCH 2/2] python3: add bluez5-native to DEPENDS conditionally
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 132
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 16 Nov 2024 05:24:16 -0800
References: <921.1731760212735035587@lists.openembedded.org>
In-Reply-To: <921.1731760212735035587@lists.openembedded.org>
Message-ID: <921.1731763456843667823@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fCeWEynp9BYhJnaDaYOl"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Nov 2024 13:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207191

--fCeWEynp9BYhJnaDaYOl
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This isn't a problem on Scarthgap, so I looked into what has changed, and I=
 found the two changes which introduce the dependency loop.

1. glib-2.0 now adds gobject-introspection to DEPENDS if gobject-introspect=
ion-data is in DISTRO_FEATURES
2. systemd now inherits mime class and adds shared-mime-info to DEPENDS (th=
is also adds libxml2 to DEPENDS)

Reverting these two changes and the dependency loop between python and blue=
z5 disappears.

--fCeWEynp9BYhJnaDaYOl
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>This isn't a problem on Scarthgap, so I looked into what has changed, =
and I found the two changes which introduce the dependency loop.</div>
<div>&nbsp;</div>
<div>1. glib-2.0 now adds gobject-introspection to DEPENDS if gobject-intro=
spection-data is in DISTRO_FEATURES</div>
<div>2. systemd now inherits mime class and adds shared-mime-info to DEPEND=
S (this also adds libxml2 to DEPENDS)</div>
<div>&nbsp;</div>
<div>Reverting these two changes and the dependency loop between python and=
 bluez5 disappears.</div>

--fCeWEynp9BYhJnaDaYOl--

