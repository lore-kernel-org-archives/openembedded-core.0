Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0473D7E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:52:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z19so16551419qtz.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TMZWPmOk+w97dhgT201HiX6o2NS4WWdivfMuzPzQ3eE=;
	b=plIfS/zLKW0SRqdbnC3FJ97oR+zRJsYHgArx0ErsCZ7BbXjwqIGBGnxGccSXqF4B7R
	lqFY+wiAXeNZYQsnph7CCzCjmVEfaaZJBs05X7DE8CBfm+y1mXUHcSaKL4xV+yYzO3Ei
	ttdQX2LlQcTKrXKaJqSpGu9NX2pA+wE4Y8RRjcgd0DpQhSFN5Nfu3kfU3HjbLZZ97cp9
	cO5Mhe+oscxCS9wALHfRDwGyskYX1r/kXM8avOprizdOFoCxOu9RFOGYYpQwKkSjiYot
	scEr+tbJ2qrxQCNN9ezcAdSoAZlRNyrjVh6yT1f+Vg/ZxBdN3cDeZvfg5uZ8+09tKtQo
	DR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TMZWPmOk+w97dhgT201HiX6o2NS4WWdivfMuzPzQ3eE=;
	b=tKAhf7VVvfBm/UD+pX8J7EzjYxj7C3MeeEjK0dw94+C+EtPqTIDLsUbPOgu+z+LTKv
	vq65GAWQROrLz5URKbC+4G1fz8V3Q7gw9D/QHFNdJyqiEWMfU7ijUAZnmk/Ws8n40cZL
	ppQGxpQs5sxzGALHJaUdEOwsROhbpI2aw9+Y3u67D9kLKQpUpQbV8kZ87fn83O82mtvk
	jjCcihTuVi4O/ZJL3E3ILwMBxbOhccNrSEDL8vpUSAQ6jIeurmvn7kTr6scC7rS9I8a7
	Yq95XMqfq/sPCrC2gw/OvbJS9U4UlBwhoAc44PAFQLWQNhVBkVhrH6HPCQvRUDcIu+DY
	rOTQ==
X-Gm-Message-State: APjAAAWGdBzLhHPrri9eFwcJPE9lmMPx3gkVWIE9SJ4PmTgjYkomuGxl
	h4CFwzi34mADrWNiKW0+OIQ7Z0CoJFW5R7J/EkY=
X-Google-Smtp-Source: APXvYqw1Vzt3qRYrVMv4ZB1sQF7fyQfOQ58TACPw5PC2m+yc7Ps/x/v/LRV8vdnqbTk3fjK8C9dAPBCLyhn5vLOJOJA=
X-Received: by 2002:aed:3b0a:: with SMTP id p10mr41678132qte.194.1558363967554;
	Mon, 20 May 2019 07:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
	<d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
	<fc518454-2565-ec27-8f0b-8c1c5832c2df@xilinx.com>
In-Reply-To: <fc518454-2565-ec27-8f0b-8c1c5832c2df@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 07:52:36 -0700
Message-ID: <CAMKF1sqHGoGBJC24_Btcfk3pyV1O_QOmpqy7SzndGZNyJToD=w@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-numpy: Avoid installing copy of f2py script
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
X-List-Received-Date: Mon, 20 May 2019 14:52:47 -0000
Content-Type: multipart/alternative; boundary="000000000000b78829058952e2aa"

--000000000000b78829058952e2aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2019 at 11:56 PM Alejandro Enedino Hernandez Samaniego <
alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:

> Hey Khem,
>
>
> On 5/18/19 10:09 PM, Khem Raj wrote:
> >
> >
> > On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:
> >> Both python-numpy and python3-numpy try to install the file:
> >>
> >> ${D}/${bindir}/f2py
> >>
> >> which causes an error during do_rootfs since the package manager
> >> complains about that.
> >>
> >> The numpy packages create basically copies of f2py script with the
> >> following names:
> >> f2py (on both)
> >> f2py2 (on python 2)
> >> f2py2.7 (on python 2)
> >> f2py3 (on python 3)
> >> f2py3.7 (on python 3)
> >>
> >> Remove the copy of f2py from python-numpy in favor of using the one
> >> from python3
> >> to avoid installation issues at do_rootfs().
> >>
> >
> > what if one does not install py3 ?
>
>
> If you only install py2, you could still execute f2py2 or f2py2.7, I'm
> simply
>
> favoring the py3 installation by default but it should be mostly harmless
>
> since there's still two other copies of the script with different names.


