Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 372656102B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:06:22 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p14so900049vsq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iDWRNu/QeLvVXLAUvQFD7VWm5atvXnuEH0SerToaM5Y=;
	b=ma7neRe5PjiVqldOPqbS3rraIAVndc3qOg7CGT6VCKwBrD4qn7zWVJEweK065fAx5/
	RwEcNbvw/c3QYe7QFE2t+PKrLpvSQ700g4aCzfh/MuX1f3dqNvxGm7qhXl5XHpmwbWx9
	DGFRbqExbUGJCL1Fkunav3b7fSylv4Rhn6pweUtjCtjvb8ODPEX1+TchEW8UQoU7dH4L
	Ymna2qvAP2YkeTYsdwSV8g2erYOarZNl1Ztp+F2070upb6zw+YGqZ04RkZ+SqqmHQc3C
	okqq3zVWso27HUAX4WH00arvG+K8fljlPpXiqhbHwWCF64ZAm98/n3bcpQ2NW7Afgtox
	TtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iDWRNu/QeLvVXLAUvQFD7VWm5atvXnuEH0SerToaM5Y=;
	b=HByZN7OrPfqcIsu7/tm0DlrMYtuar3ZFm7GGs/OHQY9yRFSzGtrUtlUivWpehmcLXP
	GsZRyISfY630wHraq4cFbqwiK4j/sHxDApMLWK9phtwCdyWUStXB0SOG+kTeGyLTNO9b
	/ErfXf+sLrifJAyQeOsCwtjFme51MuS5qSrP6Uclj0OvFA4b5z8E6OHCmzMNQeudbLDD
	W8Pjzv7esS3/Iumis+5W9qducS05DxOIsc5QefCNuEzfecjCko60rDdpl3mJ/+qcK6kM
	WO3pDOVvDIM5tdzPRQMAeYaXgF8uToKzHfyxVvwEitV56R5KlgrdmJi8MPvVewck4lF2
	mBVQ==
X-Gm-Message-State: APjAAAWnRpi7zb+CWuI0A/r/BPCuaIhaRnIzLIXDbxZcinUqhSqlEEjJ
	V9uVdUWmH0Z+d6SbuAWJltLVs+tIuAm/m5WX4e4=
X-Google-Smtp-Source: APXvYqw7lyUKteRq69Iyff5TfCF8NsoTbzyAK1OtrSS02iWvKcjWBssT1nNOfGqrhqnEjXLgfgGO1VKyOPk0eXTqPws=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr14835202vsq.94.1582135582873; 
	Wed, 19 Feb 2020 10:06:22 -0800 (PST)
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
	<CANNYZj93fYQY6rDVz5t2aaOfn=Vwz88OzZwZVcdwf3pfgWx1NQ@mail.gmail.com>
	<CAMKF1sp1EzMcb0Tndn-rJ02MOccd4J5AJFJ58Lv+0BsceP4gXg@mail.gmail.com>
In-Reply-To: <CAMKF1sp1EzMcb0Tndn-rJ02MOccd4J5AJFJ58Lv+0BsceP4gXg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 19:06:12 +0100
Message-ID: <CANNYZj-gvCsW2XzuddVaZTegS81VnHZXXTm2L0jHyG9vcXK-RA@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 18:06:22 -0000
Content-Type: multipart/alternative; boundary="000000000000675e10059ef1a59d"

--000000000000675e10059ef1a59d
Content-Type: text/plain; charset="UTF-8"

Will that take precedence over qemuall though? Sounds brittle. Another
option is to make the fbdev configuration specific to mips and arm, as
using kms does not need a configuration at all.

Alex

On Wed 19. Feb 2020 at 18.21, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 19, 2020 at 1:45 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Tue, 18 Feb 2020 at 02:56, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>> but I'll get to it, or you are welcome to try and report.
> >>> Mips can be either fixed like suggested, or be a specific exception.
> >>>
> >>> For the rest of the targets, I see that you have extended the fbdev
> fallback to qemuall only on Jan 9 this year. So it's very unlikely anyone
> is using them to run weston (not to mention how painfully slow that would
> be), and so it would just be wasteful to test or fix them.
> >>
> >>
> >> We should be only applying tested part debugging these breakages is
> very hard so when we know it will break we should be careful as with this
> patch
> >
> >
> > I have tested these things now:
> >
> > 1. Switching mips from cirrus to std vga works fine, as long as
> xorg.conf is also deleted (it's written specifically for cirrus and isn't
> working or needed with std vga). Both weston and sato boot and look right.
> I'll send a patch for it.
> >
> > 2. Switching weston to kms backend degrades performance to unusable
> level, as neither kvm nor virtio/virgl are available for non-x86 qemu, and
> kms backend is using software renderer in mesa. So fbdev is the only
> realistic option there. But for x86 qemu kms is still viable. I'm not sure
> how to best configure it though.
>
> copy qemuall/weston.ini new folders qemux86 and qemux86-64 and point
> to backend it should be using.
>
> >
> > Alex
>

--000000000000675e10059ef1a59d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Will that take precedence over qemuall though? Sound=
s brittle. Another option is to make the fbdev configuration specific to mi=
ps and arm, as using kms does not need a configuration at all.</div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 19. Feb 2020 =
at 18.21, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Feb 19,=
 2020 at 1:45 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 18 Feb 2020 at 02:56, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; but I&#39;ll get to it, or you are welcome to try and report.<=
br>
&gt;&gt;&gt; Mips can be either fixed like suggested, or be a specific exce=
ption.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For the rest of the targets, I see that you have extended the =
fbdev fallback to qemuall only on Jan 9 this year. So it&#39;s very unlikel=
y anyone is using them to run weston (not to mention how painfully slow tha=
t would be), and so it would just be wasteful to test or fix them.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; We should be only applying tested part debugging these breakages i=
s very hard so when we know it will break we should be careful as with this=
 patch<br>
&gt;<br>
&gt;<br>
&gt; I have tested these things now:<br>
&gt;<br>
&gt; 1. Switching mips from cirrus to std vga works fine, as long as xorg.c=
onf is also deleted (it&#39;s written specifically for cirrus and isn&#39;t=
 working or needed with std vga). Both weston and sato boot and look right.=
 I&#39;ll send a patch for it.<br>
&gt;<br>
&gt; 2. Switching weston to kms backend degrades performance to unusable le=
vel, as neither kvm nor virtio/virgl are available for non-x86 qemu, and km=
s backend is using software renderer in mesa. So fbdev is the only realisti=
c option there. But for x86 qemu kms is still viable. I&#39;m not sure how =
to best configure it though.<br>
<br>
copy qemuall/weston.ini new folders qemux86 and qemux86-64 and point<br>
to backend it should be using.<br>
<br>
&gt;<br>
&gt; Alex<br>
</blockquote></div></div>

--000000000000675e10059ef1a59d--
