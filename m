Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABCB7E635
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 10:07:33 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id r21so15797765otq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TbXHJC+JzRnHpgIYqaX8BT57637mV5lF1G7uCr4plBc=;
	b=hF4/TRRiIjm38xIf9Dij2fFYObcD6QOCzSmuZ0ESMmItzlSq4bF/xuNUcj60iPkfJP
	aO7oVCIXtfgJn5OA/9K2NSqplR30QrAM0L3lgcPcSO0D95pB1EE2YGQzQR64W+nje/Za
	t3bjvpxjniQLvUdFxazMu3lQF4b4bmWaswbAUG8Elmb5jiLhs2t2CX9ye6SvGnEgCG5E
	/kruLWbVB/6RuGPk/XdWanp2slVKJw+z8VI9i/MbKayMm+zYJo4mWbLpAkO20Vf2cfKX
	t4YKtTBXcv52oarldS8tCy+aC0bKh2MWx2Ez7WvOnyunkH4q/gsqE8zujoyT/yx0YbwT
	63fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TbXHJC+JzRnHpgIYqaX8BT57637mV5lF1G7uCr4plBc=;
	b=RajV+Rl0Q7TGldIVk3eOQw3RxcVu5qC6LGD7Tl7MK81eU9eOEEV74FHsOLBTsY0a6v
	k7UHR8U2uLb8EfVTETrG6gIcRf+udawOC2SLvEyoC7VxwTn2axxYQun3KvZTt+yES8YL
	EkhxiCuDa8+Oo2HqEJ1HZgHqndrIYP2fuUAOAVKJQVxa5DxubM73JS8pRW2Y9gkn2Vmr
	zmNCF9dbjgWd4y5knS7xhIozja7B9X5DcBuAwmmIIGTFWIa2hLxf1Ma4yNLSiqFBCCvo
	HwV2/MV90bCyBeQUO4Tx11ecwcRkaBFXSMg6Tgqq8t87UiapqrtwM8CRkukwMEwGl6nI
	I+lg==
X-Gm-Message-State: APjAAAV/6O67MwWnwz309AvCH02VFUT9K2Bey0spKtQP6OEMa18MoNAl
	mX3O8nzFdOZTRruFzYdyonXkakOsrX6KJFHHk8M=
X-Google-Smtp-Source: APXvYqyJDG0qUQxpIpgsDGjfX2ZEoNEOv9CN9+4ynTffG/dnRh4Tz8aYPFxFAAQ+EjkK73ts5sqkuPBDVsroHKK/YTg=
X-Received: by 2002:a9d:d87:: with SMTP id 7mr65564074ots.263.1560938855120;
	Wed, 19 Jun 2019 03:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9rVD4cZ-AN7rvF=0fuc4d99brU_Tt_wQeRMGm=L83M2w@mail.gmail.com>
	<201906171422.x5HEMKtf012735@dan.rpsys.net>
	<CANNYZj_vg_jzcMRhfQ35C_2kDnyH-yxVj52pKk2WpfZxfo5iOw@mail.gmail.com>
	<591c1c8752c4c0526d18d5cd6596a35bc41c6645.camel@rpsys.net>
	<CANNYZj-6ZbpdR9WHkhrjFL77U290ZM=B_c0W12b1aVT8oKjG3g@mail.gmail.com>
	<CAMKF1srWM7ZzHMXGLbxH57pC1Ki-x6w0HyRTxYZWk3+T52_C4g@mail.gmail.com>
In-Reply-To: <CAMKF1srWM7ZzHMXGLbxH57pC1Ki-x6w0HyRTxYZWk3+T52_C4g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jun 2019 12:07:23 +0200
Message-ID: <CANNYZj8aM88dvrPK2wMjGe3Jgm31uNQjae-432U=UgZxaVq_ZQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	Richard Purdie <rpurdie@rpsys.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] lttng-ust: upgrading to 2.10.4 FAILED
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
X-List-Received-Date: Wed, 19 Jun 2019 10:07:34 -0000
Content-Type: multipart/alternative; boundary="000000000000f9c301058baa6548"

--000000000000f9c301058baa6548
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jun 2019 at 17:49, Khem Raj <raj.khem@gmail.com> wrote:

>
> >> a) we should have a bug for this as devtool shouldn't be giving
> >> tracebacks?
> >
> >
> > Bug filed:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=13404
> >
> >>
> >> b) we could add some kind of "reset" command that AUH could run between
> >> builds which would clean things up?
> >
> >
> > There is such a command  - 'devtool reset' and AUH does run it, however
> in this case it does not work because the recipe in devtool workspace is
> half-complete. (I think devtool reset looks up the recipe to be reset in
> workspace/appends, which is empty because of the traceback).
> >
>
> may be there should be devetool reset --force to override everything
> and bring workspace to original state.
>

I added a comment to the bug mentioning that.

Alex

--000000000000f9c301058baa6548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Jun 2019 at 17:49, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
&gt;&gt; a) we should have a bug for this as devtool shouldn&#39;t be givin=
g<br>
&gt;&gt; tracebacks?<br>
&gt;<br>
&gt;<br>
&gt; Bug filed:<br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13404" =
rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show=
_bug.cgi?id=3D13404</a><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; b) we could add some kind of &quot;reset&quot; command that AUH co=
uld run between<br>
&gt;&gt; builds which would clean things up?<br>
&gt;<br>
&gt;<br>
&gt; There is such a command=C2=A0 - &#39;devtool reset&#39; and AUH does r=
un it, however in this case it does not work because the recipe in devtool =
workspace is half-complete. (I think devtool reset looks up the recipe to b=
e reset in workspace/appends, which is empty because of the traceback).<br>
&gt;<br>
<br>
may be there should be devetool reset --force to override everything<br>
and bring workspace to original state.<br></blockquote><div><br></div><div>=
I added a comment to the bug mentioning that.</div><div><br></div><div>Alex=
<br></div></div></div>

--000000000000f9c301058baa6548--
