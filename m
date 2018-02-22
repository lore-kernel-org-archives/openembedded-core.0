Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4356A78709
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 12:26:33 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id o9so6049134itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 04:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ZqXsEi2rmI9IZze7eEz4ayNHFGd9zbHuCXv7ZaxMGM=;
	b=N1/CJLrqRMxRdSOqQL/FdcBnTHxRXb7xghs98tSwQhHpEIZ+6WaucCReo8FmCSsqc5
	/O+mRvIqr1+Ui2XL2xde4nP+1e/ID9cdog+AKqI7qOJMuBiK1ZsHkWoofsOHZRlY1S8U
	dqC24udgFPdMbyosL/ZIDq0toswOgX22f1oAV8ItF3tyA4xSumDnDt/RKRno8lNoS+hc
	Z1i8dYnpzB2UTXfJRR2rdsKKecNeOwiaw9LJeAwJ/cye49nFSAR67DnVszzMHypI0VOW
	4TCSzYn7o1q22YWHkPEbmNbQl9U8/5tjhXPzANEnNQlBlb0b19MvbzgSg7/KZ361lIi+
	xdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ZqXsEi2rmI9IZze7eEz4ayNHFGd9zbHuCXv7ZaxMGM=;
	b=h9YKZiG1rOJyJI7WWPdqYv2OG7hE7ozIdeusCJOhciPK/K6H5HnN0DMu94gDJHk7Zz
	R8cW3FRsh9/EE7ZPF3VFD/Gs98QnTNolWGbHWl5OelFCn7BgWWyH/fPMDJHLrFiWhm26
	bvWg9LN79vdGFgqYVjJKg3DMmFo6SBaciDGb2ObWO4kAnxMKZ3/aqSJ2KEtlMAqL2jv7
	maK7mcS4dxP0LAo3DbxWgAvaLywoheBMAm0NKh8bPkpaWcKKRSDlgM515L4PI03ZY/nS
	rNK+AJxNEt9QxtZ6xsMfRkv8a7fRo1mgLHUTfHNY+EtVytUssdsexrJ4kFxV2Beki+Fz
	nLhw==
X-Gm-Message-State: APf1xPAw4p44bCWYWyPdyPPbKnwhZJ7Bqx1q3bFRWD0Z8NzYfKxQlvlZ
	mwgzpDKPmsgR/G/Y+7BK+sDeKadmGWnPRevgmYywug==
X-Google-Smtp-Source: AH8x224bFCYdh8jNKt0Xy0auVY1jwKiY3dSSWK+p2Mn+Ohrc6f3IuBTvz3ytw2nh3qsjKbs5C9wpRwd5kLVixguEXxk=
X-Received: by 10.36.144.68 with SMTP id x65mr7923576itd.60.1519302394633;
	Thu, 22 Feb 2018 04:26:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Thu, 22 Feb 2018 04:26:14 -0800 (PST)
In-Reply-To: <1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
References: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
	<1519278352-5224-3-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Feb 2018 12:26:14 +0000
Message-ID: <CAJTo0LYWYmk5Ch9q19Bzf6taggCsHvaZqJHdF2FPy3tbYVJBsg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gstreamer-rtsp-server: remove unnecessary dependencies
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
X-List-Received-Date: Thu, 22 Feb 2018 12:26:33 -0000
Content-Type: multipart/alternative; boundary="94eb2c07e8068a13620565cc2783"

--94eb2c07e8068a13620565cc2783
Content-Type: text/plain; charset="UTF-8"

On 22 February 2018 at 05:45, Anuj Mittal <anuj.mittal@intel.com> wrote:

> Disable building of examples and remove dep on libcgroup which
> was needed, if present, to build only one specific example.
>

Are the examples installed?  Might be worth making this a packageconfig.


> Make building of tests optional.
>

Are the tests installed?  If not then we can just disable them globally
until someone turns them into a ptests.

Ross

--94eb2c07e8068a13620565cc2783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 22 February 2018 at 05:45, Anuj Mittal <span dir=3D"ltr=
">&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mitta=
l@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Disable building of example=
s and remove dep on libcgroup which<br>
was needed, if present, to build only one specific example.<br></blockquote=
><div><br></div><div>Are the examples installed?=C2=A0 Might be worth makin=
g this a packageconfig.</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
Make building of tests optional.<br></blockquote><div><br></div><div>Are th=
e tests installed?=C2=A0 If not then we can just disable them globally unti=
l someone turns them into a ptests.</div><div><br></div><div>Ross</div></di=
v></div></div>

--94eb2c07e8068a13620565cc2783--
