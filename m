Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id E21C677375
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:41:02 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id rs20so6367267igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 08:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qZzVR2ZEh9oW8OlQ2eDi4vOYTsCE0xfDOl3yKwDEct0=;
	b=2T+NZJD4yJHLRKf/sXGlMVQOTywEMNjZa+Rlp/FVKj6PCTG/q2vzvrZg5yxIHu/Nlb
	BTJGYHBL9QxunSTVKIh2THMHNP/zpIcjd34V5l51Dreo+tOTrjbhcdG0UEJ9Vh9JBrpQ
	/pt2NdLeczNYz+0uwn8e7sF/3F8I15h8cpew5/qrhTpvFaspEnSsjyjgmF/uqOVXEJim
	z9QKEOgfBGqV9rkl69Kw7du7PfabJ0P/7LJp2VAqMdUn6jB3A1m1kYMtxKyZqzzB9T3U
	kFEtM0nZ+tKuuB0TAJzbzMjYCKgT68wT+fw32094FoB0QE/X8bZrjBUYO2ezkxFmd3D2
	MKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qZzVR2ZEh9oW8OlQ2eDi4vOYTsCE0xfDOl3yKwDEct0=;
	b=mp2OkMSCNiQzDuOu9XysMGR/x0FJqtIh/0AAd6TQkM7jOmW762tgLXfsXgVOqiYCZi
	b8WJvH7dXR/ZP43i181ceR7/fLz5ls9+nXym4ABDwKBpWm/3x4fDYfG+UDrkfjq+Eqjl
	ZhjmvRMQmYj1GaZKWZT5wjSpFXBJ3Bp16CN6I3284qvhCoqfCHxW/VdrQGS4Vr2GOitz
	v9YAs1mAdV0Mua5iGxfxqxiQopDN5Lg8lfWj+s8QtNxMcvXCbnwOG9Q1OnO/w69yvX0u
	AhIfW0LOk0xtc08KZUqCkbpKLKmr0KQ4525wpNKolHpgfCvG5/tl0CjTzia5GYFOfnFN
	hYGw==
X-Gm-Message-State: AG10YOSjVE3ku80j1vsgwG/EATf+QpDf/ZO2dO1DV5xCSms7lAKB+vQrlzeyGgv2/rDMBUVbLvmWsXCqk5lCwc41
X-Received: by 10.50.111.111 with SMTP id ih15mr25347975igb.78.1454517663201; 
	Wed, 03 Feb 2016 08:41:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 08:40:43 -0800 (PST)
In-Reply-To: <852326EB-DC9D-4912-AF5D-6BB837745EBE@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
	<cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
	<CAJTo0LbL72SbPTh22uJbRPq9G8PJRQ8Tf80bKbjYVZGBaY_kVw@mail.gmail.com>
	<852326EB-DC9D-4912-AF5D-6BB837745EBE@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 16:40:43 +0000
Message-ID: <CAJTo0Lan0p9UUfXibbAt_vJ426YqrEQH98h-dA8Y5bwGriTLxQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gcc: musl related fixes for unwinding, ppc/secure-plt and gthr
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
X-List-Received-Date: Wed, 03 Feb 2016 16:41:05 -0000
Content-Type: multipart/alternative; boundary=089e0149be34a29ceb052ae0488b

--089e0149be34a29ceb052ae0488b
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 16:38, Khem Raj <raj.khem@gmail.com> wrote:

> is it with security flags enabled or disabled and which arch.
> my builds all went ok. I will do a clean build without sstate to see
> if I can reproduce your issue. May be its because I have gold linker
> enabled
> I will check that independently here.
>

Security flags enabled, x86-64.  No gold.

Ross

--089e0149be34a29ceb052ae0488b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 16:38, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div>is it with security flags ena=
bled or disabled and which arch.</div><div>my builds all went ok. I will do=
 a clean build without sstate to see</div><div>if I can reproduce your issu=
e. May be its because I have gold linker enabled</div><div>I will check tha=
t independently here.</div></blockquote></div><br>Security flags enabled, x=
86-64.=C2=A0 No gold.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--089e0149be34a29ceb052ae0488b--