I think it should be such that it=E2=80=99s used from py2 if py3 is not ins=
talled
since otherwise it might break scripts

>
>
> Cheers,
>
> Alejandro
>
> >
> >> Signed-off-by: Alejandro Enedino Hernandez Samaniego
> >> <alejandr@xilinx.com>
> >> ---
> >>   meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git
> >> a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> >> b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> >> index 5013789..a1133da 100644
> >> --- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> >> +++ b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
> >> @@ -4,3 +4,7 @@ require python-numpy.inc
> >>   RDEPENDS_${PN}_class-target_append =3D " \
> >>       ${PYTHON_PN}-subprocess \
> >>   "
> >> +
> >> +do_install_append(){
> >> +        rm ${D}/${bindir}/f2py
> >> +}
> >>
>

--000000000000b78829058952e2aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 19, 2019 at 11:56 PM Alejandro Enedino Hernande=
z Samaniego &lt;<a href=3D"mailto:alejandro.enedino.hernandez-samaniego@xil=
inx.com">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hey Khem,<br>
<br>
<br>
On 5/18/19 10:09 PM, Khem Raj wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:<br>
&gt;&gt; Both python-numpy and python3-numpy try to install the file:<br>
&gt;&gt;<br>
&gt;&gt; ${D}/${bindir}/f2py<br>
&gt;&gt;<br>
&gt;&gt; which causes an error during do_rootfs since the package manager <=
br>
&gt;&gt; complains about that.<br>
&gt;&gt;<br>
&gt;&gt; The numpy packages create basically copies of f2py script with the=
 <br>
&gt;&gt; following names:<br>
&gt;&gt; f2py (on both)<br>
&gt;&gt; f2py2 (on python 2)<br>
&gt;&gt; f2py2.7 (on python 2)<br>
&gt;&gt; f2py3 (on python 3)<br>
&gt;&gt; f2py3.7 (on python 3)<br>
&gt;&gt;<br>
&gt;&gt; Remove the copy of f2py from python-numpy in favor of using the on=
e <br>
&gt;&gt; from python3<br>
&gt;&gt; to avoid installation issues at do_rootfs().<br>
&gt;&gt;<br>
&gt;<br>
&gt; what if one does not install py3 ?<br>
<br>
<br>
If you only install py2, you could still execute f2py2 or f2py2.7, I&#39;m =
<br>
simply<br>
<br>
favoring the py3 installation by default but it should be mostly harmless<b=
r>
<br>
since there&#39;s still two other copies of the script with different names=
.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it shou=
ld be such that it=E2=80=99s used from py2 if py3 is not installed since ot=
herwise it might break scripts=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
<br>
Cheers,<br>
<br>
Alejandro<br>
<br>
&gt;<br>
&gt;&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego <br>
&gt;&gt; &lt;<a href=3D"mailto:alejandr@xilinx.com" target=3D"_blank">aleja=
ndr@xilinx.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 meta/recipes-devtools/python-numpy/<a href=3D"http://python=
-numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python-numpy_1.16.3.=
bb</a> | 4 ++++<br>
&gt;&gt; =C2=A0 1 file changed, 4 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git <br>
&gt;&gt; a/meta/recipes-devtools/python-numpy/<a href=3D"http://python-nump=
y_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python-numpy_1.16.3.bb</a=
> <br>
&gt;&gt; b/meta/recipes-devtools/python-numpy/<a href=3D"http://python-nump=
y_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python-numpy_1.16.3.bb</a=
><br>
&gt;&gt; index 5013789..a1133da 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python-numpy/<a href=3D"http://python-=
numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python-numpy_1.16.3.b=
b</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/python-numpy/<a href=3D"http://python-=
numpy_1.16.3.bb" rel=3D"noreferrer" target=3D"_blank">python-numpy_1.16.3.b=
b</a><br>
&gt;&gt; @@ -4,3 +4,7 @@ require python-numpy.inc<br>
&gt;&gt; =C2=A0 RDEPENDS_${PN}_class-target_append =3D &quot; \<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-subprocess \<br>
&gt;&gt; =C2=A0 &quot;<br>
&gt;&gt; +<br>
&gt;&gt; +do_install_append(){<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}/${bindir}/f2py=
<br>
&gt;&gt; +}<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000b78829058952e2aa--
