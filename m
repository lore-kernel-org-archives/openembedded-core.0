Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBBC6F933
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 23:11:29 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id rl12so8030455iec.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cJStBYUZAjKH07eOEBu/SLrlU6u4y3XZ9iGz011qsno=;
	b=T8/IBKpgTC5bGyFtBG616VEqh3jgP0cQ2fAjBsuvM4G/aSDOSidAb6JHICGIezXmyP
	fw5Llo6Zv/kWnPb3N2d+ZgaSpgTXgc/EEwVvqJPXhfSW2YhTjnBq9T1aejPeVZ2r6ty0
	mqTOnpyPxE1suHGFoMcexHfIRFTE/0tmuPVTlvBogd3CHuXp7SzsqGgZbAzvHMLorM1C
	rsEFnT0bICfyLckYp7cpsy9CRjcjKix0yGch61LFlJBqgpRLsgpLvyHWvG8iIP4oljJn
	XN58walW8qoyoj5qELOXo0nAoMf4r2OMDaDwzb/AnIiVbqmAt+Ik658PJD7QT5+gNdBw
	Tv4A==
MIME-Version: 1.0
X-Received: by 10.50.43.170 with SMTP id x10mr21844780igl.20.1395184290689;
	Tue, 18 Mar 2014 16:11:30 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Tue, 18 Mar 2014 16:11:30 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Tue, 18 Mar 2014 16:11:30 -0700 (PDT)
In-Reply-To: <1395184093.3808.100.camel@ted>
References: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
	<CAMKF1srprf=54e_nh2+j5fCCRCkrTGxNxM7DgVVgqRxSDMRNCA@mail.gmail.com>
	<1395184093.3808.100.camel@ted>
Date: Tue, 18 Mar 2014 16:11:30 -0700
Message-ID: <CAMKF1son=Mf8_yyOLtmy1kQ2HGA6ALH9N=9aG+YtUmvfCkfk8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 23:11:30 -0000
Content-Type: multipart/alternative; boundary=089e01176cad0bdbe504f4e9a885

--089e01176cad0bdbe504f4e9a885
Content-Type: text/plain; charset=UTF-8

i think so look for v2

-Khem
On Mar 18, 2014 4:08 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2014-03-18 at 10:07 -0700, Khem Raj wrote:
> > On Tue, Mar 18, 2014 at 8:51 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > > On 11 March 2014 17:36, Khem Raj <raj.khem@gmail.com> wrote:
> > >> bluetooth-proximity has been removed in 5.0
> > >
> > > This brings in a new QA warning:
> > >
> > > WARNING: QA Issue: pulseaudio: configure was passed unrecognised
> > > options: --enable-bluez
> >
> > yeah now it differentiates between bluez4 and bluez5 so the options
> > are also renamed
> > accordingly. I have sent a v2
>
> Did you sent the right patch?
>
> Cheers,
>
> Richard
>
>

--089e01176cad0bdbe504f4e9a885
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">i think so look for v2</p>
<p dir=3D"ltr">-Khem</p>
<div class=3D"gmail_quote">On Mar 18, 2014 4:08 PM, &quot;Richard Purdie&qu=
ot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
On Tue, 2014-03-18 at 10:07 -0700, Khem Raj wrote:<br>
&gt; On Tue, Mar 18, 2014 at 8:51 AM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; &gt; On 11 March 2014 17:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; bluetooth-proximity has been removed in 5.0<br>
&gt; &gt;<br>
&gt; &gt; This brings in a new QA warning:<br>
&gt; &gt;<br>
&gt; &gt; WARNING: QA Issue: pulseaudio: configure was passed unrecognised<=
br>
&gt; &gt; options: --enable-bluez<br>
&gt;<br>
&gt; yeah now it differentiates between bluez4 and bluez5 so the options<br=
>
&gt; are also renamed<br>
&gt; accordingly. I have sent a v2<br>
<br>
Did you sent the right patch?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--089e01176cad0bdbe504f4e9a885--
