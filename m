Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D764077248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 20:38:30 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id q68so28086710qki.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 12:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wWVtUxIphyOpmdRWv0BubirypiT/1uop/UKClClF7E4=;
	b=MX0+kJRnSRPsva0zidCDk0XvTKFBVanpsdhW2FAoQ7szD8Z67j4LoJG5yw44abUYnp
	SiGH7iIxwuRO+o+WKFJG8kKrNBCq3K2bMULg3T3B1T9S1THtI4L8ZVugqdClazNsYTms
	xngWoGykT0x3Ye6r81KfCeu+sBiBerJqrd1P8EwsL7VeMOVFwHr9x5KiyBODMWSBl8Qp
	L+FXMRFOAhC+vfqarS05IN25vFm/Brjgvkm+nzeOnDx4Fo/3f0DyTcG8ftPTqXlk9lf9
	2Yvu09TQerZFvZ8nUQCJIpzMEczDI3cxpDvVpoQdyG/n5di+CjehMCyq0GLcQk7tys6N
	M3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wWVtUxIphyOpmdRWv0BubirypiT/1uop/UKClClF7E4=;
	b=HgCO7oMpOU7sdkQ0KHk2pxPIaMIttTxoKHk42Zq2tPE3B9QxVMXDdmtIaTafawrmGn
	Ph9wlgG+J57NVW0WgQKUzfZjmZOt8WcyQsED17CFiT4qz0kA8eoalGIZlSLjOC0yZmjC
	dPtKzuU37mEFBB2Rc2nuZ907E/dJT0mYKrm4owbNlmqgroI3IYt7UHFXcNxM1j18qVgV
	97H3rqR6AmyNP67cCaBZf8cuVuGddQV+3+SXKjjuZhEhH/7y90Nu0BbIiv4Q8r6jQ3+C
	JW91yT6ydSs7vHOrLpUz37n/62Oh/j0sFo5mTQXEcmR5+iAWy+or9Ak3/wHX8eMUTu4C
	vC8Q==
X-Gm-Message-State: AIkVDXJ5u4QwKTTzWRedMg+/r5EomV/PzszaAzwaCPfSgAUtNniwnHorYokFqpadLKH7/VtMhXLEsS5SiQJP6EVX
X-Received: by 10.55.106.134 with SMTP id f128mr2426358qkc.121.1482179912063; 
	Mon, 19 Dec 2016 12:38:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 12:38:11 -0800 (PST)
In-Reply-To: <1482170830-15830-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1482170830-15830-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 20:38:11 +0000
Message-ID: <CAJTo0Lb4iaTYBjiZHbR_JKPOtdzWdDO-pAseDHowQmL+9C4b3A@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] dpkg: upgrade to 1.18.15
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
X-List-Received-Date: Mon, 19 Dec 2016 20:38:31 -0000
Content-Type: multipart/alternative; boundary=001a114fddf626f615054408e77c

--001a114fddf626f615054408e77c
Content-Type: text/plain; charset=UTF-8

On 19 December 2016 at 18:07, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

> triplets file is no longer available.
> As of now using files data/tupletable and data/ostable
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
>

I did a test build with an empty sysroot and the RDEPENDS changed:

packages/corei7-64-poky-linux/dpkg/dpkg: RDEPENDS: removed "libbz2 (['>=
1.0.6']) zlib (['>= 1.2.8'])"

These are both DEPENDS so have they become optional and we need to decide
if we want to turn them on or not?  Have they been removed from the
codebase so we should remove the DEPENDS?

Ross

--001a114fddf626f615054408e77c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 December 2016 at 18:07, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div id=3D"gmail-:1sn" class=3D"gmail-a3s gmail-aXjCH gmail-m1591843569e847=
b5">triplets file is no longer available.<br>
As of now using files data/tupletable and data/ostable<br>
<br>
Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@li=
nux.intel.com">edwin.plauchu.camacho@linux.<wbr>intel.com</a>&gt;<br></div>=
</blockquote></div><br>I did a test build with an empty sysroot and the RDE=
PENDS changed:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">packages/corei7-64-poky-linux/dpkg/dpkg: RDEPENDS: removed &quot;l=
ibbz2 ([&#39;&gt;=3D 1.0.6&#39;]) zlib ([&#39;&gt;=3D 1.2.8&#39;])&quot;<br=
></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thes=
e are both DEPENDS so have they become optional and we need to decide if we=
 want to turn them on or not?=C2=A0 Have they been removed from the codebas=
e so we should remove the DEPENDS?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114fddf626f615054408e77c--
