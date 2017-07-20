Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 75F077822C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:19:00 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id c74so15179786iod.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n/5CCQZN78J8jInkWgvWmxvtej1vp2MHvNBSmbmvzCA=;
	b=CtXfSFfLazdv6ZJJ0MK8vugdheTNqebIP3+63RYbz78V7T+L+jJlwGh6n61PtC6onU
	rap9aDsiRd17kxC2T3oIaFIv9wTnEv+7pxJyFX9bHF4zkeApf67ZKWlGnrKxmKenr5Sg
	M42BplHFaphGaSFr0QSdBXKoBHcHj0PaO3wVLCGemOKd9R/buNXjtF2lYLW+2e21ur2j
	L6CrjosR9z+W5eWoI7ojrR17drvlzhzQjdCu5cWuyGnc4NWRh3WEfjb/37cDp246ySGO
	JRINvxoWfC1FI5SOhmku/G4ojbkaV8tC3jiM8ueocVCl0KIYAQK9zb3pE0gcW2BxzcwV
	Iu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n/5CCQZN78J8jInkWgvWmxvtej1vp2MHvNBSmbmvzCA=;
	b=LUqPd4KgzJegkiX8CvCDI3Y+Ow+6f6i8LjlIoqtV9G92lO2seNHDLuYtHDYFGTU+Ea
	DtDPWjq/S7WwrF87zcl0KgJ9PR29ltwf0Ny/slpAqCa4DZyRGUa3Fn9jP6pjzL+TFhxA
	9KHcsV7ZtuEOePYt/8rWcQynUm7UBua2ktJMO+TebxxdoDockpVaG5gEGa8bYPaCMgMN
	wDwzmc491aKFkIGi92Bzi3D7zsLaU6FLc+kj+qrM/8NRyW6F06XItYWfrvFA8LyxWSYR
	SW+sh96Rl2BXA2fcyX1ojKd8F1k4CHOOnhc+39Lp1q+K5O8t96+wGNdtozxIO9pTB97R
	AFlg==
X-Gm-Message-State: AIVw113SRNQgTkNkzz/NoR/VMgMD/tGNb0SqfYvZ4+ICG9GRQA5oIRND
	W1aqRVIxw5pytFQ1qncRV9ie97gMwT5D
X-Received: by 10.107.170.212 with SMTP id g81mr4980638ioj.19.1500578342098;
	Thu, 20 Jul 2017 12:19:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 12:18:41 -0700 (PDT)
In-Reply-To: <CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=XYR9Z=aMO-BAAZYJ2Lh=ZXQy+J5J-LjSuT-n_Hx-1ayA@mail.gmail.com>
	<CAMKF1soYE49jfc-pkYMLgdh5DJVuA0wyLFiA90Z_3OB7i6tUOw@mail.gmail.com>
	<CAKV_0egoE8wJPJGd3qZyePgOS6q0gVzDG-pvPvTpZ5UWQYasYA@mail.gmail.com>
	<CAMKF1srdmXi-uxH9eX2wK2VYXpmCpkTLTvfZxY+5_OZo65Q-Sg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 20:18:41 +0100
Message-ID: <CAJTo0LZ-goETzCb25RXab_ewnSENbcFucUDoEPmo48epdAfAdw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Thu, 20 Jul 2017 19:19:01 -0000
Content-Type: multipart/alternative; boundary="001a11425b7009f2ba0554c49f5e"

--001a11425b7009f2ba0554c49f5e
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 19:51, Khem Raj <raj.khem@gmail.com> wrote:

> it does cause harm, by making the behaviour inconsistent and highly
> dependent
> upon build host.
>

It *stops* behaviour being dependent on the build host, surely.  The
problem is that some recipes use the host compiler when they're not meant
to be and this can cause subtle (or not so subtle) breakage.

Ross

--001a11425b7009f2ba0554c49f5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 19:51, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":4ct" class=3D"a3s aXjCH m=
15d615818cca40f7">it does cause harm, by making the behaviour inconsistent =
and highly dependent<br>
upon build host.<br></div></blockquote><div><br></div><div>It *stops* behav=
iour being dependent on the build host, surely.=C2=A0 The problem is that s=
ome recipes use the host compiler when they&#39;re not meant to be and this=
 can cause subtle (or not so subtle) breakage.</div><div><br></div><div>Ros=
s</div></div><br></div></div>

--001a11425b7009f2ba0554c49f5e--
