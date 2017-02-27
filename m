Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 118007197B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:41:11 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n186so16506376qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g9I4x3ul8Dixx/0wJo9wBhVp3qFVNpRk3v88PKa8vYA=;
	b=AdMYOh28UtMe7gNkH6OlM/EVC9VIpJwrjB/DDtWDBe3xRgDy83Z/cNEjtLbSugJjz2
	jr+Gfr9ZlILuvMmv4oBj5S46r7ScciUmk9RSz6J/n6/LkD7wnCJL38B47vS18g07brPP
	mLffbMGwZZWLA2qdOIu7tBatLhec+UNUS1BZAMcxi8CYZIM85GJLCEfjqSXXgkVB29GI
	WlF7SKW8CuSvFcDPQAoGdGKM01MxGoxhZXjtuOxdCnLYE6pmQzbeA54bZk3wvHgoyAqa
	XSU5TczOEuINhqB3SG8ih7EplSG2w6vnBxeRvus2ZFrvOnRPxaT3aSK+a6mcPsCl8IHG
	MSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g9I4x3ul8Dixx/0wJo9wBhVp3qFVNpRk3v88PKa8vYA=;
	b=gJ4tdakwovPYY1fG6kOGY2Eb2BT6HorbHyUaNU0LuSeT727RieOCYBBTPo83x1TA7A
	ZtfvBcJlvz80lcrYtk/GsiHeMWUOpWfLly0aLP+kb6Sa59Tu61OAfceVsa9YpqfZwDXQ
	aqw3GzH/y15M+iMhJHwCwUgPQHdkbJ76+GstQbcnlqM/KJi+klW0Ojg6WGIrtvQhd2Kb
	WlVAYmd4ZxGEcRNfwe0Z1WRAqiMejnEObF30Uwyu2LOzkG/T5fNLD2Es4L7BdkWKjW0q
	iL/JV4hCqeNQ2l+dnxOzZshpwWIrtXxDyzY7iOzU5XaHbXsTSrxzWk/YRCvwGckcYQ89
	VvgA==
X-Gm-Message-State: AMke39lbqDfzfyLzWbTZMaeZ04rGxU3x/VmqKFono5rqx3Oyy0AwN08zYp6Ajdp22kFV5SGBJdXoriUlH0l7mfHm
X-Received: by 10.237.42.164 with SMTP id t33mr2966912qtd.105.1488195672403;
	Mon, 27 Feb 2017 03:41:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 03:40:52 -0800 (PST)
In-Reply-To: <1488036652.2631.4.camel@iki.fi>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
	<1488036652.2631.4.camel@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 11:40:52 +0000
Message-ID: <CAJTo0LZB4x2Eb8Wkxpe3ckJjZjA5AWs5vF4JRcqShD3FB-AgLQ@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Mon, 27 Feb 2017 11:41:13 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe22690ccd0549818e31

--94eb2c0cfe22690ccd0549818e31
Content-Type: text/plain; charset=UTF-8

On 25 February 2017 at 15:30, Tanu Kaskinen <tanuk@iki.fi> wrote:

> I couldn't reproduce the problem. I don't get the warning, and "readelf
> -d tmp/work/corei7-64-poky-linux/pulseaudio/10.0-r0/packages-
> split/pulseaudio-server/usr/bin/pulseaudio | grep TEXT" returns
> nothing.
>
> My test was performed on a fresh poky clone with default configuration,
> using command "bitbake pulseaudio". In addition to the default qemux86,
> I tried with genericx86-64 and also intel-corei7-64 from meta-intel,
> since your error message seemed to be from a corei7 build.
>

Typical. :/  Thanks for trying, I must have something locally that triggers
it.

Ross

--94eb2c0cfe22690ccd0549818e31
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2017 at 15:30, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":1xt" class=3D"a3s aXjCH m1=
5a75e57e5018e09">I couldn&#39;t reproduce the problem. I don&#39;t get the =
warning, and &quot;readelf<br>
-d tmp/work/corei7-64-poky-linux/<wbr>pulseaudio/10.0-r0/packages-<br>
split/pulseaudio-server/usr/<wbr>bin/pulseaudio | grep TEXT&quot; returns<b=
r>
nothing.<br>
<br>
My test was performed on a fresh poky clone with default configuration,<br>
using command &quot;bitbake pulseaudio&quot;. In addition to the default qe=
mux86,<br>
I tried with genericx86-64 and also intel-corei7-64 from meta-intel,<br>
since your error message seemed to be from a corei7 build.</div></blockquot=
e></div><br>Typical. :/ =C2=A0Thanks for trying, I must have something loca=
lly that triggers it.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c0cfe22690ccd0549818e31--
