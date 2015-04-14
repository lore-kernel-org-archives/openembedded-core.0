Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 37DCD6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 14:07:09 +0000 (UTC)
Received: by qku63 with SMTP id 63so20674794qku.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 07:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vaeyDz3IU3/N/JTeTwOWmAirzjlGfaQ9BYhOZvijPUM=;
	b=LPTe76Cjw44y9dtPSLGFmKvJMVbIoNIfEY2Gj2uQJLPYuwmjjcTiiQymeZg15OzUx9
	B4WraunVztkGITtmz4B0+X/HxKJurKkv8foEfxq2X17subgg/WiLh6rst/l0D9756vFY
	y0A6pVUCXaKmHkUyPKd0cFEEIB54YRhFy6SM6pvqgWrO4Wf2CuCmEwN9aIeZpmLugzR1
	lLt452061GowNfDQ1DPbysQX8qcBPR/xh5QoUQAvB94u1rx920p2Ox0yDY/hCtOc3fmk
	3/Y+DaWUnEvmnpjlwTBiIqFEiUwMnn7nHfond0skJoHCw1+dsVlGjgxp6jv33EGiycBZ
	E+dw==
X-Gm-Message-State: ALoCoQm862vq6iYUNIwCKGzgoLWx0f2kcXu61299YtjEPSlsUpDj0uCHHvqdDIQDACZ5i2tP4VXB
X-Received: by 10.55.23.16 with SMTP id i16mr41346581qkh.14.1429020410723;
	Tue, 14 Apr 2015 07:06:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Apr 2015 07:06:30 -0700 (PDT)
In-Reply-To: <CALbNGRTj61Gh-D=+JcAvTc55RJnMboCBU2kLAi_KE=qmCCwNgg@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<CALbNGRTj61Gh-D=+JcAvTc55RJnMboCBU2kLAi_KE=qmCCwNgg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Apr 2015 15:06:30 +0100
Message-ID: <CAJTo0Lan=W35rvFOKO50=suGPNrpJr6uQuQpy8XdW1XhFCoU4Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Tue, 14 Apr 2015 14:07:10 -0000
Content-Type: multipart/alternative; boundary=001a1146f4baf565a90513afbdd9

--001a1146f4baf565a90513afbdd9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 April 2015 at 15:03, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:

> 2. In meta-qt5-extra I have libepoxy in for a while - kwin needs it
> [1]. Problem with Xorg-Macros: These are build for x11 in distro
> features only but there are BSPs around (e.g meta-fsl-arm) supporting
> either x11 or wayland - not both together. So for a wayland only
> distro epoxy would not build.
>

util-macros doesn't require X11 to build.

Ross

--001a1146f4baf565a90513afbdd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 April 2015 at 15:03, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@g=
ooglemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":40v" class=3D"a3s" style=3D"overflow:hidden">2. In meta-qt5-extra I =
have libepoxy in for a while - kwin needs it<br>
[1]. Problem with Xorg-Macros: These are build for x11 in distro<br>
features only but there are BSPs around (e.g meta-fsl-arm) supporting<br>
either x11 or wayland - not both together. So for a wayland only<br>
distro epoxy would not build.</div></blockquote></div><br>util-macros doesn=
&#39;t require X11 to build.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a1146f4baf565a90513afbdd9--
