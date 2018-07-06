Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 47E2E7885D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 04:50:42 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id l189-v6so6140313vke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 21:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3bb0DqTnuwWnYGACf+q9NUw1pjaTXB1dLV/HBT3VHPU=;
	b=NF/1oknBUr8a94vZUup8b6gnaAnmNG5ePjl6bG9a5zdaHthis0Lx3B8Xiyr8skfDwN
	3GMe5xqfo2O6Cf/rhpAExdAjhDMulD8gfkr5dDyvA5hGV4nmEx9PaaszICoOwVOYoqDb
	YeC8NG/VwedXOCWmxIB4Uv2qvjgoJb1WfyUOzvtN4Vg7ucB9NCJW32rUjYzHURDYBScS
	beniY0Aap0o4DQTob0RGaY97xZyRbXgjDQL3l2/6Ur2rs5/6hijw3fz/1yW8pAuR44lA
	KUEg1p5joT89HD4iSUumslZvRxETj8mZLKM1cRCQFKh7EhOJBmj93kmm0hfSop4Fa2D6
	VvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3bb0DqTnuwWnYGACf+q9NUw1pjaTXB1dLV/HBT3VHPU=;
	b=ABY8Uckf6aVfghM4/LtK4dvvhIZUzsvRoNIhZgLV3vV7God42qUhGpkKKHPUKcBOoB
	vXSZqxyucnT4Wl7tTOnLzUVGBXAgnI+0zvv/x2EMPsjv8HIaFoB6dWl0JJeuWcIQPz8i
	Wcgbd3HNtiAo9UOxfvbqlgWPNVQckxqYuLkQB8blpifHIsn7QvcYh8tC7CQ7J8HvHkFW
	9dGet2klB8py/9gz5hqut+Yj+JtTQF20UZXcRgJL7fIpkLYuiU154pSPRNY03LW66/Hz
	4JJw6Lb9wDzZwXf6mTz1DF0LuE1zh3PqsVhgdRg57A1NBEcAHDpihRQ3F3aopRmnsIrr
	IZBQ==
X-Gm-Message-State: APt69E2K94GSzbcAbE5PfPT44BkRg9z5WwOOalKFJjqDGjiDtp3ffSdA
	L4w1sL09d319VDe5m45G8ExfEbRW2Ma+Y2yw46M=
X-Google-Smtp-Source: AAOMgpejVmeJ9AmU5vyDSgmRCjcXp2EK532n5AocQFk8LpQfWPbPtFb60pGfdaTSiUrfKpB+xZr6uarTQy7Jr3zUdS0=
X-Received: by 2002:a1f:5244:: with SMTP id
	g65-v6mr4883628vkb.28.1530852642889; 
	Thu, 05 Jul 2018 21:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
	<1909050.5dYaE66dI1@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqTp4y-a=cxdhy-DCax+V2h=S+QRY419qYiMgeBNuGtwg@mail.gmail.com>
	<521b95cb51424da79205d466f7376a2d@in.bosch.com>
In-Reply-To: <521b95cb51424da79205d466f7376a2d@in.bosch.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2018 21:50:31 -0700
Message-ID: <CAMKF1srUPS6OBEhWm1=gEVQxiYEj226ePfR9iuUV3j72FdU6fA@mail.gmail.com>
To: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Fri, 06 Jul 2018 04:50:42 -0000
Content-Type: multipart/alternative; boundary="000000000000fba51e05704d6715"

--000000000000fba51e05704d6715
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, you can try that


On Thu, Jul 5, 2018 at 9:29 PM Vignesh Rajendran (RBEI/ECF3) <
Vignesh.Rajendran@in.bosch.com> wrote:

