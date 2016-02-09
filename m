Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA79731F3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:13:25 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f81so1992413iof.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 16:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=0tbrTHsCRbeYloz92r7+Fi4HI1/3wNcwrNbU7rzUbsU=;
	b=Y96lCW+GV4qEcr8cRq9+pbpAQoETbG0oROAVFTDlYFyFmKp0ytbhH9+z5mFmRWIHn4
	LQuU0tt8tiX3+xOck8aYXsUnJ1CQmxpnw+BxaU/m7JEiSnWU0VdSBJlrZcbh9xzAYGsa
	fZ2dztHh6ny94okzidFo8pIzmEoVuBc5oidnmr28zifZUjVLnEHqqSGXAZpg8aq3xbbv
	6m/tlrrGVDsvg2dEOikJ5rl3PyGbmRt68JjThlP8PAlQ+O7vUXrbmXmiATRGpB+FtDy+
	ncwm7xswsTurYHIcmISfyUhph3mB4Xcy3QZn2QTfR96lKOBD5m8UI1MLVvU8YMxOOuVz
	19gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-type;
	bh=0tbrTHsCRbeYloz92r7+Fi4HI1/3wNcwrNbU7rzUbsU=;
	b=e6OVWu1S5UoVCKIgEuadGKHnLe/jJjXVNjIvGPQuqWklIySaUbOXDRdWJIfYFDGYdG
	7ao9DvGor0i/63TcmydNXNjZbC24qv+0glBtJOcveiLdAtlc+Rjs85NNx/VofQs4mMS8
	htSVcaowMvoTgQEhGMJoQSNjEtgNIzOG+w4fW5fOqYcnrMzddNoM6ulc2dwERSgB9CVr
	4//XreQyoQRWg1nxlFiO5NVa5uCE4x+j4HOs88FzpK3VeTqeZcPr6oofj59rmJ+SecT9
	ggMO8K79afRp76t0N8Pj/A35RHkCmfo5YMUtwYDdSGIWrER7VAFbamjzoebyqIKI+bYH
	mKRA==
X-Gm-Message-State: AG10YORrczTTYVHo5xy0DbGMqklPglEsIQog/LGz7ti4ffS26zUPkEFwS6UaxNyK2MFx2umRH+0GlbNyDJB4kw==
X-Received: by 10.107.34.133 with SMTP id i127mr31757236ioi.150.1454976806682; 
	Mon, 08 Feb 2016 16:13:26 -0800 (PST)
MIME-Version: 1.0
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
	<CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
	<CAJTo0LayxZ-T_cw0H5ndoxHkUHXwcqRdfu7oYjUevX+QzR4CTw@mail.gmail.com>
	<CAJ86T=VqhcakK1zhS2CdaD0-ZwdeBufLH1b06DZqrOraLiZFkw@mail.gmail.com>
	<56B92C4D.2070507@windriver.com>
	<CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
In-Reply-To: <CAJ86T=WSV2Rpm2zjNmaJEd67=BogP4KHNTuHipOJnqPi9_csdA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 09 Feb 2016 00:13:17 +0000
Message-ID: <CABcZANnKBabF-wg0zEWYSpbg5KUQEfpRWBvu4_VOkboqMPprcg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Tue, 09 Feb 2016 00:13:27 -0000
Content-Type: multipart/alternative; boundary=001a1140ef84b808b3052b4b2fd6

--001a1140ef84b808b3052b4b2fd6
Content-Type: text/plain; charset=UTF-8

