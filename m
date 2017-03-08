Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6B367774F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:43:46 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id 1so77560180qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6xjM01J6xHYbkVlA4SIvRydQF9GJalWhiTZhtDIyt8s=;
	b=NV/TsSt7ZkGfPJuc0A8Tm9uh8fk2j7eR6A5cUloROis4e6/a0FLIiZkoutYrv0emgo
	wEGoeGkKwpRMQCbbR3T2b9rxFCExRbMYMhISUoeUKFmOKMWzx6VzX4b0h+3e2Un42Ty/
	GMOii8z/v1Asxgz5dmGkpjPhvSSayGMby7NNrO9SrawF46ooer45kUu5SetHgeJiYoNn
	ZvzRAvDuORA7fFPAmO32bnkxM6k057dnVOYn5QVVr9Tmq19fooGDG/xAzWcYXnIk6Ozv
	Fcl5ArxK9LOxPlVLUFgeSriGswxwipRGo56wGOvZ1tqtyoukD7cx1F3yl4AP2b9WXTsi
	6SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6xjM01J6xHYbkVlA4SIvRydQF9GJalWhiTZhtDIyt8s=;
	b=PPjH9KTz8ke0xYmfbPwdC8oT+UKdvcwDGlkfm9g5Y+T5PEIH68bXjjjppuY3DFBpzR
	wgTEqpd9t62sa2nFe7ihXK+UFQ5linYCo7GYsP/oBtfKI1Pa4o/9ZkHyUmZz4An8ZYXI
	VsTGRn1F6QnhK00RYjlxXooWFofCuY9VGI/Uigb0Vw8RDzKnqbd6GxghSIkk0BcwOk7D
	1LOvd0+aJVZZwzE56fFAjRQ4ONI2qTHPec8cBGqr/tZNW+0/nfzAmp0E5yNMrlB5bgTh
	GpGDrYauvsEyqxlxOufAWslQU9J8IZwaFLL8AD8XHcCRKfKZpH+lTUWyRmaxJ6LnKBvN
	OIBQ==
X-Gm-Message-State: AFeK/H2dJyPDbiqcRWvdMeUCTpvZUc3gGB8szR6j0+FwkaAjgvmM940RtaeY/E37Z3Us89HXJC9femhK/FsK5Bse
X-Received: by 10.55.192.145 with SMTP id v17mr9199656qkv.3.1488995028133;
	Wed, 08 Mar 2017 09:43:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 8 Mar 2017 09:43:27 -0800 (PST)
In-Reply-To: <1488994536.22968.75.camel@linuxfoundation.org>
References: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
	<982f2830-f150-faa5-eebf-ff5ccb7972c5@windriver.com>
	<1488994536.22968.75.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Mar 2017 17:43:27 +0000
Message-ID: <CAJTo0LaqK_uGyFW=GVhjMoKfVbqN2QmdPM795edxFciQSrFvxg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 17:43:47 -0000
Content-Type: multipart/alternative; boundary=001a1149a1c2b99857054a3babb0

--001a1149a1c2b99857054a3babb0
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 17:35, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> Note that the implication here is that openssl depends on the kernel
> building and many other pieces of the system depend on openssl so it
> does bottleneck the build somewhat.
>
> It also means a kernel rebuild ends up triggering half the userspace to
> rebuild which is annoying for users.
>

I swear I was seeing this, but can't see how it would happen now.  The bulk
of this patch is a sensible cleanup anyway so I shall verify my tests and
most likely resubmit.

Ross

--001a1149a1c2b99857054a3babb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 17:35, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":236" class=3D"a3s aXjCH m15aaefdd5a6ea6df">Note that the impli=
cation here is that openssl depends on the kernel<br>
building and many other pieces of the system depend on openssl so it<br>
does bottleneck the build somewhat.=C2=A0<br>
<br>
It also means a kernel rebuild ends up triggering half the userspace to<br>
rebuild which is annoying for users.<br></div></blockquote></div><br>I swea=
r I was seeing this, but can&#39;t see how it would happen now.=C2=A0 The b=
ulk of this patch is a sensible cleanup anyway so I shall verify my tests a=
nd most likely resubmit.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>

--001a1149a1c2b99857054a3babb0--
