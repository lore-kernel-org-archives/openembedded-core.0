Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 884AA61565
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 09:45:45 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id r18so15003145vso.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 01:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4GnTJia7gyq/Hvov6lfjtkpL5ZLCET5Li9wPbGLmU7A=;
	b=eaUWgHWviPLHCFpU+kFhJxLgFmgCXLo559jwzrnKBIxHbp0+Lc601IPfWcjMOOsU6E
	qNMm3Ceg/bMwTdKpv14ZeAX//bWFkgFGQIQGvph3zRrqBqOWfVsdKD8V6Nc67dQ8FPyj
	ZAxVEYsO1gDMcYeubhanOt8hJpFdNciCyfflZKZlMKUBN6FrS6r1XCClR8DfE/Z2EfkT
	7Gg7Rq3hjFJktzpDL5lRwopVaqWcxDZPfBHpD68ArsE0NUhnts+oKdxFb+qstJqPTYlY
	wx2ny0wuLmrvd7TLucjofLkU1fAvufpitTQhKwtTSZINrxFsP+jZtkApuHhqPEdZ90RL
	Gabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4GnTJia7gyq/Hvov6lfjtkpL5ZLCET5Li9wPbGLmU7A=;
	b=l9OatncXGRqFbMxSdy89VuD7A0aM2QRfhHIrFP+VYYB/nBn0/od9gnWtKl3TorLZHY
	+S6qFSwJKg5QiOUhP8xh22Jek4xYPAL5AqZ1P7T1Q7c6EG+88tb89TZ9JMke7038QCmX
	tGS+MJA1vY5fliLsoB7B4lxwzY3mzXxEXNtO8H2QkEd8aJeukBlzjgaTkEuUXO7fX445
	i9+r8GPMAbejnc1O6RNLcP4A1X5euPnMxL0d6ikQVKW3Q9kAZsvz/A2E8g1logdTDQrT
	/irde0ICPxmbCuVQLEc+u9gP0GSnSmLWbK8aLd+v7Ay5c+abhu47c81CYcyN0u7KjKtR
	tliA==
X-Gm-Message-State: APjAAAVwfro4MxoC4qBDbqb9MXSpTAMaI60rWrFKAM9ZgurqG7j9q8Bl
	T7s7U14c07vcgUBBf46zt1gjswm+DI6Ns58voE0=
X-Google-Smtp-Source: APXvYqxK3WtHcV5t5DzdfGjtiVeYtkgo+YzRwTagyXMPD+OgjyIgKtLsUXB+3rOtmIoXGp04hBsRiDsXc7TasbS9qaU=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr13545339vsg.35.1582105546332; 
	Wed, 19 Feb 2020 01:45:46 -0800 (PST)
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
	<CAMKF1sqKV7+uMtvZEOCApvkiBV=cnFhsKJ=e9gx_gcY4iE-kvw@mail.gmail.com>
In-Reply-To: <CAMKF1sqKV7+uMtvZEOCApvkiBV=cnFhsKJ=e9gx_gcY4iE-kvw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 10:45:35 +0100
Message-ID: <CANNYZj93fYQY6rDVz5t2aaOfn=Vwz88OzZwZVcdwf3pfgWx1NQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 09:45:45 -0000
Content-Type: multipart/alternative; boundary="000000000000161d8f059eeaa758"

--000000000000161d8f059eeaa758
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2020 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:

>
> but I'll get to it, or you are welcome to try and report.
>> Mips can be either fixed like suggested, or be a specific exception.
>>
>> For the rest of the targets, I see that you have extended the fbdev
>> fallback to qemuall only on Jan 9 this year. So it's very unlikely anyone
>> is using them to run weston (not to mention how painfully slow that would
>> be), and so it would just be wasteful to test or fix them.
>>
>
> We should be only applying tested part debugging these breakages is very
> hard so when we know it will break we should be careful as with this patch
>

I have tested these things now:

1. Switching mips from cirrus to std vga works fine, as long as xorg.conf
is also deleted (it's written specifically for cirrus and isn't working or
needed with std vga). Both weston and sato boot and look right. I'll send a
patch for it.

2. Switching weston to kms backend degrades performance to unusable level,
as neither kvm nor virtio/virgl are available for non-x86 qemu, and kms
backend is using software renderer in mesa. So fbdev is the only realistic
option there. But for x86 qemu kms is still viable. I'm not sure how to
best configure it though.

Alex

--000000000000161d8f059eeaa758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Feb 2020 at 02:56, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div> but=
 I&#39;ll get to it, or you are welcome to try and report.</div><div></div>=
<div></div><div>Mips can be either fixed like suggested, or be a specific e=
xception. <br></div><div><br></div><div>For the rest of the targets, I see =
that you have extended the fbdev fallback to qemuall only on Jan 9 this yea=
r. So it&#39;s very unlikely anyone is using them to run weston (not to men=
tion how painfully slow that would be), and so it would just be wasteful to=
 test or fix them.</div></div></div></blockquote><div dir=3D"auto"><br></di=
v><div dir=3D"auto">We should be only applying tested part debugging these =
breakages is very hard so when we know it will break we should be careful a=
s with this patch <br></div></div></div></blockquote><div><br></div><div>I =
have tested these things now:</div><div><br></div><div>1. Switching mips fr=
om cirrus to std vga works fine, as long as xorg.conf is also deleted (it&#=
39;s written specifically for cirrus and isn&#39;t working or needed with s=
td vga). Both weston and sato boot and look right. I&#39;ll send a patch fo=
r it.</div><div><br></div><div>2. Switching weston to kms backend degrades =
performance to unusable level, as neither kvm nor virtio/virgl are availabl=
e for non-x86 qemu, and kms backend is using software renderer in mesa. So =
fbdev is the only realistic option there. But for x86 qemu kms is still via=
ble. I&#39;m not sure how to best configure it though.<br></div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000161d8f059eeaa758--
