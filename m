Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEC1C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 21:31:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1190.1633296668688228646
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U/5Geutn;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id g41so62978056lfv.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 14:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mGdJPDUGgYzwAL3SgAbKiMViZd+/fBdM1i+zKmsFHmk=;
        b=U/5Geutn+UKxMHkU+p+x/880EjfQgfSNDmdunTptV6RZvcr0hR4NRkCGmOPyoA37CK
         dlarb+v/WDWyKupQJlqeom61rncH5kiNGCCB/Dmou8ZeojvvFO9w4YAYE+Go4PzixXH3
         ZaLvAEJ8nLt+cU7kvx4p7GACwczxve8n3Y0CwRtgWqY0zwpN5XBjq0voV/AxiSfs/tTx
         PTASH4tH8M29JcuHbh5zHjgMfEMkj4wj9eAE7/HnwhJKVn4lzJqaJFQ0iHq/R0jbEojZ
         Lnx5RJjUQFjaGQBozGWIdG+fUn9v/9dxPPuw+vagMIapEBfo2co0bm3VY81zyUgS1vL3
         de4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mGdJPDUGgYzwAL3SgAbKiMViZd+/fBdM1i+zKmsFHmk=;
        b=RA8j/G52nmKM3WKu6/RB0FPcnJncKrRtxLKwgBAdgXOzgYqoIu0vFigiZQUIF9EKam
         Ul88f3p6KEXzt1xUnpj9qOHX1lIvR+FRExOV1zKm5ZqpJCGeVNVU2FTBJBYWZpHc5qUt
         RoYH6uFJ7vfpASnFqdsb5qVuX155Sz9ShyKz/CmUf88+VVJ/JMysY2AgyyXVMoka2tF3
         9MWi6xP0WOerMpxoWOCC5IEGrevNBvnD+jPpltxIZmOnZ8KOg+6Zkt2plryd7uTYBgF8
         hC1gRgDqcoe/8DlohuHw0IVY/tEE0vbiSETi7rPy6lKzAYrUA/PWhW++QkeDPB0tvCWM
         Mgzw==
X-Gm-Message-State: AOAM533zUgUgLG9sR2vomAMuJycsfZpkQE/5AoBfstMGtoMHMSpb6HLx
	IlkaYY0NkuYt543uN6sX7MgCDLCGz7XAiglx+Lw=
X-Google-Smtp-Source: 
 ABdhPJw+7xGFvAy3ct+AXPoTEj1f5Rui4hJO94n79NdB1q8joK4pVt1KTehKLTZtiKBAhJkMdZoceu+qXngW8a6Lqcg=
X-Received: by 2002:a2e:5111:: with SMTP id
 f17mr12039269ljb.409.1633296666489;
 Sun, 03 Oct 2021 14:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211003111403.334046-1-quaresma.jose@gmail.com>
 <AM9PR09MB4642587EE369115CA92B40A0A8AD9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642587EE369115CA92B40A0A8AD9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 3 Oct 2021 22:30:58 +0100
Message-ID: 
 <CANPvuRm2jrUrTFuzByGEj4T7brK5S2cNkk+JKF0rHnkmUxVaAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] patch.bbclass: when the patch fails show
 more info on the fatal error
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Quentin Schulz <foss@0leil.net>
Content-Type: multipart/alternative; boundary="0000000000009e772d05cd7983e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 21:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156559

--0000000000009e772d05cd7983e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Konrad Weihmann <kweihmann@outlook.com> escreveu no dia domingo, 3/10/2021
=C3=A0(s) 12:54:

