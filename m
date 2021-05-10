Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.31386.1620652424948671512
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f8yo+kY+;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id o192so8355757vsd.7
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9LDPzjk8UNSrCcDt7fL4bJxZ9Tha+ZjvleiJuff7TA4=;
        b=f8yo+kY+1vBgoODgILZSiUQO0fhHqk5ez8D6HBiyvnNdhMTH83X/UgaUlYa7fBNCer
         dEalM6Rm37wwrs3ykY+fY7qplmQmc1IlPeNGrr/Rl+77gVQyugdPtJzLGfBIVvcY3S02
         8+cqywdqEWJOaU78plySPUOot+dtKjA+Fd3vY3Eo41yS/I9NmmMZTdfm1cu0GVAMwVH7
         huRNAp7H3kMxzMURrKoMjkXoAwe5V9O5SV6/sxYBDXtqor122SZLhNuA6t5jdbGVb70L
         xzMRAKi13qlSY4HSSoETNQHN04G8GlDgmHA+XQ/ltwhhPqPnOZTwO9HyGA6+pmbj2wz2
         TOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9LDPzjk8UNSrCcDt7fL4bJxZ9Tha+ZjvleiJuff7TA4=;
        b=J25i+4t6cNSuygDV4F43I1ByLo2Vbo4B0ohchZJjJ+y3+o21Zg44J6d0ZIBcqkEwBI
         XT7/r5sAOD0RZ1QHuWoxfYOL8MJhXAkDW6z/BxE0xovbcSZAJ14CP5UruGWjlTibKSyu
         CVpuqxJP1+zDMEvNWgiXRvG/PNE7fIA0tAzY2DIPbciiq7AJiE3tpOSa/0d1UMufTfJ4
         p9OkElWLn33ZsKibNxavAyOSFdCllIz8R0pM1b/hsy9Fh4BnzAIArSDNWT+ksAgZNhrC
         zK8RtnSFWOryDzrGGPHo+RCC6cNFuBmMOl/nGIJVjLsCYDx49ACY2xyODVWaM0k452lj
         NDXQ==
X-Gm-Message-State: AOAM532nWDsxS06xBv42B+9R7nSzo5bvd5wfBl7B+UotOdrkWQPiMiOB
	11Lg/SL58y9MZhYpcGV8Ghas0YWiYVSWCSaQI1s=
X-Google-Smtp-Source: ABdhPJxwRrgVzmF1jmPoF6NZuHcET8s0/WHgiaG8vhcGmS1j4u8KkTTjbSuEyu0mM6GdAN7GWb8JprT1o0xn9Zkd8ig=
X-Received: by 2002:a67:d715:: with SMTP id p21mr11039107vsj.31.1620652424149;
 Mon, 10 May 2021 06:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
 <20210423180254.706537-4-alex.kanavin@gmail.com> <CAAnfSTsz5L60dtRGqCAam_1DCV3Lhb40GZ+8HMvEGC8RitwgKA@mail.gmail.com>
 <CANNYZj8p6061c24KP=0QxrXsAq+Qp0oAGSyaYzr10=Zq=BtvZw@mail.gmail.com> <CAAnfSTtOtEMXhYZBaf23GCr+DCR_t+bFp3PgNJ8-82kNSXszCA@mail.gmail.com>
In-Reply-To: <CAAnfSTtOtEMXhYZBaf23GCr+DCR_t+bFp3PgNJ8-82kNSXszCA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 10 May 2021 15:13:32 +0200
Message-ID: <CANNYZj_yMEhTz08E33PLGcMVZMHhE=zJbnkHYW5zxprbhg9i3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] oeqa/selftest: transition to weston images
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000bc3b505c1f98cc9"

--0000000000000bc3b505c1f98cc9
Content-Type: text/plain; charset="UTF-8"

How about now?

http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/commit/?h=contrib/akanavin/transition-to-weston&id=1cd449267db015fb89f6c3f2c85fe855fd845015

