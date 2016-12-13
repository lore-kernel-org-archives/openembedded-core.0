Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id CAE6571B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:41:16 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id q130so109278429qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 00:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bbgD90R+gbghS2d+skPnIix6FnB7I0rD4Kqcpf4gLfo=;
	b=YufYTaa1gx5mHJDuE5QR4/I28ZeBj2TO4JJKbkITL2n24x5vfLNflm8/NtGxzPf3Qk
	y5Ojav8K+6crFF7KRyxvMbjQKN1zzdb1R76oITCM43NYzyULr95NmaGSbKN+rfW0+uAR
	foaSpCP7pbvppBRlaSYSGUEGXcg7QaVZrLI0sJNRsqviOTozCJPUkEXCP05bcA8wMb4P
	IFPwyx6H7SVnfpnSmbh7o3nL/x6gLv1HjppDTcIkAcKRmstAAlHj1IEEdYTHGAc7FdAl
	4aGidUZQ3PVTNzQXqmuNLBgvxe9iw837z9Khbqh3JdSHIY2A8WbF1Eh+BC4rCXVbbFcU
	R//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bbgD90R+gbghS2d+skPnIix6FnB7I0rD4Kqcpf4gLfo=;
	b=awXqCrFqGZ20Wuf9hDqq5eHYejFpVOwrrWGKAQ6EXYg0+/J1GOv5al0XjPra2YJYqi
	hD1i1DOn1jBUpTnfZP4OiyNAXCLVIak3H/tIN9UIXXyHUZNNpjd3WVAb3Gf9+huRvcrv
	nDOsXQWOduHvO6qFCIagHEeQajBzZHizAIKl9A3e+vQNQh91rg7X/89SZeAEyjFUdXy2
	vGv5JZd/KiOReDXbM5uBXY70DdUIySNBmUsOaIgGMomyP6fLTdhguBvXesspBQz5mq2B
	H+ZslbKMjJ2Sh84qRTdZcUd4CvK559OuEDFD+Xb3CN6xU60jxpohrBbL2RNbkOj1jcfB
	XfEg==
X-Gm-Message-State: AKaTC01zNXQ6NNZDGe1ax6yJADcWTXtWXgavI4qlj9sDYSXx6Z4BexbMmcq17No98keQ5mmdgv39ksqx9N8rfVWK
X-Received: by 10.55.207.78 with SMTP id e75mr96990915qkj.36.1481618478198;
	Tue, 13 Dec 2016 00:41:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 00:40:57 -0800 (PST)
In-Reply-To: <20161212154016.1076-1-git@andred.net>
References: <20161212154016.1076-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 08:40:57 +0000
Message-ID: <CAJTo0LaChfpCDnbs8hAHLzCHS3wb3Wbu3Ak99YPDDvUZjDGGRg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: allow libiproute to handle table ids larger than 255
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
X-List-Received-Date: Tue, 13 Dec 2016 08:41:19 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b8160e250543862f05

--001a1145b7b8160e250543862f05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 December 2016 at 15:40, Andr=C3=A9 Draszik <git@andred.net> wrote:

> ++              printf("table %s ", rtnl_rttable_n2a(tid));
>

Sorry but this doesn't build here:

| networking/libiproute/lib.a(iproute.o): In function `print_route':
|
/usr/src/debug/busybox/1.24.1-r0/busybox-1.24.1/networking/libiproute/iprou=
te.c:294:
undefined reference to `rtnl_rttable_n2a'

Ross

--001a1145b7b8160e250543862f05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 December 2016 at 15:40, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D"gmail-:kq" class=3D"gmail-a3s gmai=
l-aXjCH gmail-m158f3b14ecfe317b">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 printf(&quot;table %s &quot;, rtnl_rttable_n2a(tid));<br></div><=
/blockquote></div><div class=3D"gmail_extra"><br></div>Sorry but this doesn=
&#39;t build here:</div><div class=3D"gmail_extra"><br>| networking/libipro=
ute/lib.a(iproute.o): In function `print_route&#39;:</div><div class=3D"gma=
il_extra">| /usr/src/debug/busybox/1.24.1-r0/busybox-1.24.1/networking/libi=
proute/iproute.c:294: undefined reference to `rtnl_rttable_n2a&#39;<br></di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1145b7b8160e250543862f05--
