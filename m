Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 18FA477A4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:52:27 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id y63so83752291qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xTuYtdVezjCJsBU5I2Kr7+gT6G/d9Fpo/KkKckjoIbQ=;
	b=Rxyz7gYYk7TxWjR4RlRc4EPKBCuEs+ob4u7qJuTdW97R4ifCsgSOnBU7ma99JmZnBP
	Gi9WhiKsHo6gON/1TAlonj++JzVU4L/FHE0UFoOgbNvcX8f0hwjbQN2XbdjGEpWynHey
	06Xg5tedIS+4zHy1Eh5eXZMfXj5CD5E2wuso3ZUyVcFjyQZU6LoppfIP7pDzvJ+on/Qo
	5Hyp53TwtJAFCXvkSRnoxtiGLEhihFnCFzRRxMTpLeyOGPNY0qPt/h3JNA/ne7rfygCJ
	wmQe3RYUDJkEvfFF0OyqJh9DUXXgOpYABWN1LGXPzh6md2dEFUsMgc6v3ME3YVk4wIOL
	SUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xTuYtdVezjCJsBU5I2Kr7+gT6G/d9Fpo/KkKckjoIbQ=;
	b=p5IMMdC97Qk/M16tCqEz3B2LMlvPUPyn2Ka54xwxxLdIJFxyzlzZ+nH5HnFDIsk4BC
	R7mN5FzlsANgwzM64zFLk0O/ceN3ZjcM7KE1JKXxsP2M/0JDv+Bk2U+8aohq2ZATZfSk
	CH2mPvBxeHtbbrZxVDAcDdgoBe8BjquOZSmR/E/ET8UHu5WJqPeXgyNtXltTsTO2wAa2
	VXUdZk1AX6pBqjzDTVVWT+maj/FGodwWlU8grNif8JPpuTi5lmdMyMnuArQxng+I8aLE
	M3SGAzOPIpR5DLh64AIKwDE+C5EHnwkDCZnL5yvdsLJu4os1LL75YNbDJrWkPzGlYBx1
	jQnA==
X-Gm-Message-State: AN3rC/7NWY9Ic/x4Ql8YEDsz6Xl84QmKfZ59f2vxyn9j5qsvaM6eZYUE
	CVmp36ERc0yS8LdjKeqyXlk/dzaEF+CK
X-Received: by 10.55.40.41 with SMTP id o41mr26106269qkh.3.1493031148954; Mon,
	24 Apr 2017 03:52:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:52:08 -0700 (PDT)
In-Reply-To: <CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:52:08 +0100
Message-ID: <CAJTo0LaT_7RHzG=2UyZ=Y5W=XCCWGq_P_e-E0jO3jteyhVMF-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 10:52:29 -0000
Content-Type: multipart/alternative; boundary=001a1140a35a45bb5a054de76784

--001a1140a35a45bb5a054de76784
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 06:45, Khem Raj <raj.khem@gmail.com> wrote:

> There are few other fixes that needs to be in there. glibc and gcc recipes
> also needed some fixes. I have pushed the whole series to kraj/master
> branch on contrib repo
>

grub is still failing on musl on the autobuilder:

| ../../grub-2.00/grub-core/video/i386/pc/vbe.c: In function
'vbe2videoinfo':
| ../../grub-2.00/grub-core/video/i386/pc/vbe.c:882:28: error: this
statement may fall through [-Werror=implicit-fallthrough=]
|        mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_CGA;
|        ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

https://autobuilder.yocto.io/builders/nightly-musl/builds/243/steps/BuildImages/logs/stdio

Ross

--001a1140a35a45bb5a054de76784
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 06:45, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,20=
4,204);padding-left:1ex"><div id=3D"gmail-:31c" class=3D"gmail-a3s gmail-aX=
jCH gmail-m15b9e7edf85c6650">There are few other fixes that needs to be in =
there. glibc and gcc recipes<br>
also needed some fixes. I have pushed the whole series to kraj/master<br>
branch on contrib repo</div></blockquote></div><br>grub is still failing on=
 musl on the autobuilder:</div><div class=3D"gmail_extra"><br></div>| ../..=
/grub-2.00/grub-core/video/i386/pc/vbe.c: In function &#39;vbe2videoinfo&#3=
9;:<br>| ../../grub-2.00/grub-core/video/i386/pc/vbe.c:882:28: error: this =
statement may fall through [-Werror=3Dimplicit-fallthrough=3D]<br>| =C2=A0 =
=C2=A0 =C2=A0 =C2=A0mode_info-&gt;mode_type |=3D GRUB_VIDEO_MODE_TYPE_CGA;<=
br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~=
~~~~~<div><br></div><div><a href=3D"https://autobuilder.yocto.io/builders/n=
ightly-musl/builds/243/steps/BuildImages/logs/stdio">https://autobuilder.yo=
cto.io/builders/nightly-musl/builds/243/steps/BuildImages/logs/stdio</a><br=
></div><div><br></div><div>Ross</div></div>

--001a1140a35a45bb5a054de76784--