Alex

On Mon, 10 May 2021 at 13:08, Ross Burton <ross@burtonini.com> wrote:

> The only-x11 target is close but it should drop the opengl distro feature
> too.
>
> Ross
>
> On Tue, 4 May 2021 at 19:04, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > On Tue, 4 May 2021 at 19:01, Ross Burton <ross@burtonini.com> wrote:
> >>
> >> Hi Alex,
> >>
> >> First, I love to see this. :)
> >>
> >> However, using this as a convenient starting point: if both nodistro
> >> and Poky have OpenGL enabled then there's no test cases for the non-GL
> >> configuration anymore, which is important for headless systems, of
> >> which there are many.  Whilst I agree that graphical systems that
> >> don't support modern rendering in some way are on the way out, this
> >> trend isn't across all of our target platforms.
> >>
> >> Can you add a configuration to the autobuilder along the like of
> >> poky-altconfig that does at least one build without GL?
> >> core-image-base as a *minimum* but a core-image-sato should continue
> >> to work.
> >
> >
> > I already have a companion patchset for the autobuilder:
> >
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=contrib/akanavin/transition-to-weston
> >
> > I don't think it has the non-opengl build yet, but I could easily add
> that. Can you take a look at the patches and maybe propose something
> specific to add? I can simply add a patch to my set if you write one.
> >
> > Alex
> >
> >
> >
>

--0000000000000bc3b505c1f98cc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How about now?</div><div><br></div><div><a href=3D"ht=
tp://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/commit/?h=
=3Dcontrib/akanavin/transition-to-weston&amp;id=3D1cd449267db015fb89f6c3f2c=
85fe855fd845015">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilde=
r-helper/commit/?h=3Dcontrib/akanavin/transition-to-weston&amp;id=3D1cd4492=
67db015fb89f6c3f2c85fe855fd845015</a></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, 10 May 2021 at 13:08, Ross Burton &lt;<a href=3D"mailto:ross@burt=
onini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The only-x11 target is close but it should dro=
p the opengl distro feature too.<br>
<br>
Ross<br>
<br>
On Tue, 4 May 2021 at 19:04, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; On Tue, 4 May 2021 at 19:01, Ross Burton &lt;<a href=3D"mailto:ross@bu=
rtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Alex,<br>
&gt;&gt;<br>
&gt;&gt; First, I love to see this. :)<br>
&gt;&gt;<br>
&gt;&gt; However, using this as a convenient starting point: if both nodist=
ro<br>
&gt;&gt; and Poky have OpenGL enabled then there&#39;s no test cases for th=
e non-GL<br>
&gt;&gt; configuration anymore, which is important for headless systems, of=
<br>
&gt;&gt; which there are many.=C2=A0 Whilst I agree that graphical systems =
that<br>
&gt;&gt; don&#39;t support modern rendering in some way are on the way out,=
 this<br>
&gt;&gt; trend isn&#39;t across all of our target platforms.<br>
&gt;&gt;<br>
&gt;&gt; Can you add a configuration to the autobuilder along the like of<b=
r>
&gt;&gt; poky-altconfig that does at least one build without GL?<br>
&gt;&gt; core-image-base as a *minimum* but a core-image-sato should contin=
ue<br>
&gt;&gt; to work.<br>
&gt;<br>
&gt;<br>
&gt; I already have a companion patchset for the autobuilder:<br>
&gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder=
-helper/log/?h=3Dcontrib/akanavin/transition-to-weston" rel=3D"noreferrer" =
target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuild=
er-helper/log/?h=3Dcontrib/akanavin/transition-to-weston</a><br>
&gt;<br>
&gt; I don&#39;t think it has the non-opengl build yet, but I could easily =
add that. Can you take a look at the patches and maybe propose something sp=
ecific to add? I can simply add a patch to my set if you write one.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000000bc3b505c1f98cc9--
