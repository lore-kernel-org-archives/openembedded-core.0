Return-Path: <avery.brian@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9184A770FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:19:04 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id j124so28821201ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8r1EYOX3A6SrO87WDFj1kgj60+DFP7aNOi3ZtOxGBHs=;
	b=AwAT/dl1QADE6C8thmVHA9NBdlxKNrX+q38oJLb/ljUjZfWdb87RpPeVI3udIhCCpq
	dFNVtjeu2sB7l1OdowpfLpeRX/rZJhRXO6t/6iY+UA4jIUx+bgWjzAyxFLWO7krFEocC
	RjjPtxFRzg/fSe1XPfqjXhGm5Z0C3Se8qZoFHUFPkr9yMRQ1dd63EwFPwLBVuX7qUbyk
	2tvw/Kf1P87H1pCoXgO2GQveKYkZ41yA3GCWCKE+GNtCEZmKYzV/a8GmH35YIuWOHGWE
	Sprz+UUfmAEG4VUTxPZayobv1seyOCB3vfx78dCbHWdP6DXTlogoBbeeJD8aGgSaR9oQ
	0A7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8r1EYOX3A6SrO87WDFj1kgj60+DFP7aNOi3ZtOxGBHs=;
	b=Eb9Ls/SfbXFRM2QxQlLYS6UUFLoDDtqpDcfnfa/OrTxZB9MR7CtzP6zEEVExAiHIKT
	uIpx8u8xAhWAd3eYWFd4mVzgpTZ81zAhU2hEr/y23QoryrBGvd7CbTB1KJrNsB0PG69g
	UxqIrNh4rEOs6bgdbiaySDyiYFXFymnATyUVoEtf9NKm4qVTW63nXissdkaMfaccwXCq
	2UwE6uc4CjOQx+6AT5i8bNKEYR0q77RtdczyCXrq4tkOuKPOSzZVvvDIV6x9VjJw1tJT
	+Hslx3tXpQDAObSo/jOTWD5CJ1e17t44ZiHSbbZGJ1gXsYSrCRLpFFdBGaYaPJzNJmMc
	dwXQ==
X-Gm-Message-State: AEkoouvEAP2oBSHTAGSx8I75u1XUg2ICOWJ0KZd/4UQZ4C9fhwL5tCdGOMQ+ErcQvj4YW4imVQGDWu0a1fs8ng==
X-Received: by 10.36.41.205 with SMTP id p196mr5648048itp.76.1470413944251;
	Fri, 05 Aug 2016 09:19:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.35 with HTTP; Fri, 5 Aug 2016 09:19:03 -0700 (PDT)
In-Reply-To: <1470387529.2393.4.camel@gmail.com>
References: <CAKV_0einF1siokeL5FFx2jLbwAk6xYSnb42fCZ75wpfQ3MbqRw@mail.gmail.com>
	<b41fd09b-cb0e-8702-d789-27ab70d56787@gmail.com>
	<1470387529.2393.4.camel@gmail.com>
From: Brian Avery <avery.brian@gmail.com>
Date: Fri, 5 Aug 2016 09:19:03 -0700
Message-ID: <CAKV_0ejeHLYsp4htJdYMt-j=3fG=Gnwb_b5++w_MvxNzOYALfw@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RFC: eclipse debug functionality issue
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
X-List-Received-Date: Fri, 05 Aug 2016 16:19:04 -0000
Content-Type: multipart/alternative; boundary=001a113f6d5ed1f9930539556c71

--001a113f6d5ed1f9930539556c71
Content-Type: text/plain; charset=UTF-8

Thanks Max!

I like your approach a lot; and yes, the same fix works in our /etc/profile.

-Brian
an Intel employee

On Fri, Aug 5, 2016 at 1:58 AM, Max Krummenacher <max.oss.09@gmail.com>
wrote:

