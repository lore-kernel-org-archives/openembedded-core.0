Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A88C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 16:42:06 +0000 (UTC)
Subject: Re: [PATCH v2] bluez5: upgrade 5.72 -> 5.77
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 15 Jul 2024 09:42:05 -0700
References: <E61FAFA2-917A-49C8-A3E4-9D063B918B90@arm.com>
In-Reply-To: <E61FAFA2-917A-49C8-A3E4-9D063B918B90@arm.com>
Message-ID: <5289.1721061725567010273@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KgjS4EaNsZaQebgMaJtn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 16:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201936

--KgjS4EaNsZaQebgMaJtn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 03:17 PM, Ross Burton wrote:

>=20
> This feels too fragile for my liking. Can we just fix the permissions
> always (with a comment explaining why) instead of looking for systemd? If
> upstream change their behaviour then it=E2=80=99s possible we regress.

I don't see any harm/risk in making this change always apply in do_install =
function, even when systemd is enabled.

--KgjS4EaNsZaQebgMaJtn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 03:17 PM, Ross Burton wrote:<br />
<blockquote>This feels too fragile for my liking. Can we just fix the permi=
ssions always (with a comment explaining why) instead of looking for system=
d? If upstream change their behaviour then it&rsquo;s possible we regress.<=
/blockquote>
I don't see any harm/risk in making this change always apply in do_install =
function, even when systemd is enabled.

--KgjS4EaNsZaQebgMaJtn--

