Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62FAF72F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 11:59:53 +0000 (UTC)
Received: by mail-yb0-f169.google.com with SMTP id i124so16443816ybc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bkTGjSeQPAuViIiiHMVhNSeesk5s0Z57+4wqSMFFoE0=;
	b=032sxHvKNoS9yEUWvZQGF3l1o5z6E3/v8ldBbQuj8KvUr0xNN+ijbouUXTKdEGsVdF
	B6iNIt1u0+Ads9a37jejHb1lZTGp1MPzRtHHcIoo8zGSBHsyvzmAZU87QDcQkfcAYERV
	QsprSctagBoFMrQIgj8xjjlX4pYBTrQ+G12rumT1BCcYU7Ixgt+6UWhnzuJz34RcK7Nq
	agzsaifN38zhMqNPxgT0QAZhoKtF2J7SbwPize2tka8BB0G8lwBrj6RGsyvZUMIodR1M
	FnrNHl6nSgipy7Yd9bHRK/Mj3yrezOaGXin+a8uwn6rK+ZS4xVs1skp6DPqq7/SqqWHH
	kOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bkTGjSeQPAuViIiiHMVhNSeesk5s0Z57+4wqSMFFoE0=;
	b=occ/HN/CnDHej2fwqQ89B1h3eVGMczTSCT89X1EaIILwshzgZrkTLTAxldgzzxIoEr
	vHfiwhf+pDk1ucCBKNuNaiefCIsYS/1bxAeRuUdI+fxw7Eix8AmBElHSKt3P25LcohIf
	EBqomO1gC0aVn4rEPvyb4PdEpK4WwGLj9E3tyvIWWr4fs+qhGr6oRJb195jBHeOWZrJJ
	aDjJdL7qLM69dLPTvDNTgku0iwFNsNsbm+xATXU6yYYYta1ZglYS3pLG8OP0nSUL1nC4
	P+atGsc+CSTQPIf5EEJNIceGq7uLfudzUrv05AYvj7N94v0Py9k2EP5X9PxGRRDP+G8t
	tfFA==
X-Gm-Message-State: AFeK/H3ymAFh0V2cOibKfl0RQ+4USJ1OM3cMV1Y6dLmlPvl/kGWmsfoyJGhMdUARUJLee8VBqc8EN8rB80X01TsI
X-Received: by 10.37.173.203 with SMTP id d11mr17896518ybe.3.1491566394167;
	Fri, 07 Apr 2017 04:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Fri, 7 Apr 2017 04:59:23 -0700 (PDT)
In-Reply-To: <1491553733.17200.89.camel@linuxfoundation.org>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
	<d071facbbdbb48f34e0f0d9500872349c1130a9a.1491483222.git.jussi.kukkonen@intel.com>
	<1491553733.17200.89.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Apr 2017 14:59:23 +0300
Message-ID: <CAHiDW_FHTmqsBjCpUR7m0JMh6+iyPO=Gbh8eLcoy5YLgCO+dvQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] native.bbclass: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Fri, 07 Apr 2017 11:59:55 -0000
Content-Type: multipart/alternative; boundary=f403045eb8a4156c99054c925d3f

--f403045eb8a4156c99054c925d3f
Content-Type: text/plain; charset=UTF-8

