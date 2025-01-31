Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C97C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 19:28:24 +0000 (UTC)
Subject: Re: [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 11:28:21 -0800
References: <20250131191948.396835-1-gudni.m.g@gmail.com>
In-Reply-To: <20250131191948.396835-1-gudni.m.g@gmail.com>
Message-ID: <32276.1738351701259116438@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="2MnoMKqipQN6QGMYd8XC"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 19:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210494

--2MnoMKqipQN6QGMYd8XC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried upgrading to latest stable version (2.4.7) but it fails because 2.4=
.6 broke the "--enable-gpg-is-gpg2 " option. Version 2.4.5 works though.

I found two reports on the mailing list for this bug, but no full patches t=
o backport.

1. https://lists.gnupg.org/pipermail/gnupg-devel/2024-November/035673.html =
this one contains a patch which seems to work though I'm not sure its compl=
ete.
2. https://lists.gnupg.org/pipermail/gnupg-devel/2024-December/035748.html =
another report but no patch.

I tracked down the problem to this commit https://github.com/gpg/gnupg/comm=
it/685acf650a68871d8effeaa1c2ca01f2c4752266.

----

The 2.4.5 version was already in master branch so this was a simple cherry-=
pick.

--2MnoMKqipQN6QGMYd8XC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I tried upgrading to latest stable version (2.4.7) but it fails becaus=
e 2.4.6 broke the "--enable-gpg-is-gpg2 " option. Version 2.4.5 works thoug=
h.</div>
<div>&nbsp;</div>
<div>I found two reports on the mailing list for this bug, but no full patc=
hes to backport.</div>
<div>&nbsp;</div>
<div>1. <a href=3D"https://lists.gnupg.org/pipermail/gnupg-devel/2024-Novem=
ber/035673.html" target=3D"_blank" rel=3D"noopener">https://lists.gnupg.org=
/pipermail/gnupg-devel/2024-November/035673.html</a> this one contains a pa=
tch which seems to work though I'm not sure its complete.</div>
<div>2. <a href=3D"https://lists.gnupg.org/pipermail/gnupg-devel/2024-Decem=
ber/035748.html" target=3D"_blank" rel=3D"noopener">https://lists.gnupg.org=
/pipermail/gnupg-devel/2024-December/035748.html</a> another report but no =
patch.</div>
<div>&nbsp;</div>
<div>I tracked down the problem to this commit <a href=3D"https://github.co=
m/gpg/gnupg/commit/685acf650a68871d8effeaa1c2ca01f2c4752266" target=3D"_bla=
nk" rel=3D"noopener">https://github.com/gpg/gnupg/commit/685acf650a68871d8e=
ffeaa1c2ca01f2c4752266</a>.</div>
<div>&nbsp;</div>
<div>----</div>
<div>&nbsp;</div>
<div>The 2.4.5 version was already in master branch so this was a simple ch=
erry-pick.</div>

--2MnoMKqipQN6QGMYd8XC--

