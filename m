Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D70D7FECA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 16:06:04 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id w25so8155699qki.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5r04TPTIIDIFQ/tzO2fDarItnEbl4FoS9L7sUH/F178=;
	b=Y8CFnlJV75rDWjQaV2DF6PQ1H+doCBK853z+g/U2NVzwYZ7J4lmMFamP1w+gG9xM/K
	TK59R1spNlmiqnmJ9TINvJvOA4nseIttFJJK2KEoMKm9f2Htr34oJEyrXq0TTWWNf5tc
	gxpoq8gGHcwvt9IeyLtrbclyLaIaMLf4No7qNSwmz0RKPzSx/ic/uDYWlkCCd71V2Eaq
	5V+2+SR/Cij7wWc2VywKD/HBDDccowfejcUfSR1geAFNmo2yQ/kmvH2HI5NJ6M7Y8mIj
	oK5HjyB9DwOzMGIbK/roqRfiJW6SWiofiOqqvT3qgkIxEaqwUX69/f+aBhTyLOkjp2aj
	7F8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5r04TPTIIDIFQ/tzO2fDarItnEbl4FoS9L7sUH/F178=;
	b=rjesM5KXN4/GAY+R3VHlC4/pkV7X7ECDuU4ibVgqNGEcP0/m8yHo+wRYQnluCF/bQW
	57Z2eNuFiNxDd4LkUapPxChpifjcyOqHm6GynLe7mIyu7XmWEFmRm/fbQolcrtQ87D0l
	sxuHL+aGW/97X3BIZzS2WbsUmoTxG8nLFLbqaPFpCfyXK3UVAES7E08YuxdWJ3niqHn9
	6WCRVvzNTXu42Ds/im5yLnkG9MpqPqbuSB0Y/pCxNp7hxGrdgG3XNtSpLU6vkRymNXcB
	dDI3OgX1nJ6IaPwpS+PQFbwxN4w/KU4maJdgmdBf413JgaU5gdMOkVEtg+9PfSXTQyOi
	Ye+w==
X-Gm-Message-State: APjAAAUrYo/pp+VLElrZ6oJy54+tnldCmyUHctVlkkyT9vuFKhlXau8J
	GCvJgklzg14ztTVW6mazHkUExbi4r73p7nwbSxg=
X-Google-Smtp-Source: APXvYqzvvrP3di75L0rketTgr22zOSw6yexRQ7MQHHhQfxPXDXe45S/XR48nlG9jUpPdiNNhOhM5dFUAImA8ZPYcKI8=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr22561171qkg.71.1580227564709; 
	Tue, 28 Jan 2020 08:06:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
	<20200128110213.3ji3swjy2km22d7e@jama>
In-Reply-To: <20200128110213.3ji3swjy2km22d7e@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2020 08:05:53 -0800
Message-ID: <CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 28 Jan 2020 16:06:04 -0000
Content-Type: multipart/alternative; boundary="000000000000a8ad0c059d35661e"

--000000000000a8ad0c059d35661e
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
> > Drop ppc 8xx clear cache optimization, which we have been carrying
> > through eglibc days, it has been redone in glibc now
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>
> ...
>
> > diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> > index dca1916e80..c2cfb7e2f1 100644
> > --- a/meta/recipes-core/glibc/glibc-version.inc
> > +++ b/meta/recipes-core/glibc/glibc-version.inc
> > @@ -1,6 +1,6 @@
> >  SRCBRANCH ?= "master"
> >  PV = "2.30.9000"
>
> Should this be 2.31 if the SRCREV is the final version?


Yes


>
> > -SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
> > +SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
> >  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
> >
> >  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> ...
>

--000000000000a8ad0c059d35661e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Sun, Jan 26, 2020 at 11:27:43AM -0800=
, Khem Raj wrote:<br>
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
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
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

--000000000000a8ad0c059d35661e--
