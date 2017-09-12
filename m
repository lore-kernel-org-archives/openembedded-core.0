Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 471C778479
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:35:03 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id k101so8711317iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UI/DZicDdDcyBKAZcaDErN/QerLC0qu9BapROrO+DFE=;
	b=ZCqZORwomprvFKbIGln7alS+m/BpRKPiQ+RTbkoiIpWzYiIQLhz4Rm+kcSR4iC14RP
	lfQ//JEthCoYXc+qjx2Oib8kvQWv4WaKsiPwso/Bb8sySrkvt6AiNRHH5JDMa9pPpfDi
	wdnwoSgXGre3ew7oZRRBFNyyAE1MB5Ae90708JlxqBYAdDvZxrk6F8VgYlLdEl1rfbdO
	VBVWuACYi7uQtJG4rFk7IVpWkHDk+Cv6DlPb+Pa8Zx+aI8SPvcDGZY1bqLIRi4c3dhgE
	nwrkhNZ3pnfb5gmHbOdOarZV91PsU/XEoi0/uXAiKECurDpCKttEqZ2O1JWzGYTgTvTH
	QEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UI/DZicDdDcyBKAZcaDErN/QerLC0qu9BapROrO+DFE=;
	b=NeeAO8EpAltyQY3eS1orULn1KaeOdBe5y+Lxc7iY5Jmfs2Bjo6UYyWAex+2uHuGXnT
	yF2gYLsEBSLrkkhd+NwiEJP7Ug4l2FWPv+DF5TtCrrrxMft1pVeXilfcyzTnRPIerSHl
	ZcmLiC/JSH38TvyOnC3z2q9QAj3Ql2R1Ex3xu2XFWmjaMoM591Qn0KS3bqr3PjFyVn2E
	Fwptx25oR4S1DEEhuTaTwtJSL0CnNRHUvQAbVlQ3Wx33QzRDaF/tUj179836CkyHstBY
	2S+XANoaN8FbVvbJKU+Sk4pBrCWR62jpwxb12UYqqdSFzooIX5f4fQnkZ67l0/ku7Qob
	obnQ==
X-Gm-Message-State: AHPjjUhPM6Rlvzd5v6UYf31WK8Ambb26xXvgTkLViUPk68delATvTj+d
	o3Mf9pN79gndCF/2FmyJy4RlgvIHKl6K
X-Google-Smtp-Source: AOwi7QDCJfcV88h6h6pcPyqVxaA+t80qdXxTjvyqP3VwLESUK580u0NaDeJlkHryPlAvgH5Wwvk1bVAPBdOG+UA4Xuo=
X-Received: by 10.107.164.28 with SMTP id n28mr20584070ioe.175.1505234105012; 
	Tue, 12 Sep 2017 09:35:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 12 Sep 2017 09:34:44 -0700 (PDT)
In-Reply-To: <fd5d461b-2217-ef1e-9aa4-690d7508d806@windriver.com>
References: <20170912155906.29716-1-ross.burton@intel.com>
	<fd5d461b-2217-ef1e-9aa4-690d7508d806@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Sep 2017 17:34:44 +0100
Message-ID: <CAJTo0LYKz5w7fNe=m_5kA+iXpfRvJ9FsxR75_c+=bz4zHTVVWg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: don't reset baselib
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
X-List-Received-Date: Tue, 12 Sep 2017 16:35:04 -0000
Content-Type: multipart/alternative; boundary="001a114223ac221f2c055900a041"

--001a114223ac221f2c055900a041
Content-Type: text/plain; charset="UTF-8"

