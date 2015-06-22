Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id F08D875A6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 11:07:45 +0000 (UTC)
Received: by qcji3 with SMTP id i3so5831287qcj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LSWC8B9zaF7Mwg3c1m5e2KzxvxeeF32JFnsUwhuJ2wI=;
	b=IsXueeo6mfFxmT8BW65iIoRZwo2J8zzBBmjPN6Thi0vkw8ksroU1+R/hAec2k7kqUS
	n2S0VS4ER9bNJ6NaeIJmmKtfr/R5zL5PsrIOLLSbdTPfJ1hW0pwIjPqRBJcakve4sE4K
	nrLeM24+GKY4cNsgz5Kmy0JP+fuwojCyjPdQstqXo/vVXviDMze5Zp52WQn+l+BXgL0V
	GilCmgZ/eCFpjQjDfbwfDdTvXijlToDyAeECwCO7uWzxlcGRqegLIditfANd7V0Yl+zJ
	ME1S7H/jPXhLM3kqGXYx+rsy1mkHje7Aj1z+vVPXQ7tuK8DWCyBc8IkMaSEpu7VT1ofQ
	YC0Q==
X-Gm-Message-State: ALoCoQlOLW32iS6w1cCZ5mGFIQN9LCHPf1gKuTBFFvGk17dkOR2qUpKhrkblgIclcEO4wERpbOf7
X-Received: by 10.140.235.19 with SMTP id g19mr38584152qhc.52.1434971266652;
	Mon, 22 Jun 2015 04:07:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 22 Jun 2015 04:07:27 -0700 (PDT)
In-Reply-To: <20150619165245.GB2398@jama>
References: <20150619165245.GB2398@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Jun 2015 12:07:27 +0100
Message-ID: <CAJTo0LZBZJdUbqPWNDsJ6SmgPHmpio0JwVE=xfsen-2OoB0RnQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-06-19
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
X-List-Received-Date: Mon, 22 Jun 2015 11:07:49 -0000
Content-Type: multipart/alternative; boundary=001a11376dac9cb15505191948cf

--001a11376dac9cb15505191948cf
Content-Type: text/plain; charset=UTF-8

Hi,

On 19 June 2015 at 17:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on
> libgstapp-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on
> libgstvideo-0.10, but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it
> isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10,
> but it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but
> it isn't a build dependency? [build-deps]
> qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn't a
> build dependency? [build-deps]
> qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn't a
> build dependency? [build-deps]
>

I've just filed a bug for this chunk, looks like we missed something when
disabling GStreamer 0.10 in Qt.

Nice to see nothing in oe-core break in this build. :)

Ross

--001a11376dac9cb15505191948cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On 19 June 2015 at 17:52, Martin Jansa =
<span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div id=3D":zk" class=3D"a3s" style=3D"overflow:hidden">qt-mobil=
ity-embedded-1.2.0: qt-mobility-embedded rdepends on libgstapp-0.10, but it=
 isn&#39;t a build dependency? [build-deps]<br>
qt-mobility-embedded-1.2.0: qt-mobility-embedded rdepends on libgstvideo-0.=
10, but it isn&#39;t a build dependency? [build-deps]<br>
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstapp-0.10, but it i=
sn&#39;t a build dependency? [build-deps]<br>
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstinterfaces-0.10, b=
ut it isn&#39;t a build dependency? [build-deps]<br>
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libgstvideo-0.10, but it=
 isn&#39;t a build dependency? [build-deps]<br>
qt-mobility-x11-1.2.0: qt-mobility-x11 rdepends on libxv, but it isn&#39;t =
a build dependency? [build-deps]<br>
qt5-creator-3.3.1: qt5-creator rdepends on qt-creator, but it isn&#39;t a b=
uild dependency? [build-deps]</div></blockquote></div><br>I&#39;ve just fil=
ed a bug for this chunk, looks like we missed something when disabling GStr=
eamer 0.10 in Qt.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Nice to see nothing in oe-core break in this build. :)</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11376dac9cb15505191948cf--
