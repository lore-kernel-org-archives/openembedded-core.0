Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAAC73193
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 16:28:00 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g203so32836733iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 08:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VSrCllQBhh/EYpt46MdAmMNK5CBpMyzonz775kZDTxk=;
	b=nNVJ8bfvyTIt+SHGCJzdVVx/nA+Ry2zWhKvYEg4XlfaON+TaQBk2Af4WLeuYeQzisr
	+s7sCoGE0wf1gi7tflFJVVmU1zuUNTPatf9WRBaymyKygBMrBntAUpVSWTah92pBXk4r
	serv2GlgDHNoHVIS97UI/7oOtuBCd6PJl2pxsI8OnV430e3zESj3hiZXLxGPqMtPB1+B
	6xgwBHJ3msyNagrpvinD3Ht8ZUisUYUAdYMBAEEabvNKzSssWLxYiRzxKdGQtkoLmtMm
	gpoEYJqwAkVH/tTCAAU1D+L2XrebfKYpAgN4QnqBL9ehjTaOC9Dyi3GF+ZZCAA/HI71O
	HGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VSrCllQBhh/EYpt46MdAmMNK5CBpMyzonz775kZDTxk=;
	b=Mp108bkjG2EdWl+00JhPRV72c0ZhYsEC8c+2pEkI3LFT38iFdPHA2UBw4TiQOVuqsh
	nZnRWNEFbCed15HzUk+Rj96ObTGyDg22zvglQGD9pMHvHsLDg5bdR7qpS/oATHXNnFBy
	LGoB1IktRBUbfWSdRGDZRWrENO0+V5dwBM6ypOQ+ioyR/W5BmO1IFuTw9G5bymD94REc
	BnjcGG7tAAATo1qI8K8ddz3a0hpLIJ8fBYAkvm/AEir+iGjmxE+Vt+ISlytiY06gK2Vr
	C9fd32QFTYv3ACPu4Ar3vc1D0+RV6S3ANzQ7qC/d70064dBPlnAwgduMIkPxiCf4j9B9
	hqrw==
X-Gm-Message-State: AD7BkJKfWRGyvbBOYgS+/xEw3CXgtyiMZNq0ApYfThF8eRgiTMhqh67apXfjQo72kLMdN4qrexgjfvnJggxlS2RD
X-Received: by 10.107.137.92 with SMTP id l89mr4142648iod.133.1457022481619;
	Thu, 03 Mar 2016 08:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 3 Mar 2016 08:27:41 -0800 (PST)
In-Reply-To: <20160303153659.GG2569@jama>
References: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
	<20160303153659.GG2569@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Mar 2016 16:27:41 +0000
Message-ID: <CAJTo0LaEvWh1rgR77i7MQ-zZQOKBF1GNkQyOFHtJHo0HN_YuXQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
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
X-List-Received-Date: Thu, 03 Mar 2016 16:28:02 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4727b84052d277bc1

--001a113ebdb4727b84052d277bc1
Content-Type: text/plain; charset=UTF-8

On 3 March 2016 at 15:36, Martin Jansa <martin.jansa@gmail.com> wrote:

> is it expected that old udev package was only 0.5MB, eudev is 6MB?
>
> Most of it is probably caused by /etc/udev/hwdb.d
>

Ouch!

Following systemd, that should be split out into a separate package.
Alejandro, can you do this?

Ross

--001a113ebdb4727b84052d277bc1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2016 at 15:36, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2u1" class=3D=
"a3s" style=3D"overflow:hidden">is it expected that old udev package was on=
ly 0.5MB, eudev is 6MB?<br>
<br>
Most of it is probably caused by /etc/udev/hwdb.d<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Ouch!</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Following systemd,=
 that should be split out into a separate package.=C2=A0 Alejandro, can you=
 do this?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113ebdb4727b84052d277bc1--
