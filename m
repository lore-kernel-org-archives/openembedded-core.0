Return-Path: <eugenyshcheglov@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 30F0E610EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 11:42:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h9so2566348otj.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 03:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Anff93Nsg+KaXO9Uyn2R0mfXpf1dT7w0isUWLB7cJo=;
	b=dmczDXdLh50ZPCEhCsPXG6JVjCgyFZtClKNrR9NspllZag3LYRF/emky9JKVBpMpLx
	CZ8kxeooPdLu2hyEM57M4XEdD4ccLwfh4caLf0PZ795mY23BSDJzBqjT1sQRmvDxKuK7
	KvnTHeNMSXcjCUf/Eb6UCYumFBSf9YN2gPvB4wAdSigCMJ0d9+05RUHqcM1uzORGU6+h
	XK2eiVy1NQnVeC29rY7oGSZJPtnLWkM6Ut2cu1SuJXd+aoTrz/C4z7V4SGi7Y8VCqGKo
	C6YyUR05sVYENTfIIW/+FDLP+YjWDlMYvWlmpp9Q3eA1ePdiT/c6lzLR3wlGWxC/U+8l
	UEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Anff93Nsg+KaXO9Uyn2R0mfXpf1dT7w0isUWLB7cJo=;
	b=dLXMnYu7qS/TCUB19faTiDwCDwfWU5j5OrX37OAYtXnialFrslohx2ZEabyTTadvGC
	ObQ1GT2lbj8N22B9+lR31M6x7f+kTD+VLADPkpiq3bYfEk4CodEVZnoWqfnNH1fQ3Xkw
	hf4AMYEInYG2JdIr9tO95aFG1Vj+rsqrn3SuvuF0zi5pA6Lvd/uujM1yhFNki5EBsBEu
	7cKMh2y+dR1bcS7986A0DwnaZ0UI2Tj9R6lFBFIGLRuz90wJbzh5NCDUHMNEdn08VY9h
	GS0UFPakn98Ynux5yIEkBKdeN2gdbhb85QTO23wDhaIk6RWuuzj0SvMBssz0JfDHUcyl
	Vgxg==
X-Gm-Message-State: APjAAAXR/Uyc0mwAa/iEP/YUUU8+sisZM1FpCLJDZ8bSiSyZppAuryFu
	4y2Yl1xpRRdCNDT1GV+ONBMWXsUTdV6wEoEnDYQ=
X-Google-Smtp-Source: APXvYqw2T9B+zKPGiNB8uAGrsVuJ0MS+QuzLVsLdHl8MOaigtpoePcWcbTDD331LhVSyoG1QRoZi6tRqghGbHkV+xCM=
X-Received: by 2002:a9d:7548:: with SMTP id b8mr3082203otl.74.1582803757718;
	Thu, 27 Feb 2020 03:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20200225141733.54584-1-eugenyshcheglov@gmail.com>
	<CAJ86T=VH+nVRgdWr4hyX0WZVnGwu=4MOsSs7a_8QcqAYHt1nfA@mail.gmail.com>
In-Reply-To: <CAJ86T=VH+nVRgdWr4hyX0WZVnGwu=4MOsSs7a_8QcqAYHt1nfA@mail.gmail.com>
From: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Date: Thu, 27 Feb 2020 13:42:25 +0200
Message-ID: <CALepYk+MjGAN_XO9abU9pd6Zq+7FYezboCTSEqBUneGphjTu8g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Avoid recursive symlink in oe_soinstall
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
X-List-Received-Date: Thu, 27 Feb 2020 11:42:37 -0000
Content-Type: multipart/alternative; boundary="000000000000ba62a9059f8d375e"

--000000000000ba62a9059f8d375e
Content-Type: text/plain; charset="UTF-8"

>This patch look OK but it might be nice to also clean up this error
message (and the Example comment a few lines above it) to drop the 3
levels of version number. There should only be 2, ie the fully
versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3

Yeah, sound reasonable. According to the tLDP (
http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html)
there can be be 3 levels, but last one is optional. Quote from tLDP:
*"The real name adds to the soname a period, a minor *

*number, another period, and the release number. The last period and
release number are optional". *

