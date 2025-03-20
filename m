Return-Path: <jarsoper@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE48CC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 17:51:12 +0000 (UTC)
Subject: Re: [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
To: openembedded-core@lists.openembedded.org
From: "Jean-Pierre Geslin" <jarsoper@gmail.com>
X-Originating-Location: FR (37.67.78.161)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 20 Mar 2025 10:51:05 -0700
References: <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
In-Reply-To: <CA+chaQc4kxzLcbFkZswbftUevsjcO4aYDzNVh6hMxj4miv9m1A@mail.gmail.com>
Message-ID: <31837.1742493065363412046@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zuks7Fw50VnKoaWt0dE0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 17:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213424

--zuks7Fw50VnKoaWt0dE0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

First good catch Martin!
Regarding cargo usage it's better to use feature flag (--feature) as RUSTFL=
AGS is passed at each compiler invocation (you risk to have a conflict with=
 another feature in other crate dependency compilation and enable it withou=
t wanting that).

I'm really sorry if I credited the author incorrectly, I'd made the same fi=
x before looking to see if it had already been proposed.

I think both approaches are respectable, but the revert will keep Rust reci=
pes apart forever, which may not be the most unified IMHO.

--zuks7Fw50VnKoaWt0dE0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello all,</div>
<div>&nbsp;</div>
<div>First good catch Martin!</div>
<div>Regarding cargo usage it's better to use feature flag (--feature) as R=
USTFLAGS is passed at each compiler invocation (you risk to have a conflict=
 with another feature in other crate dependency compilation and enable it w=
ithout wanting that).</div>
<div>&nbsp;</div>
<div>I'm really sorry if I credited the author incorrectly, I'd made the sa=
me fix before looking to see if it had already been proposed.</div>
<div>&nbsp;</div>
<div>I think both approaches are respectable, but the revert will keep Rust=
 recipes apart forever, which may not be the most unified IMHO.</div>
<div>&nbsp;</div>

--zuks7Fw50VnKoaWt0dE0--

