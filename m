Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 507DE7E97A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 17:24:40 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r3so4827750vsr.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4lH5Mfb1ch7S/dyD7lVkbilo2q5TI4nMqQ29UQmSVu8=;
	b=un2RRpe7gQqYEgQ+k6uIaNkffAkdGjxLpDIoDtrbo1kTpApiGSCawcTmkpcdqv0l5f
	JxDz0OFBs3RVYQ7qeVcmaocllrEmJNawvw1o5otcOqxsT0oBmGJWQ6X8Cc4Fx6RGbXbH
	CBeaUHNQJOWMzUI1bBe0lO+dh+8Y2Ii1hGrHkwdD2OwSktcP80lhS2rKb7CHGI/HU4Cw
	F1maES0ItAZyVwD97RT9sucEyRMC3tglMESOocwDt41gd/u2YaCDAX3xS6ZE5gchl0/L
	RZaVpWvRt75MeKHauAQyxlE5yVFE17DSQnmISYrrlO95w9YkJslUv60+mQXkcvDULccB
	4AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4lH5Mfb1ch7S/dyD7lVkbilo2q5TI4nMqQ29UQmSVu8=;
	b=RfXADKgnrtyGZCnGAXlIcdToUTLnSOZO4v6U8YXvaKFSG2re0KGuSECl77i/9ya6SD
	0ao7jY6gnkQyx87rerIBzRO7/4Ei9TSXorKuQGQIZivivxnQXCQZ0rpvUtwTuiA8PAmS
	oIcGAg0xWqgqLaDheeK+5uRVb/DKrbQyLWfi47QZwgTawVD4zxxDYcFLVkB0K9KeqJS0
	d1F8Sdhc1tVK3I/qlri/9/tMEMucBDL5L2AbJ42+gCSsyJVvv1VSTB+hHCOHc/OqM6io
	FLBDY18ua4xzuWoWsLhNOXuZHSQn444rla6P9xXqt38Jk09i6RR6HSkHXMyHcBgn5ttu
	0APA==
X-Gm-Message-State: APjAAAUEEG94J1ixfyRWQcGCsuzKSgh/KxqdwqiH3+k+9XOKzJyAdpGr
	FQ2oyfs2yMl+qOBCZC03dBOq52Ru1yxsemby+gA=
X-Google-Smtp-Source: APXvYqwpoLn72+nCuDgoMf1Lf20ItISFBap3RdubNj4iMp3VWe6Qzd5qLUsnznH/E46F3PlQ9BhxtWfiRQk2CkgzFz0=
X-Received: by 2002:a67:8042:: with SMTP id b63mr439165vsd.23.1565803481277;
	Wed, 14 Aug 2019 10:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
	<20190814152613.46996-2-alex.kanavin@gmail.com>
	<23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
In-Reply-To: <23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 19:24:30 +0200
Message-ID: <CANNYZj9ahFZVhncL4H_RjXcnt68qpOEwLvbS8rsi03NDKcN8=Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemuboot.bbclass: increase the default RAM to 512M
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
X-List-Received-Date: Wed, 14 Aug 2019 17:24:40 -0000
Content-Type: multipart/alternative; boundary="0000000000004a28480590170820"

--0000000000004a28480590170820
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2019 at 18:42, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm not sure I agree with this.
>
> We are meant to work on embedded systems and 256MB should be enough to
> let us bring up X under qemu.
>
> I'm fine with some sdk/ptest images having more memory, that makes
> sense but 256MB not allowing X under qemu seems rather poor.
>
> Are we really saying the minimal image size we can emulate is 256MB
> ram?
>

Note that riscv/arm/arm64 qemu configs *already* override this setting to
512M, as seen in the patch (and so does
meta-yocto-bsp/conf/machine/beaglebone-yocto.conf), so this simply brings
x86/mips/ppc as well to that level.

In our local development we have bumped it even to 2048M, because with 256M
there are cryptic boot failures (that have nothing to do with X), and the
final SoC target will have far more memory anyway. Embedded does not
necessarily mean "not a lot of RAM".

If there is a need to test tight-memory scenarios, that can be adjusted
per-image (or per-distro like poky-tiny), but I would argue that the
default should be such that no one has to stare at mysterious error
messages that are ultimately due to lack of RAM. It is not easy to diagnose
such situations, e.g. the error message here was "unable to execute
xkbcomp", so I had to rebuild the image with strace, and then run X under
it to see that the problem was clone() returning with ENOMEM.  We'll be
surely seeing more of the same as software bloat marches on.

Alex

--0000000000004a28480590170820
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug 2019 at 18:42, Richard Pur=
die &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bl=
ank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;m =
not sure I agree with this.<br>
<br>
We are meant to work on embedded systems and 256MB should be enough to<br>
let us bring up X under qemu.<br>
<br>
I&#39;m fine with some sdk/ptest images having more memory, that makes<br>
sense but 256MB not allowing X under qemu seems rather poor.<br>
<br>
Are we really saying the minimal image size we can emulate is 256MB<br>
ram?<br></blockquote><div><br></div>Note that riscv/arm/arm64 qemu configs =
*already* override this setting to 512M, as seen in the patch (and so does =
meta-yocto-bsp/conf/machine/beaglebone-yocto.conf), so this simply brings x=
86/mips/ppc as well to that level.<br></div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">In our local development we have bumped it=
 even to 2048M, because with 256M there are cryptic boot failures (that hav=
e nothing to do with X), and the final SoC target will have far more memory=
 anyway. Embedded does not necessarily mean &quot;not a lot of RAM&quot;.<b=
r></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">If =
there is a need to test tight-memory scenarios, that can be adjusted per-im=
age (or per-distro like poky-tiny), but I would argue that the default shou=
ld be such that no one has to stare at mysterious error messages that are u=
ltimately due to lack of RAM. It is not easy to diagnose such situations, e=
.g. the error message here was &quot;unable to execute xkbcomp&quot;, so I =
had to rebuild the image with strace, and then run X under it to see that t=
he problem was clone() returning with ENOMEM.=C2=A0 We&#39;ll be surely see=
ing more of the same as software bloat marches on.<br></div><div class=3D"g=
mail_quote"><br></div><div><div class=3D"gmail_quote"><div>Alex<br></div><d=
iv><br></div><div> <br></div></div></div></div>

--0000000000004a28480590170820--