So yes, correct fully versioned name should contain at least two numbers

>"oe_soinstall: $libname soname is equal to fully versioned real (file)
name. The soname should include the major version only (e.g.libfoo.so.1
instead of libfoo.so.1.2)"

Good point. But what if library real name is libfoo.so.1 and soname is
libfoo.so.1 too? In my opinion there is two ways:

1) Add one more check: parse $sonamelink and throw bbwarn if soname is
incorrect. "Incorrect" in this case means that
soname contain more than one version (libfoo.so.1.2)

2) Mention both possible problems in bbwarn. Like: " $libname soname is
equal to fully versioned real (file)
name. The soname should include the major version only (e.g. libfoo.so.1
instead of libfoo.so.1.2) or minor version
should be added to library real name (e.g. libfoo.so.1.2 instead of
libfoo.so.1) ; "

First one is definitely clearer. So I'm going to implement it and send
version 2 of patch

On Wed, Feb 26, 2020 at 10:08 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Feb 25, 2020 at 6:17 AM Yevhenii Shchehlov
> <eugenyshcheglov@gmail.com> wrote:
> >
> > This patch fixes an issue when oe_soinstall function creates
> > non-functional recursive symlinks in case library soname is equal
> > to library real (file) name.
> >
> > Signed-off-by: Yevhenii Shchehlov <eugenyshcheglov@gmail.com>
> > ---
> >  meta/classes/utils.bbclass | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> > index cd3d05709e..dea824f54f 100644
> > --- a/meta/classes/utils.bbclass
> > +++ b/meta/classes/utils.bbclass
> > @@ -25,7 +25,7 @@ oe_soinstall() {
> >         libname=`basename $1`
> >         case "$libname" in
> >             *.so)
> > -               bbfatal "oe_soinstall: Shared library must haved
> versioned filename (e.g. libfoo.so.1.2.3)"
> > +               bbfatal "oe_soinstall: Shared library must haved
> versioned filename (e.g. libfoo.so.1.2.3 instead of libfoo.so)"
>
> This patch look OK but it might be nice to also clean up this error
> message (and the Example comment a few lines above it) to drop the 3
> levels of version number. There should only be 2, ie the fully
> versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3
>
> >                 ;;
> >         esac
> >         install -m 755 $1 $2/$libname
> > @@ -33,8 +33,12 @@ oe_soinstall() {
> >         if [ -z $sonamelink ]; then
> >                 bbfatal "oe_soinstall: $libname is missing ELF tag
> 'SONAME'."
> >         fi
> > +       if [ "$sonamelink" == "$libname" ]; then
> > +               bbwarn "oe_soinstall: $libname soname is equal to real
> (file) name. Minor version should be added to a real name (e.g.
> libfoo.so.1.2 instead of libfoo.so.1)"
>
> It might be clearer to say:
>
> "oe_soinstall: $libname soname is equal to fully versioned real (file)
> name. The soname should include the major version only (e.g.
> libfoo.so.1 instead of libfoo.so.1.2)"
>
> > +       else
> > +               ln -sf $libname $2/$sonamelink
> > +       fi
> >         solink=`echo $libname | sed -e 's/\.so\..*/.so/'`
> > -       ln -sf $libname $2/$sonamelink
> >         ln -sf $libname $2/$solink
> >  }
> >
> > --
> > 2.25.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ba62a9059f8d375e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail-im">&gt;</span>This patch look OK but=
 it might be nice to also clean up this error<br>
message (and the Example comment a few lines above it) to drop the 3<br>
levels of version number. There should only be 2, ie the fully<br><div>
versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3<span c=
lass=3D"gmail-im"><br></span></div><div><br></div><div>Yeah, sound reasonab=
le. According to the tLDP (<a href=3D"http://tldp.org/HOWTO/Program-Library=
-HOWTO/shared-libraries.html">http://tldp.org/HOWTO/Program-Library-HOWTO/s=
hared-libraries.html</a>) <br></div><div>there can be be 3 levels, but last=
 one is optional. Quote from tLDP: <i>&quot;The real name adds to the sonam=
