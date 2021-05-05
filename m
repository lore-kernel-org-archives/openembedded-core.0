Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.104.1620251692139125120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 14:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JPTn0LEj;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id s131so790715vka.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IURok85a8SNGn8Bw45tr6FGEXterRPKlkuJc5b8MyM8=;
        b=JPTn0LEjqBd+IkeVgpi6FpNMKqCR6KV6oqov92QFaIvRRIsrvQzovzJV3i4MQtjHbL
         S7QUPiND5UX9Msp7fmGnMBs0vtUMNAStngaByzUdljuCTmcH1ZASsA49heAIl9aIB7bM
         L3+68oRASy8ifC5F0L4qWHYv2hrxx+hkwu+6zLpR9fBfX5qhgTzGv5SXrFIkm7I+hy5f
         2YWY8q/hg+LOOPYg17sssPm5t/HZobOLCEXwNGdBDBYzn9WzxT5FFbIdEKyFoqciISgb
         7Xsr/lplVnxFroOEIaqsZXxHm8sC2zPI1A7iCgC/K3yNSZ/z23F8rz4lK5ayQJGCw4Aa
         kxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IURok85a8SNGn8Bw45tr6FGEXterRPKlkuJc5b8MyM8=;
        b=TS6pUX+sukJmKu+6EC8GAsEyyRDojwV5/0TpUBCEoBWVc7ZAZdfo2hlREu/DFzBuhv
         +no2g7zvyaP1GClPDgg+hGVeYD2nz4IGfkbF9MbCcEQcKaXnrlJAA6A6FxTxoioTEpz9
         jo1cIxcyF2HlxvjAvd8pOYYE2auYn+3MFfxpnOsq0yiROtc/pLXeWRLzOZytVmCDmrc/
         XAtNgRnBwOuBtJuK9Cd/UbSftBRh0GQHDYHIbt0QmRxPE5EhS9jzIvaRGkv4mHfocQo2
         B+zpNKSd7dEkLflS5GRFDLhevCTP8oPj5HDeaP10hhyc0/3fyAGahgNztj+AJ001Xz9c
         +bRg==
X-Gm-Message-State: AOAM531KCwaAbkKTyGihMVzms97QOMtCCQ9l4uF9VzZZTfZT2/760yVX
	M5GeRtPmcWKMgHem6ttTybfi7PRpU/Z7AyzLVRg=
X-Google-Smtp-Source: ABdhPJxYonjn1ie5LuS0mMHRWSnB0s1OaZlhiyVwgDf+pWWM5YYWicGBWYZjfHBUH+JTgX3GFlcrl0NUGqbmGtSuQ50=
X-Received: by 2002:a1f:2a95:: with SMTP id q143mr640817vkq.8.1620251691283;
 Wed, 05 May 2021 14:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
 <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com> <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
 <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com>
In-Reply-To: <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 5 May 2021 23:54:39 +0200
Message-ID: <CANNYZj85oAj0YAZVo7J4=5d1Zti=aLmaT+-_gftA-ZWdg8JYxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000817a9c05c19c3ed7"

--000000000000817a9c05c19c3ed7
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 23:26, Khem Raj <raj.khem@gmail.com> wrote:

> I went through the history and some of these changes were added by
> you, so I hope you know why they were needed


None of them are needed to build the new version and therefore none should
be kept. Sorry, but I do have a strong view on this: the experience with
various recipes I had to rewrite from scratch because of all the
intractable, undocumented cruft they accumulated over the years taught me
this.


> # we do not want libncursesw if we can
> do_configure_prepend() {
>     # configure.ac checks for delwin() in "ncursesw ncurses" so let's
> drop first one
>     sed -i -e "s/ncursesw//g" ${S}/configure.ac
> }
>
> since we control enabling widechar support in ncurses via
> ENABLE_WIDEC, its better to either check for that here perhaps via a
> DISTRO_FEATURE or just disable the widechar support
> like it is doing.
>

It's doing:

PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS="$LIBS $ncurses_LIBS"
], [
AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
AC_MSG_ERROR([ncurses is required but was not found])
], [])
]

Unless you explain why the above is wrong (even though it builds without
any problem), I'd say you're veering too much towards bikeshedding here.

