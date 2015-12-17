Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id D5FE6731AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:27:14 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id ph11so14449218igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 07:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UgOOev58psXqqXPSH1qkhLLJUvrSsiollF+MPHpCMTE=;
	b=ZCIZMYIFUb039OO43NxtG3tz/I/J8lOKQ6JdZ5IcVkKYDZDtZbcaxFDcjx19MFFNrQ
	qUu/6IMzmz6hs3Z+2BhrpJTR/Br3I1JL4G3wcY5d8zT3vZOuHxvkYM1q/LJO5q1k4y06
	vdC5HQaO/XRpbaR239wvZRsoGpI5/qgLfz3fC2ZaeWopWKpOgx0siFN/MaSbolc2+kEp
	RxRNGDEKDX4X5p6r59OOsFAKilBwOstp8dFp8ZSeDpcT8MrBnKUlj8PrvZxkuWmYg4Zh
	DZOWXu8hyLYugukWFcJOQKTYUqlqSTuXC8cIrDaKL1Thy1lafIV+hvu/zF/kpPU37+xr
	O2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UgOOev58psXqqXPSH1qkhLLJUvrSsiollF+MPHpCMTE=;
	b=I61ORJAS5Wutmi/Sf7iC/Kzy38Gm2siu94iekeYqJvqS+caviPwwgJlmfKvJGmhu6+
	IaC3yhgi7xR4Agc8kHkD5s77twLChGNx/UjChfOZgIaQowl7oRJWr9yB6DFqgKb/FCaX
	gM6m27NeQDBrRJIL5CUMKcjbtDFy84khlbP+6KPdc24Ru0JFZMUaPYWJ6SIAc6I13tNV
	QihYKBDVU1lTltvuHCSC215nKtm1z2UbejMZM7oyJ9hsC+akIOelzjO++qKw+u+mXpH+
	aWH6wXtu0QZJS3ObIe1mUiL7mXHAwR2IpL9T/9TRm/KuB9o2bD1FseJYrZF1rBLG4sZo
	Ns8Q==
X-Gm-Message-State: ALoCoQmvbsBNfQzK0uvpeQhCytBaKQgUewNj8T3smC9Mo9NID6XCf9Vd/Aj+5494N8qG8EH2uCyWyGAjxIxWdMyPihdKUzND750dOjJiEYy/mZKZxRpbU9Y=
X-Received: by 10.50.7.102 with SMTP id i6mr3939071iga.64.1450366034815; Thu,
	17 Dec 2015 07:27:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 07:26:55 -0800 (PST)
In-Reply-To: <1450283140-6599-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1450283140-6599-1-git-send-email-daniel.alexandrux.istrate@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 15:26:55 +0000
Message-ID: <CAJTo0LbcrYkaZms4syspHbxJWMDNG3a-QHUCP0K1MqCA2DOkdg@mail.gmail.com>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] scripts/oe-selftest: Allow to run tests on random/all architecture
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
X-List-Received-Date: Thu, 17 Dec 2015 15:27:15 -0000
Content-Type: multipart/alternative; boundary=089e0111b1704cd07d052719a80a

--089e0111b1704cd07d052719a80a
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 16:25, Daniel Istrate <
daniel.alexandrux.istrate@intel.com> wrote:

> +                arch_list = ['qemuarm', 'qemuarm64', 'qemumips',
> 'qemuppc', 'qemux86', 'qemux86-64',
> +                             'beaglebone', 'genericx86', 'genericx86-64',
> 'mpc8315e-rdb', 'edgerouter']
>

I believe you can do this through tinfoil to avoid hardcoding the presence
of meta-yocto-bsp, call cooker.findFilesMatchingInDir('conf/machines',
'conf') (see bitbake/lib/bb/cooker.py).

Ross

--089e0111b1704cd07d052719a80a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2015 at 16:25, Daniel Istrate <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.alexandrux.istrate@intel.com" target=3D"_blank">daniel.al=
exandrux.istrate@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div s=
tyle=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arch_list =3D [&#39;qemuarm&#39;, &#39;qemuarm64&#39;, &#39;qemumips=
&#39;, &#39;qemuppc&#39;, &#39;qemux86&#39;, &#39;qemux86-64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;beaglebone&#39;, &#39;genericx86&#39;, =
&#39;genericx86-64&#39;, &#39;mpc8315e-rdb&#39;, &#39;edgerouter&#39;]</div=
></blockquote></div><br>I believe you can do this through tinfoil to avoid =
hardcoding the presence of meta-yocto-bsp, call cooker.findFilesMatchingInD=
ir(&#39;conf/machines&#39;, &#39;conf&#39;) (see bitbake/lib/bb/cooker.py).=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--089e0111b1704cd07d052719a80a--