On 12 September 2017 at 17:28, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 9/12/17 10:59 AM, Ross Burton wrote:
> > allarch currently resets baselib to "lib" in an attempt to keep allarch
> recipes
> > uniform.  However if the real value for $baselib is actually needed, for
> example
> > in a multilib environment where $baselib is lib64 for standard binaries
> and the
> > allarch package is using postinst intercepts which need to know the real
> value
> > of $libdir, then a non-existant or incorrect $libdir will be used.
> >
> > Real world example: liberation-fonts is allarch and inherits fontcache,
> which
> > uses a postinst intercept to run fc-cache inside qemu-user.  In a
> multilib
> > configuration where normal libdir=/usr/lib64 and lib32 libdir=/usr/lib
> qemu will
> > try running a 64-bit fc-cache with a 32-bit ld-linux, and predicatably
> the
> > binary crashes.
>
> This still won't work right.  If we put an allarch package in a
> configuration
> that can be either 32-bit or 64-bit (which is the point of allarch), then
> how
> will it know which arch this magic script is running on?
>
> It sounds to me like the way the script is running needs to be fixed
> (and/or
> qemu needs to be fixed).   Calls to QEMU should inherit the matching system
> envrionment, not assume an environment from the post-install scripts.
>

There's several problems, yes.  qemu needs to handle this more gracefully,
but it's clearly being told by the postinst-intercept framework to run a
binary in rootfs/usr/bin (64-bit) using libraries in rootfs/usr/lib
(32-bit).  By not resetting baselib at least allarch packages think libdir
is the "native" libdir, not whatever /usr/lib happens to be.

I guess the true solution is for the recipes to not need to know the
library path.  Not sure how to do that yet though...

Also its interesting that nobody else noticed this: multilib images that
installed fonts were segfaulting in rootfs...

Ross

--001a114223ac221f2c055900a041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 September 2017 at 17:28, Mark Hatle <span dir=3D"ltr=
">&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.ha=
tle@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 9/=
12/17 10:59 AM, Ross Burton wrote:<br>
&gt; allarch currently resets baselib to &quot;lib&quot; in an attempt to k=
eep allarch recipes<br>
&gt; uniform.=C2=A0 However if the real value for $baselib is actually need=
ed, for example<br>
&gt; in a multilib environment where $baselib is lib64 for standard binarie=
s and the<br>
&gt; allarch package is using postinst intercepts which need to know the re=
al value<br>
&gt; of $libdir, then a non-existant or incorrect $libdir will be used.<br>
&gt;<br>
&gt; Real world example: liberation-fonts is allarch and inherits fontcache=
, which<br>
&gt; uses a postinst intercept to run fc-cache inside qemu-user.=C2=A0 In a=
 multilib<br>
&gt; configuration where normal libdir=3D/usr/lib64 and lib32 libdir=3D/usr=
/lib qemu will<br>
&gt; try running a 64-bit fc-cache with a 32-bit ld-linux, and predicatably=
 the<br>
&gt; binary crashes.<br>
<br>
</span>This still won&#39;t work right.=C2=A0 If we put an allarch package =
in a configuration<br>
that can be either 32-bit or 64-bit (which is the point of allarch), then h=
ow<br>
will it know which arch this magic script is running on?<br>
<br>
It sounds to me like the way the script is running needs to be fixed (and/o=
r<br>
qemu needs to be fixed).=C2=A0 =C2=A0Calls to QEMU should inherit the match=
ing system<br>
envrionment, not assume an environment from the post-install scripts.<br></=
blockquote><div><br></div><div>There&#39;s several problems, yes. =C2=A0qem=
u needs to handle this more gracefully, but it&#39;s clearly being told by =
the postinst-intercept framework to run a binary in rootfs/usr/bin (64-bit)=
 using libraries in rootfs/usr/lib (32-bit).=C2=A0 By not resetting baselib=
 at least allarch packages think libdir is the &quot;native&quot; libdir, n=
ot whatever /usr/lib happens to be.</div><div><br></div><div>I guess the tr=
ue solution is for the recipes to not need to know the library path.=C2=A0 =
Not sure how to do that yet though...</div><div><br></div><div>Also its int=
eresting that nobody else noticed this: multilib images that installed font=
s were segfaulting in rootfs...</div><div><br></div><div>Ross</div></div></=
div></div>

--001a114223ac221f2c055900a041--
