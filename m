Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D80D7FBD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 17:32:42 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f8so20139640edv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2XHZVaXkHH+aTzOBrjcxZdEdBJGvkSth5AxaHKOTmUE=;
	b=oBi/MiDs6wecj94E2YZlTC0T4FN/myqtE1hxF7wVkbUemNgwBveHMPgBgg97aCWSYL
	iWrFvOq/4nXQ9UoHy1D1HafVWGWTvtR4TM5SRkUG//gkAfCrKfkIq5g7Tr6txGEx4Hwa
	XPQz3fuWdcxjWfhMy8BywnFnOGdHDgCjygsdv+eOEwvUz3+9nMYCMbI8oOQJJuRsyEsl
	anmLeu5/IUsOC3R48LrsAwqZ1/+8hOJ/yKoeTZGEZHazwtkbhh0wSY9sT4hgqaXNHBq3
	Wd7mfK9uOwuzQ9ZDp0xePudDkQJ33OqR6aLTo2KkOoJOpd4HfPb5ciakpE4/y1OubsLl
	gLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2XHZVaXkHH+aTzOBrjcxZdEdBJGvkSth5AxaHKOTmUE=;
	b=NRNNUXGmY5w0B18KcAtUm6QnCuU9PkUnEwdjuMBdzphtISDentqzxOhZeTZ1o47JPZ
	jutZ0I6DVxemyci2791weAiV82831UDOWdBYLjbmSaowOZvZyiJgfl5wQxQR4P31Q1Su
	Fn2rETZpwnSUZ4F8IqgSd/Vd5gWexK3B9JKC6tBPumRjcMjsZW5UKx2yBUpDcz2Pt+Au
	MwSJAVYU+5rsMJy+YvLq4J7OF3XjlfgTAm/qF2Za9AZZJ6piOknA88VLrBQiLepuviIi
	FQ9BtjaBVOT+qOrxK090EVktXzYCvy7/luJKSN9WdGB1wsF0xMLuJh/PbQZl7Udxdta+
	Du1w==
X-Gm-Message-State: APjAAAWrk1IJ/X826PsktOY14lIWruspyVXeZaAfek4Kh90R/3RwzvDa
	ebJOpRM8Dn46UNY0ZfB02zdZIGJtIHjlYWWBH3w=
X-Google-Smtp-Source: APXvYqxvNBHb/m7aLyzS4Dy09fjy4RF+aithS/BpVvfOAr1PnaUgXWIB32B+9047w0lac8QPqvm3UzV5Sj+iQbuJRXQ=
X-Received: by 2002:a17:906:434c:: with SMTP id
	z12mr4549274ejm.168.1576085563244; 
	Wed, 11 Dec 2019 09:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20190812195140.900-1-Martin.Jansa@gmail.com>
	<20190906113210.GA1530@jama>
In-Reply-To: <20190906113210.GA1530@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Dec 2019 18:32:31 +0100
Message-ID: <CA+chaQeQbEsqh8-z47Zd1nmoYMfX0bV-j3NhSxGu693TUv1bJQ@mail.gmail.com>
To: Yocto Project <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Herb Kuta <herb.kuta@lge.com>
Subject: Re: [yocto-docs][PATCH] ref-manual: mention PREPROCESS_RELOCATE_DIRS variable
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
X-List-Received-Date: Wed, 11 Dec 2019 17:32:43 -0000
Content-Type: multipart/alternative; boundary="00000000000022076705997104fb"

--00000000000022076705997104fb
Content-Type: text/plain; charset="UTF-8"

ping again