e a period, a
minor <br></i></div><div><i>number, another period, and the release number.
The last period and release number <b>are</b> <b>optional</b>&quot;. <br></=
i></div><div><i><br></i></div><div>So yes, correct fully versioned name sho=
uld contain at least two numbers</div><div><br></div><div>&gt;&quot;oe_soin=
stall: $libname soname is equal to fully versioned real (file) name. The so=
name should include the major version only (e.g.libfoo.so.1 instead of libf=
oo.so.1.2)&quot;</div><div><br></div><div>Good point. But what if library r=
eal name is libfoo.so.1 and soname is libfoo.so.1 too? In my opinion there =
is two ways: <br></div><div><br></div><div>1) Add one more check: parse $so=
namelink and throw bbwarn if soname is incorrect. &quot;Incorrect&quot; in =
this case means that <br></div><div>soname contain more than one version (l=
ibfoo.so.1.2)<br></div><div><br></div><div>2) Mention both possible problem=
s in bbwarn. Like: &quot; $libname soname is equal to fully versioned real =
(file)<br>
name. The soname should include the major version only (e.g. libfoo.so.1 in=
stead of libfoo.so.1.2) or minor version <br></div><div>should be added to =
library real name (e.g. libfoo.so.1.2 instead of libfoo.so.1) ; &quot;</div=
><div><br></div><div>First one is definitely clearer. So I&#39;m going to i=
mplement it and send version 2 of patch<br></div><div><i></i></div><div><sp=
an class=3D"gmail-im"></span></div><div><span class=3D"gmail-im"></span></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Feb 26, 2020 at 10:08 PM Andre McCurdy &lt;<a href=3D"mailto:arm=
ccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, Feb 25, 2020 at 6:17 AM Yevhen=
ii Shchehlov<br>
&lt;<a href=3D"mailto:eugenyshcheglov@gmail.com" target=3D"_blank">eugenysh=
cheglov@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This patch fixes an issue when oe_soinstall function creates<br>
&gt; non-functional recursive symlinks in case library soname is equal<br>
&gt; to library real (file) name.<br>
&gt;<br>
&gt; Signed-off-by: Yevhenii Shchehlov &lt;<a href=3D"mailto:eugenyshcheglo=
v@gmail.com" target=3D"_blank">eugenyshcheglov@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/utils.bbclass | 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass<b=
r>
&gt; index cd3d05709e..dea824f54f 100644<br>
&gt; --- a/meta/classes/utils.bbclass<br>
&gt; +++ b/meta/classes/utils.bbclass<br>
&gt; @@ -25,7 +25,7 @@ oe_soinstall() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libname=3D`basename $1`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &quot;$libname&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*.so)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;=
oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.=
1.2.3)&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;=
oe_soinstall: Shared library must haved versioned filename (e.g. libfoo.so.=
1.2.3 instead of libfoo.so)&quot;<br>
<br>
This patch look OK but it might be nice to also clean up this error<br>
message (and the Example comment a few lines above it) to drop the 3<br>
levels of version number. There should only be 2, ie the fully<br>
versioned filename would be libfoo.so.1.2 instead of libfoo.so.1.2.3<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 $1 $2/$libname<br>
&gt; @@ -33,8 +33,12 @@ oe_soinstall() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z $sonamelink ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &=
quot;oe_soinstall: $libname is missing ELF tag &#39;SONAME&#39;.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$sonamelink&quot; =3D=3D &quot;=
$libname&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;o=
e_soinstall: $libname soname is equal to real (file) name. Minor version sh=
ould be added to a real name (e.g. libfoo.so.1.2 instead of libfoo.so.1)&qu=
ot;<br>
<br>
It might be clearer to say:<br>
<br>
&quot;oe_soinstall: $libname soname is equal to fully versioned real (file)=
<br>
name. The soname should include the major version only (e.g.<br>
libfoo.so.1 instead of libfoo.so.1.2)&quot;<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $libnam=
e $2/$sonamelink<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0solink=3D`echo $libname | sed -e &#39=
;s/\.so\..*/.so/&#39;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $libname $2/$sonamelink<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $libname $2/$solink<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ba62a9059f8d375e--
