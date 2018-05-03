Return-Path: <srifenbark@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED5A74A12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 13:58:12 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id p62-v6so16115943oie.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8y2G0w862ovrj6q2nq/93kpVlHSO6DBSRu5yaNSQyZk=;
	b=BFGjHSVzLHVxg0qGhUJX1kpTBVVVFznvyU75wFLw2biy1mwanRq+MDB5TULJPmOg6k
	cXLkGr73U/KjGMjCqunX5s3TBW9iiRQJt9BD50rXH28oEJdSslhYnMiZc0rCUMR80rOx
	GCJ80+HCILzvctNbMnAQzb5WA3HunyvI+fjyPWfXsF/jgvyavS9mOKQ3vYyIRDS7z7eL
	ZKHEvkg6VPRGv/FOHpwnvbbDW/KER+Jkb67wkyn5kcllMIVA1ihfNFYrK+jrHO9daK0C
	CmkKDFlCpek10s/vjSawYAR24K5rTr5dFbjbQTTE5bCq2L9+vwwid5PR0KRXyrwMpbL5
	9hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8y2G0w862ovrj6q2nq/93kpVlHSO6DBSRu5yaNSQyZk=;
	b=F+H1iF9CuJ/vU7kw2ODOp0HHztvQET9JrybK7N/bUzt5ZD4XEgmej2Bsotmt9RgIQB
	rQastB0e2Z92almsxsXqmHP3dastXkpM2YuMqk65+F+mNCYWDrVlfUAagvDqUjqUBrjH
	pQAHIGMaZ+w7/XL8lEn2uPbtsCw22y1L/8tD1VKotap14im5ui4j1qwRPrHbHwy7mlJ8
	QHp1zzm4d8RIhwEAxnY5KTc7dHoT8wtylZt/zd8xZIIwZNi0X21L9mbWaAPxIEy6ofm7
	mmA49eS2t6aZmeUfXCVO6oGrGy5lrystKNdS2j/A8iP8Vhi1W2jhRf8MIuTRU7zjCsqw
	i+Og==
X-Gm-Message-State: ALQs6tDWfzj01PEwynXZgSbcowf9OjoR4TaISLlMdlJJ1jWIaq/V+3Ry
	OUw+zpG1cU3+dGISkMkLyiB06AJsjYX+8EpngoM=
X-Google-Smtp-Source: AB8JxZraJkLQ8oZXtkXrleIUlK2DqjvcCgpOgmJRi/XHCARdxhklLC7DS17ljFb6nmj5TRcPF962Vymmco3DiLN7hR4=
X-Received: by 2002:aca:3152:: with SMTP id
	x79-v6mr14813007oix.74.1525355893863; 
	Thu, 03 May 2018 06:58:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7009:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 06:58:13 -0700 (PDT)
In-Reply-To: <5e09a0d81b0a48a1bebdc3e8ed542f52@XBOX02.axis.com>
References: <1524154643.18865.113.camel@linuxfoundation.org>
	<39f087be-1129-6131-d5d1-5714f127667b@thecshore.com>
	<1525186011.25196.117.camel@linuxfoundation.org>
	<CAFNP8Ov2waP_aG81Y9_AJRNbm4FicjhkC7Yy-M5OU=SXLmJarg@mail.gmail.com>
	<5e09a0d81b0a48a1bebdc3e8ed542f52@XBOX02.axis.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Thu, 3 May 2018 06:58:13 -0700
Message-ID: <CAFNP8Ot4j5V4LzmE=7MU+WWXX1wha0_8byV27TLr2Qb9pW9SOw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 03 May 2018 13:58:13 -0000
Content-Type: multipart/alternative; boundary="00000000000035b8a1056b4d98b7"

--00000000000035b8a1056b4d98b7
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for the patch.  I have applied it to the 2.5 version of the Yocto
Project Reference Manual (see
https://yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-BUILDHISTORY_FEATURES).
You can also see
https://yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-BUILDHISTORY_FEATURES
for the commit in the yocto-docs repository.

Please look it over as I did a bit of modification for manual purposes.

Regards,
Scott

On Thu, May 3, 2018 at 12:29 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

>
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org [mailto:
> openembedded-core-bounces@lists.openembedded.org] *On Behalf Of *Scott
> Rifenbark
> *Sent:* den 1 maj 2018 16:56
> *To:* Richard Purdie <richard.purdie@linuxfoundation.org>
> *Cc:* openembedded-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] 2.6 planning proposals and meeting
>
>
>
> On Tue, May 1, 2018 at 7:46 AM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
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
>
>
> Yes - please indicate any areas in the documentation you believe need
> updated, changed, or added.  I have been trying to bring things up-to-date
> in several manuals during the 2.5 process.  So, identifying areas in the
> 2.5 manual set would be very helpful.  To be sure you are viewing 2.5
> manuals use the following form for the URL:
>
>       yoctoproject.org/docs/2.5/<manual_folder>/<manual_folder>.html
>
>       where <manual_folder> is
>
>            brief-yoctoprojectqs
>
>            bsp-guide
>
>            overview-manual
>
>            dev-manual
>
>            sdk-manual
>
>            profile-manual
>
>            kernel-dev
>
>            ref-manual
>
>            toaster-manual
>
>            bitbake-user-guide
>
> Thanks
>
> Scott
>
> Is there any special process to get manual updates accepted? I am asking
> because I sent an update for the BUILDHISTORY_FEATURES variable to the
> Yocto mailing list (https://lists.yoctoproject.org/pipermail/yocto/2018-
> January/039787.html) at the end of January (last pinged a month ago) and
> it still has not made it into the manual AFAICT and it has not received any
> feedback.
>
> //Peter
>
>
>