> Hi Brian
>
> Am Donnerstag, den 04.08.2016, 19:49 -0700 schrieb Khem Raj:
> >
> > On 8/4/16 2:20 PM, Brian Avery wrote:
> > > The core issue:
> > > The busybox resize command breaks the eclipse ssh debug stream.
> > >  This is
> > > because the resize command for busybox sends a set of cursor
> > > control
> > > escape sequences to stderr. The resize cfg was added to Krogoth and
> > > is
> > > still in master.  The point of resize is to set the environment and
> > > terminal settings to the current xterm window size.
> > >
> > > Additional complexity:
> > > eclipse-debug is an IMAGE_FEATURE.  If it is turned on by a user in
> > > local.conf via EXTRA_IMAGE_FEATURES then I can conditionally turn
> > > off
> > > busybox/resize in the cfg file.  Unfortunately, if a user makes a
> > > new
> > > image with IMAGE_FEATURES += " eclipse-debug " in it, I do not see
> > > this
> > > from the scope of the busybox##.bb recipe.
> > >
> > > So, there are a couple of ways to solve this and I'm not sure which
> > > is
> > > the best one.
> > >
> > > 1) conditionally turn off the resize.cfg if eclipse-debug is in
> > > extra-image-features.  Also, make a rm_resize.bbclass to rm the
> > > usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which can
> > > be
> > > inherited by the various sdk images we build.
> > >
> > > This is problematic since if a user makes a new image recipe of
> > > their
> > > own and includes eclipse-debug but doesn't inherit the
> > > rm_resize.bbclass
> > > eclipse debug will fail.
> > >
> > > 2) elevate eclipse-debug to a distro feature which would make it
> > > visible
> > > to the busybox###.bb recipe.  Unfortunately, it is really an image
> > > specific set of packages to be included so elevating it doesn't
> > > seem
> > > reasonable.
> > >
> > > 3)   use the update-alternatives method (busybox is currently doing
> > > this
> > > for syslog) to make a separate busybox-resize package and make an
> > > eclipse friendly resize package that is empty and add the eclipse
> > > one to
> > > the eclipse-debug packagegroup.
> > >
> > > 4) Just turn off resize or patch it so it doesn't try to control
> > > the
> > > cursor via escape sequences sent to stderr but still sets up the
> > > environment.  It's worth noting that the ubuntu  resize doesn't
> > > send
> > > escape sequences to any of the streams.
> >
> > this seems to be best option.
>
> We fixed this by only executing resize if logging in from a serial
> console:
>
> http://git.toradex.com/cgit/meta-toradex.git/commit/?h=V2.6-next&id=9d1
> 32ea3cf75562ef5610dd6ff1c89d0cffa334d
>
> I guess one could apply the same fix to here
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/b
> ase-files/base-files/profile?h=krogoth
>
> Regards
> Max
>
> > >
> > > 5) Something else?
> > >
> > > Thanks,
> > > Brian
> > > an Intel employee
> > >
> > >
> > >
> > >
>
>

--001a113f6d5ed1f9930539556c71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Max!<div><br></div><div>I like your approach a lot;=
 and yes, the same fix works in our /etc/profile.</div><div><br></div><div>=
-Brian</div><div>an Intel employee</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Fri, Aug 5, 2016 at 1:58 AM, Max Krummenach=
er <span dir=3D"ltr">&lt;<a href=3D"mailto:max.oss.09@gmail.com" target=3D"=
_blank">max.oss.09@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Hi Brian<br>
<div><div class=3D"h5"><br>
Am Donnerstag, den 04.08.2016, 19:49 -0700 schrieb Khem Raj:<br>
&gt;<br>
&gt; On 8/4/16 2:20 PM, Brian Avery wrote:<br>
&gt; &gt; The core issue:<br>
&gt; &gt; The busybox resize command breaks the eclipse ssh debug stream.<b=
r>
&gt; &gt;=C2=A0 This is<br>
&gt; &gt; because the resize command for busybox sends a set of cursor<br>
&gt; &gt; control<br>
&gt; &gt; escape sequences to stderr. The resize cfg was added to Krogoth a=
nd<br>
&gt; &gt; is<br>
&gt; &gt; still in master.=C2=A0 The point of resize is to set the environm=
ent and<br>
&gt; &gt; terminal settings to the current xterm window size.<br>
&gt; &gt;<br>
&gt; &gt; Additional complexity:<br>
&gt; &gt; eclipse-debug is an IMAGE_FEATURE.=C2=A0 If it is turned on by a =
user in<br>
&gt; &gt; local.conf via EXTRA_IMAGE_FEATURES then I can conditionally turn=
<br>
&gt; &gt; off<br>
&gt; &gt; busybox/resize in the cfg file.=C2=A0 Unfortunately, if a user ma=
kes a<br>
&gt; &gt; new<br>
&gt; &gt; image with IMAGE_FEATURES +=3D &quot; eclipse-debug &quot; in it,=
 I do not see<br>
