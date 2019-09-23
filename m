Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB577DE36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 18:39:14 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q1so36040720ion.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LmqWQV+LotavhpNhwD83nqNSIm1glc8MKcJN8m+5EfY=;
	b=Hq8v/1ZtfNVIUbgWSLFkmYs+ScmKX9p5mGDYXlfOAe80Utcj3T8/Cf6Eqhx6bbkpM+
	Knq9rNb0zY62g5EgeshjlNt6zs8umzdW59acHkty2+rQ7T3a4blApo+qXjKd0JYprWlo
	kUICUPEVXQh8UdxBW8NmJGUy3iRY6ebW0UVrQ10DEIuaaejnG7/psqPGtoQRH1427HtQ
	xmJLslkk7UXl7bC80obIDp+uAUE36rFlYKuvrHmoWYoAxd9xKLHpRSt/vb6PKElmcadN
	T1MAgiYOyIIUQJ+ZUKbqp0Eu0zn9ur6CGNmDUYdo+gAWjLchLYl2J/uwymonJlfhPcfp
	D4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LmqWQV+LotavhpNhwD83nqNSIm1glc8MKcJN8m+5EfY=;
	b=JnolBmyPDSSmLG1rsMh6oUk9Racgbm7UtoD8wAgKy/yR/fI//4QuYdFdoQRV62u3pW
	JgVB2Z/z87ZrYmTNcYjovc7wL6ytxO1f1TKay2Byc9wqFwHS7NT/P3b2ZjTv+arlPMrV
	6kDWtGbR0t6GiFgo0Hc5tW9Zr4zDgzMLgcUMWCQQocyJWS7+RWKiV8mLg0Ye2IeG3QbK
	dc+CyTCxhSIZ9yY+4yJC3xxDjslzPfFQRsxSBhzfoWgqbTCPhvPmIbwXbNRuSo4p+EJt
	Ab9hReBWmaSSuJpmd52VFX9vvipFy8AuTfH6uqw0GG+aqJiA6KVdeTpEU4VrfYHaUX5Q
	SVJQ==
X-Gm-Message-State: APjAAAU+7/45N+lcF4bHwCg2XThqr6hMNl/49jygfXOADAnW7o5Npeui
	CCF9vlkwFDuB2YqajzPVpCNpg0x32pRl6nf5U0jwlA==
X-Google-Smtp-Source: APXvYqyrPk+6OJucXhw6FsKDDtcCU6PoU07xxn334TD4Jx22cEvlVJyLtnw9mEQDD5/nQQxjw30BPeUl00nO3JK5v8A=
X-Received: by 2002:a5e:8404:: with SMTP id h4mr884020ioj.170.1569263955185;
	Mon, 23 Sep 2019 11:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190923180109.15157-1-Trevor.Gamblin@windriver.com>
	<29d0f686-48a2-ef07-aa16-39375b6b6937@windriver.com>
In-Reply-To: <29d0f686-48a2-ef07-aa16-39375b6b6937@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 23 Sep 2019 11:39:04 -0700
Message-ID: <CANx9H-BPG9pYWypmh26rLf0Fc-xzQyOa+-cYLYs6uRMzLh3xbA@mail.gmail.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lighttpd: remove fam as a PACKAGECONFIG option
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
X-List-Received-Date: Mon, 23 Sep 2019 18:39:14 -0000
Content-Type: multipart/alternative; boundary="0000000000009b96ad05933cbc6e"

--0000000000009b96ad05933cbc6e
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 11:07 AM Trevor Gamblin <
trevor.gamblin@windriver.com> wrote:

