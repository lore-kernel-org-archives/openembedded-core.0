Return-Path: <koenraad.verheyden@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB9D6093A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 11:59:18 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id w10so83888909oif.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RfHJkHjZR7usPoigiHnDK4n2pSUrrDUbUmGa3t8YYP8=;
	b=TkLodJuF9k+tHFD1ryBCytK8Xzpk0ffIe/IN/WmMzIiZ0OcW8GnzFGm8mQ2jZdsO9o
	xeI/+8ffehVZnREWcjSLwHeGFoEzekokzcRFq5owF7XNKUYKbhuehwk8uBK+dFR6GdZa
	9vQs2R3QrsM7DqPX7mOl6g2umKYUZpF/L0mkFK2LSSW7gYqVl8XUxiLdUtgmIwPRSImM
	f+mPah1zbAJFsqL6IoPufYU9gTeypZ8tWYy6lUmE8KIhjuyPXWNRN/Boo5AWFrHiPvqX
	mkEZ3UASbn9nJiLYaQXCmwHzi/E/pnq+YfJ7wIx1aVleWgejhx8tnI0jXNI7s0MC/lIH
	bgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RfHJkHjZR7usPoigiHnDK4n2pSUrrDUbUmGa3t8YYP8=;
	b=lO4o0NzRFPa9A0iAeKBAN76Fun8R4L0ucmmFIP/mJCHUrX4BGSOuOpw+4QPwgpmkd6
	TTLi3VUljEiim3RniGUKdX9RlTe8XSAgvx1iYEpzUt9I+o9hjjcl1IAKNhsnXGDKYbr8
	nmdvzrYA8huzPxEzQhppBcqM0Oy3w0WjjpnkbTRsDgwwIKpKgwz3CIBt9AlL1yNFQ+n1
	u+zZO6ZS6BGtAkwtaG7dw66SAgVYBNTLTmsvR7URgSIMeo9t1/EFHxYAZAKrLO1YygX9
	Y1lOSwbvU4B5VK3wPnlGqa3ucfzWSIrjd3Z4XXtfdcGK7Vlrr6G8Dpai/d7dDv1z25rr
	27CA==
X-Gm-Message-State: AN3rC/6RA61KzpyNKrBWs5zBwl7b+CpQNHweCleHhwJh8LA87j87bnFv
	FloCR+W0UaAYS3fpzroogt3gOQmJgA==
X-Received: by 10.157.39.98 with SMTP id r89mr26295933ota.11.1494331159780;
	Tue, 09 May 2017 04:59:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.25.196 with HTTP; Tue, 9 May 2017 04:59:19 -0700 (PDT)
In-Reply-To: <1492768432.2475.1.camel@iki.fi>
References: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
	<1492694665.22019.2.camel@iki.fi>
	<CA+rFJSHDqvsg23XXSQfk0XUpj+0bmcULM_EjddD0NwS9ZZC37Q@mail.gmail.com>
	<1492768432.2475.1.camel@iki.fi>
From: Koenraad Verheyden <koenraad.verheyden@gmail.com>
Date: Tue, 9 May 2017 13:59:19 +0200
Message-ID: <CA+rFJSGHBiVAwPqF9bqJQV=0wh+6DT5rdK-6V3TuZCg2qRYp=Q@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PulseAudio with WebRTC echo cancellation (aec): support for webrtc-audio-processing package
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
X-List-Received-Date: Tue, 09 May 2017 11:59:20 -0000
Content-Type: multipart/alternative; boundary=001a113ce6c2f4a5a7054f16153e

--001a113ce6c2f4a5a7054f16153e
Content-Type: text/plain; charset=UTF-8

Hi Tanu,

I've written a script myself, referencing how other scripts did this. Was
indeed not so hard.
This is the first time writing such a script so I can't guarantee
everything is correct or the right way to do (especially the license
stuff). But this works for me.

You can do with this script as you want.

With kind regards,
Koenraad

The script:
==========
DESCRIPTION = "This is meant to be a more Linux packaging friendly copy of
the AudioProcessing module from the WebRTC project."
HOMEPAGE = "
https://www.freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://COPYING;md5=da08a38a32a340c5d91e13ee86a118f2"

SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
SRC_URI[md5sum] = "336ae032f608e65808ac577cde0ab72c"
SRC_URI[sha256sum] =
"756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa"

inherit autotools
==========

On 21 April 2017 at 11:53, Tanu Kaskinen <tanuk@iki.fi> wrote:

> On Thu, 2017-04-20 at 22:14 +0200, Koenraad Verheyden wrote:
> > I am not familiar with the organization of the various recipes. I
> > mentioned oe-core since the original message was posted there.
> > Meta-oe seems more suitable indeed.
> >
> > How much work would it be to make a recipe for this?
> > I need it for a short-term project and am not in a position to further
> > support it afterwards.
>
> Writing the recipe should be fairly simple. I can do that at some
> point, but if you want it fast, write the recipe yourself. I volunteer
> to maintain it.
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113ce6c2f4a5a7054f16153e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Tanu,<br><br></div>I&#39;ve wr=
itten a script myself, referencing how other scripts did this. Was indeed n=
ot so hard.<br></div>This is the first time writing such a script so I can&=
#39;t guarantee everything is correct or the right way to do (especially th=
e license stuff). But this works for me.<br><br></div><div>You can do with =
this script as you want.<br></div><div><br></div>With kind regards,<br></di=
v>Koenraad<br><br></div>The script:<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>DE=
SCRIPTION =3D &quot;This is meant to be a more Linux packaging friendly cop=
y of the AudioProcessing module from the WebRTC project.&quot;<br>HOMEPAGE =
=3D &quot;<a href=3D"https://www.freedesktop.org/software/pulseaudio/webrtc=
-audio-processing/">https://www.freedesktop.org/software/pulseaudio/webrtc-=
audio-processing/</a>&quot;<br>LICENSE =3D &quot;BSD-3-Clause&quot;<br>LIC_=
FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dda08a38a32a340c5d91e13ee86a118f=
2&quot;<br><br>SRC_URI =3D &quot;<a href=3D"http://freedesktop.org/software=
/pulseaudio/${BPN}/${BP}.tar.xz">http://freedesktop.org/software/pulseaudio=
/${BPN}/${BP}.tar.xz</a>&quot;<br>SRC_URI[md5sum] =3D &quot;336ae032f608e65=
808ac577cde0ab72c&quot;<br>SRC_URI[sha256sum] =3D &quot;756e291d4f557d88cd5=
0c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa&quot;<br><br>inherit autotool=
s<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 21 April 2017 at 11:53, Tanu Kaskinen <span =
dir=3D"ltr">&lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki=
.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Thu, 2017-04-20 at 22:14 +0200, Koenraad Verheyden wrote:<br>
&gt; I am not familiar with the organization of the various recipes. I<br>
&gt; mentioned oe-core since the original message was posted there.<br>
&gt; Meta-oe seems more suitable indeed.<br>
&gt;<br>
&gt; How much work would it be to make a recipe for this?<br>
&gt; I need it for a short-term project and am not in a position to further=
<br>
&gt; support it afterwards.<br>
<br>
</span>Writing the recipe should be fairly simple. I can do that at some<br=
>
point, but if you want it fast, write the recipe yourself. I volunteer<br>
to maintain it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tanu<br>
<br>
<a href=3D"https://www.patreon.com/tanuk" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.patreon.com/tanuk</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113ce6c2f4a5a7054f16153e--
