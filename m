Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.243.1620252174737374466
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAJOkX0c;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id r13so2095561qvm.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WAg/4SHgVdDQRBc0BP/aq29HDu9D77Q6H2S9xAYj9o4=;
        b=RAJOkX0cVKtRFWSMT42G7bPXL8MKvq17oY3ISB+LOoGds0wXN56N0QsERKLv2J40ci
         kv86ZKeu1C8vLoT61g6pEng0iilcVVRqwAvqLS63qI52iVkgmR5nkt7CHWDmqjXBVh2P
         4qM6RsQ5JhIcKTEx0/GIOE5rAX0HAErEUpGxpPDxJTQHStPhwVGwEEO5ZVVhZFBh8das
         V3TqvkNTDd0jVtjOUEgIqYv88K4VmY6+KKYnp1rFWbZdGHEmiA1oGsF30LwjpVXtKjZw
         U2M6sQJoQHfdIRRisM7ZxoB6ykc6pSjSiSYQ9mcycmMg1gvYEtKQpoKHcrM5BBCRnnK1
         WLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WAg/4SHgVdDQRBc0BP/aq29HDu9D77Q6H2S9xAYj9o4=;
        b=e02bxSeCoKl2nrnmj+gKMZ+huE/Q6DR3MUMcdiWSd1Xe0JBFaoIpjFy/1/bqvrsWzZ
         LbBE+1YqMnbJV58cJQ7Dufla95TAu2PMYbG6mpDBkAMBwpGKYpUFfpSaI6MEqoWeSPi2
         zcNV3tB0gYK8BaNQGyzF/Jt/oydNrhFVw2XPKB5Kb6UjXgmHeTm69YkxF5pFieb2NigS
         V0BpNmI53L6Ymtb2Kuj3k5hbxIgihOaR92J4X77N8GL6L7QQtPujTleoi83+NslJNUiE
         3lLQ9zkHkFp3EYV+ErxYBy46+QwHSRs7dYUh/MIOvsBYXgbT2tgiVFA0yUdvXFmvSQb9
         cqeA==
X-Gm-Message-State: AOAM531IRGj/gVCRYK98B3LVfL/uj1RYpE3Tq52FrglYZVVuUi31i6it
	6i3I8LzoHyPFnWu7ATmxPh3OTa+cv5g2Se9ni78=
X-Google-Smtp-Source: ABdhPJyNr+/S9WY8SyQvcrUU4ltiQHxE+JRBV59P/Bjj3cgkqSJQFlYpIUZzDuw5pkVUIIW75c/r4O7yG/gmvqv6eaI=
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr1180697qvs.55.1620252173326;
 Wed, 05 May 2021 15:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com> <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
 <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com> <CANNYZj8iZrEC0kc5GGJSb6ddBH77Tz_pN+pFzuD0Hhbdjhpjbw@mail.gmail.com>
 <CAMKF1sozSbDLB08dWLOTnSAFFpgp3j7rkoQ-7NGe5fYF7f+ceQ@mail.gmail.com> <CANNYZj85oAj0YAZVo7J4=5d1Zti=aLmaT+-_gftA-ZWdg8JYxQ@mail.gmail.com>
In-Reply-To: <CANNYZj85oAj0YAZVo7J4=5d1Zti=aLmaT+-_gftA-ZWdg8JYxQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:02:27 -0700
Message-ID: <CAMKF1spJ3sJnhT59PGeaGwfsoSbS1QuZEqFdgY0bxBVbES=fVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003cdcf605c19c5bb4"

--0000000000003cdcf605c19c5bb4
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 2:54 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 5 May 2021 at 23:26, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I went through the history and some of these changes were added by
>> you, so I hope you know why they were needed
>
>
> None of them are needed to build the new version and therefore none should
> be kept. Sorry, but I do have a strong view on this: the experience with
> various recipes I had to rewrite from scratch because of all the
> intractable, undocumented cruft they accumulated over the years taught me
> this.
>
>
>> # we do not want libncursesw if we can
>> do_configure_prepend() {
>>     # configure.ac checks for delwin() in "ncursesw ncurses" so let's
>> drop first one
>>     sed -i -e "s/ncursesw//g" ${S}/configure.ac
>> }
>>
>> since we control enabling widechar support in ncurses via
>> ENABLE_WIDEC, its better to either check for that here perhaps via a
>> DISTRO_FEATURE or just disable the widechar support
>> like it is doing.
>>
>
> It's doing:
>
> PKG_CHECK_MODULES([NCURSES], [ncursesw ncurses], [LIBS="$LIBS
> $ncurses_LIBS"], [
> AC_SEARCH_LIBS([delwin], [ncursesw ncurses], [], [
> AC_MSG_ERROR([ncurses is required but was not found])
> ], [])
> ]
>
> Unless you explain why the above is wrong (even though it builds without
> any problem), I'd say you're veering too much towards bikeshedding here.
>
>
order is, look for ncursesw first so this sed operation removes ncursesw
from search paths.
and this commits mentions this change was intentional

https://git.openembedded.org/openembedded-core/commit/?id=188862de64b

so why should it be dropped without understanding the repercussions of it?

Alex
>

--0000000000003cdcf605c19c5bb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 2:54 PM Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 5 May 2021 at 23:26, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">I went through the=
 history and some of these changes were added by<br>
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
<div><br></div><div><table><tbody><tr><td id=3D"gmail-m_4695276265065032177=
gmail-LC120">PKG_CHECK_MODULES(<span><span>[</span>NCURSES<span>]</span></s=
pan>, <span><span>[</span>ncursesw ncurses<span>]</span></span>, <span><spa=
n>[</span>LIBS=3D&quot;$LIBS $ncurses_LIBS&quot;<span>]</span></span>, <spa=
n><span>[</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table><tbody><tr><td id=3D"gmail-m_4695276265=
065032177gmail-LC121"><span>	<span>AC_SEARCH_LIBS</span><span>(</span><span=
><span>[</span>delwin<span>]</span></span>, <span><span>[</span>ncursesw nc=
urses<span>]</span></span>, <span><span>[</span><span>]</span></span>, <spa=
n><span>[</span></span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table><tbody><tr><td id=3D"gmail-m_4695276265=
065032177gmail-LC122"><span><span>		<span>AC_MSG_ERROR</span><span>(</span>=
<span><span>[</span>ncurses is required but was not found<span>]</span></sp=
an><span>)</span></span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><table><tbody><tr><td id=3D"gmail-m_4695276265=
065032177gmail-LC123"><span><span>	<span>]</span></span>, <span><span>[</sp=
an><span>]</span></span><span>)</span></span></td>
      </tr>
      <tr>
        </tr></tbody></table><span><span>]</span></span></div></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Unless you explain=
 why the above is wrong (even though it builds without any problem), I&#39;=
d say you&#39;re veering too much towards bikeshedding here.</div><div clas=
s=3D"gmail_quote"><br></div></div></blockquote><div>=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace">order is, look=
 for ncursesw first so this sed operation removes ncursesw from search path=
s.</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospa=
ce">and this commits mentions this change was intentional</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace,monospace"><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D188862de64b=
">https://git.openembedded.org/openembedded-core/commit/?id=3D188862de64b</=
a><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace"><br></div><div class=3D"gmail_default" style=3D"font-family:monospa=
ce,monospace">so why should it be dropped without understanding the repercu=
ssions=C2=A0of it?</div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"></div><div class=3D"gmail_=
quote">Alex<br></div></div>
</blockquote></div></div>

--0000000000003cdcf605c19c5bb4--
