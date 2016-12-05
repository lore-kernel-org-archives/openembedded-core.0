Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2589571993
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:37:11 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id p16so308602777qta.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 02:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E9DxegqzaIJuaRH5oqci7OAIR7G6OSBw2/SVuyx2A7g=;
	b=rN6kb5lKb+/A89eEANnT4NMCSZASYZ89bVgAYLSV7bVNsferr3eRRkeS9Hjplk/XBT
	PrORBgl+VDcr/gTQdMIU6SwBU210dZkkg2OjSjlh2aj9SPd4xiSuVEjzDr033EzDrACY
	lOFlXO3eIpIZuGVuNtm/N6qD+xNeiYyg9QR3P33TMegAJEFm5wAPYO8vx0Lo0tYgX+yq
	EO1ND0SrmM1nKijuvBEW/Qhhs8LxKMkyP/zD7gyhvg/CJzrgyK83RpGcstbOJuRoNchz
	AKrm6XV40pelvkYdb815bsL/qeKlEl+i9VbQa9fMmhT9bo0uGDamnUpJ6Jg8pG8DE+qS
	Boww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E9DxegqzaIJuaRH5oqci7OAIR7G6OSBw2/SVuyx2A7g=;
	b=OvqG372lSu1miK2WHU/T7FXec5no5FUAfGVCI8gAKg66jLBuCUakXNn1nR4B4/Cn8F
	5KyQxthDRen/JfJGxV/JcibYn5s/zvbL5fDodBE2fx+hkeydw7322gJQV8wkNpa0MJ4v
	REJvCUAu1DpgfimXo1uRDn3h5h+/KnIqUL/6kE5fWSm+tKoT9o9c1tMt/m7FIg/2syhb
	eRIq062bzXsMxdVrEv+j6LWfpu2hqSNnIFNyAwWwLr7fR5vESP990eSLquxZbeTEu1Xg
	UmOkGJwMbqrRJA3/yAK6/AieB1mfmmQitPFtztFj5IyrAsewMkaiiflIbAOFfjvCzDHW
	qM0Q==
X-Gm-Message-State: AKaTC02rp6hWcm8uGOnukK6jUYx787EYKkFuVa5YGLjUak9fSbWyG+cd179lpNJOEVhPtv7EaIjWilBhxpriB1gp
X-Received: by 10.237.49.230 with SMTP id 93mr48384778qth.109.1480934233201;
	Mon, 05 Dec 2016 02:37:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 02:36:52 -0800 (PST)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C6D68FE3@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1480507368-10692-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C6D68FE3@G08CNEXMBPEKD03.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 10:36:52 +0000
Message-ID: <CAJTo0Lbrx_WwQjEPmkY_H8PV-Uizgm2Q7_YcXox=hAVTHUL5dw@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: 4.13 -> 4.14
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
X-List-Received-Date: Mon, 05 Dec 2016 10:37:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e2e7f5ad0542e6dee8

--94eb2c1251e2e7f5ad0542e6dee8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This and your other patches are under testing now.

