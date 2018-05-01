Return-Path: <srifenbark@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5C66FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 14:55:52 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id a6-v6so10278138oia.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2018 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SuhuyNjKp/jprS5Hk6mjdnsTPd7RHuRMUAaVBsxojDE=;
	b=QjFx5Nw+mGwEhmk7dBOd89qXC7fDq06Yk8zxsc7uY2+a2eKbfWZTXmUZ6IhrpKEJkD
	vKKaIo7YevgSariMkJb8k52qT0blBMCrAqJ0/Cnm7f/7M7BCfYutxWgoxgdjU94OyoPJ
	hy2njDlzTd77b0xGecUHAXhGv+vMjAxeF4eRsPl69JT3FTgk53BjyAY2rDhifM6LKfmC
	9lgQpWlo/MHo/d8lv/Fnh+hvlI9AdFp279/7NloQCHpS9wkZddRBRpPG7qhiWnu/aIP2
	9ysYgxJj5IgXUBTPsTtqTfgdT6rdOUB9JhoJ47zu3on2UEIC0+JuMydCpGZkta0Y0Nej
	ZwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SuhuyNjKp/jprS5Hk6mjdnsTPd7RHuRMUAaVBsxojDE=;
	b=gWO0tHL/mcnBgCuUxr6YNkRXyTjyLPWFk2qX2KG+D2lUC98NqL5p7GQ5zw9/Ouzabf
	mfVjTLIsVwd3nX1zdoXPWv4k+Y8z1y+gPqXA2Wl7B3y45/k2WLbpV4wjhNfuvQPK3Rkj
	ATs9GKhFCgX30Y1IBIuPMDwk9SVAVW5IGQFkEhM/kDwd7cy5K5FI2G2JkZgx1yKcLy3h
	3XhnwR9FM4dP+CQQSkaXIqp7AE1ITU0Zb8NDNw6XHI0lJQEny+lC0iokmdkbuuIc1oic
	IhfFd22Cr/l7JzPHsmA4nHVQhKJi0g/ZGcoCzPVpSItDL7JiXoN2cqL3cKZWlEWNdrFG
	dJ9w==
X-Gm-Message-State: ALQs6tC2wjtgtMFx4dV4lmY2GqZb39rbEU/tFphKRXm+CHENYp9Fwc91
	+xb7ypy1s6wiYMHTyajzNwqZUj9YApzpAuPRK3M=
X-Google-Smtp-Source: AB8JxZp6OuPue9J1eQrtODH7x725eQXB7R08HgUoOCvooxE29YbDvIWcBqRtBK3zTqQ7alfoXLqBVowgbTWzte+C5s4=
X-Received: by 2002:aca:e848:: with SMTP id
	f69-v6mr10194144oih.192.1525186553782; 
	Tue, 01 May 2018 07:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7009:0:0:0:0:0 with HTTP;
	Tue, 1 May 2018 07:55:53 -0700 (PDT)
In-Reply-To: <1525186011.25196.117.camel@linuxfoundation.org>
References: <1524154643.18865.113.camel@linuxfoundation.org>
	<39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
	<1525186011.25196.117.camel@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Tue, 1 May 2018 07:55:53 -0700
Message-ID: <CAFNP8Ov2waP_aG81Y9_AJRNbm4FicjhkC7Yy-M5OU=SXLmJarg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: 2.6 planning proposals and meeting
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
X-List-Received-Date: Tue, 01 May 2018 14:55:53 -0000
Content-Type: multipart/alternative; boundary="000000000000c12839056b262a13"

--000000000000c12839056b262a13
Content-Type: text/plain; charset="UTF-8"

On Tue, May 1, 2018 at 7:46 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi,
>
> On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:
> > I'm relatively new to OE; I've written a couple of pre-alpha layers
> > to try some idea, and worked on meta-openembedded, but I've not had a
> > chance to go in depth on the Yocto documentation, and at the some
> > there see to be things (based on the lists) that are out of date, or
> > new things that aren't even mentioned, which makes getting up speed
> > somewhat difficult.
>
> Writing down where you think there are issues would be a help so that
> we can see if there is some way we can improve that.
>

Yes - please indicate any areas in the documentation you believe need
updated, changed, or added.  I have been trying to bring things up-to-date
in several manuals during the 2.5 process.  So, identifying areas in the
2.5 manual set would be very helpful.  To be sure you are viewing 2.5
manuals use the following form for the URL:

      yoctoproject.org/docs/2.5/<manual_folder>/<manual_folder>.html

      where <manual_folder> is

           brief-yoctoprojectqs
           bsp-guide
           overview-manual
           dev-manual
           sdk-manual
           profile-manual
           kernel-dev
           ref-manual
           toaster-manual
           bitbake-user-guide

Thanks
Scott




