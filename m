Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8D22D7F402
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:28:24 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o11so5780638qkg.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5SvhVotDUURqK9nTfNTzCRmFP4dzfn1vG2Qog85Ykkg=;
	b=e9TBIexIG6e9nYzkgt97EuAMfKuBas0TxJ3mwOjwnFZU/v8Qo8VUZ4AhhaB95UtuHL
	3lCh+GhCu4aMMzj8kWIadC9lPJtHL2j0H8dXzcDSFbcsvM+JsVYEzQ6uX9JgAXPrn733
	kZFiXvjwc+REVcdlaip3SKaeXHMsXKtO8Rs9UM6dKwNSTbt8MdQfQzjLyCkD95H29r54
	Le1UzkFSIxjaW68ZPRhahoo1ELAsYHlgsgX8aq09URlJaHvMBJp+sso7TpyqMOJSpkWy
	vqYYQQcclLrgCbH/dpdHkV7iNBNSJCjSC1miTwiecJAn+b2P5z1u0WE9a59vSQuUBbbM
	wHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5SvhVotDUURqK9nTfNTzCRmFP4dzfn1vG2Qog85Ykkg=;
	b=POxMXV2GF5U/c+C18a/v+t9UIDUUQPasboZvCuLONgqx1h4NDAfLMu4bsu6KDgNtWT
	ESNe/CEvwH1LQoqfU0EJxGg96k2QQ3Hh9I/rriDQvA5IspbF2+DLr/sOCrPCnsZERBr/
	O1vVByD1eSfHCrzwxbh1fjX8qBjKWcd4FTgzLXvZol/VUyZaJuDEqdkIxtBsiOWDgYkm
	QRvP4Q3eI3bmshn7/Q4PTh0jbvUMYhp2+HU98MvjylRzePsmp5Si1a5ssEK8S7sHKDus
	PfWYB2aZNboIKy0vkyV/lsa2cAjjLt9Hu1VuTQgrdmEPBqrtEZZtXB+7tCajTgHy8V3P
	Vl7Q==
X-Gm-Message-State: APjAAAUrxgAqa+JXnh/dJZOVZuA8/mH/LLqCBcWBQ6Op0EvYiu3uuBcw
	zgMCcXRIv4CgH7z6croJcfhci5m2kAoe+N5RE1E=
X-Google-Smtp-Source: APXvYqy5u8acvEBbX8zyhInzXr0XubfUPkxSIxVkBYo0r6ZVbwZvfGNFGfvZId6wBuQ1v1QQfkHk65+S80xIxh0KUNU=
X-Received: by 2002:a37:b002:: with SMTP id z2mr8602205qke.71.1567780105318;
	Fri, 06 Sep 2019 07:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
	<20190906072347.31616-2-richard.purdie@linuxfoundation.org>
	<CAMKF1so5hDAtGESfwjCNNGJtnikskPqQg2rFsTKdxYh-g9QXAQ@mail.gmail.com>
	<8ac92297f48538afe156290f1e60b80abf00f1dd.camel@linuxfoundation.org>
In-Reply-To: <8ac92297f48538afe156290f1e60b80abf00f1dd.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:28:14 -0700
Message-ID: <CAMKF1spJ-=S9YzNSP8ber6hZH7pu+PFjMQQ_3o5goGQX+CKxeA@mail.gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc-cross: Fix header file corruption problems
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
X-List-Received-Date: Fri, 06 Sep 2019 14:28:24 -0000
Content-Type: multipart/alternative; boundary="00000000000043778f0591e3403a"

--00000000000043778f0591e3403a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2019 at 7:23 AM <richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2019-09-06 at 07:15 -0700, Khem Raj wrote:
> >
> >
> > On Fri, Sep 6, 2019 at 12:24 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > gcc's makefile can move files, replacing with the contents
> > > "timestamp". This
> > > corrupts the headers and breaks things like the gcc testsuite.
> > >
> > > Add in a fix to ensure the headers are not corrupted through their
> > > hardlink copies.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > index e417b898734..95af6d89a9d 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > > @@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] =3D
> > > "${BUILDDIRSTASH}"
> > >  do_gcc_stash_builddir () {
> > >         dest=3D${BUILDDIRSTASH}
> > >         hardlinkdir . $dest
> > > +       # Makefile does move-if-change which can end up with
> > > 'timestamp' as file contents so break links to those files
> > > +       rm $dest/gcc/include/*.h
> > > +       cp gcc/include/*.h $dest/gcc/include/
> > >  }
> >
> > I think we moved them outside gcc dir isn=E2=80=99t it
>
> Not sure I follow? I think the patch is correct?
>

Yeah I think patch is fine since I was wondering about files from
gcc-runtime which got move

>
> Cheers,
>
> Richard
>
>

--00000000000043778f0591e3403a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 6, 2019 at 7:23 AM &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-09-06 at 07:15 -0=
700, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Sep 6, 2019 at 12:24 AM Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; gcc&#39;s makefile can move files, replacing with the contents<br=
>
&gt; &gt; &quot;timestamp&quot;. This<br>
&gt; &gt; corrupts the headers and breaks things like the gcc testsuite.<br=
>
&gt; &gt; <br>
&gt; &gt; Add in a fix to ensure the headers are not corrupted through thei=
r<br>
&gt; &gt; hardlink copies.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org=
</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/gcc/gcc-cross.inc | 3 +++<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; &gt; b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; &gt; index e417b898734..95af6d89a9d 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-cross.inc<br>
&gt; &gt; @@ -212,6 +212,9 @@ do_gcc_stash_builddir[cleandirs] =3D<br>
&gt; &gt; &quot;${BUILDDIRSTASH}&quot;<br>
&gt; &gt;=C2=A0 do_gcc_stash_builddir () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest=3D${BUILDDIRSTASH}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardlinkdir . $dest<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Makefile does move-if-change which =
can end up with<br>
&gt; &gt; &#39;timestamp&#39; as file contents so break links to those file=
s<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm $dest/gcc/include/*.h<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp gcc/include/*.h $dest/gcc/include/=
<br>
&gt; &gt;=C2=A0 }<br>
&gt; <br>
&gt; I think we moved them outside gcc dir isn=E2=80=99t it <br>
<br>
Not sure I follow? I think the patch is correct?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah I think pat=
ch is fine since I was wondering about files from gcc-runtime which got mov=
e=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000043778f0591e3403a--
