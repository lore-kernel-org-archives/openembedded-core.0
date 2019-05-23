Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id EF6717D5C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 13:52:33 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id w25so3801995qkj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pCcJ4xVTDWCT+QOZAliexmqVy+PlKdDO5JtPk1LHU4o=;
	b=hhVe8feioVZZsXDUtlRagO0fJXDUKcJFiS0i5yChQzd7qQTNna5P5ahlQUUPyy3CXS
	BQjD0X7zMdeVtSqU6baUqi8I5/0McisyaJWrMMPII0+onPZSm3MMJhQrubsz16iz3jqI
	YxgRpViIdUyoHcRmkVb1c7ekDxhF2OX7i+PliuiZlZWzWrWFOyLI1ZvD6z1fxVbA2aCl
	jjLxcBONGAvFR9G3BrCJdLegKC6YC6gEFXn3uyGf3s8EaY0Ixhp3d63PEwyN6aPPlYEl
	hckGK5SJJCPeyoiwKKY8XOPnqVU4Vi2utkV93ncpLjhnpMBYmLo9GNkbBt3A2cCCrqDr
	hyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pCcJ4xVTDWCT+QOZAliexmqVy+PlKdDO5JtPk1LHU4o=;
	b=Ysh00lkEwHbFw72PTZU58GQfrHLtNmbd8JjnINerbzniqMb2+16FA6WZBVjjfx9ra6
	/0oI4G3larwIA5ywEZYRtKozknr6AcVLkqbEPOlsgT+SGXqDxKRMhokP9d+lCl6iicSw
	flD5yyItabS2QTY+XUB1/687AKvMxI+DKe/RHIVapeHSDdKo2hmfeppV00F/Yctsj+x9
	CYAGn3jcq4LXoR14FK7zMD1tOh3R/MqSEL8f/435STxIdh7GSf5925M8GgOLgX/CuBy4
	+NX3bg1sZzIDDrpt7+wbxfb5FiwkvbVk1BHnw3aBLRQYAPiJbmRHZYWNKEc/jJ4cGr/C
	PwLQ==
X-Gm-Message-State: APjAAAW2dLcsfUQl/VMpxvDhbyFiHVTavvMkeItVOnKeW7/22L6vQ6Y2
	cS6bDjrSq+2CRit6rkdM3NLN82W/NqIWNWiOukQgS3Te
X-Google-Smtp-Source: APXvYqzskbCsBc7+lhTxORF90Ybz+cwbScLuX9PuPQQnk+Rd8NQZbvlYuY+rCCXuzHzVXVqMf1ZtJ0b50Z/qvqnP2LQ=
X-Received: by 2002:a05:620a:14a1:: with SMTP id
	x1mr58374547qkj.312.1558619554499; 
	Thu, 23 May 2019 06:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190522013228.7591-1-raj.khem@gmail.com>
	<20190522013228.7591-3-raj.khem@gmail.com>
	<20190522064909.GA9621@localhost>
	<CAMKF1sqj0+y_55xVf6SRjS1czodtioUYxVv1tbWU4_7AKYrzLw@mail.gmail.com>
	<20190523061010.GA11736@localhost>
In-Reply-To: <20190523061010.GA11736@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 May 2019 06:52:23 -0700
Message-ID: <CAMKF1so0kA0Ugk=c9qnW2bsTo78wCxHfNEjOuMbAxQbfU+rPvA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] elfutils: Fix eu-* utils builds for musl
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
X-List-Received-Date: Thu, 23 May 2019 13:52:34 -0000
Content-Type: multipart/alternative; boundary="000000000000e2d11705898e64f0"

--000000000000e2d11705898e64f0
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 11:10 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, May 22, 2019 at 04:29:33PM -0700, Khem Raj wrote:
> > On Tue, May 21, 2019 at 11:49 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:
> > > >...
> > > > PN and PN-binutils is not empty anymore on musl
> > > >...
> > > > ++#if !defined(FNM_EXTMATCH)
> > > > ++# define FNM_EXTMATCH (1 << 5) /* Use ksh-like extended matching.
> */
> > > > ++#endif
> > > >...
> > >
> > > This might fix the compilation, but it is horribly wrong.
> > >
> > > It passes a flag to a function that this function does not understand.
> > >
> > > In the best case the function returns with an error on unknown flags.
> > >
> > > In the worst case the function does silently something different from
> > > what the caller expects it to do.
> > >
> >
> > I forgot that the API is provided by libc here so mimic'ing the define
> > infact could
> > cause pain. I think its better to nullify it in this case where it is
> > being used in these
> > files.
>
> Just looking at the usage in src/elfcompress.c, my first impression is
> that this tool is mostly useless without a properly working FNM_EXTMATCH.
>
> Are the eu-* utils actually important in the cases where space is so
> limited that people are forced to use musl instead of glibc?
>
>
They are primarily needed for testing and now we have good auto testing
infra it would be good to build them

cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--000000000000e2d11705898e64f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 22, 2019 at 11:10 PM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Wed, May 22, 2019 at 04:29:33PM -0700, Khem Raj wrote=
:<br>
&gt; On Tue, May 21, 2019 at 11:49 PM Adrian Bunk &lt;<a href=3D"mailto:bun=
k@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, May 21, 2019 at 06:32:28PM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt;...<br>
&gt; &gt; &gt; PN and PN-binutils is not empty anymore on musl<br>
&gt; &gt; &gt;...<br>
&gt; &gt; &gt; ++#if !defined(FNM_EXTMATCH)<br>
&gt; &gt; &gt; ++# define FNM_EXTMATCH (1 &lt;&lt; 5) /* Use ksh-like exten=
ded matching. */<br>
&gt; &gt; &gt; ++#endif<br>
&gt; &gt; &gt;...<br>
&gt; &gt;<br>
&gt; &gt; This might fix the compilation, but it is horribly wrong.<br>
&gt; &gt;<br>
&gt; &gt; It passes a flag to a function that this function does not unders=
tand.<br>
&gt; &gt;<br>
&gt; &gt; In the best case the function returns with an error on unknown fl=
ags.<br>
&gt; &gt;<br>
&gt; &gt; In the worst case the function does silently something different =
from<br>
&gt; &gt; what the caller expects it to do.<br>
&gt; &gt;<br>
&gt; <br>
&gt; I forgot that the API is provided by libc here so mimic&#39;ing the de=
fine<br>
&gt; infact could<br>
&gt; cause pain. I think its better to nullify it in this case where it is<=
br>
&gt; being used in these<br>
&gt; files.<br>
<br>
Just looking at the usage in src/elfcompress.c, my first impression is <br>
that this tool is mostly useless without a properly working FNM_EXTMATCH.<b=
r>
<br>
Are the eu-* utils actually important in the cases where space is so <br>
limited that people are forced to use musl instead of glibc?<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">They are primari=
ly needed for testing and now we have good auto testing infra it would be g=
ood to build them=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--000000000000e2d11705898e64f0--
