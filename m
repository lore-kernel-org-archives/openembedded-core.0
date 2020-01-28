Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 27CFD7FE4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 17:48:07 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g23so8645600vsr.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 09:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D9cwEiuQb+m9He3Wa3f8LG92hiiB9hbXU0psU4PyMCQ=;
	b=FKsvVySn0+ng8rJkopSxQ5y4fOfneNP0zJ7luH+NK9QR6EfvdyGXchgfc+lRyBGvOl
	9k9pWLhpdkPbdlpxJbBDYnfGbAhk5VDEJcEb4GWAZhue1V9ucPxXYWNXGMPHEu6nm6RX
	EptkzM72znMXRYq2S5zEJS7blErMcs2KXtKoJt2Uj+fYxhmmanTuIoIdbIgHz6iTKxWi
	VbDVCvF4TC5wLA7ayef51jh4ZZEPtufHh9XSUaN8NhqE/6cnnB5VozSmMmIkM2yQmie3
	+dHoCWlLJ71fqyuNqeFzYd9YSbKmrEQ6Sg/YlmETKP6kQk+SKnQsArCqa/EqqBeFc+up
	AzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D9cwEiuQb+m9He3Wa3f8LG92hiiB9hbXU0psU4PyMCQ=;
	b=CHl9I8s4H9Zuj0FpLcIgcpSmOzjtb7vYXDdyL564D797sIqAU6MQK6ihb+f41poCjj
	O4AB7S9OMhIedAVe85CkJSL3V7SFKNbWTYlpWZgAlq/FxmOTw3VbIxSk8CY/AO7VaaFu
	md5WPXDtxZifEkwimTsn0eEhsTaQmlCOyd5au1YBd8MrA1r5ABbk3MbWI+IlOO0DXtKl
	4aU5z+AIBSHWDLWpWAYQz7vJTNCkcoz5U1fMbS3oGmphGGZrdV29nOSQ1duQBoXSPqjd
	7vxzNFIboOnUKd1ncDE5ZNMz4mJQBcaVazg5r4JXO6JtwMTAaaM8a8BfmkLmB75N1dj+
	ByRw==
X-Gm-Message-State: APjAAAX+dQdoJji7X4ca4zJ6z9WNiGmIYypPt61RME+UJ07040gJE235
	a7MrtJN9G/VsWhTWl5bLchg7U51LRJrerb6N3Pc=
X-Google-Smtp-Source: APXvYqx2ZzXWkFoCrJU+ukHA2fogbncu7VqJlEXGAz9t/HkCxwsU7CCnjZSSgn/c/ubvOAqx5n7lx8c0JizGe7pi9Zo=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr14023364vsa.25.1580233688034; 
	Tue, 28 Jan 2020 09:48:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
	<20200128110213.3ji3swjy2km22d7e@jama>
	<CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
In-Reply-To: <CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jan 2020 18:47:56 +0100
Message-ID: <CANNYZj-e+_y_=FbvoTALYduvi=yRy7j+VhDqHtr8nvmzkp1msA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Tue, 28 Jan 2020 17:48:07 -0000
Content-Type: multipart/alternative; boundary="000000000000a3303c059d36d37a"

--000000000000a3303c059d36d37a
Content-Type: text/plain; charset="UTF-8"

But 2.31 hasn't yet been released or tagged?

http://sourceware.org/git/?p=glibc.git


Alex

On Tue, 28 Jan 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
>> > Drop ppc 8xx clear cache optimization, which we have been carrying
>> > through eglibc days, it has been redone in glibc now
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
>> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>>
>> ...
>>
>> > diff --git a/meta/recipes-core/glibc/glibc-version.inc
>> b/meta/recipes-core/glibc/glibc-version.inc
>> > index dca1916e80..c2cfb7e2f1 100644
>> > --- a/meta/recipes-core/glibc/glibc-version.inc
>> > +++ b/meta/recipes-core/glibc/glibc-version.inc
>> > @@ -1,6 +1,6 @@
>> >  SRCBRANCH ?= "master"
>> >  PV = "2.30.9000"
>>
>> Should this be 2.31 if the SRCREV is the final version?
>
>
> Yes
>
>
>>
>> > -SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
>> > +SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
>> >  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
>> >
>> >  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>> ...
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a3303c059d36d37a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But 2.31 hasn&#39;t yet been released or tagged?</div=
><div><br></div><div><a href=3D"http://sourceware.org/git/?p=3Dglibc.git">h=
ttp://sourceware.org/git/?p=3Dglibc.git</a></div><div><br></div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 28 Jan 2020 at 17:06, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan =
28, 2020 at 3:02 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Sun, Jan 26, 2020 at 11:27:4=
3AM -0800, Khem Raj wrote:<br>
&gt; Drop ppc 8xx clear cache optimization, which we have been carrying<br>
&gt; through eglibc days, it has been redone in glibc now<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glibc/<a href=3D"http://cross-localedef-native_2.31.bb" rel=
=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.31.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
<br>
...<br>
<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-=
core/glibc/glibc-version.inc<br>
&gt; index dca1916e80..c2cfb7e2f1 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; +++ b/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 SRCBRANCH ?=3D &quot;master&quot;<br>
&gt;=C2=A0 PV =3D &quot;2.30.9000&quot;<br>
<br>
Should this be 2.31 if the SRCREV is the final version?</blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yes=C2=A0</div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
&gt; -SRCREV_glibc ?=3D &quot;def9c08c94da60bfb746644d56cffbe7a9de3477&quot=
;<br>
&gt; +SRCREV_glibc ?=3D &quot;352bb99754ae7c83ff1b974f9c52244e974c9410&quot=
;<br>
&gt;=C2=A0 SRCREV_localedef ?=3D &quot;cd9f958c4c94a638fa7b2b4e21627364f1a1=
a655&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/=
git/glibc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glib=
c.git</a>&quot;<br>
...<br>
</blockquote></div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a3303c059d36d37a--
