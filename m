Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB61C7EE2D
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:39:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.22643.1677256742420508925
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RDsFu+Wk;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so2608877wms.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zBvxNLYYGEdiTQZfI+WEiQTQmDoAtjrXndro5vkind8=;
        b=RDsFu+WkMKJg8D26y2zmiK/n8yG0vewlHkjiWdxuPsHPJaNH5WBmbwmTgDGVWsEAP0
         pTD/viklgtoQTDGiafvTYUrcO7V9sLQMm9aXVTyt2ROHD/vQADPyxzvzLTyYtp4J8n7j
         yk1JGuL9BO9oVYpD/+ZZ6EUIMCmRMWg1eR3uBGKULOUN9L+8U64OSH6pnpdqxcWxPf+U
         rvoXvw+ZMxZYYUhmlKHUNojpVcntc0puMT2dD7LYDiMCzgMR1498WCnOBmTl5zkP1CRf
         /Q1f3Cz2fQcIUxf3OtxiOv8MKuVIl3IlppkV8rJWOVpjSVM0KBnDNLhQV1bD8lGjxTBd
         yRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBvxNLYYGEdiTQZfI+WEiQTQmDoAtjrXndro5vkind8=;
        b=4RVTfFe5e5qezRAKx7d0P9fr4kwETKVl3n0BbwxHs5eRC17uGGBI/5Lb28S3p0Dnju
         fwnV+GidMEC8zy4UL2JAe2yX8gdB3fChkQOZXlVdCmNDcXLgw0nwm01LXGqn5WsaEnFB
         xswsKjZgZnZkhYW5FXilIOq66AwmXO9qgy+xgiREAQgGJooi0mZBoxWrfFC5K4EMKTmn
         BI62+FSKffG3cbU17YPLn6ZIeMk0ZN1wtp0vAN3dESlgbzo+vrKQ2yj5+mcl7gy6LzMT
         TIdsM29fkJH41V5xErQz6C9u/xdvZozCUVWu/jfLjSY6xXFZz+T+K/UGJZLxaKoG9KiL
         3vtA==
X-Gm-Message-State: AO0yUKXgPPOPFBDWuM/6o702rMySQF3sy7IZJZzUV8vyz3XtVt99KEh1
	b6nTwU/Atnd+MAimunDDVaDuC3atN374sKJnNVA=
X-Google-Smtp-Source: AK7set+Pb+zL0v+XW+o1EJUvh/2D21RGQvjCkum1zQRz34SAFkRRKHZtd+duz89SxnImPCv6Y8YrR01uKwAezZbWMjw=
X-Received: by 2002:a05:600c:502c:b0:3df:fc69:e977 with SMTP id
 n44-20020a05600c502c00b003dffc69e977mr1466779wmr.5.1677256740664; Fri, 24 Feb
 2023 08:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20230217095855.1932015-1-jose.quaresma@foundries.io> <bdc9e1da6cce62c017e767addc91633a724bf27d.camel@linuxfoundation.org>
In-Reply-To: <bdc9e1da6cce62c017e767addc91633a724bf27d.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2023 17:38:45 +0100
Message-ID: <CA+chaQchee2Yw5TooHEu6vBJXpDSNaMhrno1LN=aNY3f7cLpMQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] icecc.bbclass: enable the network only when
 ICECC_DISABLED is not set
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000003977da05f574c453"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177695

--0000000000003977da05f574c453
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 5:27 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-02-17 at 09:58 +0000, Jose Quaresma wrote:
> > Enabling the network uncondictional is not need for some use cases.
> >
> > Such use case is usefull to reuse the sstate-cache of the build
> > and it requires the icecc inherit in all of the builds.
> > The real control control of the icecc is in the variable ICECC_DISABLED
> > so this patch change the logic to enable the network when the icecc is
> in use.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/icecc.bbclass | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index 312e0f17b5..159cae20f8 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -428,22 +428,18 @@ set_icecc_env() {
> >      bbnote "Using icecc tarball: $ICECC_VERSION"
> >  }
> >
> > -do_configure[network] = "1"
> >  do_configure:prepend() {
> >      set_icecc_env
> >  }
> >
> > -do_compile[network] = "1"
> >  do_compile:prepend() {
> >      set_icecc_env
> >  }
> >
> > -do_compile_kernelmodules[network] = "1"
> >  do_compile_kernelmodules:prepend() {
> >      set_icecc_env
> >  }
> >
> > -do_install[network] = "1"
> >  do_install:prepend() {
> >      set_icecc_env
> >  }
> > @@ -457,3 +453,9 @@ ICECC_SDK_HOST_TASK:pn-uninative-tarball = ""
> >
> >  # Add the toolchain scripts to the SDK
> >  TOOLCHAIN_HOST_TASK:append = " ${ICECC_SDK_HOST_TASK}"
> > +
> > +python () {
> > +    if d.getVar('ICECC_DISABLED') != "1":
> > +        for task in ['do_configure', 'do_compile',
> 'do_compile_kernelmodules', 'do_install']:
> > +                d.setVarFlag(task, 'network', '1')
> > +}
>
> I did want to talk a little about the overhead this has. Basically
> you've turned a simple flag setting into some anonymous python so the
> parsing overhead increases with it since there is now code parsing and
> execution to add in.
>
> For a single recipe this isn't so bad but when it is being added to
> every recipe it adds up.
>
> I'm not against the change as such, I just see a continual flood of
> patches adding conditions everywhere for various reasons and each one
> degrades parsing speed a little bit more (as well as complicates the
> test matrix).
>
> I personally don't use this class so I don't have a stake in this one
> but I thought it worth highlighting since I think the overhead of this
> was mentioned elsewhere and I think the overhead isn't widely
> understood.
>

