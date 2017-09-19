Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 74E3A78202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 02:09:44 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q8so1504441qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=F8vgTmHrMNuMMcCQwVYPI+9pncaX5XR9B4htJ4njiHw=;
	b=iCq6smJ6QMl+n+qzZ40esCalJZUKm+lHKfKEZm0e2jgNMhwFefhJ1l+r9FSg+BUzBK
	Y7uQeww1GNedfMlMEbSthv7APc9HavGwMf+utif0SbPcCJNSStBMim8VeD2pHXedlJmx
	pVFLWJuc28kkvHqS5OtBJsoYyNEg1am9F/86JJsCEpHiV+YVa4LV4tRwwSL3mR7/Koy3
	8M/B6LmW4yp29LzQt1uwuxWE0XnpAT+CTCaw+bZjdIC3B9L9ptW1inQ5x2q1pr9p5KDL
	j5DSDZeku+lMoN1r8U9k2kqW6rYUtIPR2m4mk+z8fw2BNnLzZ7OB6LwpwllIK2zMRWOu
	rw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F8vgTmHrMNuMMcCQwVYPI+9pncaX5XR9B4htJ4njiHw=;
	b=ntv6BPbBoiPUTTD3QzypSZzk69J8SNpfuUcnQDoUvytu79tlpFpmH+r6vZIPdC4whu
	FXLcdsorEy8669ov8wVsoWQydHFuvaDcvIp+wwL385y8IUOtgdNIQSh1yJMqYaKOe2Gy
	iT0GLw0bzMav1iAZG1/VTVEw3cBqQsDbqrCFe9tj5q+Oen98JGlaz+b9sW+pPt5aomEc
	/BjYMLskz3oXHGGfERMQBDco93HRYZ7iX3dcBb5HndzwPI+vJlJv0zWKD/y+wSl/aBrF
	V8dnv0iYeTzGfX/j7WnHBUfAZ/z8lTZmtEVh7Ra2yhLE6KqE+ELT1yxkirlU+k6rn8wZ
	CPcA==
X-Gm-Message-State: AHPjjUiDPjkO2RJlSSLPTNCJCsWJ3cex+OlWUdcb5kCO6ojQrHpfA3ha
	oR2rDl+h9Yrp/hO96a923DX1tYzrkbSBGvzVFmk=
X-Google-Smtp-Source: AOwi7QB0chA+M2oxCcwZGfIud7AmhmQl+43ynvj0jzPeEwU2rMelrTQOMEbwcnzMNtQV7SP2O0bROYqSiEeDA71WAi4=
X-Received: by 10.200.42.244 with SMTP id c49mr11900703qta.46.1505786986233;
	Mon, 18 Sep 2017 19:09:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.41.67 with HTTP; Mon, 18 Sep 2017 19:09:45 -0700 (PDT)
In-Reply-To: <20170918165138.dv6vgaradorduiuq@apollo>
References: <1505738586-28217-1-git-send-email-liu.ming50@gmail.com>
	<20170918165138.dv6vgaradorduiuq@apollo>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 19 Sep 2017 04:09:45 +0200
Message-ID: <CALatG=7grCuPMpA+rkcxRVn=UzHi9XkxTR9jXEbTbt+b6-uBpw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-ifupdown: RDEPENDS on procps
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
X-List-Received-Date: Tue, 19 Sep 2017 02:09:45 -0000
Content-Type: multipart/alternative; boundary="001a114063a86c03af0559815ab6"

--001a114063a86c03af0559815ab6
Content-Type: text/plain; charset="UTF-8"

Hi, Khem:

> busybox can provide the sysctl applet too. Do we take care of that
somewhere ?

sysctl applet has been already compiled since CONFIG_BB_SYSCTL is being
enabled in busybox defconfig.

//Ming Liu


2017-09-18 18:51 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Mon, Sep 18, 2017 at 12:43:06PM +0000, liu.ming50@gmail.com wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS
> > on procps.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > index 733ae41..8774386 100644
> > --- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > @@ -35,7 +35,7 @@ do_install_append_qemuall () {
> >  }
> >
> >  PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
> > -RDEPENDS_${PN} = "netbase"
> > +RDEPENDS_${PN} = "netbase procps"
>
> busybox can provide the sysctl applet too. Do we take care of that
> somewhere ?
>
> >  RCONFLICTS_${PN} = "netbase (< 1:5.0)"
> >
> >  CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114063a86c03af0559815ab6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div>Hi, Khem:<div><br></div><div><span style=3D=
"font-size:14px">&gt; busybox can provide the sysctl applet too. Do we take=
 care of that somewhere ?</span><br></div><div><span style=3D"font-size:14p=
x"><br></span></div><div><span style=3D"font-size:14px">sysctl applet has b=
een already compiled since=C2=A0CONFIG_BB_SYSCTL is being enabled in busybo=
x defconfig.</span></div><div><span style=3D"font-size:14px"><br></span></d=
iv><div><span style=3D"font-size:14px">//Ming Liu=C2=A0</span></div><div><s=
pan style=3D"font-size:14px"><br></span></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2017-09-18 18:51 GMT+02:00 Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><span class=3D"gmail-">On Mon, Sep 18, 2017 at 12:43:06PM +0000, <a =
href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS=
<br>
&gt; on procps.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifup=
down_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a> =
| 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://in=
it-ifupdown_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.=
bb</a> b/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifupdo=
wn_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><br=
>
&gt; index 733ae41..8774386 100644<br>
&gt; --- a/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifup=
down_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><=
br>
&gt; +++ b/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifup=
down_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><=
br>
&gt; @@ -35,7 +35,7 @@ do_install_append_qemuall () {<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 PACKAGE_ARCH_qemuall =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; -RDEPENDS_${PN} =3D &quot;netbase&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;netbase procps&quot;<br>
<br>
</span>busybox can provide the sysctl applet too. Do we take care of that s=
omewhere ?<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt;=C2=A0 RCONFLICTS_${PN} =3D &quot;netbase (&lt; 1:5.0)&quot;<br>
&gt;<br>
&gt;=C2=A0 CONFFILES_${PN} =3D &quot;${sysconfdir}/network/<wbr>interfaces&=
quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
</div></div><span class=3D"gmail-HOEnZb"><font color=3D"#888888">&gt; --<br=
>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a114063a86c03af0559815ab6--