On 7 April 2017 at 11:28, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> On Fri, 2017-04-07 at 09:09 +0300, Jussi Kukkonen wrote:
> > There seems to be no advantage to letting distro features affect
> > native builds. There is a significant disadvantage: a change to
> > DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a
> > test like this:
> >   $ bitbake core-image-minimal
> >   # append " systemd" to DISTRO_FEATURES
> >   $ bitbake core-image-minimal
> > The latter build takes 44 minutes (28%) of cpu-time less with this
> > patch (skipping 135 native tasks). Sadly wall clock time was not
> > affected as glibc remains the bottleneck.
> >
> > Set DISTRO_FEATURES to a fixed value for native recipes to avoid the
> > unnecessary tasks: currently the default value is empty.
> >
> > Do the variable setting in native_virtclass_handler() because
> > otherwise
> > it could still be overridden by appends and the feature backfilling.
> > Shuffle the early returns so DISTRO_FEATURES gets set as long as
> > the packagename ends with "-native".
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >  meta/classes/native.bbclass | 12 ++++++++----
> >  meta/conf/bitbake.conf      |  2 ++
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/native.bbclass
> > b/meta/classes/native.bbclass
> > index 1919fbc..fbca4c6 100644
> > --- a/meta/classes/native.bbclass
> > +++ b/meta/classes/native.bbclass
> > @@ -121,14 +121,18 @@ PATH_prepend = "${COREBASE}/scripts/native-
> > intercept:"
> >  SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
> >
> >  python native_virtclass_handler () {
> > -    classextend = e.data.getVar('BBCLASSEXTEND') or ""
> > -    if "native" not in classextend:
> > -        return
> > -
> >      pn = e.data.getVar("PN")
> >      if not pn.endswith("-native"):
> >          return
> >
> > +    # Set features here to prevent appends and distro features
> > backfill
> > +    # from modifying native distro features
> > +    d.setVar("DISTRO_FEATURES", "${NATIVE_DISTRO_FEATURES}")
> > +
> > +    classextend = e.data.getVar('BBCLASSEXTEND') or ""
> > +    if "native" not in classextend:
> > +        return
> > +
> >      def map_dependencies(varname, d, suffix = ""):
> >          if suffix:
> >              varname = varname + "_" + suffix
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 5e98d45..78a3470 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -789,6 +789,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
> >  EXTRA_IMAGE_FEATURES ??= ""
> >  IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
> >
> > +NATIVE_DISTRO_FEATURES ?= ""
> > +
> >  DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-
> > introspection-data ldconfig"
> >  MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
>
> Thanks for working on this, looks good.
>
> Most native variables are called XXX_NATIVE, not NATIVE_XXX so we might
> want to make this match?
>

Will do.


> Also, one question. Does this have any effect on qemu-native? Does
> qemu-native need/use x11 today?
>

qemu itself does not use anything x11 since last year and the default
native packageconfig is already not
dependent on distro features.

Now that you mentioned I had a closer look at qemu & SDL:
 * qemu-native doesn't build with "sdl" by default, but someone might
change that of course
 * If that happens (and libsdl-native is not in ASSUME_PROVIDED), libsdl is
built and by default depends on libx11
I completely expected this to fail now (without x11 in distro features) but
it actually builds just fine. It turns out that a clever Burton has tweaked
REQUIRED_DISTRO_FEATURES_class-native for some X libraries for exactly this
purpose already.


Jussi

--f403045eb8a4156c99054c925d3f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 7 April 2017 at 11:28, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5=
">On Fri, 2017-04-07 at 09:09 +0300, Jussi Kukkonen wrote:<br>
&gt; There seems to be no advantage to letting distro features affect<br>
&gt; native builds. There is a significant disadvantage: a change to<br>
&gt; DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a<b=
r>
&gt; test like this:<br>
&gt; =C2=A0 $ bitbake core-image-minimal<br>
&gt; =C2=A0 # append &quot; systemd&quot; to DISTRO_FEATURES<br>
&gt; =C2=A0 $ bitbake core-image-minimal<br>
&gt; The latter build takes 44 minutes (28%) of cpu-time less with this<br>
&gt; patch (skipping 135 native tasks). Sadly wall clock time was not<br>
&gt; affected as glibc remains the bottleneck.<br>
&gt;<br>
&gt; Set DISTRO_FEATURES to a fixed value for native recipes to avoid the<b=
r>
&gt; unnecessary tasks: currently the default value is empty.<br>
&gt;<br>
&gt; Do the variable setting in native_virtclass_handler() because<br>
&gt; otherwise<br>
&gt; it could still be overridden by appends and the feature backfilling.<b=
r>
&gt; Shuffle the early returns so DISTRO_FEATURES gets set as long as<br>
&gt; the packagename ends with &quot;-native&quot;.<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/native.bbclass | 12 ++++++++----<br>
&gt; =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|<wbr>=
=C2=A0=C2=A02 ++<br>
&gt; =C2=A02 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/native.bbclass<br>
&gt; b/meta/classes/native.bbclass<br>
&gt; index 1919fbc..fbca4c6 100644<br>
&gt; --- a/meta/classes/native.bbclass<br>
&gt; +++ b/meta/classes/native.bbclass<br>
&gt; @@ -121,14 +121,18 @@ PATH_prepend =3D &quot;${COREBASE}/scripts/nativ=
e-<br>
&gt; intercept:&quot;<br>
&gt; =C2=A0SSTATE_SCAN_CMD ?=3D &quot;${SSTATE_SCAN_CMD_NATIVE}&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0python native_virtclass_handler () {<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0classextend =3D e.data.getVar(&#39;BBCLASSEXT=
END&#39;) or &quot;&quot;<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0if &quot;native&quot; not in classextend:<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return<br>
&gt; -<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pn =3D e.data.getVar(&quot;PN&quot;)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if not pn.endswith(&quot;-native&quot;):=
<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return<br>
&gt; =C2=A0<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0# Set features here to prevent appends and di=
stro features<br>
&gt; backfill<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0# from modifying native distro features<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&quot;DISTRO_<wbr>FEATURES&quot;, &q=
uot;${NATIVE_DISTRO_FEATURES}&quot;)<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0classextend =3D e.data.getVar(&#39;BBCLASSEXT=
END&#39;) or &quot;&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0if &quot;native&quot; not in classextend:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def map_dependencies(varname, d, suffix =
=3D &quot;&quot;):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if suffix:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0varname =3D varname + &quot;_&quot; + suffix<br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 5e98d45..78a3470 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -789,6 +789,8 @@ MACHINE_ESSENTIAL_EXTRA_<wbr>RRECOMMENDS ?=3D &quo=
t;&quot;<br>
&gt; =C2=A0EXTRA_IMAGE_FEATURES ??=3D &quot;&quot;<br>
&gt; =C2=A0IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&quot;<br>
&gt; =C2=A0<br>
&gt; +NATIVE_DISTRO_FEATURES ?=3D &quot;&quot;<br>
&gt; +<br>
&gt; =C2=A0DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit bluez5 go=
bject-<br>
&gt; introspection-data ldconfig&quot;<br>
&gt; =C2=A0MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quot;<br>
<br>
</div></div>Thanks for working on this, looks good.<br>
<br>
Most native variables are called XXX_NATIVE, not NATIVE_XXX so we might<br>
want to make this match?<br></blockquote><div><br></div><div>Will do.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Also, one question. Does this have any effect on qemu-native? Does<br>
qemu-native need/use x11 today?<br></blockquote><div><br></div><div>qemu it=
self does not use anything x11 since last year and the default native packa=
geconfig is already not</div><div>dependent on distro features.</div><div><=
br></div><div>Now that you mentioned I had a closer look at qemu &amp; SDL:=
</div><div>=C2=A0* qemu-native doesn&#39;t build with &quot;sdl&quot; by de=
fault, but someone might change that of course=C2=A0</div><div>=C2=A0* If t=
hat happens (and libsdl-native is not in ASSUME_PROVIDED), libsdl is built =
and by default depends on libx11</div><div>I completely expected this to fa=
il now (without x11 in distro features) but it actually builds just fine. I=
t turns out that a clever Burton has tweaked=C2=A0</div><div>REQUIRED_DISTR=
O_FEATURES_class-native for some X libraries for exactly this purpose alrea=
dy.<br></div><div><br></div><div><br></div><div>Jussi<br></div></div></div>=
</div>

--f403045eb8a4156c99054c925d3f--