&gt; &gt; this<br>
&gt; &gt; from the scope of the busybox##.bb recipe.<br>
&gt; &gt;<br>
&gt; &gt; So, there are a couple of ways to solve this and I&#39;m not sure=
 which<br>
&gt; &gt; is<br>
&gt; &gt; the best one.<br>
&gt; &gt;<br>
&gt; &gt; 1) conditionally turn off the resize.cfg if eclipse-debug is in<b=
r>
&gt; &gt; extra-image-features.=C2=A0 Also, make a rm_resize.bbclass to rm =
the<br>
&gt; &gt; usr/bin/resize from the rootfs in a do_rootfs[postfuncs] which ca=
n<br>
&gt; &gt; be<br>
&gt; &gt; inherited by the various sdk images we build.<br>
&gt; &gt;<br>
&gt; &gt; This is problematic since if a user makes a new image recipe of<b=
r>
&gt; &gt; their<br>
&gt; &gt; own and includes eclipse-debug but doesn&#39;t inherit the<br>
&gt; &gt; rm_resize.bbclass<br>
&gt; &gt; eclipse debug will fail.<br>
&gt; &gt;<br>
&gt; &gt; 2) elevate eclipse-debug to a distro feature which would make it<=
br>
&gt; &gt; visible<br>
&gt; &gt; to the busybox###.bb recipe.=C2=A0 Unfortunately, it is really an=
 image<br>
&gt; &gt; specific set of packages to be included so elevating it doesn&#39=
;t<br>
&gt; &gt; seem<br>
&gt; &gt; reasonable.<br>
&gt; &gt;<br>
&gt; &gt; 3)=C2=A0 =C2=A0use the update-alternatives method (busybox is cur=
rently doing<br>
&gt; &gt; this<br>
&gt; &gt; for syslog) to make a separate busybox-resize package and make an=
<br>
&gt; &gt; eclipse friendly resize package that is empty and add the eclipse=
<br>
&gt; &gt; one to<br>
&gt; &gt; the eclipse-debug packagegroup.<br>
&gt; &gt;<br>
&gt; &gt; 4) Just turn off resize or patch it so it doesn&#39;t try to cont=
rol<br>
&gt; &gt; the<br>
&gt; &gt; cursor via escape sequences sent to stderr but still sets up the<=
br>
&gt; &gt; environment.=C2=A0 It&#39;s worth noting that the ubuntu=C2=A0 re=
size doesn&#39;t<br>
&gt; &gt; send<br>
&gt; &gt; escape sequences to any of the streams.<br>
&gt;<br>
&gt; this seems to be best option.<br>
<br>
</div></div>We fixed this by only executing resize if logging in from a ser=
ial<br>
console:<br>
<br>
<a href=3D"http://git.toradex.com/cgit/meta-toradex.git/commit/?h=3DV2.6-ne=
xt&amp;id=3D9d1
32ea3cf75562ef5610dd6ff1c89d0cffa334d" rel=3D"noreferrer" target=3D"_blank"=
>http://git.toradex.com/cgit/<wbr>meta-toradex.git/commit/?h=3DV2.<wbr>6-ne=
xt&amp;id=3D9d1<br>
32ea3cf75562ef5610dd6ff1c89d0c<wbr>ffa334d</a><br>
<br>
I guess one could apply the same fix to here<br>
<a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipes=
-core/b
ase-files/base-files/profile?h=3Dkrogoth" rel=3D"noreferrer" target=3D"_bla=
nk">http://cgit.openembedded.org/<wbr>openembedded-core/tree/meta/<wbr>reci=
pes-core/b<br>
ase-files/base-files/profile?<wbr>h=3Dkrogoth</a><br>
<br>
Regards<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Max<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt;<br>
&gt; &gt; 5) Something else?<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Brian<br>
&gt; &gt; an Intel employee<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
</div></div></blockquote></div><br></div>

--001a113f6d5ed1f9930539556c71--
