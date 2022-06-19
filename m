Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C4EC43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 10:54:05 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web08.17989.1655636042981737467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 03:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZeYWm8AF;
 spf=pass (domain: gmail.com, ip: 209.85.219.181,
 mailfrom: ptsneves@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id x38so14359045ybd.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Am6FX4tVI4rwECJu4vyj0Yay8WkHa/3rOL8BXvoi4Hk=;
        b=ZeYWm8AFpk5OrPwRl8mG2jaHimnS114RkVUn5jClMaF6EiTxWDioXdxzg7QfGy5zou
         xmUsKGCI8kVnFktTAvkkWpoWXVL7XS1fY1RZ52oNjfnjE7DOghs7WkayYNHqiibroBgL
         fbGVt1Ig6tzgiQlip68Wh9Yf8IbK+5BDjonWFGfYMb6xDRMyUFfyl06z3fCNPAdN08lH
         y5rfUIAcacCwdDJn3aRC3MDwZVaIfJKbXHq8zW7vhq1Ct9iJSWZ9CjWJ+Sb4yNAEz0Og
         JsRPr1YV45tOvpZ1t4AkqOkTStQ2XeDuzpO9tnTtbgcszshyuP2iJT00NY2UMaSgzpea
         Lufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Am6FX4tVI4rwECJu4vyj0Yay8WkHa/3rOL8BXvoi4Hk=;
        b=jZCflYCQcr6nqBzOkD9IV8REdcjN/j51NJVNZ3QVxMM1lqCx+1FrJQjk+aWo9T1aEK
         b9E7BL/mTiOFEqgpGnxO6of9vBNhos/puRbBD9LlROfiM30ADSZE5Oyh7Uv4Zgq6AZH3
         n/fPBA0+O9Y/nfRjKMalIZLjp+zz5NrUGKKHCVKU50+eQVIHc+ZAgNP5o7WWp0B+oO1+
         fjBaESlcDGzBr5eDxlPXRYTXFyCec0yZeoSQ6bMMh6QPIklAh6Cifcw+DD7Li7Ah6a/i
         asLusL6XhHPUhXEEUZs+AJvSUhvFBahvcKAa9AchIgxd0owDKOnOjab2fpsi+QjXq2gT
         flVg==
X-Gm-Message-State: AJIora9dstlBnmiMWVhgHPRacsG7kj8u/LFz2EOAK5ZUu6MNlRxz5nF1
	gkF4aonAlupKsoobow6vu3YM+iTOTod8vR0oOQ==
X-Google-Smtp-Source: 
 AGRyM1t7GJzdNTRbjDxgjKiEQ+KdjCbLWlRJ2faylvlTsGoGOJbckz9gpIj8Dm/liPu72UTli1HuAIdh2g5ivuxgOzI=
X-Received: by 2002:a25:2e11:0:b0:665:746:6ac5 with SMTP id
 u17-20020a252e11000000b0066507466ac5mr19156779ybu.481.1655636042142; Sun, 19
 Jun 2022 03:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614151105.1890454-1-ptsneves@gmail.com>
 <20220614151105.1890454-3-ptsneves@gmail.com>
 <3b113e342f6f03c2200bbb1477139334b055fa05.camel@linuxfoundation.org>
In-Reply-To: 
 <3b113e342f6f03c2200bbb1477139334b055fa05.camel@linuxfoundation.org>
From: Paulo Neves <ptsneves@gmail.com>
Date: Sun, 19 Jun 2022 12:53:50 +0200
Message-ID: 
 <CAJO0J4gOq+1VW1d5_9ba-qxVe9Ptg5mPcgJXz+gATPELGFtrCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 3/7] insane.bbclass: Make do_qa_staging check
 shebangs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002b581a05e1cace43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 10:54:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167033

--0000000000002b581a05e1cace43
Content-Type: text/plain; charset="UTF-8"

Yes, when I was making the change I also realized the scope of the check
was quite bigger than before. I am going to deliver the final changes
requested and leave it up to you to decide on the merge. Let me know your
decision so I can close the bug as well.

Paulo Neves

