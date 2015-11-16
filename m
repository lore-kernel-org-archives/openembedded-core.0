Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id D6DF36E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 15:03:38 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so58731588igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 07:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fHDfdrAAP5npFLZspxoaBzpO5OVsnHVugZrU7gUByfA=;
	b=Yuj9x0/ncW8bNPck77CG8+EQn7QK2e49zh5qkvIJ1g8ioT851wiXSTYDLMcCb/rtGj
	NZ3LMhYJImIYWYKv3kSxhLhWCXiGxGd782TkCAASX4gNt8uXSxOOdb3Vuhhi6IRo/zUf
	YwAi48z1Invxm9ZknkJtuD6Q9vH5hLE18u1mWfO81AEAMbDcHkcFLuGUo5dFDzuo5/kX
	pcMWYtp4I+iMcih71kzicDETt7uxQVGZn9T0TCTKbU+2IG/zorJVfWZ0vdP5gdLRXj8P
	tap7dB9ANjwHeqm81n4ymyKwanR/CP+FqgnJ4PUB/sn6ujXM33jaJ6XJ5H2F05rzAbjS
	7qCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fHDfdrAAP5npFLZspxoaBzpO5OVsnHVugZrU7gUByfA=;
	b=MlUVBSOHaRNdWo3jDB60ppSEHIWKrPxV3F3z0xbe4JFR7efkUnhlG3K4bqpZyN0go5
	ARyBzN6jdaohFsQb+a7LT1kw2pxTeLmZx9DE0QlEYHfH80qGL+abIfmsx5RvulAuJkSj
	Aqbel8dz7yPKqB9r/ZZXvAADcgLV4rIxizq6pjzqnRHKCM4WpiEpWI0oOx+k1cDXd9N6
	NdKcQT28fefW4IQLs+Ay5jwx/HDXuCH5Pjo2bQA3nPG/E5H2Am/kiprEehvR4k9X4i5B
	/qzNNyT+wJWxs73Uo2T2asGnEkpYcUMwGm0S7MLdkgf4ZcNr4vPnS9BvgtxXVqz+KxeR
	QIew==
X-Gm-Message-State: ALoCoQkJyxyGHmJBOAuBXETnyxaOEHonGPeeu1Y8PhtcB3vgz5FN8MpxPa4unEAC9TjeXil4TqqQ
X-Received: by 10.50.79.129 with SMTP id j1mr15750007igx.52.1447686217936;
	Mon, 16 Nov 2015 07:03:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 16 Nov 2015 07:03:18 -0800 (PST)
In-Reply-To: <5649B202.1060301@jp.fujitsu.com>
References: <563C5648.5050009@jp.fujitsu.com>
	<CAJTo0LZsG+_bo5=+bYrfP3theSrW-aw2TR4Y-Ax_JVY3YnEKDg@mail.gmail.com>
	<5649B202.1060301@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Nov 2015 15:03:18 +0000
Message-ID: <CAJTo0Laiibw3uxt1OHQK0MfTGcWrJsQYduPunx8sYJc0iq3+Gw@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Mon, 16 Nov 2015 15:03:39 -0000
Content-Type: multipart/alternative; boundary=089e011609fcc45ddc0524a9b654

--089e011609fcc45ddc0524a9b654
Content-Type: text/plain; charset=UTF-8

On 16 November 2015 at 10:37, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> wpa-supplicant: upgrade to 2.5
>
> 1. upgrade to 2.5
> 2. remove eight patches since they have been applied in 2.5
> 3. update SRC_URI, HOMEPAGE and BUGTRACKER to use w1.fi instead
>
> Signed-off-by: Fan Xin <fan.xin at jp.fujitsu.com>
>

It looks like you generated a patch and then pasted it into the Thunderbird
composer, which means long lines wrap and the patch corrupts.  Can you
either send the patch without line wrapping or ideally using git-send-email
directly?

Thanks,
Ross

--089e011609fcc45ddc0524a9b654
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 November 2015 at 10:37, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mail=
to:fan.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4bl" class=3D"=
a3s" style=3D"overflow:hidden">wpa-supplicant: upgrade to 2.5<br>
<br>
1. upgrade to 2.5<br>
2. remove eight patches since they have been applied in 2.5<br>
3. update SRC_URI, HOMEPAGE and BUGTRACKER to use <a href=3D"http://w1.fi" =
rel=3D"noreferrer" target=3D"_blank">w1.fi</a> instead<br>
<br>
Signed-off-by: Fan Xin &lt;fan.xin at <a href=3D"http://jp.fujitsu.com" rel=
=3D"noreferrer" target=3D"_blank">jp.fujitsu.com</a>&gt;</div></blockquote>=
</div><br>It looks like you generated a patch and then pasted it into the T=
hunderbird composer, which means long lines wrap and the patch corrupts.=C2=
=A0 Can you either send the patch without line wrapping or ideally using gi=
t-send-email directly?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</div></div>

--089e011609fcc45ddc0524a9b654--
