Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 337 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 14:06:24 UTC
Received: from mail-oa0-f43.google.com (unknown [209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2559C6FAB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 14:06:24 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id l6so9644670oag.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TCRRcvV9VuV3fv52p7I2+JN/F/ZQ+U5OVsKsRF+MsZI=;
	b=M3i7btLzO71hjvAo108SyKOAdEwOUcsvdr7Yqw5GWEo6pf5+dVHCKySnebUrk3bRA0
	aswp2p1Ymfj2F4xWB6NhYEbE7gDZiB6woPDgBJPaqIlBbMIhRaePW4Il89rBzA1Pdvah
	rPoSL19TLybs2JTA5XDagr3uZcvj8my63OV6tVt8/dNEh3VXEDCBhgOr+ZEdFk0aeZbP
	T52aG5/pNDejefbSJmuG5vH5FZeQgAw9abu+1NfWJBPudz7AOJJA6WgUlLp68qWpkvIj
	jFfHBqnsTgFNh+RXEc2/4EMgnvsyPCKmr/3eD4hyIRmeu/yKJWORbwOos9Kj26qzfEH5
	ZOVQ==
MIME-Version: 1.0
X-Received: by 10.182.29.195 with SMTP id m3mr33253262obh.33.1401199248206;
	Tue, 27 May 2014 07:00:48 -0700 (PDT)
Received: by 10.182.240.136 with HTTP; Tue, 27 May 2014 07:00:48 -0700 (PDT)
In-Reply-To: <6373193.eVtsr7fQSg@peggleto-mobl5.ger.corp.intel.com>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140524084213.GC2715@jama>
	<CANx9H-AGGrh-3zVOoaq9GZ60gtknNGAyZ7BGJD5s2w-GYH3e7A@mail.gmail.com>
	<6373193.eVtsr7fQSg@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 27 May 2014 07:00:48 -0700
Message-ID: <CANx9H-Ax=ZTOavtP6Aq47to3Vd8LdDHBexA7jjXkBZAdaLrP7Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libav (9.13): remove DEFAULT_PREFERENCE
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
X-List-Received-Date: Tue, 27 May 2014 14:06:28 -0000
Content-Type: multipart/alternative; boundary=001a11c2dca672f56d04fa621f67

--001a11c2dca672f56d04fa621f67
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 5:28 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Tim,
>
> On Sunday 25 May 2014 22:29:14 Tim Orling wrote:
> > On Sat, May 24, 2014 at 1:42 AM, Martin Jansa <martin.jansa@gmail.com
> >wrote:
> > > On Fri, May 23, 2014 at 07:36:42PM -0700, Khem Raj wrote:
> > > > On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton
> > > >
> > > > <paul.eggleton@linux.intel.com> wrote:
> > > > >> Use PREFERRED_VERSION_libav in your distro definition instead.
> > > > >
> > > > > Why? PREFERRED_VERSION_libav will override this in any case...
> > > >
> > > > I would rather ask why not ? we are pinning to older version is there
> > > > a reason for that ?
> > >
> > > Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplayer2
> > > fails with old libav-8, we need someone to work on making them
> > > compatible with the same version of libav (preferably newer one - 9 or
> > > 10) and then we should switch.
> > >
> > > The problem--at least for gst-ffmpeg and xbmc--is that libav-9 drops
> >
> > libpostproc.
> >
> http://git.libav.org/?p=libav.git;a=commit;h=b315042c8ce984bec431c5965120853
> > a843cbfa5
> >
> > I'll see if I can get http://git.videolan.org/?p=libpostproc.git to play
> > nice.
>
> Maybe you already saw it, but we do have a libpostproc recipe in meta-oe...
>
> :) I found that recipe shortly after I sent the above email. I am working
with that recipe now to see if I can get several multimedia packages to
build with libav-9+. IMHO, gst-ffmpeg-0.10 needs to go away and this will
help.

--Tim

--001a11c2dca672f56d04fa621f67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Tue, May 27, 2014 at 5:28 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Tim,<br>
<div class=3D""><br>
On Sunday 25 May 2014 22:29:14 Tim Orling wrote:<br>
&gt; On Sat, May 24, 2014 at 1:42 AM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;wrote:<br>
&gt; &gt; On Fri, May 23, 2014 at 07:36:42PM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eg=
gleton@linux.intel.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt; Use PREFERRED_VERSION_libav in your distro definiti=
on instead.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Why? PREFERRED_VERSION_libav will override this in any =
case...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would rather ask why not ? we are pinning to older version=
 is there<br>
&gt; &gt; &gt; a reason for that ?<br>
&gt; &gt;<br>
&gt; &gt; Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplay=
er2<br>
&gt; &gt; fails with old libav-8, we need someone to work on making them<br=
>
&gt; &gt; compatible with the same version of libav (preferably newer one -=
 9 or<br>
&gt; &gt; 10) and then we should switch.<br>
&gt; &gt;<br>
&gt; &gt; The problem--at least for gst-ffmpeg and xbmc--is that libav-9 dr=
ops<br>
&gt;<br>
&gt; libpostproc.<br>
&gt; <a href=3D"http://git.libav.org/?p=3Dlibav.git;a=3Dcommit;h=3Db315042c=
8ce984bec431c5965120853" target=3D"_blank">http://git.libav.org/?p=3Dlibav.=
git;a=3Dcommit;h=3Db315042c8ce984bec431c5965120853</a><br>
&gt; a843cbfa5<br>
&gt;<br>
&gt; I&#39;ll see if I can get <a href=3D"http://git.videolan.org/?p=3Dlibp=
ostproc.git" target=3D"_blank">http://git.videolan.org/?p=3Dlibpostproc.git=
</a> to play<br>
&gt; nice.<br>
<br>
</div>Maybe you already saw it, but we do have a libpostproc recipe in meta=
-oe...<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>:=
) I found that recipe shortly after I sent the above email. I am working wi=
th that recipe now to see if I can get several multimedia packages to build=
 with libav-9+. IMHO, gst-ffmpeg-0.10 needs to go away and this will help.<=
/div>
<div><br></div><div>--Tim=C2=A0</div></div><br></div></div>

--001a11c2dca672f56d04fa621f67--
