Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id AB7C47251B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:18:01 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id 10so35763491lbg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 13:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gIMqMiafVa6tRufPd1ZvEgMs1uunFXDKD8w7atcCRRA=;
	b=IO9RDHVLwQ3+uHluaNuPrjdfplNhwQnBMuJ8E1EmbtFYBa21LaMw9rr/KiJp48mxHk
	i7MD6JNZhY5ENtbteB/gqcDmCfCv/ZBo4BNguBFadonICNW18zE+V7IaERmGS0cyTfyV
	445hYheBPcyqzyB4BJilXhiKcZF80LBXuTdIZTOvixEflfHRngDKc6nTjBuC8ZOeSPog
	LqEDnKKPyLIRY8V0FrZ9NFT0RCrNyGC4htTf0nwu+lAi04OhPjNKaOHALZkRf90SFMK3
	eS9Cjcms3Op7SPa/nOC/5ZVx/cUq6+4MOpeLd8QGHG7F0d4rgKZGF46kLaSg9+zWeILa
	M3Bw==
X-Gm-Message-State: ALoCoQlm4BX2mfJ6Rwtu4V5DPTMMi6WRFRIDGknhYxnSi9mIQEFnbhSqKk36FUdEjfsB1cu0GKWF
X-Received: by 10.112.185.101 with SMTP id fb5mr40894304lbc.12.1421788680485; 
	Tue, 20 Jan 2015 13:18:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.223.164 with HTTP; Tue, 20 Jan 2015 13:17:40 -0800 (PST)
In-Reply-To: <1418221117-12710-3-git-send-email-Martin.Jansa@gmail.com>
References: <20141111171344.GA2453@jama>
	<1418221117-12710-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221117-12710-3-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Jan 2015 21:17:40 +0000
Message-ID: <CAJTo0LZyFhMvO1YHeQTQsRRbVGmQ7xtmkzBH3rk4LvtGvvBMQw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Tue, 20 Jan 2015 21:18:06 -0000
Content-Type: multipart/alternative; boundary=001a11c3c5163f0f7d050d1bf996

--001a11c3c5163f0f7d050d1bf996
Content-Type: text/plain; charset=UTF-8

On 10 December 2014 at 14:18, Martin Jansa <martin.jansa@gmail.com> wrote:

>  meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.15.bb  | 4 ++++
>  meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb | 4 ++++
>  meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb       | 4 ++++
>  meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb     | 4 ++++
>  meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb     | 4 ++++
>  meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb  | 4 ++++
>

There's a xorg-driver-common.inc you can patch instead.

Ross

--001a11c3c5163f0f7d050d1bf996
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2014 at 14:18, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":501" clas=
s=3D"a3s" style=3D"overflow:hidden">=C2=A0meta/recipes-graphics/xorg-<span =
class=3D"il">driver</span>/<a href=3D"http://xf86-video-intel_2.21.15.bb" t=
arget=3D"_blank">xf86-video-intel_2.21.15.bb</a>=C2=A0 | 4 ++++<br>
=C2=A0meta/recipes-graphics/xorg-<span class=3D"il">driver</span>/<a href=
=3D"http://xf86-video-intel_2.99.912.bb" target=3D"_blank">xf86-video-intel=
_2.99.912.bb</a> | 4 ++++<br>
=C2=A0meta/recipes-graphics/xorg-<span class=3D"il">driver</span>/<a href=
=3D"http://xf86-video-omap_git.bb" target=3D"_blank">xf86-video-omap_git.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0meta/recipes-graphics/xorg-<span class=3D"il">driver</span>/<a href=
=3D"http://xf86-video-omapfb_git.bb" target=3D"_blank">xf86-video-omapfb_gi=
t.bb</a>=C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0meta/recipes-graphics/xorg-<span class=3D"il">driver</span>/<a href=
=3D"http://xf86-video-vesa_2.3.3.bb" target=3D"_blank">xf86-video-vesa_2.3.=
3.bb</a>=C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
=C2=A0meta/recipes-graphics/xorg-<span class=3D"il">driver</span>/<a href=
=3D"http://xf86-video-vmware_13.0.2.bb" target=3D"_blank">xf86-video-vmware=
_13.0.2.bb</a>=C2=A0 | 4 ++++</div></blockquote></div><br>There&#39;s a xor=
g-driver-common.inc you can patch instead.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c3c5163f0f7d050d1bf996--
