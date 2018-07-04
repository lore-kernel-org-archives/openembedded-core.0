Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA6B678425
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 03:16:02 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id r16-v6so7981957oie.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 20:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Xoq0S2lwiJhr5mU1sKQ1tpqV3BF3lmZ1Og6pLtmGN0=;
	b=dqeEY7wEPcxTkQJvgsb1qzvpOAUEh5pmU1GV3mPI/tlgaCi3JNbCIFBXqjvexZ2+X6
	bNeE+mrFIxha7zbM+/5pIgspi+J2oDElBO2PoJELF0zXgG2hZXKrdPVS1V6CfmeHd0R4
	JJhuX/Gto8t4sA3ceOZ3KOREPA5vPlfDlBgYfui1Rjn3AmqfcjK6+CpuNAdRA6NDGmjH
	DyH/WKmOVynpobvLGzxtMsHolz017Bct2CthNOmGIsFTKEibhx8Ib79NKAmkFpfsoW7B
	ToJ4LLxb0I7rgSmlLMGMTRk9QO8K/WpLYcELGrqt1n9X19ty2rCl6loXtMGrav92c4FA
	aFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Xoq0S2lwiJhr5mU1sKQ1tpqV3BF3lmZ1Og6pLtmGN0=;
	b=O8IqVAeXXPUxfTb/zcw5t3FYVNToCw8cQOlN3OJXfvAFSXqBy/C/4vW3fysCe77qPp
	bY49AF5pdiJdft5VL98TLd7UcCiH2f0+GdBGehh+CbnYu1TAkdI+CNg/YJt7amRaCLfc
	j/NDsLgkOTYVhli03PuaEIgLVDzYr0tRpvt0oxjRTe0iGIJzYp/+NLRwiKtcxHrSPoHp
	ytMsJP7ZWwFqAJVI7BbFJKEekNwYY5jOWNtIeVW8HoPk0lR6kKub2pXaO9WvVmNHy0nL
	Z2Xn3jLj29Pz36TDpbxNI4955Rl6cfh9LjKMkMqgAhAfjU6HrDZ05kSgk6xuXSEUwq3h
	A2tg==
X-Gm-Message-State: APt69E0cRqiYWsPCOPXM/4h1zVMebi7NltMy9q3FmTOmjBWhOvukMgPc
	EOgyxlyXyI7xm7+65iC+fr5VKchWmTpZI3+XUDY=
X-Google-Smtp-Source: AAOMgpfs8N61DpxRMU+e/6pvcbY86mQnHJJEZosifsOqRxXVqRtsVtlaMq/zcgc5g0mOgPu43n4DP6iPda/fGC0tH7o=
X-Received: by 2002:aca:2c3:: with SMTP id 186-v6mr282977oic.85.1530674163696; 
	Tue, 03 Jul 2018 20:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 3 Jul 2018 20:15:48 -0700
Message-ID: <CABcZANkGsmoBG=L=RsaJ07TDA6tU6vM5gxiP+m2ER=9BABEqpg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Wed, 04 Jul 2018 03:16:03 -0000
Content-Type: multipart/alternative; boundary="000000000000cb485b057023d9ac"

--000000000000cb485b057023d9ac
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 3, 2018 at 5:55 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> An over-ride replaces the original value regardless of whether or
> not it's set up with +=. As replacing the original value seems to be
> the intention here, drop the += to make it more explicit. Also some
> minor recipe formatting tweaks.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>

Technically this is not the case, not precisely. += is appending to any
existing DEPENDS_class-native value, and only *then* is the override
applied to replace DEPENDS. So it's not appending to DEPENDS, it's
appending to DEPENDS_class-native. In this case, it's most likely doing it
this way in the .inc so it's possible for the recipe including it to define
DEPENDS_class-native alongside DEPENDS before the inclusion, but this is
largely pointless, since they can always += to it *after* the inclusion
instead. So I think you're good, most likely it's still fine to remove it,
but I wanted to clarify, as there *are* times when this is a useful thing
to do.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000cb485b057023d9ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Jul 3, 2018 at 5:55 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmai=
l.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">An over-ride replaces the original value regardless of whether or<br=
>
not it&#39;s set up with +=3D. As replacing the original value seems to be<=
br>
the intention here, drop the +=3D to make it more explicit. Also some<br>
minor recipe formatting tweaks.<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com" tar=
get=3D"_blank">armccurdy@gmail.com</a>&gt;<br></blockquote><div><br></div><=
div class=3D"">Technically this is not the case, not precisely.=C2=A0+=3D i=
s appending to any existing DEPENDS_class-native value, and only *then* is =
the override applied to replace DEPENDS. So it&#39;s not appending to DEPEN=
DS, it&#39;s appending to DEPENDS_class-native. In this case, it&#39;s most=
 likely doing it this way in the .inc so it&#39;s possible for the recipe i=
ncluding it to define DEPENDS_class-native alongside DEPENDS before the inc=
lusion, but this is largely pointless, since they can always=C2=A0+=3D to i=
t *after* the inclusion instead. So I think you&#39;re good, most likely it=
&#39;s still fine to remove it, but I wanted to clarify, as there *are* tim=
es when this is a useful thing to do.<br clear=3D"all"></div></div>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at g=
mail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Softw=
are Engineer, Mentor Graphics</div></div></div></div></div>

--000000000000cb485b057023d9ac--
