Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8022361539
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 01:56:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id a141so8225750qkg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 17:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KWVBJIcjo2qC/+8+a8brZx74M24kwNztfSKp/QIj1T8=;
	b=CBqDLfMStQtOzes9rk7bNnbkigpDZqrK+kdMiKQOWdZUxoybppEiQoI/IJA06Or6hh
	aqECuZClVd9J0i0SArumWPz6yRqlIO84wLRhl8mftY9q9s7e3ywnLQIyu9Oa6FgWKj77
	mBFDdxAfBm1aVT/Z+B2Kppk7BMk3pwAVxrghqubeT4qTZP5crpV6WfFIC1laezKuLXx0
	3pQbLr51ocnMvjISOY/3+dcuwJZ0Aie2/NjutO3IBjIJ+J1qIHgo4qt1lHSu0e6UcLGm
	U13Yfjnf57pUjZycLHSLictx/Xlmn/l9GiehOyy87UQoTUQ5oDdCA0hkircnaJf/FLB3
	mgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KWVBJIcjo2qC/+8+a8brZx74M24kwNztfSKp/QIj1T8=;
	b=nzq+CPUBIFNAjAvzPB/2NRyhnj8I36zA4I8suZWnhDv/xFQtmkR450Tu4CKRsCi5KH
	QpnjmezgcI29vCQL+Vha0ni800apWjiJGX1exSTxjtZS87dLb57EmFM5NdOKsvzGGGB+
	haAMe+bWSdOFTnwI49/VG7Hfl7g2jr1zBESUsjfEg7VxnKZeldFGEk4WPO/QB/jMpBfA
	ubhQRBNPr2t3UFnilM3XAOCfQeoEpFszgMZVEIeMTD6u0KF8fzunMJs2uholb+SpRpEa
	c0zrgyDcO8fpQFa6pvIf5kpe4dc2YHu3damK2VNV4MyIYcN3XxXkrrw6Pzu02tZC2n6L
	vc5w==
X-Gm-Message-State: APjAAAXJ7k8wCpiakWhDCwEtphWWjZWGBelFAcu3a+8T61o4Ra0lSCf9
	1OuiC7KwZWcVSUArNL/GL/qciEHfzot8ir7leYc=
X-Google-Smtp-Source: APXvYqzkt+MPP8WROPZHfpAF2zFzcy6oBbU6Amiu7da8N8OO2ERypcKFgiKyyxivzFQIWHUmrH1NZt1DF/Hrk50RHBw=
X-Received: by 2002:a37:de05:: with SMTP id h5mr17348211qkj.474.1581991001145; 
	Mon, 17 Feb 2020 17:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
	<CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
	<CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
	<CANNYZj_ktJg=JF=nTPvHWBajA+7t2zMPwZmbUFLOKRWD1uP4_A@mail.gmail.com>
In-Reply-To: <CANNYZj_ktJg=JF=nTPvHWBajA+7t2zMPwZmbUFLOKRWD1uP4_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Feb 2020 17:56:30 -0800
Message-ID: <CAMKF1sqKV7+uMtvZEOCApvkiBV=cnFhsKJ=e9gx_gcY4iE-kvw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Tue, 18 Feb 2020 01:56:40 -0000
Content-Type: multipart/alternative; boundary="000000000000a9469c059ecffb06"

--000000000000a9469c059ecffb06
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 17, 2020 at 11:29 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 17 Feb 2020 at 19:45, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> hw acceleration is not going to work for non-x86 qemus, while other
>> qemus should be fixed but not
>> by breaking them first. As suggested limit this change to tested
>> architectures and it would be fine.
>> then if interested to fix it globally make changes to fix rest of
>> qemus and then instrument global change
>> after that
>>
>
> arm64 qemu should work, as it is using the same video hardware as x86_64.
> My computing resources are severely limited right now, so I cannot try it
> out immediately unfortunately,
>

Ok then resend it later


but I'll get to it, or you are welcome to try and report.
> Mips can be either fixed like suggested, or be a specific exception.
>
> For the rest of the targets, I see that you have extended the fbdev
> fallback to qemuall only on Jan 9 this year. So it's very unlikely anyone
> is using them to run weston (not to mention how painfully slow that would
> be), and so it would just be wasteful to test or fix them.
>

We should be only applying tested part debugging these breakages is very
hard so when we know it will break we should be careful as with this patch



>
> Alex
>

--000000000000a9469c059ecffb06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Feb 17, 2020 at 11:29 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">=
On Mon, 17 Feb 2020 at 19:45, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
hw acceleration is not going to work for non-x86 qemus, while other<br>
qemus should be fixed but not<br>
by breaking them first. As suggested limit this change to tested<br>
architectures and it would be fine.<br>
then if interested to fix it globally make changes to fix rest of<br>
qemus and then instrument global change<br>
after that<br></blockquote><div><br></div><div>arm64 qemu should work, as i=
t is using the same video hardware as x86_64. My computing resources are se=
verely limited right now, so I cannot try it out immediately unfortunately,=
</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Ok then resend it later</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div> but I&#39;ll get to it, or you are welcome to try and rep=
ort.</div><div></div><div></div><div>Mips can be either fixed like suggeste=
d, or be a specific exception. <br></div><div><br></div><div>For the rest o=
f the targets, I see that you have extended the fbdev fallback to qemuall o=
nly on Jan 9 this year. So it&#39;s very unlikely anyone is using them to r=
un weston (not to mention how painfully slow that would be), and so it woul=
d just be wasteful to test or fix them.</div></div></div></blockquote><div =
dir=3D"auto"><br></div><div dir=3D"auto">We should be only applying tested =
part debugging these breakages is very hard so when we know it will break w=
e should be careful as with this patch=C2=A0</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_quote"><div><br></div><br><div>Alex<br></div></div>=
</div>
</blockquote></div></div>

--000000000000a9469c059ecffb06--
