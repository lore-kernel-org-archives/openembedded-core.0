Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.17367.1603571379936817751
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 13:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XLtlGzpx;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id h16so2318349vsh.6;
        Sat, 24 Oct 2020 13:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qynAGgSx0tPdQNOT6CH++uABiG5nJYxdR7k/Ita2Hx0=;
        b=XLtlGzpx3Yt03EW+GzshKQreUiddzGKOGGg/UqJzCryrqGmKaL5IMCbMy9jKk2L4OM
         NxuWpcIThq/tEGzaWEM9lSGuZGAk0r3m+XHW1hFM2+kve8+nExt5b754WSi4WstlAfsJ
         cniB4NjNl4AGhcXFWxDYAuShG/5L61XR2PA5njRzr7KbUTilGpsn8d6u5RHBI4Ke+OfC
         eaMA1VOYmkkdmVtYeRgzwlJ0qtwSniANQvuZDD9jf23+VciPgAW6GI1Y0McsuYBeGkf4
         7lNciUEBGNrXSNdVsv76TP/ajgZBOpJNU+zv4yPvxagK5tO9ZxsLhFtx//6STy3H7hyr
         Y0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qynAGgSx0tPdQNOT6CH++uABiG5nJYxdR7k/Ita2Hx0=;
        b=GqxvXIOBu2HiuTqq+RrrChGdhnxCsfb0vyKrDG8k80PU00QNHFUUyr/eT6KnNZdrpf
         XcTw4p67x+s9Th966y2sPDzzRQ9s0PkFw8cB7BpfBAypFqDEf3Oc/p2lHxm9KRx+ckE+
         uyJHn1u48hCp3YrbaGp/1zTNWi82cRlfwjjhodSobpz8UHCuPXSZIgLF6cv8a1Bphoot
         gD9Sg0NCAfJtTeHdW9w2jBvoDPrlPdJMOw254xY8z6oUlcP+OVSLyb6+JT0tDj2sOvnn
         S36zq2Z+z0xpJt7+oBJ+UKLfEkG0Wup6F5KwQWWThxRocYqbB7v1CpYgTGdV0SPsPiJl
         Onbw==
X-Gm-Message-State: AOAM530nGFTofslC1C7rBZlZzeyiI7zSbpJ67V/TOWniKLde5ymmPRzb
	TXYWMVMQdGgXFqI/LEXwM41RjwYywXVoSFSsIWo=
X-Google-Smtp-Source: ABdhPJxfgNFf7oWYY2lDm2KGzJgWl9u5h/qfHzeeehigjDEH5dMeMC2JJzbnV+iFgRDnCJJXoEtJZFw4YXcdWH03JHg=
X-Received: by 2002:a05:6102:119:: with SMTP id z25mr10418314vsq.51.1603571379071;
 Sat, 24 Oct 2020 13:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <1640E842B1461A14.10923@lists.yoctoproject.org> <CAGAf8LwEANwgRoXr39xJ1BP5t3XYb9B_8Sf2fYBx_-CfiRAB9Q@mail.gmail.com>
 <CANNYZj_g=0mt7d+f4Gu0HhmikgZ8M6gpGStZLtsDgRqSBXH+vQ@mail.gmail.com> <CAGAf8Lzf2NV+MTKimLqnO=uBZ2DizrhCefLgkj3oBZSqkRoKUA@mail.gmail.com>
In-Reply-To: <CAGAf8Lzf2NV+MTKimLqnO=uBZ2DizrhCefLgkj3oBZSqkRoKUA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 24 Oct 2020 22:29:27 +0200
Message-ID: <CANNYZj9Pu-y8dP0MmMy2K=Y2ns+Rmy7tnBVW6bFs1TU_43PwJw@mail.gmail.com>
Subject: Re: [yocto] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, yocto@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006bf1b505b2708e71"

--0000000000006bf1b505b2708e71
Content-Type: text/plain; charset="UTF-8"

Right, I guess my usage of 'you' was ambiguous. It was not targeted at you
specifically, my apologies for that.

Alex

On Sat, 24 Oct 2020 at 22:26, Zoran Stojsavljevic <
zoran.stojsavljevic@gmail.com> wrote:

> I do get this.
>
> But if you deliver/target this message to me, you are barking under
> the wrong tree.
>
> Best Regards,
> Zoran
>
> On Sat, Oct 24, 2020 at 10:22 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I am not complaining or bragging. I only want to set expectations, in
> public, and clearly. Otherwise some people will treat the project
> contributors as their unpaid contractors, and get upset when help is not
> given, or work is not done for them.
> >
> > Alex
> >
> > On Sat, 24 Oct 2020 at 19:38, Zoran Stojsavljevic <
> zoran.stojsavljevic@gmail.com> wrote:
> >>
> >> Alex,
> >>
> >> Either do it voluntarily, either do not.
> >>
> >> Do not complain, or brag about it.
> >>
> >> We all understand Open Source rules, or we do not, do we???
> >>
> >> Thank you,
> >> Zoran Stojsavljevic
> >> _______
> >>
> >>
> >>
> >>
> >>
> >> On Sat, Oct 24, 2020 at 12:54 PM Zoran via lists.yoctoproject.org
> >> <zoran.stojsavljevic=gmail.com@lists.yoctoproject.org> wrote:
> >> >
> >> > > I have absolutely no need for python2, I made this abundantly
> >> > > clear when I created the meta-python2 layer.
> >> >
> >> > WTH? Let me tell you how I really feel.
> >> >
> >> > I  have absolutely no need for python2, as well.
> >> >
> >> > > You are not paying me to do this. You cannot pay me enough
> >> > > to do this. Period. Support yourself.
> >> >
> >> > What is the amount of cash for you, you'll consider it enough to
> >> > do that???
> >> >
> >> > Better... What is the real message behind this/yours "announcement"?
> >> >
> >> > Thank you,
> >> > Zoran
> >> > _______
> >> >
> >> > On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com>
> wrote:
> >> > >
> >> > > I have absolutely no need for python2, I made this abundantly clear
> when I created the meta-python2 layer.
> >> > >
> >> > > If you depend upon continuing support of python2 via the
> meta-python2 layer, this is your call to arms.
> >> > >
> >> > > I was originally intending to abdicate any support after the 3.1
> "dunfell" release, but managed to somehow continue supporting it into the
> crest of the 3.2 "gatesgarth" release.
> >> > >
> >> > > I will stop all support and actively refuse lo respond to any
> emails and this layer will be dead and I have zero care in the world that
> it stops being useful. I do not use it. I do not depend upon it. You are
> not paying me to do this. You cannot pay me enough to do this. Period.
> Support yourself.
> >> > >
> >> > > If this is not clear enough, I am happy to have a virtual video
> call with you that you will not like.
> >> > >
> >> > > --moto-timo
> >> > >
> >> > >
> >> >
> >> > 
> >> >
>

--0000000000006bf1b505b2708e71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Right, I guess my usage of &#39;you&#39; was ambiguou=
s. It was not targeted at you specifically, my apologies for that.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, 24 Oct 2020 at 22:26, Zoran Stojsavl=
jevic &lt;<a href=3D"mailto:zoran.stojsavljevic@gmail.com">zoran.stojsavlje=
vic@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I do get this.<br>
<br>
But if you deliver/target this message to me, you are barking under<br>
the wrong tree.<br>
<br>
Best Regards,<br>
Zoran<br>
<br>
On Sat, Oct 24, 2020 at 10:22 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I am not complaining or bragging. I only want to set expectations, in=
 public, and clearly. Otherwise some people will treat the project contribu=
tors as their unpaid contractors, and get upset when help is not given, or =
work is not done for them.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sat, 24 Oct 2020 at 19:38, Zoran Stojsavljevic &lt;<a href=3D"mail=
to:zoran.stojsavljevic@gmail.com" target=3D"_blank">zoran.stojsavljevic@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Alex,<br>
&gt;&gt;<br>
&gt;&gt; Either do it voluntarily, either do not.<br>
&gt;&gt;<br>
&gt;&gt; Do not complain, or brag about it.<br>
&gt;&gt;<br>
&gt;&gt; We all understand Open Source rules, or we do not, do we???<br>
&gt;&gt;<br>
&gt;&gt; Thank you,<br>
&gt;&gt; Zoran Stojsavljevic<br>
&gt;&gt; _______<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Oct 24, 2020 at 12:54 PM Zoran via <a href=3D"http://list=
s.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject=
.org</a><br>
&gt;&gt; &lt;zoran.stojsavljevic=3D<a href=3D"mailto:gmail.com@lists.yocto=
project.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wro=
te:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; I have absolutely no need for python2, I made this abun=
dantly<br>
&gt;&gt; &gt; &gt; clear when I created the meta-python2 layer.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; WTH? Let me tell you how I really feel.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I=C2=A0 have absolutely no need for python2, as well.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; You are not paying me to do this. You cannot pay me eno=
ugh<br>
&gt;&gt; &gt; &gt; to do this. Period. Support yourself.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What is the amount of cash for you, you&#39;ll consider it e=
nough to<br>
&gt;&gt; &gt; do that???<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Better... What is the real message behind this/yours &quot;a=
nnouncement&quot;?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you,<br>
&gt;&gt; &gt; Zoran<br>
&gt;&gt; &gt; _______<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, Oct 21, 2020 at 2:48 AM Tim Orling &lt;<a href=3D"ma=
ilto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I have absolutely no need for python2, I made this abun=
dantly clear when I created the meta-python2 layer.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; If you depend upon continuing support of python2 via th=
e meta-python2 layer, this is your call to arms.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I was originally intending to abdicate any support afte=
r the 3.1 &quot;dunfell&quot; release, but managed to somehow continue supp=
orting it into the crest of the 3.2 &quot;gatesgarth&quot; release.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I will stop all support and actively refuse lo respond =
to any emails and this layer will be dead and I have zero care in the world=
 that it stops being useful. I do not use it. I do not depend upon it. You =
are not paying me to do this. You cannot pay me enough to do this. Period. =
Support yourself.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; If this is not clear enough, I am happy to have a virtu=
al video call with you that you will not like.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; --moto-timo<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000006bf1b505b2708e71--
