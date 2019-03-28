Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 147C97D19E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:46:09 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id s15so7417649qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=go+ZUEN+v0GBWmMkBiNK2LBbETNqNmraf0crTQTbKr4=;
	b=D03S75LQs1KT9Ze7l5JL25zZJDGjtuGW88o9jCxN0BG08kaElRSnjEPyHI5c7lOvMh
	h+Q61/HYCxL1ZlGiWMnGS+CKFogFyA2p314sTBlAtVaYJWx0suFb3GbY1ysOKOC1nxic
	9iTiSP6NlmOMRlTK1is+yKzbj2eNgfB09LleIM6kQ8JlXHQNkw1W0rQG+TK8NEhM4Vmw
	i1VcVtYyES3Yp8BThkc60SnQ8pME2TOC954QpJYkwDfTsFJA8J6/PIaPe4qJPLGG29vi
	/+oRWxEnpeU8BhdUMs7SBD9hWUl0FVCLWdSQq40anZY+SkKI9mpzrfLjGWfHY3tmC53m
	tNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=go+ZUEN+v0GBWmMkBiNK2LBbETNqNmraf0crTQTbKr4=;
	b=jj/sV8pTU22TeGzkP1XcNMHTjk7hGItyMoj+tpox8vggUu3iivDwUujzQ3FG6HFA5g
	Eth8fKED+IP2NE8ye7bQHX7YSxATxpZZ6yVP1ZUGoqKgNUlv04+9RMeIUinClWN7W5mZ
	uhkjjioLU3s5KoHmV4vPxVs2W35jBdH9pLGdVGphD0fq/PzbWYqckuI3gMQIjv/3UYLb
	nO73bSVeqlyCKgKKWpty4e7bwoAM9fboL1dliLnbGhbly0/EcRRRh296ayQFBnUUarIg
	43UDi3DrtMp/z6xpOFz7hARoU4+nyn5lUKSqNZUZ+4gRKFGywQGz1NAX0ZTPuVCnJ7GP
	zCPA==
X-Gm-Message-State: APjAAAVF0fnOTxpsaBfFfkJrAAMKPT2Al/eNImFNiLynQODLmufioA1Z
	bqn3xGu2xId7Vijja3ce76beNJq+x7l8oZTEaxI=
X-Google-Smtp-Source: APXvYqwKDKkkQgwqMdESq0jOPe5Rk5uueU5NCisPOvTdPB9++011iuIsqNQBJmN/trTamswlWoJQBcDcU+kLLE5XtEA=
X-Received: by 2002:ac8:2f10:: with SMTP id j16mr36752607qta.29.1553780770612; 
	Thu, 28 Mar 2019 06:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190326120157.4397-1-ross.burton@intel.com>
	<CAMKF1sprxcvAtLQsu-dueRZtvPXvo+ozg9HZ+w+yU417sU3AfQ@mail.gmail.com>
	<CAJ86T=VZpLxYwh2Su+HLFCJFvbEm043fyiaBf4Dezo66O-h=aQ@mail.gmail.com>
	<CAJTo0LbEU7BUHyYYCOi7rvEFmyPq5te1fJhPiW4yTYbtHVpGZA@mail.gmail.com>
In-Reply-To: <CAJTo0LbEU7BUHyYYCOi7rvEFmyPq5te1fJhPiW4yTYbtHVpGZA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Mar 2019 06:45:58 -0700
Message-ID: <CAMKF1soXDhAXL0vOyJUDBEjhzajnfMouZqsUcF01CEnu4aQZUQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib: set glib-specific cross properties
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
X-List-Received-Date: Thu, 28 Mar 2019 13:46:10 -0000
Content-Type: multipart/alternative; boundary="000000000000e42d59058527c61b"

--000000000000e42d59058527c61b
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 28, 2019 at 5:48 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Tue, 26 Mar 2019 at 19:41, Andre McCurdy <armccurdy@gmail.com> wrote:
> > > > +growing_stack = false
> > >
> > > this is mostly true for arches we support but maybe a comment
> > > to check it when doing explicit arch ports ( e.g. arm can grown both
> ways)
> >
> > Not on EABI or any other ARM ABI which could possibly be targeted by
> > OE... unless you have evidence to prove otherwise?
>
> Evidence, no.  Anecdotally:
>
> $ grep glib_cv_stack_grows *
> arc-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> arm-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> arm-darwin:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> arm-darwin8:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> ix86-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> microblaze-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips64el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips64el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsel-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsel-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa32r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa32r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa32r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa32r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa64r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa64r6el-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa64r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mipsisa64r6-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> mips-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> nios2-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> powerpc-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> riscv32-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> riscv64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> sh-common:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> sparc-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
> x86_64-linux:glib_cv_stack_grows=${glib_cv_stack_grows=no}
>
> Yes, this technique needs to be extended and generalised so it can be
> overridden on a per-platform basis, but for now it appears that
> everything we care about has the same values.


All I asked was to add a comment about it
So if someone is porting OE to new architecture then this will be a great
hint to check for


>
> Ross
>

--000000000000e42d59058527c61b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 28, 2019 at 5:48 AM Burton, Ross &lt;<a href=3D=
"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Tue, 26 Mar 2019 at 19:41, Andre McCurd=
y &lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gm=
ail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; +growing_stack =3D false<br>
&gt; &gt;<br>
&gt; &gt; this is mostly true for arches we support but maybe a comment<br>
&gt; &gt; to check it when doing explicit arch ports ( e.g. arm can grown b=
oth ways)<br>
&gt;<br>
&gt; Not on EABI or any other ARM ABI which could possibly be targeted by<b=
r>
&gt; OE... unless you have evidence to prove otherwise?<br>
<br>
Evidence, no.=C2=A0 Anecdotally:<br>
<br>
$ grep glib_cv_stack_grows *<br>
arc-common:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
arm-common:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
arm-darwin:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
arm-darwin8:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
ix86-common:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
microblaze-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips64el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips64el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips64-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips64-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsel-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsel-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa32r6el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa32r6el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa32r6-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa32r6-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa64r6el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa64r6el-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa64r6-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mipsisa64r6-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
mips-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
nios2-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
powerpc-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
riscv32-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
riscv64-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
sh-common:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
sparc-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
x86_64-linux:glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}<br>
<br>
Yes, this technique needs to be extended and generalised so it can be<br>
overridden on a per-platform basis, but for now it appears that<br>
everything we care about has the same values.</blockquote><div dir=3D"auto"=
><br></div><div dir=3D"auto">All I asked was to add a comment about it</div=
><div dir=3D"auto">So if someone is porting OE to new architecture then thi=
s will be a great hint to check for=C2=A0</div><div dir=3D"auto"><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
<br>
Ross<br>
</blockquote></div></div>

--000000000000e42d59058527c61b--
