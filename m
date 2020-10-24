Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.18369.1603576244872985726
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2020 14:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rdsa3e0t;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id x16so5593957ljh.2;
        Sat, 24 Oct 2020 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jMajJHo+rMvfR9ggIUhvvSvF+DBLK1mHPrB8gqDOnqM=;
        b=rdsa3e0tHcN8R7TlyaJCYe0HN9KiUVshG9xGpWripGO+D4fiuKpvFffBv3wMpQL/+t
         FyQJ1apaxYvPR7Nx2U55CNtucCQ1L97jHTezBbtSgXiRVds0+dddfcQj9O2WOCn/XgAl
         ZwQQ2ixFqL3Bx+VJRLVhfDXLp0pMc8uBeVYx+TDC4gk1LWRjWOVa04IHh4+DwbNU8wJw
         A47bs/vQ5yEfFKatVq7sqYaMVlCN62MxBvxaeDYbItFRBU9DyoG2CW9cqD7/Lbzb76k3
         G07ePue5UNYSr9l0zfkpYSkU0GBtkVWjZUefo38vjLbqmQKsG5UfTKAbk66CXp8OwdqX
         H/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jMajJHo+rMvfR9ggIUhvvSvF+DBLK1mHPrB8gqDOnqM=;
        b=ufPTrTLaTu9yuW4verH+sPvd9JobA9TN1TzLiR25VzavRZJ1Fflb7EPu2rwQ7OeyW9
         h7dJDu5gSJFvOK+UQKHtrJAqnlC/G/+szAJ35aG8wb0oekmEFublkU+3cjiOD8zApYMb
         ljNPifGtIOukogYt5DcSACb0BqaDW4kDv9Vb+C0wlRtGJSVN8B1/yA96qNfFOmv7IRVz
         LWxF1rX/b1wv5hoVc2bOcxCybmTuJFVdFo1upqfJ2bDxd1DgMJB3RdxefHH94h38uPyl
         llBS0QwhpFY/MM4CqZAZqAL87ZOCjXhnsGJo3nImvV+zVMsx6UGfhCZ5V4KCaV9y3NvV
         b+lA==
X-Gm-Message-State: AOAM532ktIlELiD9+65pyTr2F5CfyuDCWwy0GEYQj0twefVV8/49j3/D
	N0aT5SVd69VdjIOH3yRyo/3ZaMF/r7WcvLtDWIA=
X-Google-Smtp-Source: ABdhPJyvxlgUMh8Ht2o9ufHeq35njPqBiwO41qUVc1hXJiAU/9nO6GlqiaW4FqQ1F9193sRqQOY2SFDYH8ySXFU8wUU=
X-Received: by 2002:a2e:8985:: with SMTP id c5mr3390520lji.406.1603576242761;
 Sat, 24 Oct 2020 14:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <1640E842B1461A14.10923@lists.yoctoproject.org> <CAGAf8LwEANwgRoXr39xJ1BP5t3XYb9B_8Sf2fYBx_-CfiRAB9Q@mail.gmail.com>
 <CANNYZj_g=0mt7d+f4Gu0HhmikgZ8M6gpGStZLtsDgRqSBXH+vQ@mail.gmail.com>
 <CAGAf8Lzf2NV+MTKimLqnO=uBZ2DizrhCefLgkj3oBZSqkRoKUA@mail.gmail.com> <CANNYZj9Pu-y8dP0MmMy2K=Y2ns+Rmy7tnBVW6bFs1TU_43PwJw@mail.gmail.com>
In-Reply-To: <CANNYZj9Pu-y8dP0MmMy2K=Y2ns+Rmy7tnBVW6bFs1TU_43PwJw@mail.gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Sat, 24 Oct 2020 21:51:18 +0000
Message-ID: <CAHMutrbCQptbtdbQFRPz_o2OomMyGVYuyv-gPUABBssrjbmw7Q@mail.gmail.com>
Subject: Re: [oe] [yocto] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>, Tim Orling <ticotimo@gmail.com>, 
	yocto@lists.yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000051f59505b271b080"

--00000000000051f59505b271b080
Content-Type: text/plain; charset="UTF-8"

I don't believe this is about a certain amount of cash in any way and I
think it's unfair to say it would be,
and I also believe that this has been called out by Tim and others several
times with little to no response
on someone offering to help out and those discussions need to be accounted
for, it isn't just about this last
message.

You've had enough time to port code to python3, and there has been an extra
effort to maintain this layer for
longer than it should have already.

If you have a product based on python2, or you use it in some way, at this
point, you need to allocate time to
work on it and maintain it (to be honest you should have started to
help out since several years ago),
simple as that, there's nothing else to read between the lines.

Again, as Alex said, "you" isn't targeted to anyone in specific, its simply
referring to anyone using it
(and probably complaining about support for it)

Alejandro

