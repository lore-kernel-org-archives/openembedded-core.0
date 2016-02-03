Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1430A731CF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:55:58 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id g73so70387810ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SufL25Ga+nLA1sWXcUmjm4T589A9BuCe+a73/Ixu6Uo=;
	b=LCE1kX/NS/cF3CZjPrHREBLdPGOu0mBYVeM9d1KClbLGM4uz8MO9+AWBO0fMPHjYSm
	IyRQw2y42Vl5KWVGDLPOPamqsTCbTA35K9VtprAycox+6TfJikMSnshDfyowvYubKYVy
	LP54WQBExbJIKxudyVJVjaqQvya+VqCYm5aRqg3ownvjVekv7ddsQS8tiy6+5e6q6aGi
	to3u3hlhK1af3em/1bxWf9S+vMBD8D+rn6QLxgmqymT88qohmvJzYMHwbfEpKyuXKv4z
	HXfxgT2q8NM3GenfVgSt2gaClU8A+DyUKUVU7MjkT/0Hf1JXtUynreMeuaFIk1LPlWRD
	pSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SufL25Ga+nLA1sWXcUmjm4T589A9BuCe+a73/Ixu6Uo=;
	b=R7MqsVlcreMCk9g7F5jaqEyXkkiGm1vgUcDCZYZIf8INXAazwCiuDPbxTUaNDpT9P0
	7vUOLIhZvIxTnXDqkrDrBaBOHt4QA54zpNSk6UoTS/yvQp8GpzZTvQbeAQw3YaOK6Jxi
	6RGKrlhB2fJfcXEa+e8MDKCUZKIveJbHwPcgEkmLOc/eFOYIVS9KXbBF43GEPhZUI3Ii
	M27Aw9UOb6t7cyjvz3BAD/+Iz3uzE+Sv/XChWWwmCFRsBx7BFnB7LRJwdEbqjaVwZIkP
	yKfTVi7wDmuXeMKcH9iLgIt7wwfEm1OquIfiCBRWfbJY0KA+XPFAkhi/RlqoLzuv05XN
	75uw==
X-Gm-Message-State: AG10YOSFBqtKY+jpiwA9x2ia/pwLXiyVvoAl2mb3srNHqzEYUx3dotziBUHYGD03h44gnssY5rYmaKpxx1Gkafyr
X-Received: by 10.107.3.220 with SMTP id e89mr5121854ioi.99.1454532959427;
	Wed, 03 Feb 2016 12:55:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 12:55:40 -0800 (PST)
In-Reply-To: <CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 20:55:40 +0000
Message-ID: <CAJTo0LZ=WrweupLhQvUqcTd2F-wo8FBY2b0Zj2Njx6zbBaO7vg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Wed, 03 Feb 2016 20:56:02 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c5c95c9052ae3d8b8

--001a113f0e7c5c95c9052ae3d8b8
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 20:32, Martin Jansa <martin.jansa@gmail.com> wrote:

> This could be caused by chromium using own bundled binutils


Wait, WHAT?!  :O

--001a113f0e7c5c95c9052ae3d8b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 20:32, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This could be caused b=
y chromium using own bundled binutils</blockquote></div><br>Wait, WHAT?! =
=C2=A0:O</div></div>

--001a113f0e7c5c95c9052ae3d8b8--