Alex

--000000000000817a9c05c19c3ed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 23:26, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">I went through the history and some of these =
changes were added by<br>
you, so I hope you know why they were needed</blockquote><br><div>None of t=
hem are needed to build the new version and therefore none should be kept. =
Sorry, but I do have a strong view on this: the experience with various rec=
ipes I had to rewrite from scratch because of all the intractable, undocume=
nted cruft they accumulated over the years taught me this.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"># we do not w=
ant libncursesw if we can<br>
do_configure_prepend() {<br>
=C2=A0 =C2=A0 # <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> checks for delwin() in &quot;ncursesw ncurses&=
quot; so let&#39;s<br>
drop first one<br>
=C2=A0 =C2=A0 sed -i -e &quot;s/ncursesw//g&quot; ${S}/<a href=3D"http://co=
nfigure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
}<br>
<br>
since we control enabling widechar support in ncurses via<br>
ENABLE_WIDEC, its better to either check for that here perhaps via a<br>
DISTRO_FEATURE or just disable the widechar support<br>
like it is doing.<br></blockquote><div><br></div><div>It&#39;s doing:</div>=
<div><br></div><div><table class=3D"gmail-highlight gmail-tab-size gmail-js=
-file-line-container"><tbody><tr><td id=3D"gmail-LC120" class=3D"gmail-blob=
-code gmail-blob-code-inner gmail-js-file-line">PKG_CHECK_MODULES(<span cla=
ss=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</span>NCURSES<span class=
=3D"gmail-pl-pds">]</span></span>, <span class=3D"gmail-pl-c1"><span class=
=3D"gmail-pl-pds">[</span>ncursesw ncurses<span class=3D"gmail-pl-pds">]</s=
pan></span>, <span class=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</sp=
an>LIBS=3D&quot;$LIBS $ncurses_LIBS&quot;<span class=3D"gmail-pl-pds">]</sp=
an></span>, <span class=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</spa=
n></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC121" class=3D"g=
mail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gma=
il-pl-c1">	<span class=3D"gmail-pl-k">AC_SEARCH_LIBS</span><span class=3D"g=
mail-pl-pds">(</span><span class=3D"gmail-pl-c1"><span class=3D"gmail-pl-pd=
s">[</span>delwin<span class=3D"gmail-pl-pds">]</span></span>, <span class=
=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</span>ncursesw ncurses<span=
 class=3D"gmail-pl-pds">]</span></span>, <span class=3D"gmail-pl-c1"><span =
class=3D"gmail-pl-pds">[</span><span class=3D"gmail-pl-pds">]</span></span>=
, <span class=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</span></span><=
/span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC122" class=3D"g=
mail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gma=
il-pl-c1"><span class=3D"gmail-pl-c1">		<span class=3D"gmail-pl-k">AC_MSG_E=
RROR</span><span class=3D"gmail-pl-pds">(</span><span class=3D"gmail-pl-c1"=
><span class=3D"gmail-pl-pds">[</span>ncurses is required but was not found=
<span class=3D"gmail-pl-pds">]</span></span><span class=3D"gmail-pl-pds">)<=
/span></span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table class=3D"gmail-highlight gmail-tab-size=
 gmail-js-file-line-container"><tbody><tr><td id=3D"gmail-LC123" class=3D"g=
mail-blob-code gmail-blob-code-inner gmail-js-file-line"><span class=3D"gma=
il-pl-c1"><span class=3D"gmail-pl-c1">	<span class=3D"gmail-pl-pds">]</span=
></span>, <span class=3D"gmail-pl-c1"><span class=3D"gmail-pl-pds">[</span>=
<span class=3D"gmail-pl-pds">]</span></span><span class=3D"gmail-pl-pds">)<=
/span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><span class=3D"gmail-pl-c1"><span class=3D"gma=
il-pl-pds">]</span></span></div></div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Unless you explain why the above is wrong (even =
though it builds without any problem), I&#39;d say you&#39;re veering too m=
uch towards bikeshedding here.</div><div class=3D"gmail_quote"><br></div><d=
iv class=3D"gmail_quote">Alex<br></div></div>

--000000000000817a9c05c19c3ed7--
