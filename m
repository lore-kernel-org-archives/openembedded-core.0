Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F70960CB8;
	Tue, 11 Feb 2020 13:57:16 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id p2so2431319uao.9;
	Tue, 11 Feb 2020 05:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AyNw6wMGwA7uzwun+ntSD9rxP6T3Eu6l3yOpTFxKjWI=;
	b=RK/yDQ5vYKq7357K4kumxYPNfDqqkC2XlEfyEFAeCJLSVdfTFptZ4gICK+QnLzVbit
	OLzWMwZCrBY3Qb5doK6THkoBOxqIuFl/5KPZQe77d5L0e+0bP6kUATkru5zz7pDk0u+C
	Mu9+IBHI2iiVThqYUgMpv04ZZ53HwY40m953CF32fELw1beRNtxjZ/ZqyOiV2FyE1ZKc
	BCTsNRMAebRJCflFJ1+hqVadvMpFr/RDJHq2ymZ1rygc1bBNKQdjCkCpmMpLGd7KH09t
	3IE1Mh6VlGHz1BI4YReXUffVUfMNtDth/yTXKy8LyuCaefgsDcpojcOQ8crdp8dayMvc
	sLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AyNw6wMGwA7uzwun+ntSD9rxP6T3Eu6l3yOpTFxKjWI=;
	b=VuV/FHj324v5EQ/ehiY8pr+pr7epKxTGsRz10ZtA3czj8mQ1sl8xWoDy6iMUIvqRre
	8Z23cDAH+SlcciPZx645JWQ0OiqDIscgGxFVhlS5JgP6wa+MpqL6FulARwAzPf4p2flL
	CFNLIpw8OWOWniRYBtpUCitSIhUmnrBewfWgdawQuQ5vZ3yRKzG8bh7e++R3HjXl0uCJ
	SE4pZw3TEA+Ot+KurlGAKzkI00YwfPIr65jOYI4ug6e/ezbIBAb0XEch0M/1d7XgJh0t
	uxcq6DIv6OkA8S/0FScGf5lPMGBIFw21+rR+VjK4n6K21gXHwOlyEK3AUeoR6jvGvg+x
	bNYg==
X-Gm-Message-State: APjAAAUlgAv0jiKq3dKuyDK9nr33hxHfewrwUPiIcyph6mOYjngE15ZD
	EOYXIPhM9Oi5i2Eirk1IiDdIv1fHTX2Fo/VTJe2oTQ==
X-Google-Smtp-Source: APXvYqx2CPV61QNl/tdjKYCRfrb4sC38vB0KVtPvdUOplIRFJApo9b7miulNj3le6CoW6xXITkAJHABWCkn73j0dWcY=
X-Received: by 2002:ab0:2006:: with SMTP id v6mr3712755uak.22.1581429437517;
	Tue, 11 Feb 2020 05:57:17 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
In-Reply-To: <20200211135323.GA3234@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 14:57:48 +0100
Message-ID: <CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 13:57:17 -0000
Content-Type: multipart/alternative; boundary="000000000000dc5518059e4d3b77"

--000000000000dc5518059e4d3b77
Content-Type: text/plain; charset="UTF-8"

The question is: what are the use cases for an 'example/reference UI'? Why
have one at all at this point? Remember, the core project is severely
under-staffed and we need to commit our limited resources wisely.

Alex

On Tue, 11 Feb 2020 at 14:53, Adrian Bunk <bunk@stusta.de> wrote:

> On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:
> >...
> > - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and
> does
> > not have a Wayland compositor. Yocto project does not have the resources
> to
> > do the gtk4 port, or add a compositor.
> >
> > - no 'lightweight Wayland compositor with a desktop/launcher experience"
> > has emerged in the open source space; I think the only realistic choice
> at
> > the moment is the reference compositor Weston which provides a blank
> > desktop with ability to open terminal windows.
> >
> > So the way I think things should be going (seeking opinions/inputs of
> > course):
> >...
> > - oe-core continues to support and runtime-test X for as long as
> possible;
> > for this a new image (say, 'core-image-sato-xorg') is created which will
> > provide matchbox under X. However, once upstream bitrot sets in, and pain
> > threshold is exceeded, this will be removed and/or relegated to a legacy
> > layer.
> >
> > Thoughts?
>
> matchbox made sense at a time when you could go into a shop and buy an
> internet tablet with Linux running on 256 MB flash with 256 MB RAM.
>
> Part of the problem is that the only remaining usage of this branch
> of matchbox development seems to be as example UI for Yocto.
>
> For matchbox/sato I am wondering whether replacing it with parts of
> meta-xfce from meta-openembedded would be a good way forward.
>
> Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland
> support, but at the point where supporting X might become a problem
> this should be available.
>
> Xfce was my first thought as replacement since it appears to be
> well-maintained in meta-openembedded, no strong opinion whether
> it is actually the best option.
>
> > Regards,
> > Alex
>
> cu
> Adrian
>

--000000000000dc5518059e4d3b77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The question is: what are the use cases for an &#39;e=
xample/reference UI&#39;? Why have one at all at this point? Remember, the =
core project is severely under-staffed and we need to commit our limited re=
sources wisely.</div><div><br></div><div>Alex</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Feb 2020 at 14:53, =
Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">On Tue, Feb 11, 2020 at 01:49:27PM +0100, Al=
exander Kanavin wrote:<br>
&gt;...<br>
&gt; - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and=
 does<br>
&gt; not have a Wayland compositor. Yocto project does not have the resourc=
es to<br>
&gt; do the gtk4 port, or add a compositor.<br>
&gt; <br>
&gt; - no &#39;lightweight Wayland compositor with a desktop/launcher exper=
ience&quot;<br>
&gt; has emerged in the open source space; I think the only realistic choic=
e at<br>
&gt; the moment is the reference compositor Weston which provides a blank<b=
r>
&gt; desktop with ability to open terminal windows.<br>
&gt; <br>
&gt; So the way I think things should be going (seeking opinions/inputs of<=
br>
&gt; course):<br>
&gt;...<br>
&gt; - oe-core continues to support and runtime-test X for as long as possi=
ble;<br>
&gt; for this a new image (say, &#39;core-image-sato-xorg&#39;) is created =
which will<br>
&gt; provide matchbox under X. However, once upstream bitrot sets in, and p=
ain<br>
&gt; threshold is exceeded, this will be removed and/or relegated to a lega=
cy<br>
&gt; layer.<br>
&gt; <br>
&gt; Thoughts?<br>
<br>
matchbox made sense at a time when you could go into a shop and buy an<br>
internet tablet with Linux running on 256 MB flash with 256 MB RAM.<br>
<br>
Part of the problem is that the only remaining usage of this branch<br>
of matchbox development seems to be as example UI for Yocto.<br>
<br>
For matchbox/sato I am wondering whether replacing it with parts of<br>
meta-xfce from meta-openembedded would be a good way forward.<br>
<br>
Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland <br>
support, but at the point where supporting X might become a problem<br>
this should be available.<br>
<br>
Xfce was my first thought as replacement since it appears to be <br>
well-maintained in meta-openembedded, no strong opinion whether<br>
it is actually the best option.<br>
<br>
&gt; Regards,<br>
&gt; Alex<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>

--000000000000dc5518059e4d3b77--
