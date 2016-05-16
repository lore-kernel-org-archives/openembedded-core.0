Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3D0770C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 22:37:38 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id m9so662665ige.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sHfz2KxqEbhOYGLDDeennD++ZwEcKi2uQVLfjxWujCI=;
	b=M7KOEF/LizJY6njEvTiLJShYrP7ZNGBqcsWx7r5EnQUlqP+DybSQJcr3eF3gWQk4Ej
	qtWslVj8AL94EvFB2WYuyWLZHgbL/O8AZbssNMSvxjk20SCV6vS4ktejIz7e7rCvf8/M
	FmfdiEi2kYuBXYtvIlXzVdxRgE39Ismk2NqSQZ97TyXJOTCXO8ZmjRyswXOkyQmNrr83
	5WxMcgLz1y9imqvD6KkKJqEBaZU7ILg+inx4I9vS4J6l4GO/dbziTCrAXZmvvUKV9Nfr
	VmdUQuMIM82FvmFPASV2Y5BdfkaDxt7P4dIfVMtFld4PsEh+1BuiXCeWw2xWLvwKkTTM
	ypuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sHfz2KxqEbhOYGLDDeennD++ZwEcKi2uQVLfjxWujCI=;
	b=h3yX8ZdqJ2mHwJlYhbEZGQx/fOUtDeKwubQD84/i0l9QgRcTdl5a/kGn65qxVYMoMy
	HDlEcS1D1KwkrB21KMcqKZ36oXzpB7zfKFJXYXuPAJ66tBrvRgB4G825J7PoPFLtu0YT
	0ZRT+HLgrytuRPSBgHExb5deFzRVb+xYp/vskoQvFv3a4xSYA9DodjY1PDe68L476A7m
	FRlFge8Gy6PrVCD5jU6T76sSdwdMVKlfmxAaoHcksggog63GeBhKmxBhjOk8sBJmIrnY
	tfUm5/ejNyA7977s8bHRozo9LrwQWkBIPwaIu8BkmADPbh3HKFswwIWsmrdHp5rsyRZm
	KogQ==
X-Gm-Message-State: AOPr4FXMH21jyNb0QPl5rlIrSiUiVAvhvAeu1hcUPqqLIeH34GblTOsdRMwPS2pxbgu62rF39qkI7KbtzjfvMw==
X-Received: by 10.50.160.3 with SMTP id xg3mr12801897igb.87.1463438259457;
	Mon, 16 May 2016 15:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 16 May 2016 15:37:20 -0700 (PDT)
In-Reply-To: <1463207114.9746.139.camel@linuxfoundation.org>
References: <289ee855c6244dfd7a5b1e0f2a4a27ad236ac60c.1462476586.git.chris_larson@mentor.com>
	<e889a21f09e4bcbddd05ee90a914600d33540dfa.1462489051.git.chris_larson@mentor.com>
	<1463207114.9746.139.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 16 May 2016 15:37:20 -0700
Message-ID: <CABcZAN=p25pZm=vxmYM_5SW6buRM91910YUw5uRfqVLmddAX7g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCHv2 2/3] mkelfimage: obey LDFLAGS, sort out HOST_ flags
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
X-List-Received-Date: Mon, 16 May 2016 22:37:39 -0000
Content-Type: multipart/alternative; boundary=001a11348a7a9b2a550532fd45b9

--001a11348a7a9b2a550532fd45b9
Content-Type: text/plain; charset=UTF-8

On Fri, May 13, 2016 at 11:25 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-05-05 at 15:59 -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > We weren't consistent in the HOST_ (aka BUILD_) and non-HOST_ flags,
> > so we
> > were using BUILD_CPPFLAGS to compile target stuff, for example. Sort
> > that out,
> > and make sure we obey LDFLAGS.
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  .../mkelfimage/mkelfimage/cross-compile.patch      | 86
> > +++++++++++++++-------
> >  meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |  4 +-
> >  2 files changed, 63 insertions(+), 27 deletions(-)
>
> http://errors.yoctoproject.org/Errors/Details/62910/
>
> Could you check the patch please?


Looking at this now, sorry for the delay, went from having a sick kid to
being sick myself, the past few days.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11348a7a9b2a550532fd45b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, May 13, 2016 at 11:25 PM, Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On Thu, 2016-05-05 at 15:59 -0700, Christopher La=
rson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We weren&#39;t consistent in the HOST_ (aka BUILD_) and non-HOST_ flag=
s,<br>
&gt; so we<br>
&gt; were using BUILD_CPPFLAGS to compile target stuff, for example. Sort<b=
r>
&gt; that out,<br>
&gt; and make sure we obey LDFLAGS.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@m=
entor.com">chris_larson@mentor.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../mkelfimage/mkelfimage/cross-compile.patch=C2=A0 =C2=A0 =C2=
=A0 | 86<br>
&gt; +++++++++++++++-------<br>
&gt;=C2=A0 meta/recipes-devtools/mkelfimage/<a href=3D"http://mkelfimage_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">mkelfimage_git.bb</a> |=C2=A0 4 =
+-<br>
&gt;=C2=A0 2 files changed, 63 insertions(+), 27 deletions(-)<br>
<br>
</span><a href=3D"http://errors.yoctoproject.org/Errors/Details/62910/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/62910/</a><br>
<br>
Could you check the patch please?</blockquote></div><br>Looking at this now=
, sorry for the delay, went from having a sick kid to being sick myself, th=
e past few days.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">=
Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mento=
r Graphics</div></div>
</div></div>

--001a11348a7a9b2a550532fd45b9--