As the network evaluation patch was merged in bitbake:
https://git.openembedded.org/bitbake/commit/?id=3d96c07f9fd4ba1a84826811d14bb4e98ad58846

I can send my inline version:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=jansa/master&id=1b143f065ab5408f5543951a8c73fa01ce3ee0c1

This works for master, for langdale and kirkstone we would need to backport
this bitbake commit as well as "utils: Allow to_boolean to support int
values", I have all 3 in my branches for kirkstone and langdale and can
send them as soon as there is agreement to do that (e.g. top 5 changes from
https://git.openembedded.org/bitbake-contrib/log/?h=jansa/2.0)

Regards,

--0000000000003977da05f574c453
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Feb 24, 2023 at 5:27 PM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2023-02-17 at 09:=
58 +0000, Jose Quaresma wrote:<br>
&gt; Enabling the network uncondictional is not need for some use cases.<br=
>
&gt; <br>
&gt; Such use case is usefull to reuse the sstate-cache of the build<br>
&gt; and it requires the icecc inherit in all of the builds.<br>
&gt; The real control control of the icecc is in the variable ICECC_DISABLE=
D<br>
&gt; so this patch change the logic to enable the network when the icecc is=
 in use.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/icecc.bbclass | 10 ++++++----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass<b=
r>
&gt; index 312e0f17b5..159cae20f8 100644<br>
&gt; --- a/meta/classes/icecc.bbclass<br>
&gt; +++ b/meta/classes/icecc.bbclass<br>
&gt; @@ -428,22 +428,18 @@ set_icecc_env() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bbnote &quot;Using icecc tarball: $ICECC_VERSION&q=
uot;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -do_configure[network] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_configure:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -do_compile[network] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -do_compile_kernelmodules[network] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_compile_kernelmodules:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -do_install[network] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_install:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_icecc_env<br>
&gt;=C2=A0 }<br>
&gt; @@ -457,3 +453,9 @@ ICECC_SDK_HOST_TASK:pn-uninative-tarball =3D &quot=
;&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add the toolchain scripts to the SDK<br>
&gt;=C2=A0 TOOLCHAIN_HOST_TASK:append =3D &quot; ${ICECC_SDK_HOST_TASK}&quo=
t;<br>
&gt; +<br>
&gt; +python () {<br>
&gt; +=C2=A0 =C2=A0 if d.getVar(&#39;ICECC_DISABLED&#39;) !=3D &quot;1&quot=
;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for task in [&#39;do_configure&#39;, &#39=
;do_compile&#39;, &#39;do_compile_kernelmodules&#39;, &#39;do_install&#39;]=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVarFlag(=
task, &#39;network&#39;, &#39;1&#39;)<br>
&gt; +}<br>
<br>
I did want to talk a little about the overhead this has. Basically<br>
you&#39;ve turned a simple flag setting into some anonymous python so the<b=
r>
parsing overhead increases with it since there is now code parsing and<br>
execution to add in.<br>
<br>
For a single recipe this isn&#39;t so bad but when it is being added to<br>
every recipe it adds up.<br>
<br>
I&#39;m not against the change as such, I just see a continual flood of<br>
patches adding conditions everywhere for various reasons and each one<br>
degrades parsing speed a little bit more (as well as complicates the<br>
test matrix).<br>
<br>
I personally don&#39;t use this class so I don&#39;t have a stake in this o=
ne<br>
but I thought it worth highlighting since I think the overhead of this<br>
was mentioned elsewhere and I think the overhead isn&#39;t widely<br>
understood.<br></blockquote><div><br></div><div>As the network evaluation p=
atch was merged in bitbake:</div><div><a href=3D"https://git.openembedded.o=
rg/bitbake/commit/?id=3D3d96c07f9fd4ba1a84826811d14bb4e98ad58846">https://g=
it.openembedded.org/bitbake/commit/?id=3D3d96c07f9fd4ba1a84826811d14bb4e98a=
d58846</a></div><div><br></div><div>I can send my inline version:</div><div=
><a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Djansa/master&amp;id=3D1b143f065ab5408f5543951a8c73fa01ce3ee0c1">https:/=
/git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&am=
p;id=3D1b143f065ab5408f5543951a8c73fa01ce3ee0c1</a></div><div><br></div><di=
v>This works for master, for langdale and kirkstone we would need to backpo=
rt this bitbake commit as well as &quot;utils: Allow to_boolean to support =
int values&quot;, I have all 3 in my branches for kirkstone and langdale an=
d can send them as soon as there is agreement to do that (e.g. top 5 change=
s from <a href=3D"https://git.openembedded.org/bitbake-contrib/log/?h=3Djan=
sa/2.0">https://git.openembedded.org/bitbake-contrib/log/?h=3Djansa/2.0</a>=
)</div><div><br></div><div>Regards,</div></div></div>

--0000000000003977da05f574c453--