> On 9/23/19 2:01 PM, Trevor Gamblin wrote:
>
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >
> > lighttpd builds fail if "fam" (and therefore gamin) is enabled.
> >
> > In conf/local.conf:
> >
> >      CORE_IMAGE_EXTRA_INSTALL += "lighttpd"
> >      PACKAGECONFIG_append_pn-lighttpd = " fam"
> >
> > bitbake error:
> >
> >      ERROR: Nothing PROVIDES 'gamin' (but
> /yow-lpggp31/tgamblin/oe-core.git/meta/recipes-extended/lighttpd/
> lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
> >      NOTE: Runtime target 'lighttpd' is unbuildable, removing...
> >      Missing or unbuildable dependency chain was: ['lighttpd', 'gamin']
> >      ERROR: Required build target 'core-image-minimal' has no buildable
> providers.
> >      Missing or unbuildable dependency chain was: ['core-image-minimal',
> 'lighttpd', 'gamin']
> >
> > Since gamin doesn't appear to have a recipe and hasn't been
> > maintained for several years, this should be removed from the
> > list of lighttpd PACKAGECONFIG options.
> >
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >   meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> > index 72990d02e5..3f9e4fec18 100644
> > --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> > +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
> > @@ -39,7 +39,6 @@ PACKAGECONFIG[krb5] = "--with-krb5,--without-krb5,krb5"
> >   PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
> >   PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> >   PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> > -PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
> >   PACKAGECONFIG[webdav-props] =
> "--with-webdav-props,--without-webdav-props,libxml2 sqlite3"
> >   PACKAGECONFIG[webdav-locks] =
> "--with-webdav-locks,--without-webdav-locks,util-linux"
> >   PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
>
> While troubleshooting I learned that gamin has not been maintained for
> several years. See:
>
> https://bugzilla.gnome.org/show_bug.cgi?id=454124
>
> https://gitlab.gnome.org/Archive/gamin
>
> Is there a reason why we'd want to keep it in the PACKAGECONFIG options
> list?
>

Gamin was dropped from oe-core four years ago:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=aa05be4882eed830c2fc91f93653223edfab2a0c

Gamin itself has not been updated since 2008.

Seems like it is safe to drop the option.

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009b96ad05933cbc6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Sep 23, 2019 at 11:07 AM Trevor Gamblin &lt;<a href=
=3D"mailto:trevor.gamblin@windriver.com">trevor.gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On 9/23/19 2:01 PM, Trevo=
r Gamblin wrote:<br>
<br>
&gt; From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.co=
m" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt;<br>
&gt; lighttpd builds fail if &quot;fam&quot; (and therefore gamin) is enabl=
ed.<br>
&gt;<br>
&gt; In conf/local.conf:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CORE_IMAGE_EXTRA_INSTALL +=3D &quot;lighttpd&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG_append_pn-lighttpd =3D &quot; fam&qu=
ot;<br>
&gt;<br>
&gt; bitbake error:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ERROR: Nothing PROVIDES &#39;gamin&#39; (but /yow-=
lpggp31/tgamblin/oe-core.git/meta/recipes-extended/lighttpd/<a href=3D"http=
://lighttpd_1.4.54.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54=
.bb</a> DEPENDS on or otherwise requires it)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NOTE: Runtime target &#39;lighttpd&#39; is unbuild=
able, removing...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Missing or unbuildable dependency chain was: [&#39=
;lighttpd&#39;, &#39;gamin&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ERROR: Required build target &#39;core-image-minim=
al&#39; has no buildable providers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Missing or unbuildable dependency chain was: [&#39=
;core-image-minimal&#39;, &#39;lighttpd&#39;, &#39;gamin&#39;]<br>
&gt;<br>
&gt; Since gamin doesn&#39;t appear to have a recipe and hasn&#39;t been<br=
>
&gt; maintained for several years, this should be removed from the<br>
&gt; list of lighttpd PACKAGECONFIG options.<br>
&gt;<br>
&gt; Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@win=
driver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_=
1.4.54.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a> | 1 =
-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd=
_1.4.54.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a> b/m=
eta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54.bb" rel=3D"=
noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
&gt; index 72990d02e5..3f9e4fec18 100644<br>
&gt; --- a/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54=
.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
&gt; +++ b/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4.54=
.bb" rel=3D"noreferrer" target=3D"_blank">lighttpd_1.4.54.bb</a><br>
&gt; @@ -39,7 +39,6 @@ PACKAGECONFIG[krb5] =3D &quot;--with-krb5,--without-=
krb5,krb5&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[pcre] =3D &quot;--with-pcre,--without-pcre,l=
ibpcre&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[zlib] =3D &quot;--with-zlib,--without-zlib,z=
lib&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[bzip2] =3D &quot;--with-bzip2,--without-bzip=
2,bzip2&quot;<br>
&gt; -PACKAGECONFIG[fam] =3D &quot;--with-fam,--without-fam,gamin&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[webdav-props] =3D &quot;--with-webdav-props,=
--without-webdav-props,libxml2 sqlite3&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[webdav-locks] =3D &quot;--with-webdav-locks,=
--without-webdav-locks,util-linux&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[gdbm] =3D &quot;--with-gdbm,--without-gdbm,g=
dbm&quot;<br>
<br>
While troubleshooting I learned that gamin has not been maintained for <br>
several years. See:<br>
<br>
<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D454124" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D4541=
24</a><br>
<br>
<a href=3D"https://gitlab.gnome.org/Archive/gamin" rel=3D"noreferrer" targe=
t=3D"_blank">https://gitlab.gnome.org/Archive/gamin</a><br>
<br>
Is there a reason why we&#39;d want to keep it in the PACKAGECONFIG options=
 <br>
list?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Gamin was droppe=
d from oe-core four years ago:</div><div dir=3D"auto"><div><a href=3D"http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Daa05be4882eed830c2fc=
91f93653223edfab2a0c">http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit=
/?id=3Daa05be4882eed830c2fc91f93653223edfab2a0c</a></div><br></div><div dir=
=3D"auto">Gamin itself has not been updated since 2008.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Seems like it is safe to drop the option.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000009b96ad05933cbc6e--