--00000000000035b8a1056b4d98b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi Peter, <br><br></div>Thanks for the=
 patch.=C2=A0 I have applied it to the 2.5 version of the Yocto Project Ref=
erence Manual (see <a href=3D"https://yoctoproject.org/docs/2.5/ref-manual/=
ref-manual.html#var-BUILDHISTORY_FEATURES">https://yoctoproject.org/docs/2.=
5/ref-manual/ref-manual.html#var-BUILDHISTORY_FEATURES</a>).=C2=A0 You can =
also see <a href=3D"https://yoctoproject.org/docs/2.5/ref-manual/ref-manual=
.html#var-BUILDHISTORY_FEATURES">https://yoctoproject.org/docs/2.5/ref-manu=
al/ref-manual.html#var-BUILDHISTORY_FEATURES</a> for the commit in the yoct=
o-docs repository.<br><br></div>Please look it over as I did a bit of modif=
ication for manual purposes.<br><br></div>Regards, <br></div>Scott<br></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 3, 2=
018 at 12:29 AM, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=3D"mailto=
:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div link=3D"blue" vlink=3D"purple" lang=3D"SV">
<div class=3D"m_-5804285231166946543WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US"><u></u>=
=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.=
org" target=3D"_blank">openembedded-core-bounces@<wbr>lists.openembedded.or=
g</a> [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedde=
d.org" target=3D"_blank">openembedded-core-<wbr>bounces@lists.openembedded.=
org</a><wbr>]
<b>On Behalf Of </b>Scott Rifenbark<br>
<b>Sent:</b> den 1 maj 2018 16:56<br>
<b>To:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
<b>Cc:</b> openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.=
openembedded.org" target=3D"_blank">openembedded-core@lists.<wbr>openembedd=
ed.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] 2.6 planning proposals and meeting<u></u><u><=
/u></span></p>
</div>
</div><div><div class=3D"h5">
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, May 1, 2018 at 7:46 AM,=
 Richard Purdie &lt;</span><a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank"><span lang=3D"EN-US">richard.purdie@<wbr>linuxfound=
ation.org</span></a><span lang=3D"EN-US">&gt; wrote:<u></u><u></u></span></=
p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">Hi,<br>
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
we can see if there is some way we can improve that.<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Yes - please indicate=
 any areas in the documentation you believe need updated, changed, or added=
.=C2=A0 I have been trying to bring things up-to-date in several manuals du=
ring the 2.5 process.=C2=A0 So, identifying areas
 in the 2.5 manual set would be very helpful.=C2=A0 To be sure you are view=
ing 2.5 manuals use the following form for the URL:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
<a href=3D"http://yoctoproject.org/docs/2.5/" target=3D"_blank">
yoctoproject.org/docs/2.5/</a>&lt;<wbr>manual_folder&gt;/&lt;manual_folder&=
gt;<wbr>.html<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
where &lt;manual_folder&gt; is <u></u>
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 brief-yocto=
projectqs<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 bsp-guide<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 overview-ma=
nual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 dev-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 sdk-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 profile-man=
ual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 kernel-dev<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 ref-manual<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 toaster-man=
ual<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 bitbake-user-guide<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks<u></u><u></u></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-right:0cm;margin-bottom:12.0pt;margi=
n-left:5.25pt">
Scott<span style=3D"color:#943634"><u></u><u></u></span></p>
</div>
</div>
</div></div></div>
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US">Is ther=
e any special process to get manual updates accepted? I am asking because I=
 sent an update for the BUILDHISTORY_FEATURES variable to the Yocto mailing=
 list (<a href=3D"https://lists.yoctoproject.org/pipermail/yocto/2018-Janua=
ry/039787.html" target=3D"_blank">https://lists.yoctoproject.<wbr>org/piper=
mail/yocto/2018-<wbr>January/039787.html</a>)
 at the end of January (last pinged a month ago) and it still has not made =
it into the manual AFAICT and it has not received any feedback.<span class=
=3D"HOEnZb"><font color=3D"#888888"><u></u><u></u></font></span></span></p>=
<span class=3D"HOEnZb"><font color=3D"#888888">
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US"><u></u>=
<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US">//Peter=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#943634" lang=3D"EN-US"><u></u>=
=C2=A0<u></u></span></p>
</font></span></div>
</div>

</blockquote></div><br></div>

--00000000000035b8a1056b4d98b7--