On Sat, 24 Oct 2020 at 20:29, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Right, I guess my usage of 'you' was ambiguous. It was not targeted at you
> specifically, my apologies for that.
>
> Alex
>
> On Sat, 24 Oct 2020 at 22:26, Zoran Stojsavljevic <
> zoran.stojsavljevic@gmail.com> wrote:
>
>> I do get this.
>>
>> But if you deliver/target this message to me, you are barking under
>> the wrong tree.
>>
>> Best Regards,
>> Zoran
>>
>> On Sat, Oct 24, 2020 at 10:22 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > I am not complaining or bragging. I only want to set expectations, in
>> public, and clearly. Otherwise some people will treat the project
>> contributors as their unpaid contractors, and get upset when help is not
>> given, or work is not done for them.
>> >
>> > Alex
>> >
>> > On Sat, 24 Oct 2020 at 19:38, Zoran Stojsavljevic <
>> zoran.stojsavljevic@gmail.com> wrote:
>> >>
>> >> Alex,
>> >>
>> >> Either do it voluntarily, either do not.
>> >>
>> >> Do not complain, or brag about it.
>> >>
>> >> We all understand Open Source rules, or we do not, do we???
>> >>
>> >> Thank you,
>> >> Zoran Stojsavljevic
>> >> _______
>> >>
>> >>
>> >>
>> >>
>> >>
>> >> On Sat, Oct 24, 2020 at 12:54 PM Zoran via lists.yoctoproject.org
>> >> <zoran.stojsavljevic=gmail.com@lists.yoctoproject.org> wrote:
>> >> >
>> >> > > I have absolutely no need for python2, I made this abundantly
>> >> > > clear when I created the meta-python2 layer.
>> >> >
>> >> > WTH? Let me tell you how I really feel.
>> >> >
>> >> > I  have absolutely no need for python2, as well.
>> >> >
>> >> > > You are not paying me to do this. You cannot pay me enough
>> >> > > to do this. Period. Support yourself.
>> >> >
>> >> > What is the amount of cash for you, you'll consider it enough to
>> >> > do that???
>> >> >
>> >> > Better... What is the real message behind this/yours "announcement"?
>> >> >
>> >> > Thank you,
>> >> > Zoran
>> >> > _______
>> >> >
>> >> > On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com>
>> wrote:
>> >> > >
>> >> > > I have absolutely no need for python2, I made this abundantly
>> clear when I created the meta-python2 layer.
>> >> > >
>> >> > > If you depend upon continuing support of python2 via the
>> meta-python2 layer, this is your call to arms.
>> >> > >
>> >> > > I was originally intending to abdicate any support after the 3.1
>> "dunfell" release, but managed to somehow continue supporting it into the
>> crest of the 3.2 "gatesgarth" release.
>> >> > >
>> >> > > I will stop all support and actively refuse lo respond to any
>> emails and this layer will be dead and I have zero care in the world that
>> it stops being useful. I do not use it. I do not depend upon it. You are
>> not paying me to do this. You cannot pay me enough to do this. Period.
>> Support yourself.
>> >> > >
>> >> > > If this is not clear enough, I am happy to have a virtual video
>> call with you that you will not like.
>> >> > >
>> >> > > --moto-timo
>> >> > >
>> >> > >
>> >> >
>> >> >
>> >> >
>>
>
> 
>
>

--00000000000051f59505b271b080
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e;font-size:small">I don&#39;t believe this is about a certain amount of ca=
sh in any way and I think it&#39;s unfair to say it would be,</div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace;font-size:small">and I =
also believe that this has been called out by Tim and others several times =
with little to no response</div><div class=3D"gmail_default" style=3D"font-=
family:monospace;font-size:small">on someone offering to help out and those=
 discussions need to be accounted for, it isn&#39;t just about this last</d=
iv><div class=3D"gmail_default" style=3D"font-family:monospace;font-size:sm=
all">message.</div><div class=3D"gmail_default" style=3D"font-family:monosp=
ace;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace;font-size:small"><div class=3D"gmail_default">You&#39;ve ha=
d enough time to port code to python3, and there has been an extra effort t=
o maintain this layer for</div><div class=3D"gmail_default">longer than it =
should have already.</div><div class=3D"gmail_default"><br></div></div><div=
 class=3D"gmail_default" style=3D"font-family:monospace;font-size:small">If=
 you have a product based on python2, or you use it in some way, at this po=
int, you need to allocate time to</div><div class=3D"gmail_default" style=
=3D"font-family:monospace;font-size:small">work on it and maintain it (to =
be honest you should have started to help=C2=A0out since several years ago)=
,</div><div class=3D"gmail_default" style=3D"font-family:monospace;font-siz=
e:small">simple as that, there&#39;s nothing else to read between the lines=
.</div><div class=3D"gmail_default" style=3D"font-family:monospace"></div><=
div class=3D"gmail_default" style=3D"font-family:monospace;font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-family:monospace;font=
-size:small">Again, as Alex said, &quot;you&quot; isn&#39;t targeted to any=
one in specific, its simply referring to anyone using it=C2=A0</div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace;font-size:small">(and =
probably complaining=C2=A0about support for it)<br></div><div class=3D"gmai=
l_default" style=3D"font-family:monospace;font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:monospace;font-size:small">Alej=
andro</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Sat, 24 Oct 2020 at 20:29, Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>R=
ight, I guess my usage of &#39;you&#39; was ambiguous. It was not targeted =
at you specifically, my apologies for that.</div><div><br></div><div>Alex<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sat, 24 Oct 2020 at 22:26, Zoran Stojsavljevic &lt;<a href=3D"ma=
ilto:zoran.stojsavljevic@gmail.com" target=3D"_blank">zoran.stojsavljevic@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">I do get this.<br>
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
<br>
<br>
<br>
</blockquote></div>

--00000000000051f59505b271b080--
