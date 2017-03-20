Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9596D77957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:58:28 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id y76so108813252qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NPJaPWBhJ+sFM/FZPyR8/lWwXVy7Sv29Gj04nbWeU0g=;
	b=xCZsllnV1CEiU6FY+hN1Fn9pLy8MbGDJuNb6uNEPeljDz7vZWH3g2pSQ4HpXz5zFDz
	eMHq3pl7OxT+DNbCSK5o2+3b1Jm5RrSOilV+wEnpmr1dDFhO3dLfrdf8jOVl9jfkhykE
	9zTDfBRKkU0m3e7fcsC59LZDKch44BtlUQFoKn+r9okJeM1nT6/VqLMs9++ETtLvhV3W
	mseg6ViiCYiKzmnT1pS9aOhqMDyt+K248qwRkvvopU9s0DazGmMfNzrkQ5aBAoCsdZ1/
	VcEooeYBn/+i014Vy64DlwxBFeDB2wQIeKEZomulCZ9vaLOCn3brrJYCyQ3eleSqu6Ji
	mQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NPJaPWBhJ+sFM/FZPyR8/lWwXVy7Sv29Gj04nbWeU0g=;
	b=um+vHfS3jlw+XUzzv+jzT85Ls65CGort21+9NcnA/JgiNfGSmuQP0cgsNTz4eckLrM
	Ycy0+bpYmzo6YXHOihOlBdIs/ZvXtUbVWfwhplW+zSHqyKqaszkRgvHVmk4/1E0dyJFx
	HSLpjsJFBeNxEhy52lxRImYXo9k4D4AMRIbgrXOl5Prxux8Q0M16VqEHQpd7L9VoanC2
	JWrRiC+KDnCk4J4tSWUI7KnD0nkeSz6YHw2q+/NBAV+FRFScfBODsV/p/A8niFgD6FYn
	/Fy1Yrwq1ku2DakDXLGv6We/LEOeIOp6DISrh3SjFty41hNmulqJdEx49e35cVIHP1QJ
	06mA==
X-Gm-Message-State: AFeK/H0bbVSsr5DEIlof9QXEeKhAeW0A9B7TjyzXCfHy62HLsy1MG8VK9LEJUe/qqxOXNocgsd0Aqu5dHtYvixVN
X-Received: by 10.55.108.195 with SMTP id h186mr236685qkc.36.1490014709316;
	Mon, 20 Mar 2017 05:58:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 05:58:08 -0700 (PDT)
In-Reply-To: <6355a5b0-7381-332c-1d0c-765da860b695@mlbassoc.com>
References: <597a60bd-e1a7-c832-3f95-13464ca8ebd2@mlbassoc.com>
	<1490012507.6396.173.camel@intel.com>
	<6355a5b0-7381-332c-1d0c-765da860b695@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 12:58:08 +0000
Message-ID: <CAJTo0LaXNHKyTSBBaOdMvywPUE1iER=NNrown=pB7SLf0U3HKg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Error after updating Poky
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
X-List-Received-Date: Mon, 20 Mar 2017 12:58:29 -0000
Content-Type: multipart/alternative; boundary=001a114fe79a7598dd054b2915cf

--001a114fe79a7598dd054b2915cf
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 12:50, Gary Thomas <gary@mlbassoc.com> wrote:

> Thanks, that did fix it.
>
> I see that those recipe-sysroot* trees are kept around (I don't run
> rm_work)
> For one of my builds which has ~475 packages in tmp/work, they amount to
> 7GB
> Is there any way to prune them?
>

It's all hardlinks, so be careful how you count.

Ross

--001a114fe79a7598dd054b2915cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 March 2017 at 12:50, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":1td" class=3D"a3s aXjCH=
 m15aebc54522eb778">Thanks, that did fix it.<br>
<br>
I see that those recipe-sysroot* trees are kept around (I don&#39;t run rm_=
work)<br>
For one of my builds which has ~475 packages in tmp/work, they amount to 7G=
B<br>
Is there any way to prune them?<br></div></blockquote><div><br></div><div>I=
t&#39;s all hardlinks, so be careful how you count.</div><div><br></div><di=
v>Ross=C2=A0</div></div><br></div></div>

--001a114fe79a7598dd054b2915cf--
