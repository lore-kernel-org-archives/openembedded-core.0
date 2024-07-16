Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E08C3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 13:10:10 +0000 (UTC)
Subject: Re: [PATCH v3] bluez5: upgrade 5.72 -> 5.77
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 16 Jul 2024 06:10:08 -0700
References: <CANNYZj-oj9mjyX15aFXnzaLPHO8Sqj=4TmbmuFo==52s=ZA4dw@mail.gmail.com>
In-Reply-To: <CANNYZj-oj9mjyX15aFXnzaLPHO8Sqj=4TmbmuFo==52s=ZA4dw@mail.gmail.com>
Message-ID: <5245.1721135408392157486@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TZGhW7weVLlmdLBXNrlm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 13:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202111

--TZGhW7weVLlmdLBXNrlm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 11:04 AM, Alexander Kanavin wrote:

>=20
> It's fine to remove if after doing that you can conclusively verify
> there's no 'python' anywhere.

I've looked at the source code directly and there are no 'python' shebangs =
anywhere. They all use #!/usr/bin/env python3

I'll submit a separate patch for this then :)

--TZGhW7weVLlmdLBXNrlm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jul 16, 2024 at 11:04 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>It's fine to remove if after doing that you can conclusively ve=
rify<br />there's no 'python' anywhere.</blockquote>
</div>
<div>I've looked at the source code directly and there are no 'python' sheb=
angs anywhere. They all use #!/usr/bin/env python3</div>
<div>&nbsp;</div>
<div>I'll submit a separate patch for this then :)</div>

--TZGhW7weVLlmdLBXNrlm--