>
>
> On 03.10.21 13:14, Jose Quaresma wrote:
> > There are situration when the user have the 'patchdir' defined
> > as a parameter on SRC_URI. However he doesn't know with this,
> > the patch is applied relatively to the receipe source dir 'S'.
> >
> > When user have 'patchdir' defined check if this directory exist.
> > If the patch fails show addition info to the user:
> >   * Import: show the striplevel
> >   * Resolver: show the expanded 'patchdir' to the user.
> >
> > On the next example, the patch is applied on ${WORKDIR}/contrib.
>
> Nice patch, that will turn really helpful, thanks for that one
>
> >
> > S =3D "${WORKDIR}/git"
> > SRCREV_FORMAT =3D "opencv_contrib"
> > SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \
> >             git://
> github.com/opencv/opencv_contrib.git;destsuffix=3Dcontrib;name=3Dcontrib =
\
> >
>  file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../contrib \
> >             "
> >
> > But if the user specifies a path on 'patchdir' that don't exist,
> > (patchdir=3D../no-found-on-file-system) the patch will fail and there
> > are no message that indicates the real cause.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >   meta/classes/patch.bbclass | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> > index 388773a237..30753dc65b 100644
> > --- a/meta/classes/patch.bbclass
> > +++ b/meta/classes/patch.bbclass
> > @@ -131,6 +131,9 @@ python patch_do_patch() {
> >               patchdir =3D parm["patchdir"]
> >               if not os.path.isabs(patchdir):
> >                   patchdir =3D os.path.join(s, patchdir)
> > +            if not os.path.isdir(patchdir):
> > +                bb.fatal("Patch target source directory '%s' not found=
,
> 'patchdir' is incorrect in '%s'" %
> > +                    (patchdir, parm['patchname']))
> >           else:
> >               patchdir =3D s
> >
> > @@ -147,11 +150,13 @@ python patch_do_patch() {
> >               patchset.Import({"file":local, "strippath":
> parm['striplevel']}, True)
> >           except Exception as exc:
> >               bb.utils.remove(process_tmpdir, True)
> > +            bb.fatal("Import patch '%s' with striplevel '%s'" %
> (parm['patchname'], parm['striplevel']))
> >               bb.fatal(str(exc))
>
> I'm not a 100% sure about consecutive bb.fatal calls. To my
> understanding each of the calls will raise a BBHandledException, which
> is caught at toplevel and leading to sys.exit - so a bb.fatal after a
> bb.fatal is likely dead code, as it will be never called.
>

Thanks, good catch.
Does not make sense to call bb.fatal one after the other.
I will send a V5.


> But I might be wrong here - looking for more insights from the bitbake
> experts
>
>
> >           try:
> >               resolver.Resolve()
> >           except bb.BBHandledException as e:
> >               bb.utils.remove(process_tmpdir, True)
> > +            bb.fatal("Resolve patch '%s' on target directory '%s'" %
> (parm['patchname'], patchdir))
> >               bb.fatal(str(e))
> >
> >       bb.utils.remove(process_tmpdir, True)
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156549):
> https://lists.openembedded.org/g/openembedded-core/message/156549
> > Mute This Topic: https://lists.openembedded.org/mt/86039997/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009e772d05cd7983e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Konrad Weihmann &lt;<a href=3D"mailto=
:kweihmann@outlook.com">kweihmann@outlook.com</a>&gt; escreveu no dia domin=
go, 3/10/2021 =C3=A0(s) 12:54:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 03.10.21 13:14, Jose Quaresma wrote:<br>
&gt; There are situration when the user have the &#39;patchdir&#39; defined=
<br>
&gt; as a parameter on SRC_URI. However he doesn&#39;t know with this,<br>
&gt; the patch is applied relatively to the receipe source dir &#39;S&#39;.=
<br>
&gt; <br>
&gt; When user have &#39;patchdir&#39; defined check if this directory exis=
t.<br>
&gt; If the patch fails show addition info to the user:<br>
&gt;=C2=A0 =C2=A0* Import: show the striplevel<br>
&gt;=C2=A0 =C2=A0* Resolver: show the expanded &#39;patchdir&#39; to the us=
er.<br>
&gt; <br>
&gt; On the next example, the patch is applied on ${WORKDIR}/contrib.<br>
<br>
Nice patch, that will turn really helpful, thanks for that one<br>
<br>
&gt; <br>
&gt; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; SRCREV_FORMAT =3D &quot;opencv_contrib&quot;<br>
&gt; SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencv/opencv.git=
;name=3Dopencv" rel=3D"noreferrer" target=3D"_blank">github.com/opencv/open=
cv.git;name=3Dopencv</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/github.com/opencv/opencv_contrib.git;destsuffix=3Dcontrib;name=3Dcontrib" =
rel=3D"noreferrer" target=3D"_blank">github.com/opencv/opencv_contrib.git;d=
estsuffix=3Dcontrib;name=3Dcontrib</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-sfm-link-wi=
th-Glog_LIBS.patch;patchdir=3D../contrib \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; But if the user specifies a path on &#39;patchdir&#39; that don&#39;t =
exist,<br>
&gt; (patchdir=3D../no-found-on-file-system) the patch will fail and there<=
br>
&gt; are no message that indicates the real cause.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/patch.bbclass | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass<b=
r>
&gt; index 388773a237..30753dc65b 100644<br>
&gt; --- a/meta/classes/patch.bbclass<br>
&gt; +++ b/meta/classes/patch.bbclass<br>
&gt; @@ -131,6 +131,9 @@ python patch_do_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchdir =3D par=
m[&quot;patchdir&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.i=
sabs(patchdir):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pa=
tchdir =3D os.path.join(s, patchdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isdir(patchd=
ir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quo=
t;Patch target source directory &#39;%s&#39; not found, &#39;patchdir&#39; =
is incorrect in &#39;%s&#39;&quot; %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (patchdir, parm[&#39;patchname&#39;]))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchdir =3D s<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -147,11 +150,13 @@ python patch_do_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patchset.Import(=
{&quot;file&quot;:local, &quot;strippath&quot;: parm[&#39;striplevel&#39;]}=
, True)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as exc:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(=
process_tmpdir, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Import patch=
 &#39;%s&#39; with striplevel &#39;%s&#39;&quot; % (parm[&#39;patchname&#39=
;], parm[&#39;striplevel&#39;]))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(str(exc=
))<br>
<br>
I&#39;m not a 100% sure about consecutive bb.fatal calls. To my <br>
understanding each of the calls will raise a BBHandledException, which <br>
is caught at toplevel and leading to sys.exit - so a bb.fatal after a <br>
bb.fatal is likely dead code, as it will be never called.<br></blockquote><=
div><br></div><div>Thanks, good catch.</div><div>Does not make sense to cal=
l bb.fatal one after the other.<br></div><div>I will send a V5.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
But I might be wrong here - looking for more insights from the bitbake <br>
experts<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resolver.Resolve=
()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except bb.BBHandledException a=
s e:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(=
process_tmpdir, True)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Resolve patc=
h &#39;%s&#39; on target directory &#39;%s&#39;&quot; % (parm[&#39;patchnam=
e&#39;], patchdir))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(str(e))=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(process_tmpdir, True)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#156549): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/156549" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/156549</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86039997=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86039997/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000009e772d05cd7983e3--