>
> > In any even one thing that I'm wondering if is of interest, is
> > modifying the build process to build an eSDK which is used to build
> > everything else.  The advantage of this, in my view, is that it makes
> > it easier to do things like use GitHub+Travis integration on
> > individual recipes.
>
> I know people who've tried travis with OE and the challenge is the
> length of the builds and the data usage. I'm not sure that problem
> changes regardless of whether the eSDK or native sstate is used as the
> size would be comparable.
>
> > The biggest challenge for this type of per-recipe build is dealing
> > with dependencies, but I think it would be helpful to get rid of 3-
> > day+ world builds.
> >
> > At the very least having a 'standard' binary eSDK for external layers
> > to use for this purpose would helpful in my view.
>
> How would that differ from a specific version of OE-Core used for
> testing for which a known good set of sstate were available?
>
> > I'm interested in working on this, but I don't think I've got a good
> > enough handle on OE for making this a 2.6 goal from me.
> >
> > Thoughts?
>
> I like the idea of thinking more in this area and would certainly
> welcome help. I think the issue is more one of tools to generate a
> locked sstate which layers then reuse rather than anything eSDK
> specific. Its therefore partly a process problem of generating that
> specific config and sstate which others would reuse. You could do this
> from things that already exist, e.g. from the OE-Core milestone
> releases but its not something people have really adopted for testing
> of other layers.
>
> Certainly worth exploring but the devil is in the details.
>
> Also worth mentioning that build-appliance exists which is an image
> capable of "self hosting" builds. There are often specific patches
> applied to native tools and version requirements which mean that the
> -native recipes are often essential to the build though.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c12839056b262a13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 1, 2018 at 7:46 AM, Richard Purdie <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">Hi,<br>
<br>
On Fri, 2018-04-20 at 08:02 -0400, Daniel F. Dickinson wrote:<br>
&gt; I&#39;m relatively new to OE; I&#39;ve written a couple of pre-alpha l=
ayers<br>
&gt; to try some idea, and worked on meta-openembedded, but I&#39;ve not ha=
d a<br>
&gt; chance to go in depth on the Yocto documentation, and at the some<br>
&gt; there see to be things (based on the lists) that are out of date, or<b=
r>
&gt; new things that aren&#39;t even mentioned, which makes getting up spee=
d<br>
&gt; somewhat difficult.<br>
<br>
Writing down where you think there are issues would be a help so that<br>
we can see if there is some way we can improve that.<br></blockquote><div><=
br></div><div>Yes - please indicate any areas in the documentation you beli=
eve need updated, changed, or added.=C2=A0 I have been trying to bring thin=
gs up-to-date in several manuals during the 2.5 process.=C2=A0 So, identify=
ing areas in the 2.5 manual set would be very helpful.=C2=A0 To be sure you=
 are viewing 2.5 manuals use the following form for the URL:<br><br></div><=
div>=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://yoctoproject.org/docs/2.5/">yoct=
oproject.org/docs/2.5/</a>&lt;manual_folder&gt;/&lt;manual_folder&gt;.html<=
br><br></div><div>=C2=A0 =C2=A0 =C2=A0 where &lt;manual_folder&gt; is <br><=
br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 brief-yoctoprojectqs=
<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 bsp-guide<br></div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 overview-manual<br></div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 dev-manual<br></div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 sdk-manual<br></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=C2=A0 profile-manual<br></div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=C2=A0 kernel-dev<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 ref-manual<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0 toaster-manual<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 bitbake-user-guide<br><br></div><div>Thanks<br></div><div>Scott<br><=
br><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
&gt; In any even one thing that I&#39;m wondering if is of interest, is<br>
&gt; modifying the build process to build an eSDK which is used to build<br=
>
&gt; everything else.=C2=A0=C2=A0The advantage of this, in my view, is that=
 it makes<br>
&gt; it easier to do things like use GitHub+Travis integration on<br>
&gt; individual recipes.<br>
<br>
I know people who&#39;ve tried travis with OE and the challenge is the<br>
length of the builds and the data usage. I&#39;m not sure that problem<br>
changes regardless of whether the eSDK or native sstate is used as the<br>
size would be comparable.<br>
<br>
&gt; The biggest challenge for this type of per-recipe build is dealing<br>
&gt; with dependencies, but I think it would be helpful to get rid of 3-<br=
>
&gt; day+ world builds.<br>
&gt; <br>
&gt; At the very least having a &#39;standard&#39; binary eSDK for external=
 layers<br>
&gt; to use for this purpose would helpful in my view.<br>
<br>
How would that differ from a specific version of OE-Core used for<br>
testing for which a known good set of sstate were available?<br>
<br>
&gt; I&#39;m interested in working on this, but I don&#39;t think I&#39;ve =
got a good=C2=A0<br>
&gt; enough handle on OE for making this a 2.6 goal from me.<br>
&gt; <br>
&gt; Thoughts?<br>
<br>
I like the idea of thinking more in this area and would certainly<br>
welcome help. I think the issue is more one of tools to generate a<br>
locked sstate which layers then reuse rather than anything eSDK<br>
specific. Its therefore partly a process problem of generating that<br>
specific config and sstate which others would reuse. You could do this<br>
from things that already exist, e.g. from the OE-Core milestone<br>
releases but its not something people have really adopted for testing<br>
of other layers.<br>
<br>
Certainly worth exploring but the devil is in the details.<br>
<br>
Also worth mentioning that build-appliance exists which is an image<br>
capable of &quot;self hosting&quot; builds. There are often specific patche=
s<br>
applied to native tools and version requirements which mean that the<br>
-native recipes are often essential to the build though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--000000000000c12839056b262a13--
