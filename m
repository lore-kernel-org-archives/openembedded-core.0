Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id D856C6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:42:44 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id g6so3126665vkb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 17:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KbYRjQ9FALOPaAUTzOcClnKpbv6u8yyLdnQNJlEnBl0=;
	b=CmSD0brPGAXu6cSQ2kQh4i3nCt6duOH+QZVUoIOG30g8Dh8U3a9bhjIwl3KpSxJN3d
	AC7K6m5VvtFNmwCmkB4R+hehDLcbl8KpRCkmYnL472Cv2XLhq2BJT4i1YtKGZB5vI8Yr
	34J8kM/qvXB1WkutSGcYt/0dqQK9dChlwLTGPzbgWpfA28mgno45wg/X0+0rJ7X82vrk
	UcHOCfzYHL6np9NnHzOGxa0ct+PSSlQHwUfkRATQjWRTH4qNwHAy+uVsxff3k7FpzG5y
	sH3pWhZdUDpexNJDD4nQ75kEHRf3CjGujCSY912tJHQAzOGwJV4zforj46rKTPSBJlCc
	bxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KbYRjQ9FALOPaAUTzOcClnKpbv6u8yyLdnQNJlEnBl0=;
	b=rdoOENVlXpkrYyPxDwhn89FtchZ68+E8jeaZT4ogwctP7E9sw1L8f7tKjHhoJfVruy
	ko9tbRQ+gyWA/7esjX8OMmgvRo8j6cFp3jp6sU2PIS47RxltI6vyinBfkbOaeLpZBGuH
	gSYvQzEexQ6tAGl+oNjh4xhws828xcSv7nvk0H3Q4xW7tp7pEWqXUTS80f/Qr5FcB/m8
	W5FVUje5TrR9pSS+ppx1fLmWDzjLJTlfiE7PqMKDCZvA5rQyrSluP7U8A+eNuOAhyiIV
	2/Qdz8w6J+hcBOSqoKDVHn/qw4NiwTkzGLtFTiOm/BguWPJaECmUxHypHZepqJyh+X56
	7hng==
X-Gm-Message-State: ALQs6tCb39eiAARLBc6+Tk8lzjqKXWmzK+gZNnsuIlKMn2RHRhmAJEtS
	aso0ySDP+34REI3szQ85enIK8JxGq7au05ml+0c=
X-Google-Smtp-Source: AIpwx498BhgHd25XPtBc9Yk9e+CfWHD/Vo3ENhfhVn5LIgBRGIUG05MyR91SKsHYcj19rcLVp8vXjPYh7h1UC1ORvWE=
X-Received: by 10.31.177.141 with SMTP id a135mr516vkf.88.1523925765522; Mon,
	16 Apr 2018 17:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.131.86 with HTTP; Mon, 16 Apr 2018 17:42:45 -0700 (PDT)
In-Reply-To: <71cdd480b91641c0967948e7db68e82f@XBOX02.axis.com>
References: <1523924710-21480-1-git-send-email-liu.ming50@gmail.com>
	<71cdd480b91641c0967948e7db68e82f@XBOX02.axis.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 17 Apr 2018 02:42:45 +0200
Message-ID: <CALatG=6SEV0T7H83UMtHoGoHRCiNP_W9Anw8fJY-Z4q3KGu99g@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Tue, 17 Apr 2018 00:42:45 -0000
Content-Type: multipart/alternative; boundary="001a11c02970eb0ae0056a009dae"

--001a11c02970eb0ae0056a009dae
Content-Type: text/plain; charset="UTF-8"

Oops, will send a V3.

2018-04-17 2:34 GMT+02:00 Peter Kjellerstedt <peter.kjellerstedt@axis.com>:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > liu.ming50@gmail.com
> > Sent: den 17 april 2018 02:25
> > To: openembedded-core@lists.openembedded.org
> > Cc: Ming Liu <liu.ming50@gmail.com>
> > Subject: [OE-core] [PATCH V2] externalsrc.bbclass: introduce
> INHIBIT_SRCTREE_FILE_CHECKSUMES
>
> Please correct the subject as well.
>
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > It defaults to be '0', but it allows the developers to choose not add
> > file-checksums to do_compile for the entire source tree, by setting to
> > '1'.
> >
> > We need this because we have a huge project with 100G bytes source
> > files, and we do not want them to be added to file-checksums variable
> > flag.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass
> > b/meta/classes/externalsrc.bbclass
> > index c9f5cf7..2b83193 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -26,6 +26,7 @@
> >
> >  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
> >  EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
> > +INHIBIT_SRCTREE_FILE_CHECKSUMS ?= "0"
> >
> >  python () {
> >      externalsrc = d.getVar('EXTERNALSRC')
> > @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
> >          with open(oe_hash_file, 'w') as fobj:
> >              fobj.write(sha1)
> >          ret = oe_hash_file + ':True'
> > -    else:
> > +    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMS'):
> >          ret = s_dir + '/*:True'
> >      return ret
> >
> > --
> > 2.7.4
>
> //Peter
>
>

--001a11c02970eb0ae0056a009dae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oops, will send a V3.</div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">2018-04-17 2:34 GMT+02:00 Peter Kjellerstedt <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D=
"_blank">peter.kjellerstedt@axis.com</a>&gt;</span>:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; <a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a><br>
&gt; Sent: den 17 april 2018 02:25<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gm=
ail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH V2] externalsrc.bbclass: introduce INHIBIT_S=
RCTREE_FILE_<wbr>CHECKSUMES<br>
<br>
Please correct the subject as well.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt; <br>
&gt; It defaults to be &#39;0&#39;, but it allows the developers to choose =
not add<br>
&gt; file-checksums to do_compile for the entire source tree, by setting to=
<br>
&gt; &#39;1&#39;.<br>
&gt; <br>
&gt; We need this because we have a huge project with 100G bytes source<br>
&gt; files, and we do not want them to be added to file-checksums variable<=
br>
&gt; flag.<br>
&gt; <br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/externalsrc.<wbr>bbclass | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; b/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; index c9f5cf7..2b83193 100644<br>
&gt; --- a/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; +++ b/meta/classes/externalsrc.<wbr>bbclass<br>
&gt; @@ -26,6 +26,7 @@<br>
&gt; <br>
&gt;=C2=A0 SRCTREECOVEREDTASKS ?=3D &quot;do_patch do_unpack do_fetch&quot;=
<br>
&gt;=C2=A0 EXTERNALSRC_SYMLINKS ?=3D &quot;oe-workdir:${WORKDIR} oe-logs:${=
T}&quot;<br>
&gt; +INHIBIT_SRCTREE_FILE_<wbr>CHECKSUMS ?=3D &quot;0&quot;<br>
&gt; <br>
&gt;=C2=A0 python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 externalsrc =3D d.getVar(&#39;EXTERNALSRC&#39;)<br=
>
&gt; @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=3DNone):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(oe_hash_file, &#39;w&#39;)=
 as fobj:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fobj.write(sha1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D oe_hash_file + &#39;:True&#3=
9;<br>
&gt; -=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 elif not d.getVar(&#39;INHIBIT_SRCTREE_<wbr>FILE_CHECKS=
UMS&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s_dir + &#39;/*:True&#39;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret<br>
&gt; <br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">//Peter<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c02970eb0ae0056a009dae--
