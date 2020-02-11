Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 96C5C601EB;
	Tue, 11 Feb 2020 14:00:49 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id r18so6326512vso.5;
	Tue, 11 Feb 2020 06:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xPZVIl9TMB+URfZm2HepkwRPCqs/Hrchpkyd39xAZtc=;
	b=P0CpRYBBhyeSkwouLBCa7zHwVP54pnr2yAbxND9LAnlb45gmF6NNm5XBla1nLJwmh+
	wW8qLgnCwC3XLcD8diiC1cM14zDjHTX5UVV1RFUObQm4ZCxUR3ioxdw67pNxCBgaPvlG
	WVEF56ebFlzsRY1YCGlv2O1Tz5f10h3LpOQXDvhmlDnWVEthpH/XZq9cgPKle/kHsNbf
	BLcNjP57VucrwAaRFFxflfx5hMOiCISISbsFbUqK4KjSSTQK5StdMYcZ4A73owrLHwaR
	sPRDztQt9tXHk1UypCt+bjMMtgkNFecgmKL9RIOpzPcpRFoxvhwXIUsH6SpeFDMb2FU9
	Kmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xPZVIl9TMB+URfZm2HepkwRPCqs/Hrchpkyd39xAZtc=;
	b=TrjfxG7ADDWB4eiUtQ6JxCk7XT6qxMrIPrS5IVV/aRJ4nQWKtQCCOwMTAuGDhJcUkp
	epIGy8f5bxi+9q9fbMe3xAEobqJ2SDjZ9mpXIA1Ta1xuGwBD0ZSpxcOBBfKBTjKV5Vw2
	Ux9I/CjUnuaXMry/WfeJ9eilBklf/LLbQFES4rP1kmUAmBqpNJKCJQmkQEWXFChOSM8U
	PVO4dzirpiPbofXZWZhvnjT1YSvFybmhwYQ8WGaQj3fSx8omDqHQTgExCTHkMlOUvwWI
	BSPTWnvICbLMvdicu+lniAtIern+597hZbMKwe05grsRbUw/AC+37OkRSDFxM261ysJs
	fVAg==
X-Gm-Message-State: APjAAAV075pWNb5E6oOW4dgPGxdvF2fpOM8QANMK5uK3Kx5Uz8EBNiuW
	1QN/dOI3zbm67qud6+F4DJJv9YUkFDxgyHVg8OE=
X-Google-Smtp-Source: APXvYqxWlnou3YQJIEFC190OjOmlji/tTgJC7Y5ijNTaAkPepOvxdY0WQxMlirmAf05r4vV6JQknu2cIbPYuf2W/9WQ=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr9361421vsg.35.1581429650446; 
	Tue, 11 Feb 2020 06:00:50 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
In-Reply-To: <CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 15:01:20 +0100
Message-ID: <CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2020 14:00:49 -0000
Content-Type: multipart/alternative; boundary="0000000000008d5d5f059e4d48e3"

--0000000000008d5d5f059e4d48e3
Content-Type: text/plain; charset="UTF-8"

Specifically (sorry for the rapid-followup), I think the main value
proposition of core is integration and testing of various language
toolchains and core libraries. UIs in embedded space can mean pretty much
anything, and so I'd leave that to specialised layers.

Alex

On Tue, 11 Feb 2020 at 14:57, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The question is: what are the use cases for an 'example/reference UI'? Why
> have one at all at this point? Remember, the core project is severely
> under-staffed and we need to commit our limited resources wisely.
>
> Alex
>
> On Tue, 11 Feb 2020 at 14:53, Adrian Bunk <bunk@stusta.de> wrote:
>
>> On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:
>> >...
>> > - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year), and
>> does
>> > not have a Wayland compositor. Yocto project does not have the
>> resources to
>> > do the gtk4 port, or add a compositor.
>> >
>> > - no 'lightweight Wayland compositor with a desktop/launcher experience"
>> > has emerged in the open source space; I think the only realistic choice
>> at
>> > the moment is the reference compositor Weston which provides a blank
>> > desktop with ability to open terminal windows.
>> >
>> > So the way I think things should be going (seeking opinions/inputs of
>> > course):
>> >...
>> > - oe-core continues to support and runtime-test X for as long as
>> possible;
>> > for this a new image (say, 'core-image-sato-xorg') is created which will
>> > provide matchbox under X. However, once upstream bitrot sets in, and
>> pain
>> > threshold is exceeded, this will be removed and/or relegated to a legacy
>> > layer.
>> >
>> > Thoughts?
>>
>> matchbox made sense at a time when you could go into a shop and buy an
>> internet tablet with Linux running on 256 MB flash with 256 MB RAM.
>>
>> Part of the problem is that the only remaining usage of this branch
>> of matchbox development seems to be as example UI for Yocto.
>>
>> For matchbox/sato I am wondering whether replacing it with parts of
>> meta-xfce from meta-openembedded would be a good way forward.
>>
>> Upstream Xfce still seems to be 2-3 years away from gtk4 and Wayland
>> support, but at the point where supporting X might become a problem
>> this should be available.
>>
>> Xfce was my first thought as replacement since it appears to be
>> well-maintained in meta-openembedded, no strong opinion whether
>> it is actually the best option.
>>
>> > Regards,
>> > Alex
>>
>> cu
>> Adrian
>>
>

--0000000000008d5d5f059e4d48e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Specifically (sorry for the rapid-followup), I think the m=
ain value proposition of core is integration and testing of various languag=
e toolchains and core libraries. UIs in embedded space can mean pretty much=
 anything, and so I&#39;d leave that to specialised layers.<div><br></div><=
div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 11 Feb 2020 at 14:57, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div>The question is: what are the=
 use cases for an &#39;example/reference UI&#39;? Why have one at all at th=
is point? Remember, the core project is severely under-staffed and we need =
to commit our limited resources wisely.</div><div><br></div><div>Alex</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 11 Feb 2020 at 14:53, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" t=
arget=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
On Tue, Feb 11, 2020 at 01:49:27PM +0100, Alexander Kanavin wrote:<br>
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
</blockquote></div>

--0000000000008d5d5f059e4d48e3--