On Fri, Sep 6, 2019 at 1:32 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Aug 12, 2019 at 07:51:40PM +0000, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> ping
>
> > ---
> >  documentation/ref-manual/ref-classes.xml   |  5 ++++-
> >  documentation/ref-manual/ref-variables.xml | 21 +++++++++++++++++++++
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/documentation/ref-manual/ref-classes.xml
> b/documentation/ref-manual/ref-classes.xml
> > index ece47e757..159efb3b1 100644
> > --- a/documentation/ref-manual/ref-classes.xml
> > +++ b/documentation/ref-manual/ref-classes.xml
> > @@ -413,7 +413,10 @@
> >          <filename>cross</filename>, and
> >          <filename>cross-canadian</filename> recipes to change
> >          <filename>RPATH</filename> records within binaries in order to
> make
> > -        them relocatable.
> > +        them relocatable. To extend the list of directories where it
> searches
> > +        for binaries to relocate, you can set
> > +        <link
> linkend='var-PREPROCESS_RELOCATE_DIRS'><filename>PREPROCESS_RELOCATE_DIRS</filename></link>
> > +        variable in your recipe.
> >      </para>
> >  </section>
> >
> > diff --git a/documentation/ref-manual/ref-variables.xml
> b/documentation/ref-manual/ref-variables.xml
> > index 9470a780a..5ac766658 100644
> > --- a/documentation/ref-manual/ref-variables.xml
> > +++ b/documentation/ref-manual/ref-variables.xml
> > @@ -11424,6 +11424,27 @@
> >              </glossdef>
> >          </glossentry>
> >
> > +        <glossentry
> id='var-PREPROCESS_RELOCATE_DIRS'><glossterm>PREPROCESS_RELOCATE_DIRS</glossterm>
> > +            <info>
> > +                PREPROCESS_RELOCATE_DIRS[doc] = "List of extra
> directories where to search for binaries which should be relocatable."
> > +            </info>
> > +            <glossdef>
> > +                <para role="glossdeffirst">
> > +<!--                <para role="glossdeffirst"><imagedata
> fileref="figures/define-generic.png" /> -->
> > +                    List of extra directories with binaries.
> > +                </para>
> > +
> > +                <para>
> > +                    <filename>PREPROCESS_RELOCATE_DIRS</filename> is
> used by
> > +                    chrpath.bbclass to allow extending the list where
> it searches
> > +                    for binaries. By default it searches in:
> > +                    ${bindir} ${sbindir} ${base_sbindir} ${base_bindir}
> ${libdir} ${base_libdir} ${libexecdir}
> > +                    Thus, <filename>PREPROCESS_RELOCATE_DIRS</filename>
> usually doesn't
> > +                    need to be set withing recipes.
> > +                </para>
> > +            </glossdef>
> > +        </glossentry>
> > +
> >          <glossentry id='var-PRIORITY'><glossterm>PRIORITY</glossterm>
> >              <info>
> >                  PRIORITY[doc] = "Indicates the importance of a
> package.  The default value is 'optional'.  Other standard values are
> 'required', 'standard', and 'extra'."
> > --
> > 2.17.1
> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--00000000000022076705997104fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping again</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 1:32 PM Martin Jansa &lt;=
<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug=
 12, 2019 at 07:51:40PM +0000, Martin Jansa wrote:<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
<br>
ping<br>
<br>
&gt; ---<br>
&gt;=C2=A0 documentation/ref-manual/ref-classes.xml=C2=A0 =C2=A0|=C2=A0 5 +=
+++-<br>
&gt;=C2=A0 documentation/ref-manual/ref-variables.xml | 21 ++++++++++++++++=
+++++<br>
&gt;=C2=A0 2 files changed, 25 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/=
ref-manual/ref-classes.xml<br>
&gt; index ece47e757..159efb3b1 100644<br>
&gt; --- a/documentation/ref-manual/ref-classes.xml<br>
&gt; +++ b/documentation/ref-manual/ref-classes.xml<br>
&gt; @@ -413,7 +413,10 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;cross&lt;/filename&g=
t;, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;cross-canadian&lt;/f=
ilename&gt; recipes to change<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;RPATH&lt;/filename&g=
t; records within binaries in order to make<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 them relocatable.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 them relocatable. To extend the list of d=
irectories where it searches<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for binaries to relocate, you can set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-PREPROCESS_RE=
LOCATE_DIRS&#39;&gt;&lt;filename&gt;PREPROCESS_RELOCATE_DIRS&lt;/filename&g=
t;&lt;/link&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 variable in your recipe.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
&gt;=C2=A0 &lt;/section&gt;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/documentation/ref-manual/ref-variables.xml b/documentatio=
n/ref-manual/ref-variables.xml<br>
&gt; index 9470a780a..5ac766658 100644<br>
&gt; --- a/documentation/ref-manual/ref-variables.xml<br>
&gt; +++ b/documentation/ref-manual/ref-variables.xml<br>
&gt; @@ -11424,6 +11424,27 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glossdef&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glossentry&gt;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#39;var-PREPROCESS_R=
ELOCATE_DIRS&#39;&gt;&lt;glossterm&gt;PREPROCESS_RELOCATE_DIRS&lt;/glosster=
m&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;info&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PREPROCESS_RE=
LOCATE_DIRS[doc] =3D &quot;List of extra directories where to search for bi=
naries which should be relocatable.&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/info&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossdef&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para role=
=3D&quot;glossdeffirst&quot;&gt;<br>
&gt; +&lt;!--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;pa=
ra role=3D&quot;glossdeffirst&quot;&gt;&lt;imagedata fileref=3D&quot;figure=
s/define-generic.png&quot; /&gt; --&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 List of extra directories with binaries.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &lt;filename&gt;PREPROCESS_RELOCATE_DIRS&lt;/filename&gt; is used by<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 chrpath.bbclass to allow extending the list where it searches<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for binaries. By default it searches in:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${bindir} ${sbindir} ${base_sbindir} ${base_bindir} ${libdir} ${base_libdi=
r} ${libexecdir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 Thus, &lt;filename&gt;PREPROCESS_RELOCATE_DIRS&lt;/filename&gt; usually do=
esn&#39;t<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 need to be set withing recipes.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glossdef&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/glossentry&gt;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;glossentry id=3D&#39;var-PRIORIT=
Y&#39;&gt;&lt;glossterm&gt;PRIORITY&lt;/glossterm&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;info&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PRIORITY=
[doc] =3D &quot;Indicates the importance of a package.=C2=A0 The default va=
lue is &#39;optional&#39;.=C2=A0 Other standard values are &#39;required&#3=
9;, &#39;standard&#39;, and &#39;extra&#39;.&quot;<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
<br>
-- <br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</blockquote></div>

--00000000000022076705997104fb--