> Hello Khem,
>
> Can you clarify your idea and my question?
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Best regards
>
> Rajendran Vignesh
> RBEI/ECF33
>
> Tel. +91 422 67-65103
>
>
> -----Original Message-----
> From: Vignesh Rajendran (RBEI/ECF3)
> Sent: Tuesday, June 19, 2018 10:24 AM
> To: 'Khem Raj' <raj.khem@gmail.com>; Paul Eggleton <
> paul.eggleton@linux.intel.com>
> Cc: Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>
> Subject: RE: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
> sources in externalsrc -dbg packages
>
> Hello Khem,
>
> >> perhaps setting DEBUG_PREFIX_MAP relative to S instead of WORKDIR is
> >> going to take care of this
>
> Do you mean to change it at bitbake.conf ?
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Best regards
>
> Rajendran Vignesh
> RBEI/ECF33
>
> Tel. +91 422 67-65103
>
>
> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Monday, June 18, 2018 11:13 PM
> To: Paul Eggleton <paul.eggleton@linux.intel.com>
> Cc: Vignesh Rajendran (RBEI/ECF3) <Vignesh.Rajendran@in.bosch.com>;
> Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug
> sources in externalsrc -dbg packages
>
> On Sun, May 20, 2018 at 3:26 PM Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> >
> > Hi Vignesh,
> >
> > Thanks for the patch, a question below.
> >
> > On Thursday, 17 May 2018 5:50:00 PM NZST Vignesh Rajendran wrote:
> > > The recipes which are using externalsrc method doesn't contain the
> > > debug sources in their -dbg packages.
> > >
> > > Add a handling in copydebugsources function to copy the debugsources
> for
> > > externalsrc -dbg packages.
> > >
> > > Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com>
> > > ---
> > >  meta/classes/externalsrc.bbclass |  3 +++
> > >  meta/classes/package.bbclass     | 12 ++++++++++--
> > >  2 files changed, 13 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> > > index c9f5cf7..135670d 100644
> > > --- a/meta/classes/externalsrc.bbclass
> > > +++ b/meta/classes/externalsrc.bbclass
> > > @@ -129,6 +129,9 @@ python () {
> > >              d.setVar('CONFIGURESTAMPFILE', configstamp)
> > >              d.setVar('STAMP',
> '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}')
> > >              d.setVar('STAMPCLEAN',
> '${STAMPS_DIR}/work-shared/${PN}/*-*')
> > > +
> > > +     # set DEBUG_PREFIX_MAP to external source path
> > > +     d.appendVar("DEBUG_PREFIX_MAP",
> "-fdebug-prefix-map=3D${EXTERNALSRC}=3D/usr/src/debug/${PN}/${EXTENDPE}${=
PV}-${PR}")
> > >  }
> > >
> > >  python externalsrc_configure_prefunc() {
> > > diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> > > index edeffa9..f071a2e 100644
> > > --- a/meta/classes/package.bbclass
> > > +++ b/meta/classes/package.bbclass
> > > @@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):
> > >          workdir =3D d.getVar("WORKDIR")
> > >          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
> > >          workbasedir =3D os.path.basename(os.path.dirname(workdir)) +
> "/" + os.path.basename(workdir)
> > > +        externalsrc =3D d.getVar('EXTERNALSRC', True)
> > >
> > >          # If build path exists in sourcefile, it means toolchain did
> not use
> > >          # -fdebug-prefix-map to compile
> > > @@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):
> > >          processdebugsrc +=3D "fgrep -zw '%s' | "
> > >          # Remove prefix in the source paths
> > >          processdebugsrc +=3D "sed 's#%s##g' | "
> > > -        processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL
> --no-preserve-owner '%s%s' 2>/dev/null)"
> > > +        # handle external sources to provide sources in -dbg package=
s
> > > +        if externalsrc:
> > > +            localsrc_prefix =3D "/usr/src/debug/"
> > > +            processdebugsrc +=3D "sed 's#%s/##g' | "
> > > +            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL
> --no-preserve-owner '%s%s/%s' 2>/dev/null)"
> > > +            cmd =3D processdebugsrc % (sourcefile, workbasedir,
> localsrc_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir=
)
> > > +        else:
> > > +            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL
> --no-preserve-owner '%s%s' 2>/dev/null)"
> > > +            cmd =3D processdebugsrc % (sourcefile, workbasedir,
> localsrc_prefix, workparentdir, dvar, debugsrcdir)
> > >
> > > -        cmd =3D processdebugsrc % (sourcefile, workbasedir,
> localsrc_prefix, workparentdir, dvar, debugsrcdir)
> > >          (retval, output) =3D oe.utils.getstatusoutput(cmd)
> > >          # Can "fail" if internal headers/transient sources are
> attempted
> > >          #if retval:
> > >
> >
> > Is there a way we can fix this without adding a reference to externalsr=
c
> in
> > package.bbclass?
> >
>
> perhaps setting DEBUG_PREFIX_MAP relative to S instead of WORKDIR is
> going to take care of this
>
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fba51e05704d6715
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Yes, you can try that=C2=A0</div></div><div><br></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jul 5, 2018 =
at 9:29 PM Vignesh Rajendran (RBEI/ECF3) &lt;<a href=3D"mailto:Vignesh.Raje=
ndran@in.bosch.com">Vignesh.Rajendran@in.bosch.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hello Khem,<br>
<br>
Can you clarify your idea and my question?<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Best regards<br>
<br>
Rajendran Vignesh<br>
RBEI/ECF33=C2=A0 <br>
<br>
Tel. +91 422 67-65103 <br>
<br>
<br>
-----Original Message-----<br>
From: Vignesh Rajendran (RBEI/ECF3) <br>
Sent: Tuesday, June 19, 2018 10:24 AM<br>
To: &#39;Khem Raj&#39; &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;; Paul Eggleton &lt;<a href=3D"mailto:pau=
l.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com=
</a>&gt;<br>
Cc: Patches and discussions about the oe-core layer &lt;<a href=3D"mailto:o=
penembedded-core@lists.openembedded.org" target=3D"_blank">openembedded-cor=
e@lists.openembedded.org</a>&gt;<br>
Subject: RE: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug sour=
ces in externalsrc -dbg packages<br>
<br>
Hello Khem,<br>
<br>
&gt;&gt; perhaps setting DEBUG_PREFIX_MAP relative to S instead of WORKDIR =
is<br>
&gt;&gt; going to take care of this<br>
<br>
Do you mean to change it at bitbake.conf ?<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Best regards<br>
<br>
Rajendran Vignesh<br>
RBEI/ECF33=C2=A0 <br>
<br>
Tel. +91 422 67-65103 <br>
<br>
<br>
-----Original Message-----<br>
From: Khem Raj [mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>] <br>
Sent: Monday, June 18, 2018 11:13 PM<br>
To: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" targ=
et=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;<br>
Cc: Vignesh Rajendran (RBEI/ECF3) &lt;<a href=3D"mailto:Vignesh.Rajendran@i=
n.bosch.com" target=3D"_blank">Vignesh.Rajendran@in.bosch.com</a>&gt;; Patc=
hes and discussions about the oe-core layer &lt;<a href=3D"mailto:openembed=
ded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.=
openembedded.org</a>&gt;<br>
Subject: Re: [OE-core] [meta-oe][PATCH] package.bbclass: provide debug sour=
ces in externalsrc -dbg packages<br>
<br>
On Sun, May 20, 2018 at 3:26 PM Paul Eggleton<br>
&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul=
.eggleton@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Vignesh,<br>
&gt;<br>
&gt; Thanks for the patch, a question below.<br>
&gt;<br>
&gt; On Thursday, 17 May 2018 5:50:00 PM NZST Vignesh Rajendran wrote:<br>
&gt; &gt; The recipes which are using externalsrc method doesn&#39;t contai=
n the<br>
&gt; &gt; debug sources in their -dbg packages.<br>
&gt; &gt;<br>
&gt; &gt; Add a handling in copydebugsources function to copy the debugsour=
ces for<br>
&gt; &gt; externalsrc -dbg packages.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Vignesh Rajendran &lt;<a href=3D"mailto:vignesh.ra=
jendran@in.bosch.com" target=3D"_blank">vignesh.rajendran@in.bosch.com</a>&=
gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/externalsrc.bbclass |=C2=A0 3 +++<br>
&gt; &gt;=C2=A0 meta/classes/package.bbclass=C2=A0 =C2=A0 =C2=A0| 12 ++++++=
++++--<br>
&gt; &gt;=C2=A0 2 files changed, 13 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/exte=
rnalsrc.bbclass<br>
&gt; &gt; index c9f5cf7..135670d 100644<br>
&gt; &gt; --- a/meta/classes/externalsrc.bbclass<br>
&gt; &gt; +++ b/meta/classes/externalsrc.bbclass<br>
&gt; &gt; @@ -129,6 +129,9 @@ python () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;CON=
FIGURESTAMPFILE&#39;, configstamp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;STA=
MP&#39;, &#39;${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}${PV}-${PR}&#39;)<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;STA=
MPCLEAN&#39;, &#39;${STAMPS_DIR}/work-shared/${PN}/*-*&#39;)<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0# set DEBUG_PREFIX_MAP to external source pa=
th<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;DEBUG_PREFIX_MAP&quot;, &q=
uot;-fdebug-prefix-map=3D${EXTERNALSRC}=3D/usr/src/debug/${PN}/${EXTENDPE}$=
{PV}-${PR}&quot;)<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 python externalsrc_configure_prefunc() {<br>
&gt; &gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.=
bbclass<br>
&gt; &gt; index edeffa9..f071a2e 100644<br>
&gt; &gt; --- a/meta/classes/package.bbclass<br>
&gt; &gt; +++ b/meta/classes/package.bbclass<br>
&gt; &gt; @@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir =3D d.getVar(&quot;WORK=
DIR&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workparentdir =3D os.path.dirna=
me(os.path.dirname(workdir))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workbasedir =3D os.path.basenam=
e(os.path.dirname(workdir)) + &quot;/&quot; + os.path.basename(workdir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 externalsrc =3D d.getVar(&#39;EXTERN=
ALSRC&#39;, True)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If build path exists in sourc=
efile, it means toolchain did not use<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # -fdebug-prefix-map to compile=
<br>
&gt; &gt; @@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;fgre=
p -zw &#39;%s&#39; | &quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove prefix in the source p=
aths<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;sed =
&#39;s#%s##g&#39; | &quot;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;(cd &#39;=
%s&#39; ; cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&gt;/dev/null)&q=
uot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # handle external sources to provide=
 sources in -dbg packages<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if externalsrc:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D &q=
uot;/usr/src/debug/&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &=
quot;sed &#39;s#%s/##g&#39; | &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &=
quot;(cd &#39;%s&#39; ; cpio -pd0mlL --no-preserve-owner &#39;%s%s/%s&#39; =
2&gt;/dev/null)&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsr=
c % (sourcefile, workbasedir, localsrc_prefix, workbasedir, externalsrc, dv=
ar, debugsrcdir, workbasedir)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &=
quot;(cd &#39;%s&#39; ; cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&g=
t;/dev/null)&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsr=
c % (sourcefile, workbasedir, localsrc_prefix, workparentdir, dvar, debugsr=
cdir)<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsrc % (sourcefil=
e, workbasedir, localsrc_prefix, workparentdir, dvar, debugsrcdir)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (retval, output) =3D oe.utils.g=
etstatusoutput(cmd)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Can &quot;fail&quot; if inter=
nal headers/transient sources are attempted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #if retval:<br>
&gt; &gt;<br>
&gt;<br>
&gt; Is there a way we can fix this without adding a reference to externals=
rc in<br>
&gt; package.bbclass?<br>
&gt;<br>
<br>
perhaps setting DEBUG_PREFIX_MAP relative to S instead of WORKDIR is<br>
going to take care of this<br>
<br>
&gt; Cheers,<br>
&gt; Paul<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; Paul Eggleton<br>
&gt; Intel Open Source Technology Centre<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000fba51e05704d6715--
