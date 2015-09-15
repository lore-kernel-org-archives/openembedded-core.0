Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E54065D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 00:12:03 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so3658883igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=D9Fq65YKdEw8lypHOjwLb/C8u/XBG2rjhBoRPXybZyI=;
	b=zvNuiXR85EB1fcJZFO1qf/R3OZpvkl5O9gpXwHyANKpztgcmSjzpb/KQk8DD8W1psX
	rVoMVqxQ3Z0+46FdO3Suis+srU+wsFRAY5vR0AqbCrMZLWZVWdt39d/PpJQrkQa6liED
	Tv5mb6D7pTvLcla/gN5CqO0fIx/H4K3gbUrQYnOIicGjt1QiypHceDsduEqSF7XI0oAR
	SYl84nX72SHfvOd29KIFvnnYFP2s1YbfI7JokWAHDRzelgFhrbLAd1ErldrimsroiGkQ
	+ouwEL4Noy5qVBFJn1MfLyFTFWln2XKC7dHtTbQrAbZ0xRRfsFItlrMYR9rhuCHS3V9Z
	8JJg==
X-Received: by 10.50.43.193 with SMTP id y1mr961278igl.38.1442275923609; Mon,
	14 Sep 2015 17:12:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 14 Sep 2015 17:11:44 -0700 (PDT)
In-Reply-To: <1442275837-23562-1-git-send-email-kergoth@gmail.com>
References: <1442275837-23562-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 14 Sep 2015 17:11:44 -0700
X-Google-Sender-Auth: Pm-etTTG4B-WqUko5FxDWz4zgPs
Message-ID: <CABcZAN=S9Fw-hJyjkgPxzq9Kxqfhfdbk0vSYCfATFQV3HH6drw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] image.bbclass: add do_rootfs vardeps for {COMPRESS, IMAGE}_CMD_*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 00:12:06 -0000
Content-Type: multipart/alternative; boundary=089e0111d1be18764c051fbe0828

--089e0111d1be18764c051fbe0828
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 5:10 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We want do_rootfs to rerun if the fstype or compression commands or
> dependencies change for any of our configured fstypes (IMAGE_FSTYPES).
> IMAGE_TYPEDEP isn't explicitly handled, as it's traversed already, so the
> end
> result will change if it does, and we only really care about the results,
> not
> how we got there. This uses oe.image.Image()._get_image_types() to get the
> info about the image and compression types in use.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

This version supercedes '[PATCH] image.bbclass: add do_rootfs vardeps for
IMAGE_{CMD,TYPEDEP}_*' (didn't send as v2 as the commit summary message
changed), but it's essentially a v2).
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0111d1be18764c051fbe0828
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 14, 2015 at 5:10 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bor=
der-left-style:solid;padding-left:1ex"><div id=3D":338" class=3D"" style=3D=
"overflow:hidden">From: Christopher Larson &lt;<a href=3D"mailto:chris_lars=
on@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
We want do_rootfs to rerun if the fstype or compression commands or<br>
dependencies change for any of our configured fstypes (IMAGE_FSTYPES).<br>
IMAGE_TYPEDEP isn&#39;t explicitly handled, as it&#39;s traversed already, =
so the end<br>
result will change if it does, and we only really care about the results, n=
ot<br>
how we got there. This uses oe.image.Image()._get_image_types() to get the<=
br>
info about the image and compression types in use.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>This vers=
ion supercedes &#39;[PATCH] image.bbclass: add do_rootfs vardeps for IMAGE_=
{CMD,TYPEDEP}_*&#39; (didn&#39;t send as v2 as the commit summary message c=
hanged), but it&#39;s essentially a v2).<br>-- <br><div class=3D"gmail_sign=
ature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div></div>
</div></div>

--089e0111d1be18764c051fbe0828--
