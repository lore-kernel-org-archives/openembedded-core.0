Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB4D27721C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 20:50:15 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id z135so153951953iof.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ri7UWG8pfMRnwmhY4dTnbf7t0Yv8o8ngC4VaUOtsj0w=;
	b=ufcBLCmTdQ7KdkPuocG8FbULuRklsBe9WaXkU7D/4TeMIpwC2m1m7QACtlRmVN6YNw
	EMCWYA4JsZD2S8ekEbDFHIFpaX2CQmrj7jqYEkg9OPpV3v/TuLRqlYRJOExMYA8Ft208
	hQaRZplD0Lzoklu2Dx9NyIRpizIt5fmVuEvy5RWQPjG9lDzKmFjquf9MJmkb8y1HC5m2
	nM5IxfoHws4oftwVli54BUrbx0891eTZDc0EQOM61DkmNOdnL8O2JKVYHM5eKG5kfnv5
	KcrEpk46YMweC0ByNxOnSTZfhT8cA9u5FN4cUeE4kuUx3mP9wXlSFYTSUi6co3NX4xIa
	zUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ri7UWG8pfMRnwmhY4dTnbf7t0Yv8o8ngC4VaUOtsj0w=;
	b=GaI147v+e0m6mrMtA1Xh/8xqlYqa0XkFtIZUJ9O/S91oUtaW4xP9a53Md79O/3T5CA
	lgJ76++xxyA00kVAbKhz8x73UrbJFIdZv8EwfXgCt/rR3pJsDgfYd6+vB+7MJF1jZ/ci
	o+iDjMfEPu/gROACmdm/ac0KsL0xU87PvzqgYRxosRc1SWV9+SfGUbN6CjML1U2LphEP
	GE1Xu8ylMzVsVtJCckyT+QgtHaXcLyxcdXOVNh4l06Wh2dNnyXVOH7QD7wZSgnUp83Oi
	LsYLV/EJv9izzZInwRzKtILyhIOow8TOgBA27Oyqpg6WEBsrWtIH/LL6dNEwGFdiIrtt
	H+gg==
X-Gm-Message-State: AG10YOR0c9D+YkmFNVCW+MX062QKDa8sxDWGh+8+AGffhFqKUaiOgIzoSVeZ0cmf7Anr5sAj0o44wK3AeFehk0Jb
X-Received: by 10.107.3.220 with SMTP id e89mr12683036ioi.99.1456606215969;
	Sat, 27 Feb 2016 12:50:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Sat, 27 Feb 2016 12:49:56 -0800 (PST)
In-Reply-To: <1456561245.11498.119.camel@linuxfoundation.org>
References: <1456552387-10564-1-git-send-email-armccurdy@gmail.com>
	<1456552387-10564-5-git-send-email-armccurdy@gmail.com>
	<1456561245.11498.119.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 27 Feb 2016 20:49:56 +0000
Message-ID: <CAJTo0Lb0_nwBg_koZ5==+JXjWwLWdvUfcrjj5YM_-WgUT5n=Xw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] native.bbclass: poison TARGET_CFLAGS etc for native builds
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
X-List-Received-Date: Sat, 27 Feb 2016 20:50:15 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c14b56a052cc69094

--001a113f0e7c14b56a052cc69094
Content-Type: text/plain; charset=UTF-8

On 27 February 2016 at 08:20, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Wouldn't it perhaps be nicer just to unexport these?
>
> I think
>
> TARGET_CPPFLAGS[unexport] = "1"
>
> might do it or we could do:
>
> delvarFlag("TARGET_CPPFLAGS", "export")
>
> ?
>
> Regardless of approach, this is likely going to need some extensive
> testing.
>

Unexporting is certainly neater, but a world build with poisoned flags
would certainly catch anything that's doing it wrong (openjdk for example
appears to be passing build cflags to host g++).

Ross

--001a113f0e7c14b56a052cc69094
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2016 at 08:20, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":2n3" class=3D"a3s" style=3D"overflow:hidden">Wouldn&#39;t=
 it perhaps be nicer just to unexport these?<br>
<br>
I think<br>
<br>
TARGET_CPPFLAGS[unexport] =3D &quot;1&quot;<br>
<br>
might do it or we could do:<br>
<br>
delvarFlag(&quot;TARGET_CPPFLAGS&quot;, &quot;export&quot;)<br>
<br>
?<br>
<br>
Regardless of approach, this is likely going to need some extensive<br>
testing.<br></div></blockquote></div><br>Unexporting is certainly neater, b=
ut a world build with poisoned flags would certainly catch anything that&#3=
9;s doing it wrong (openjdk for example appears to be passing build cflags =
to host g++).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a113f0e7c14b56a052cc69094--