Target_cflags is an exported variable. It affects the checksums of every
task. Not ideal, but that's how it is today.
On Mon, Feb 8, 2016 at 5:10 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Feb 8, 2016 at 4:01 PM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 2/8/16 5:43 PM, Andre McCurdy wrote:
> >> On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >>>
> >>> On 8 February 2016 at 20:03, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>>>
> >>>> Can you give an example? Looking at native.bbclass it seems to replace
> >>>> TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.
> >>>
> >>> Sure, so in doing a native build TARGET_CFLAGS is used.  But as
> >>> security_flags.inc was using TARGET_CFLAGS_append, the end result was
> >>> BUILD_CFLAGS appended with the security flags.
> >>
> >> Yes, for native, TARGET_CFLAGS will end up being "${BUILD_CFLAGS}
> >> ${SECURITY_CFLAGS}".
> >>
> >> However it shouldn't matter - native.bbclass sets CFLAGS to
> >> BUILD_CFLAGS, not TARGET_CFLAGS.
> >>
> >> Do you have an example where host gcc can legitimately be invoked with
> >> TARGET_CFLAGS?
> >
> > You have to remember the order of the operators.  _append says to make
> the
> > append, AFTER everything else has been evaluated (and before _remove).
> This
> > includes override behaviors.
> >
> > So if you do:
> >
> > TARGET_CFLAGS = "-deadbeef"
> > BUILD_CFLAGS = "-badc0ffee"
> > TARGET_CFLAGS_append = " -foobar"
> > TARGET_CFLAGS = "${BUILD_CFLAGS}"
> >
> > The final value of TARGET_CFLAGS is "-badc0ffee -foobar"
> >
> > Thus by changing the append to:
> >
> > TARGET_CFLAGS_append_class-target = " -foobar"
> > TARGET_CFLAGS_class-native = "${BUILD_CFLAGS}"
> >
> > In the case where the 'class-target' is the override you will get:
> >
> > TARGET_CFLAGS = "-deadbeef -foobar"
> >
> > In the case where the 'class-native' is the override you will get:
> >
> > TARGET_CFLAGS = "-badc0ffee"
>
> I'm not disputing that TARGET_CFLAGS can contain something bogus for a
> class-native build.
>
> I'm asking why does it matter?
>
> Setting TARGET_CFLAGS at all in native.bbclass is fairly recent and
> seems to be a workaround to avoid churning sstate:
>
>
> http://git.openembedded.org/openembedded-core/commit/?id=05a70ac30b37cab0952f1b9df501993a9dec70da
>
> Is that perhaps still the real reason to avoid modifying TARGET_CFLAGS
> for a native build?
>
>
> > --Mark
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140ef84b808b3052b4b2fd6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Target_cflags is an exported variable. It affects the checksums of every ta=
sk. Not ideal, but that&#39;s how it is today.<br><div class=3D"gmail_quote=
"><div dir=3D"ltr">On Mon, Feb 8, 2016 at 5:10 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Mon, Feb 8, 2016 at 4:01 PM, Mark Hatle =
&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatl=
e@windriver.com</a>&gt; wrote:<br>
&gt; On 2/8/16 5:43 PM, Andre McCurdy wrote:<br>
&gt;&gt; On Mon, Feb 8, 2016 at 3:00 PM, Burton, Ross &lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wro=
te:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 8 February 2016 at 20:03, Andre McCurdy &lt;<a href=3D"mail=
to:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Can you give an example? Looking at native.bbclass it seem=
s to replace<br>
&gt;&gt;&gt;&gt; TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sure, so in doing a native build TARGET_CFLAGS is used.=C2=A0 =
But as<br>
&gt;&gt;&gt; security_flags.inc was using TARGET_CFLAGS_append, the end res=
ult was<br>
&gt;&gt;&gt; BUILD_CFLAGS appended with the security flags.<br>
&gt;&gt;<br>
&gt;&gt; Yes, for native, TARGET_CFLAGS will end up being &quot;${BUILD_CFL=
AGS}<br>
&gt;&gt; ${SECURITY_CFLAGS}&quot;.<br>
&gt;&gt;<br>
&gt;&gt; However it shouldn&#39;t matter - native.bbclass sets CFLAGS to<br=
>
&gt;&gt; BUILD_CFLAGS, not TARGET_CFLAGS.<br>
&gt;&gt;<br>
&gt;&gt; Do you have an example where host gcc can legitimately be invoked =
with<br>
&gt;&gt; TARGET_CFLAGS?<br>
&gt;<br>
&gt; You have to remember the order of the operators.=C2=A0 _append says to=
 make the<br>
&gt; append, AFTER everything else has been evaluated (and before _remove).=
=C2=A0 This<br>
&gt; includes override behaviors.<br>
&gt;<br>
&gt; So if you do:<br>
&gt;<br>
&gt; TARGET_CFLAGS =3D &quot;-deadbeef&quot;<br>
&gt; BUILD_CFLAGS =3D &quot;-badc0ffee&quot;<br>
&gt; TARGET_CFLAGS_append =3D &quot; -foobar&quot;<br>
&gt; TARGET_CFLAGS =3D &quot;${BUILD_CFLAGS}&quot;<br>
&gt;<br>
&gt; The final value of TARGET_CFLAGS is &quot;-badc0ffee -foobar&quot;<br>
&gt;<br>
&gt; Thus by changing the append to:<br>
&gt;<br>
&gt; TARGET_CFLAGS_append_class-target =3D &quot; -foobar&quot;<br>
&gt; TARGET_CFLAGS_class-native =3D &quot;${BUILD_CFLAGS}&quot;<br>
&gt;<br>
&gt; In the case where the &#39;class-target&#39; is the override you will =
get:<br>
&gt;<br>
&gt; TARGET_CFLAGS =3D &quot;-deadbeef -foobar&quot;<br>
&gt;<br>
&gt; In the case where the &#39;class-native&#39; is the override you will =
get:<br>
&gt;<br>
&gt; TARGET_CFLAGS =3D &quot;-badc0ffee&quot;<br>
<br>
I&#39;m not disputing that TARGET_CFLAGS can contain something bogus for a<=
br>
class-native build.<br>
<br>
I&#39;m asking why does it matter?<br>
<br>
Setting TARGET_CFLAGS at all in native.bbclass is fairly recent and<br>
seems to be a workaround to avoid churning sstate:<br>
<br>
=C2=A0 <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3D05a70ac30b37cab0952f1b9df501993a9dec70da" rel=3D"noreferrer" target=3D"_=
blank">http://git.openembedded.org/openembedded-core/commit/?id=3D05a70ac30=
b37cab0952f1b9df501993a9dec70da</a><br>
<br>
Is that perhaps still the real reason to avoid modifying TARGET_CFLAGS<br>
for a native build?<br>
<br>
<br>
&gt; --Mark<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1140ef84b808b3052b4b2fd6--
