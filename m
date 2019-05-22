Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id F05317E3B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 14:01:43 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id m3so3696819itl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cV+WgIB20SQOAN1r+oFAg6HSrsDZN7BpFq4ZIRMY40I=;
	b=gy/izLCld1TsdVCDdzlbvoa+CLfdoYOquBmxi5RDvNesM35pSKa2TMJKOXmbF+Be39
	a3g6vTrv/bfawwfYbt0XodIhBshaLQbkLbZznLPqKmxOsVlsYzHSf53CEU8FrCFgfz7o
	x289qomm1EaYc3yvGPAGo78tbQZCehH0EkozxEx0aTIuhrhLe+3Gwk/QJ9JZvjpwPlvp
	yvqOyHkhQna61avOCj16HjeDE5P448tfGXZL/5U1+od9Hiq4jTf37eDAcBwcGMUPAEE+
	4HIYEE19l6Kgr6HLPJ6gEEeDS2uEEDcURxibfOv+0dSLQCB1nAG+vsMiKXMCAuHDyIvS
	6+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cV+WgIB20SQOAN1r+oFAg6HSrsDZN7BpFq4ZIRMY40I=;
	b=iOBmIHdu1lcwbOpQiUIpo6+Ze2UasUhaKHqW9R8hhqoX/dGRkehKbSAyL54KSTGimW
	/p1mjY0q1o/nQY/4Bi3xKLfHEeZ2newulfvD8nI8R8DbrH3lFpqW/uQ0gvXkB4ah/Bf5
	DcJ+9z2RMlJpmKja0BcJ7KS1pykFM8gZT1GwuoqqsXiUguZDCQldkmjypNk+hcvjU3KN
	9Zz+cbbPVrxG+8D95aGmF5kO8FyirZpiMXaHTLCbc7s7dW1WeXLigo9KWeHKN5HbOu9L
	DGF8a6NVyGs6uubuoi1owLNvnUJkQKcUOwZmEXqHhantqQpo9W5mGcty2XeNk+iUgcX7
	cENA==
X-Gm-Message-State: APjAAAVW4ZT/DweItpgFJFi90bZXurUNF/5cJw5K5HgdJSb7z/CCNoAF
	A+qeyE9rpCEmP9nJ4IMnjH2hhIBC8eHnXEvGZv0=
X-Google-Smtp-Source: APXvYqy7Iaf1Yt4U+6YiC9rZMsUOERSSInwEXxUeuKc2sIXwjqgfcokHXNUUglZcOJodNqS9T5Fs2GMnXBUefQZ3YIY=
X-Received: by 2002:a24:1796:: with SMTP id 144mr8313894ith.18.1558533704768; 
	Wed, 22 May 2019 07:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
	<1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
	<CAMKF1srz+_Tk5=GNWzBLpNRXoqdCYOmLyNm6XKkFJQFvGcpX=Q@mail.gmail.com>
	<f10bbaa1a0d8ef62f7b7ffd8dfae101b906fafce.camel@linuxfoundation.org>
	<CANNYZj89w2eT2bN=8SmSwmAPzYADLPk=GmajvNJTif+0q3eO+g@mail.gmail.com>
In-Reply-To: <CANNYZj89w2eT2bN=8SmSwmAPzYADLPk=GmajvNJTif+0q3eO+g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 May 2019 07:01:33 -0700
Message-ID: <CANx9H-D0E+ixNv3Tj4ZBir3Z8xv0=G_1nkufvML7CwA=4RigZw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 14:01:44 -0000
Content-Type: multipart/alternative; boundary="000000000000d7e22c05897a67e7"

--000000000000d7e22c05897a67e7
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 4:27 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 22 May 2019 at 13:05, <richard.purdie@linuxfoundation.org> wrote:
>
> > I don't think we need to switch our default, just be able to build say
> > oe-core without python/python2 in HOSTTOOLS and without needing python
> > 2.7 in OE-Core either.
> >
> > > Its good that project is taking lead here but we might leave many
> > > users behind.
> >
> > I suspect python2 will end up in a layer of its down which I'm fine
> > with, dependencies can then be clearly seen.
>
> For what it's worth, Fedora is getting serious about Python 2 removal,
> and they have a plan for it:
> https://fedoraproject.org/wiki/Changes/RetirePython2
>
> "All packages in Fedora that need Python 2 to run will be removed from
> Fedora 32 regardless of their dependencies. All packages in Fedora
> that need Python 2 to build will be removed from Fedora 32 regardless
> of their dependencies. "
>


We have discussed moving meta-python to its own repository (not under
meta-openembedded). As part of that move, I am proposing the existing
python2 recipes move to a separate (deprecated) layer, as RP mentioned
earlier. Then meta-python will become python3 only. We will also move
recipetool/devtool to provide python3 (only) support. People that need
python2 will very soon have to live with older stable branches. This should
not be a surprise.

We also need to do whatever we can with upstream projects that are not
feeling an urgency to move to python3. They should likewise not be
surprised at the need to switch.


> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d7e22c05897a67e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 22, 2019 at 4:27 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Wed, 22 May 2019 at 13:05, &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
<br>
&gt; I don&#39;t think we need to switch our default, just be able to build=
 say<br>
&gt; oe-core without python/python2 in HOSTTOOLS and without needing python=
<br>
&gt; 2.7 in OE-Core either.<br>
&gt;<br>
&gt; &gt; Its good that project is taking lead here but we might leave many=
<br>
&gt; &gt; users behind.<br>
&gt;<br>
&gt; I suspect python2 will end up in a layer of its down which I&#39;m fin=
e<br>
&gt; with, dependencies can then be clearly seen.<br>
<br>
For what it&#39;s worth, Fedora is getting serious about Python 2 removal,<=
br>
and they have a plan for it:<br>
<a href=3D"https://fedoraproject.org/wiki/Changes/RetirePython2" rel=3D"nor=
eferrer" target=3D"_blank">https://fedoraproject.org/wiki/Changes/RetirePyt=
hon2</a><br>
<br>
&quot;All packages in Fedora that need Python 2 to run will be removed from=
<br>
Fedora 32 regardless of their dependencies. All packages in Fedora<br>
that need Python 2 to build will be removed from Fedora 32 regardless<br>
of their dependencies. &quot;<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">We have discussed moving meta-python to its own repository (not=
 under meta-openembedded). As part of that move, I am proposing the existin=
g python2 recipes move to a separate (deprecated) layer, as RP mentioned ea=
rlier. Then meta-python will become python3 only. We will also move recipet=
ool/devtool to provide python3 (only) support. People that need python2 wil=
l very soon have to live with older stable branches. This should not be a s=
urprise.</div><div dir=3D"auto"><br></div><div dir=3D"auto">We also need to=
 do whatever we can with upstream projects that are not feeling an urgency =
to move to python3. They should likewise not be surprised at the need to sw=
itch.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Alex<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000d7e22c05897a67e7--