On Fri, Jun 17, 2022, 18:50 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-06-14 at 17:11 +0200, Paulo Neves wrote:
> > As reported in the bug report [1], there was no check for shebang
> > sizes on native scripts and now this is fixed.
> >
> > The path scope of the qa_staging was increased from just checking
> > libdir to all the relevant SYSROOT_DIRS.
> >
> > It is possible to skip this check through INSANE_SKIP.
> >
> > [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
> >
> > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > ---
> >  meta/classes/insane.bbclass | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 9ca84bace9..b2951a48fe 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -630,6 +630,11 @@ def qa_check_staged(path,d):
> >          bb.note("Recipe %s skipping qa checking: pkgconfig" %
> d.getVar('PN'))
> >          skip_pkgconfig = True
> >
> > +    skip_shebang_size = False
> > +    if 'shebang-size' in skip:
> > +        bb.note("Recipe %s skipping qa checkking: shebang-size" %
> d.getVar('PN'))
> > +        skip_shebang_size = True
> > +
> >      # find all .la and .pc files
> >      # read the content
> >      # and check for stuff that looks wrong
> > @@ -651,6 +656,13 @@ def qa_check_staged(path,d):
> >                          error_msg = "%s failed sanity test (tmpdir) in
> path %s" % (file,root)
> >                          oe.qa.handle_error("pkgconfig", error_msg, d)
> >
> > +            if not skip_shebang_size:
> > +                errors = {}
> > +                package_qa_check_shebang_size(path, "", d, None, errors)
> > +                for e in errors:
> > +                    oe.qa.handle_error(e, errors[e], d)
> > +
> > +
> >  # Run all package-wide warnfuncs and errorfuncs
> >  def package_qa_package(warnfuncs, errorfuncs, package, d):
> >      warnings = {}
> > @@ -1139,7 +1151,9 @@ addtask do_package_qa_setscene
> >
> >  python do_qa_staging() {
> >      bb.note("QA checking staging")
> > -    qa_check_staged(d.expand('${SYSROOT_DESTDIR}${libdir}'), d)
> > +    sysroot_destdir = d.expand('${SYSROOT_DESTDIR}')
> > +    for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
> > +        qa_check_staged(sysroot_destdir + sysroot_dir, d)
> >      oe.qa.exit_with_message_if_errors("QA staging was broken by the
> package built above", d)
> >  }
>
>
> I'm a little worried about the performance implications of this, we're
> going from scanning files in libdir to scanning nearly all files in the
> sysroots, reading from many of them. In isolation that doesn't seem
> much but I suspect the IO will impact builds overall.
>
> That leaves me a little torn on this change :/
>
> Cheers,
>
> Richard
>
>

--0000000000002b581a05e1cace43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, when I was making the change I also realized the sco=
pe of the check was quite bigger than before. I am going to deliver the fin=
al changes requested and leave it up to you to decide on the merge. Let me =
know your decision so I can close the bug as well.<div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Paulo Neves=C2=A0</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 17, 2022, 18:50 Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Tue, 2022-06-14 at 17:11 +0200, Paulo Neves wrote:<br>
&gt; As reported in the bug report [1], there was no check for shebang<br>
&gt; sizes on native scripts and now this is fixed.<br>
&gt; <br>
&gt; The path scope of the qa_staging was increased from just checking<br>
&gt; libdir to all the relevant SYSROOT_DIRS.<br>
&gt; <br>
&gt; It is possible to skip this check through INSANE_SKIP.<br>
&gt; <br>
&gt; [1] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D110=
53" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D11053</a><br>
&gt; <br>
&gt; Signed-off-by: Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">ptsneves@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/insane.bbclass | 16 +++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass=
<br>
&gt; index 9ca84bace9..b2951a48fe 100644<br>
&gt; --- a/meta/classes/insane.bbclass<br>
&gt; +++ b/meta/classes/insane.bbclass<br>
&gt; @@ -630,6 +630,11 @@ def qa_check_staged(path,d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Recipe %s skipping qa =
checking: pkgconfig&quot; % d.getVar(&#39;PN&#39;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_pkgconfig =3D True<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 skip_shebang_size =3D False<br>
&gt; +=C2=A0 =C2=A0 if &#39;shebang-size&#39; in skip:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Recipe %s skipping qa check=
king: shebang-size&quot; % d.getVar(&#39;PN&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_shebang_size =3D True<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # find all .la and .pc files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # read the content<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # and check for stuff that looks wrong<br>
&gt; @@ -651,6 +656,13 @@ def qa_check_staged(path,d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 error_msg =3D &quot;%s failed sanity test (tmpdir) in =
path %s&quot; % (file,root)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error(&quot;pkgconfig&quot;, error_msg, d=
)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not skip_shebang_size:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errors =3D {}=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_qa_ch=
eck_shebang_size(path, &quot;&quot;, d, None, errors)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for e in erro=
rs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 oe.qa.handle_error(e, errors[e], d)<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 # Run all package-wide warnfuncs and errorfuncs<br>
&gt;=C2=A0 def package_qa_package(warnfuncs, errorfuncs, package, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 warnings =3D {}<br>
&gt; @@ -1139,7 +1151,9 @@ addtask do_package_qa_setscene<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 python do_qa_staging() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.note(&quot;QA checking staging&quot;)<br>
&gt; -=C2=A0 =C2=A0 qa_check_staged(d.expand(&#39;${SYSROOT_DESTDIR}${libdi=
r}&#39;), d)<br>
&gt; +=C2=A0 =C2=A0 sysroot_destdir =3D d.expand(&#39;${SYSROOT_DESTDIR}&#3=
9;)<br>
&gt; +=C2=A0 =C2=A0 for sysroot_dir in d.expand(&#39;${SYSROOT_DIRS}&#39;).=
split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qa_check_staged(sysroot_destdir + sysroot=
_dir, d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe.qa.exit_with_message_if_errors(&quot;QA staging=
 was broken by the package built above&quot;, d)<br>
&gt;=C2=A0 }<br>
<br>
<br>
I&#39;m a little worried about the performance implications of this, we&#39=
;re<br>
going from scanning files in libdir to scanning nearly all files in the<br>
sysroots, reading from many of them. In isolation that doesn&#39;t seem<br>
much but I suspect the IO will impact builds overall.<br>
<br>
That leaves me a little torn on this change :/<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000002b581a05e1cace43--

