Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 05:34:17 UTC
Received: from mail-ob0-f182.google.com (unknown [209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1A58165E87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 05:34:17 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wn1so7638159obc.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 May 2014 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5v/24C+cjhzBLF6o5MUVUiFpYxj2/0ArEFamTs2WxZs=;
	b=NVdZ0iGFcD79GErTS3to4punZtA3MePJ89t438Zs9Ot2GInh0/U23DnB5/fh+l2S59
	x7gvwBV4cCL3MR6cdx4WYEuNcc6QeIny3k6nND0GQ4aZ2SgQs2uqE18jalvBb3G++l3T
	jEeaIl/bGd4MEkSzbfaWMaZpNC26OXSG42MMJG53V8SHus8DBOylH0XK5xrBBy2A7K6/
	EBSn01OI8wK/tvZG7QTBsq4k4JliVurFDXowdlRHpUK17sV/o7HMYKK0R8h0ub16SpBQ
	ZKuBTt7fJ7TrlExQdhPbnQG7+1AFMpXUmj+6uN/jSSGTDCJ/GY6KSYbU2EcUw3T6QSBP
	hysg==
MIME-Version: 1.0
X-Received: by 10.60.134.109 with SMTP id pj13mr22294297oeb.63.1401082154266; 
	Sun, 25 May 2014 22:29:14 -0700 (PDT)
Received: by 10.182.240.136 with HTTP; Sun, 25 May 2014 22:29:14 -0700 (PDT)
In-Reply-To: <20140524084213.GC2715@jama>
References: <1400672277-7181-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1400672277-7181-4-git-send-email-Matthieu.Crapet@ingenico.com>
	<1423131.I8v84STvfF@peggleto-mobl5.ger.corp.intel.com>
	<CAMKF1srVR0u6OLL_6ZAFLjcbvf2iHNRbTRbZGX5yGtGgX1CUwQ@mail.gmail.com>
	<20140524084213.GC2715@jama>
Date: Sun, 25 May 2014 22:29:14 -0700
Message-ID: <CANx9H-AGGrh-3zVOoaq9GZ60gtknNGAyZ7BGJD5s2w-GYH3e7A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 26 May 2014 05:34:20 -0000
Content-Type: multipart/alternative; boundary=047d7b471f381b34ed04fa46dc3e

--047d7b471f381b34ed04fa46dc3e
Content-Type: text/plain; charset=UTF-8

On Sat, May 24, 2014 at 1:42 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, May 23, 2014 at 07:36:42PM -0700, Khem Raj wrote:
> > On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > >> Use PREFERRED_VERSION_libav in your distro definition instead.
> > >
> > > Why? PREFERRED_VERSION_libav will override this in any case...
> >
> > I would rather ask why not ? we are pinning to older version is there
> > a reason for that ?
>
> Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplayer2
> fails with old libav-8, we need someone to work on making them
> compatible with the same version of libav (preferably newer one - 9 or
> 10) and then we should switch.
>
> The problem--at least for gst-ffmpeg and xbmc--is that libav-9 drops
libpostproc.
http://git.libav.org/?p=libav.git;a=commit;h=b315042c8ce984bec431c5965120853a843cbfa5

I'll see if I can get http://git.videolan.org/?p=libpostproc.git to play
nice.

Otherwise we could build the internal versions of ffmpeg in gst-ffmpeg and
xbmc, but that seems dumb and wasteful.

--Tim

--047d7b471f381b34ed04fa46dc3e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Sat, May 24, 2014 at 1:42 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"">On Fri, May 23, 2014 at 07:36:42PM -0700, =
Khem Raj wrote:<br>

&gt; On Wed, May 21, 2014 at 4:57 AM, Paul Eggleton<br>
&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@lin=
ux.intel.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Use PREFERRED_VERSION_libav in your distro definition instead=
.<br>
&gt; &gt;<br>
&gt; &gt; Why? PREFERRED_VERSION_libav will override this in any case...<br=
>
&gt;<br>
&gt; I would rather ask why not ? we are pinning to older version is there<=
br>
&gt; a reason for that ?<br>
<br>
</div>Current openal-soft, gst-ffmpeg and xbmc fail with libav-9, mplayer2<=
br>
fails with old libav-8, we need someone to work on making them<br>
compatible with the same version of libav (preferably newer one - 9 or<br>
10) and then we should switch.<br>
<br></blockquote><div>The problem--at least for gst-ffmpeg and xbmc--is tha=
t libav-9 drops libpostproc.=C2=A0</div><div><a href=3D"http://git.libav.or=
g/?p=3Dlibav.git;a=3Dcommit;h=3Db315042c8ce984bec431c5965120853a843cbfa5">h=
ttp://git.libav.org/?p=3Dlibav.git;a=3Dcommit;h=3Db315042c8ce984bec431c5965=
120853a843cbfa5</a></div>
<div><br></div><div>I&#39;ll see if I can get <a href=3D"http://git.videola=
n.org/?p=3Dlibpostproc.git">http://git.videolan.org/?p=3Dlibpostproc.git</a=
> to play nice.</div><div><br></div><div>Otherwise we could build the inter=
nal versions of ffmpeg in gst-ffmpeg and xbmc, but that seems dumb and wast=
eful.<br>
</div><div><br></div><div>--Tim</div></div><br></div></div>

--047d7b471f381b34ed04fa46dc3e--
