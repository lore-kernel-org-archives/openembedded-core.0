Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A3C3877D45
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 13:16:12 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id v3so54254766qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0KHCVQK5qHUjtkhX9vo/eKKBakmOgfC6xxL0U4GRWWY=;
	b=jLwgGy7znam0NTJKHmu971dx/u653jWHuOTmk2KRllrVWxJNFmgTIV75bOcKwwCpyZ
	izXrhpcmgmZrLHqn7BDIB/Cd2eRD7YoNNpEqYBmI7vmlOHLF+csMopRwjFq+1V/H3XAI
	9ovzLbGLRhRqB3w/wOSGh5xLizKyJZp7GtAu3sOnktMrnBDHRasX3Tfmw0IJWxA7flu0
	5x87ULXt8BwCAlkCFw6xwhGxHWgXDiv+9sXg5FqYKD5IhxYOc4mSMrtB25F9K5KOHF8K
	6J1KqklOHKcTDiIlZ8tUkFIJMti0dVDNqfDs/uU6Jx+91jk/O7/yDVyhVW7gnQdL+zC4
	Phyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0KHCVQK5qHUjtkhX9vo/eKKBakmOgfC6xxL0U4GRWWY=;
	b=OmEXMvTptZUQCL9yrxtVEGl1KKyCOPGJki26VauY73aEBev66vytSW6y4+1oyFoqwA
	CRBUHJc8noAB1AkG8vFF+Ku7IhV4dF5Q69fnruPeRNPcWfMltiJ0KJzfPgsxS09XO3zs
	Dy9RTKRb41jk2YiPqF/0KfXibcB2oypyxYgsDNpRvAcECWR1XntIE61Xqhud4zmZnTXT
	QQ9YQMdRInfYn4Sw97eS0C4uJ8WZ5XM6HJUTsvHH00cuuD6Re7rW/TecpHM6fWjaU+vv
	wrUqQAE0vyKQEk8Nao27gjHWTY5xjgqB1hBPzfeViJk4C1t29MAZK7veSZlBdFX3RLz4
	dRuA==
X-Gm-Message-State: AN3rC/5slI4cRrEa6VDv5SThsfSt/1l4qgOYn9OG2If9UhqSEWeVaEC8Djvxhtuauh8X7KFjWY0gp+x6SpVuUQ==
X-Received: by 10.237.47.194 with SMTP id m60mr15148736qtd.9.1491830173098;
	Mon, 10 Apr 2017 06:16:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Mon, 10 Apr 2017 06:16:12 -0700 (PDT)
In-Reply-To: <1491829792.10884.115.camel@intel.com>
References: <1491828558.10884.112.camel@intel.com>
	<CADkTA4PQHE0w9=kvr5EyeQvG-Vm8SPQFh9NqM2Jofp_Ec99fKA@mail.gmail.com>
	<1491829792.10884.115.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Apr 2017 09:16:12 -0400
Message-ID: <CADkTA4NkqkDvhBSArQ6_6uz7Syb0sL21Vg1brnEArD9y1rATag@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: go-cross: incorrect dependency on tune-specific libgcc
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
X-List-Received-Date: Mon, 10 Apr 2017 13:16:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c12555c886bb0054ccfc7b6

--94eb2c12555c886bb0054ccfc7b6
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 10, 2017 at 9:09 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Mon, 2017-04-10 at 08:59 -0400, Bruce Ashfield wrote:
> >
> >
> > On Mon, Apr 10, 2017 at 8:49 AM, Patrick Ohly <patrick.ohly@intel.com>
> > wrote:
> [...]
> >         diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> >         index 85f71a2e9a6..ac41c80d377 100644
> >         --- a/meta/classes/go.bbclass
> >         +++ b/meta/classes/go.bbclass
> >         @@ -26,7 +26,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
> >          export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
> >         ${TARGET_CXXFLAGS}"
> >          export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS}
> >         ${TARGET_LDFLAGS}"
> >
> >         -DEPENDS += "go-cross-${TARGET_ARCH}"
> >         +DEPENDS += "go-cross-${TUNE_PKGARCH}"
> >          DEPENDS_class-native += "go-native"
> >
> >          FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
> [...]
>
> > This requires any layers with existing DEPENDS on go-cross-${TARGET}
> > to be updated,
>
> "inherit go" hides that detail, so only recipes which depend on
> go-cross-${TARGET_ARCH} directly instead of using go.bbclass need to be
> updated (and perhaps should be changed to use go.bbclass instead?).
>

True!

I don't universally use the go bbclass in oe-core, since my recipes all
predate
it by a significant amount.

Either way, I still have a problem when changes like this merge into
oe-core and
I never know exactly when .. until I get the email of people telling me
that things
are broken in meta-virt :D

Bruce


>
> But I'm not a go expert, so let's hear from those first ;-}
>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c12555c886bb0054ccfc7b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Apr 10, 2017 at 9:09 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On Mon, 2017-04-10 at 08:59 -0400, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Apr 10, 2017 at 8:49 AM, Patrick Ohly &lt;<a href=3D"mailto:pa=
trick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
&gt; wrote:<br>
</span>[...]<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0diff --git a/meta/cl=
asses/go.bbclass b/meta/classes/go.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index 85f71a2e9a6..ac41c80d377 100644=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--- a/meta/classes/go.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/go.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -26,7 +26,7 @@ export CGO_CPPFLAGS=
 =3D &quot;${TARGET_CPPFLAGS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_CXXFLAGS =3D &quot;${TARG=
ET_CC_ARCH}${TOOLCHAIN_<wbr>OPTIONS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${TARGET_CXXFLAGS}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export CGO_LDFLAGS =3D &quot;${TARGE=
T_CC_ARCH}${TOOLCHAIN_<wbr>OPTIONS}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${TARGET_LDFLAGS}&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DEPENDS +=3D &quot;go-cross-${TARGET=
_ARCH}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+DEPENDS +=3D &quot;go-cross-${TUNE_P=
KGARCH}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DEPENDS_class-native +=3D &quot;go-n=
ative&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FILES_${PN}-staticdev +=3D &quot;${G=
OSRC_FINAL}/${GO_IMPORT}&quot;<br>
</span>[...]<br>
<span class=3D""><br>
&gt; This requires any layers with existing DEPENDS on go-cross-${TARGET}<b=
r>
&gt; to be updated,<br>
<br>
</span>&quot;inherit go&quot; hides that detail, so only recipes which depe=
nd on<br>
go-cross-${TARGET_ARCH} directly instead of using go.bbclass need to be<br>
updated (and perhaps should be changed to use go.bbclass instead?).<br></bl=
ockquote><br></div><div class=3D"gmail_quote">True!<br><br></div><div class=
=3D"gmail_quote">I don&#39;t universally use the go bbclass in oe-core, sin=
ce my recipes all predate<br></div><div class=3D"gmail_quote">it by a signi=
ficant amount.<br><br></div><div class=3D"gmail_quote">Either way, I still =
have a problem when changes like this merge into oe-core and<br></div><div =
class=3D"gmail_quote">I never know exactly when .. until I get the email of=
 people telling me that things<br></div><div class=3D"gmail_quote">are brok=
en in meta-virt :D<br><br></div><div class=3D"gmail_quote">Bruce<br></div><=
div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
But I&#39;m not a go expert, so let&#39;s hear from those first ;-}<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c12555c886bb0054ccfc7b6--
