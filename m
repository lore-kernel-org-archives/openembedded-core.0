Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 012DA6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:24:17 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id to1so4097303ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=vwyZYrUDZKyhHVkN261ko6E0xvoFnjp1IghnIs9UupQ=;
	b=wxcKwQzE1mnc+PUk1dUL/2VyHvbICeKu9pqYguBPvLJUvDn/EZ0i43Fo8MWyIpjlXW
	hqN2gI1wPW9vQp41zOHd5bwoAB2TB6Hq12jhk40jh3i7zndOzejNi47gNXbsmz+GGwnW
	SHpDpMNvuRlY5tqAuK073XDguQpbxlJz0z8CKG8abECjuUk8Zj6Hz29SfIKF2S5OiRx0
	ackC+hWNNSOBwiJyji1LEQKuxr4L9h3n4zH4brR3Yg0M2J0lCydzWgGVdXXbx9NBa2ku
	8z3qlQYdoxaoUMSz/J/9ep+ojiCAjcAehtBJnAD8jAFu4NBV3VHsH4WmlY8rmLoDZC4p
	g0Hw==
MIME-Version: 1.0
X-Received: by 10.50.43.165 with SMTP id x5mr2948967igl.40.1394198658060; Fri,
	07 Mar 2014 05:24:18 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.42.198.139 with HTTP; Fri, 7 Mar 2014 05:24:17 -0800 (PST)
In-Reply-To: <1394195975.12327.33.camel@ted>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
	<CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
	<1394195975.12327.33.camel@ted>
Date: Fri, 7 Mar 2014 14:24:17 +0100
X-Google-Sender-Auth: KSg3LeBKxgj7fd-7ITvTny4CCnA
Message-ID: <CABgO3_M1-S7vQC=ypS58T9w6pJTjomAT1uM+Fik4ETA3GSOHzQ@mail.gmail.com>
From: =?ISO-8859-1?Q?S=E9bastien_Mennetrier?= <s.mennetrier@innotis.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Fri, 07 Mar 2014 13:24:21 -0000
Content-Type: multipart/alternative; boundary=089e0122aee0c29ab004f4042b40

--089e0122aee0c29ab004f4042b40
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

This patch was written in dora branch. I will try to adapt it for master
branch and I will send a new patch ASAP.
Sorry for my mistake.


Regards,
S=E9bastien


2014-03-07 13:39 GMT+01:00 Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Tue, 2014-03-04 at 09:19 +0100, Sebastien MENNETRIER wrote:
> > Ping
> >
> >
> >
> > 2014-02-27 14:53 GMT+01:00 S=E9bastien Mennetrier
> > <s.mennetrier@innotis.org>:
> >         This recipe is based on gst-meta-base
> >
> >         Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org=
>
> >         ---
> >          .../gstreamer/gstreamer1.0-meta-base.bb            | 63
> >         ++++++++++++++++++++++
> >          1 file changed, 63 insertions(+)
> >          create mode 100644
> >         meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> >
> >         diff --git
> >         a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> >         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> >         new file mode 100644
> >         index 0000000..3b797f0
> >         --- /dev/null
> >         +++
> >         b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> >         @@ -0,0 +1,63 @@
> >         +DESCRIPTION =3D "Gstreamer1.0 package groups"
> >         +LICENSE =3D "MIT"
> >         +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base
> >         gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
> >         +LIC_FILES_CHKSUM =3D
> >         "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3=
b58
> \
> >         +
> >
>  file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de204=
20"
>
> This patch broke the builds since it was written and tested against
> something which was not master. I can tell this since
> ${COREBASE}/LICENSE changed.
>
> Cheers,
>
> Richard
>
>
>
>
>
>

--089e0122aee0c29ab004f4042b40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>This patch was written in dora =
branch. I will try to adapt it for master branch and I will send a new patc=
h ASAP.<br></div><div>Sorry for my mistake.<br></div><div class=3D"gmail_ex=
tra">
<div><div dir=3D"ltr"><div><br><br>Regards,<br></div>S=E9bastien<br></div><=
/div>
<br><br><div class=3D"gmail_quote">2014-03-07 13:39 GMT+01:00 Richard Purdi=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Tue, 2014-03-04 at 09:19 +0100, =
Sebastien MENNETRIER wrote:<br>
&gt; Ping<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; 2014-02-27 14:53 GMT+01:00 S=E9bastien Mennetrier<br>
&gt; &lt;<a href=3D"mailto:s.mennetrier@innotis.org">s.mennetrier@innotis.o=
rg</a>&gt;:<br>
&gt; =A0 =A0 =A0 =A0 This recipe is based on gst-meta-base<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"m=
ailto:s.mennetrier@innotis.org">s.mennetrier@innotis.org</a>&gt;<br>
&gt; =A0 =A0 =A0 =A0 ---<br>
&gt; =A0 =A0 =A0 =A0 =A0.../gstreamer/<a href=3D"http://gstreamer1.0-meta-b=
ase.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a> =A0 =A0 =A0 =A0 =A0=
 =A0| 63<br>
&gt; =A0 =A0 =A0 =A0 ++++++++++++++++++++++<br>
&gt; =A0 =A0 =A0 =A0 =A01 file changed, 63 insertions(+)<br>
&gt; =A0 =A0 =A0 =A0 =A0create mode 100644<br>
&gt; =A0 =A0 =A0 =A0 meta/recipes-multimedia/gstreamer/<a href=3D"http://gs=
treamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><br=
>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 diff --git<br>
&gt; =A0 =A0 =A0 =A0 a/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><=
br>
&gt; =A0 =A0 =A0 =A0 b/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><=
br>
&gt; =A0 =A0 =A0 =A0 new file mode 100644<br>
&gt; =A0 =A0 =A0 =A0 index 0000000..3b797f0<br>
&gt; =A0 =A0 =A0 =A0 --- /dev/null<br>
&gt; =A0 =A0 =A0 =A0 +++<br>
&gt; =A0 =A0 =A0 =A0 b/meta/recipes-multimedia/gstreamer/<a href=3D"http://=
gstreamer1.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><=
br>
&gt; =A0 =A0 =A0 =A0 @@ -0,0 +1,63 @@<br>
&gt; =A0 =A0 =A0 =A0 +DESCRIPTION =3D &quot;Gstreamer1.0 package groups&quo=
t;<br>
&gt; =A0 =A0 =A0 =A0 +LICENSE =3D &quot;MIT&quot;<br>
&gt; =A0 =A0 =A0 =A0 +DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-b=
ase<br>
&gt; =A0 =A0 =A0 =A0 gstreamer1.0-plugins-good gstreamer1.0-plugins-bad&quo=
t;<br>
&gt; =A0 =A0 =A0 =A0 +LIC_FILES_CHKSUM =3D<br>
&gt; =A0 =A0 =A0 =A0 &quot;file://${COREBASE}/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58 \<br>
&gt; =A0 =A0 =A0 =A0 +<br>
&gt; =A0 =A0 =A0 =A0 =A0file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb=
788c80a0384361b4de20420&quot;<br>
<br>
</div></div>This patch broke the builds since it was written and tested aga=
inst<br>
something which was not master. I can tell this since<br>
${COREBASE}/LICENSE changed.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div><br></div></div>

--089e0122aee0c29ab004f4042b40--