On 5 December 2016 at 02:38, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> ping
>
> > -----Original Message-----
> > From: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87
> > Sent: Wednesday, November 30, 2016 8:03 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87 <huangqy.fnst@cn.fujitsu.c=
om>
> > Subject: [OE-core] [PATCH] strace: 4.13 -> 4.14
> >
> > From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> >
> > Upgrade strace from 4.13 to 4.14.
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> >  meta/recipes-devtools/strace/{strace_4.13.bb =3D> strace_4.14.bb} | 4
> ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)  rename
> > meta/recipes-devtools/strace/{strace_4.13.bb =3D> strace_4.14.bb} (91%)
> >
> > diff --git a/meta/recipes-devtools/strace/strace_4.13.bb
> > b/meta/recipes-devtools/strace/strace_4.14.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/strace/strace_4.13.bb
> > rename to meta/recipes-devtools/strace/strace_4.14.bb
> > index cae7f21..452925c 100644
> > --- a/meta/recipes-devtools/strace/strace_4.13.bb
> > +++ b/meta/recipes-devtools/strace/strace_4.14.bb
> > @@ -15,8 +15,8 @@ SRC_URI =3D
> > "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
> >             file://mips-SIGEMT.patch \
> >             "
> >
> > -SRC_URI[md5sum] =3D "4b78c7febdd24c79d5147824d1a080a3"
> > -SRC_URI[sha256sum] =3D
> > "d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7"
> > +SRC_URI[md5sum] =3D "1e39b5f7583256d7dc21170b9da529ae"
> > +SRC_URI[sha256sum] =3D
> > "5bed5110b243dce6864bedba269446c18c8c63f553cdd7fd4f808d89a764712f"
> >
> >  inherit autotools ptest bluetooth
> >
> > --
> > 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1251e2e7f5ad0542e6dee8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This and your other patches are under testing now.</div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 December 2016 =
at 02:38, Huang, Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto:huangqy.fnst@=
cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">ping<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87<br>
&gt; Sent: Wednesday, November 30, 2016 8:03 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Huang, Qiyu/=E9=BB=84 =E7=90=A6=E5=AE=87 &lt;<a href=3D"mailto:hua=
ngqy.fnst@cn.fujitsu.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] strace: 4.13 -&gt; 4.14<br>
&gt;<br>
&gt; From: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">hu=
angqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt;<br>
&gt; Upgrade strace from 4.13 to 4.14.<br>
&gt;<br>
&gt; Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/strace/{<a href=3D"http://strace_4.13.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>strace_4.13.bb</a> =3D&gt; <a hre=
f=3D"http://strace_4.14.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.1=
4.bb</a>} | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)=C2=A0 rename<br>
&gt; meta/recipes-devtools/strace/{<a href=3D"http://strace_4.13.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>strace_4.13.bb</a> =3D&gt; <a href=3D"h=
ttp://strace_4.14.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.14.bb</=
a>} (91%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>strace/<a href=3D"http://strac=
e_4.13.bb" rel=3D"noreferrer" target=3D"_blank">strace_4.13.bb</a><br>
&gt; b/meta/recipes-devtools/<wbr>strace/<a href=3D"http://strace_4.14.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_4.14.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/strace/<a href=3D"http://strace_4.13=
.bb" rel=3D"noreferrer" target=3D"_blank">s<wbr>trace_4.13.bb</a><br>
&gt; rename to meta/recipes-devtools/strace/<a href=3D"http://strace_4.14.b=
b" rel=3D"noreferrer" target=3D"_blank">s<wbr>trace_4.14.bb</a><br>
&gt; index cae7f21..452925c 100644<br>
&gt; --- a/meta/recipes-devtools/<wbr>strace/<a href=3D"http://strace_4.13.=
bb" rel=3D"noreferrer" target=3D"_blank">strace_4.13.bb</a><br>
&gt; +++ b/meta/recipes-devtools/<wbr>strace/<a href=3D"http://strace_4.14.=
bb" rel=3D"noreferrer" target=3D"_blank">strace_4.14.bb</a><br>
&gt; @@ -15,8 +15,8 @@ SRC_URI =3D<br>
&gt; &quot;${SOURCEFORGE_MIRROR}/strace/<wbr>strace-${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mips-SIGEMT.patc=
h \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>4b78c7febdd24c79d5147824d1a080<wbr>a3&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;<wbr>d48f732576c91ece36a5843d63f9be<wbr>054c40ef59f1e47739860426=
368616<wbr>25d7&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>1e39b5f7583256d7dc21170b9da529<wbr>ae&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;<wbr>5bed5110b243dce6864bedba269446<wbr>c18c8c63f553cdd7fd4f808d=
89a764<wbr>712f&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools ptest bluetooth<br>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c1251e2e7f5ad0542e6dee8--
