Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 46D5860777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:54:13 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id k135-v6so10279745ite.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WjV0HJ27xo9UTy/GQkFS1bdLu0r+c0RU7r7rTy11KwY=;
	b=hADhwIIn0cZQKC7XvejVTtUaiwG/Z2+1+1eRlcSepTmua8srzpOr+7vaK9oQDQ0Oqy
	S0/VPNmWrulPgJlTEKNbfVOi3FG2664C8Jre4aVpLRmj/Z9QOxJ6xK+BJEzCUwswmFOn
	Bl+VVFsUTb3a3oHUobQYD0KJsOF/mhSgaEdGbZNySndgJhV0MmmNWY9l7thxXBsou+nH
	y5UgFBk0vffMHigxgw+OFhpAouZOSvXUYp9bBzgVLPDLimHrVI139uTg3I0TvNvwTt9J
	DtYErJrPYkTp98Js1FpdYFVzBKHbXU9g8z1+tmjuSbjRea/WVXA0ton6tVrwOvBf5A6k
	m0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WjV0HJ27xo9UTy/GQkFS1bdLu0r+c0RU7r7rTy11KwY=;
	b=e+yuZibdZzA1vTsM4fidvXwdfni8uM7NX4nuALZ1DqMYbCT5ZbZCGPNn8uhagjr8LA
	9rLRu8sLInjwMcoZRe1o9o0tEsf1BNc9M2zVbOJXgjGTJ18k3/qCB9NckLh14XwPkjuK
	Qc0GtHScf9mr6I6XolLMi+F5Lqy0j4dq4HJBVlvfmKMsdJysjLyjzHZmtafsndZ/9O6A
	hyfw65F1d2TNeJeLQ8ZVOqGMSAGJSwVW28tzUsM3kmfAjqnIoKvaJv6cYxpGRfwl2lhs
	RMDTTrvf354ATafBB9C/pP3JtRdumyOO0B6KcBehSLZrsZyw36dRD5C+Ro0N4co9uIYC
	u/LA==
X-Gm-Message-State: AElRT7H+0UZXGnKvsj64UfJqSOttSB/ZMOXM9Q6WyV3uMtg47AEsCKjx
	cW2IumcddPuWedOETvG8aPa4CuDesnaRMQFUskIxKQ==
X-Google-Smtp-Source: AG47ELttnkQyVfixjerXPPZ4LlHAUG7UjVSVwTbZdrNhEPAODhQ1PfXIN9GXsMPRwceRvPuC6lxLMjbH+Bmr3mUf9zA=
X-Received: by 2002:a24:cf55:: with SMTP id
	y82-v6mr8043705itf.127.1521464055404; 
	Mon, 19 Mar 2018 05:54:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 05:53:55 -0700 (PDT)
In-Reply-To: <CAJ86T=XAYT18GHq=CfoQ2uMaw88j75eMXJ_GPkYUAer4j31aKg@mail.gmail.com>
References: <20180316214112.42299-1-raj.khem@gmail.com>
	<CAJ86T=XAYT18GHq=CfoQ2uMaw88j75eMXJ_GPkYUAer4j31aKg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 12:53:55 +0000
Message-ID: <CAJTo0LZwWmGO99=tkXSKgPYoVqmGOrC5sGik2QjUtSGowmCZ6g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Mon, 19 Mar 2018 12:54:14 -0000
Content-Type: multipart/alternative; boundary="0000000000008fb4c40567c37426"

--0000000000008fb4c40567c37426
Content-Type: text/plain; charset="UTF-8"

On 16 March 2018 at 21:43, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Mar 16, 2018 at 2:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > We allow to set LINKER_HASH_STYLE to be empty so this would fail
> > since --with-linker-hash-style needs an argument and cant be empty
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > Changes in v3:
> > - Fix typo in gcc option
> >
> > Changes in v2:
> > - Use inline if statement instead of old syntax
> >
> >  meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
> b/meta/recipes-devtools/gcc/gcc-7.3.inc
> > index d56d2c5e06..a80926216b 100644
> > --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> > @@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
> >      --disable-bootstrap \
> >      --disable-libmudflap \
> >      --with-system-zlib \
> > -    --with-linker-hash-style=${LINKER_HASH_STYLE} \
> > +    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if
> '${LINKER_HASH_STYLE}' else ''} \
>
> What are the rules about when to use d.getVar('FOO') -vs- when to use
> ${FOO} in python fragments like this?


I just had to test this in another recipe to verify it does what you expect.

${FOO} isn't expanded anymore in python functions, but it does get expanded
inside python expansions.

Ross

--0000000000008fb4c40567c37426
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 March 2018 at 21:43, Andre McCurdy <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gma=
il.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Fri, Mar 16, =
2018 at 2:41 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khe=
m@gmail.com</a>&gt; wrote:<br>
&gt; We allow to set LINKER_HASH_STYLE to be empty so this would fail<br>
&gt; since --with-linker-hash-style needs an argument and cant be empty<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v3:<br>
&gt; - Fix typo in gcc option<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - Use inline if statement instead of old syntax<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-devtools/gcc/gcc-<wbr>7.3.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc b/meta/recipes=
-devtools/gcc/<wbr>gcc-7.3.inc<br>
&gt; index d56d2c5e06..a80926216b 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc<br>
&gt; @@ -100,7 +100,7 @@ EXTRA_OECONF_BASE =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-bootstrap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --disable-libmudflap \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-system-zlib \<br>
&gt; -=C2=A0 =C2=A0 --with-linker-hash-style=3D${<wbr>LINKER_HASH_STYLE} \<=
br>
&gt; +=C2=A0 =C2=A0 ${@&#39;--with-linker-hash-style=3D$<wbr>{LINKER_HASH_S=
TYLE}&#39; if &#39;${LINKER_HASH_STYLE}&#39; else &#39;&#39;} \<br>
<br>
</span>What are the rules about when to use d.getVar(&#39;FOO&#39;) -vs- wh=
en to use<br>
${FOO} in python fragments like this?</blockquote><div><br></div><div>I jus=
t had to test this in another recipe to verify it does what you expect.</di=
v><div><br></div><div>${FOO} isn&#39;t expanded anymore in python functions=
, but it does get expanded inside python expansions.</div><div><br></div><d=
iv>Ross</div></div></div></div>

--0000000000008fb4c40567c37426--
