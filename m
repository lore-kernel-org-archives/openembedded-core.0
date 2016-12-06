Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 529C371A69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 15:49:57 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so196009522qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 07:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yzyGzGZ59+KXAUL9sTiA3GYOkY1yH4XIazk0tBqn0+s=;
	b=OEMwDLSN85e8e3P2qrv/6QH0i+G/6KJdQtxtVw64qnuvAiYNDS3GDYsrDVBIZQG0WC
	w5xGJUkZFJszmSfM9LUA++U+rW+aDxeHALA9TGWjrEEY35dYnQUKuGSAC2j6nzqXdkW/
	wm2Ij15VJyxs26/xWA+MDp6LyHbw3etrWyeBAXdK+lNbkinl/VEjaED2KGNBCLsvgUrB
	qow2WG45Vaj+M+zjvbbpvUsmkM5fGf3+cukG1iM144BsGg5oM+bVyKyMWkzKsY6jryWB
	WxHkdVJ1uJNcEyYFruKQDercY12Jl1nD7/1M8ZbRq2gI8/2kcdiiWZNAN50LaIRyMudE
	1M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yzyGzGZ59+KXAUL9sTiA3GYOkY1yH4XIazk0tBqn0+s=;
	b=WVD738nKE17iYiE7QBxQZs9VHUc9v9f3M1b37OA7SQQ0x1kHfuVhY+RBfTvOmc3Nxj
	PsMz/JImPDgKVS1fRTRAM7+r+zJvab5io4i/FPmvZuYcpqMagbrSjeYMgZA8L9Eg484n
	bUBAs80o6Rc1LRmaTVnyJzKI0DRqeZv/Iowo2oKOxh5ZpIy5T0eMn2eSnpve08mjYPIb
	7qUrRXVasP+Ys4ecR+jpMqzxxms6g5lGkRiCAJ/P5/ZEVguxrumu1mIOr2tXVUNWIg3W
	R2dJJGcKsVcMHNpBmG8dCyPzr3zdLo6/5Jke8sKn2ddVKP6tdEXBA7EGGWIZv//ec6lz
	hJbQ==
X-Gm-Message-State: AKaTC0141S0QpYYqiTkT7/ut+tztFxsFlZCEK/Q9CS3utGBm/6+0b9A9DHWK41FEc0cxkQqcooIWnSRf5XgRK6rn
X-Received: by 10.55.106.134 with SMTP id f128mr61421558qkc.121.1481039399408; 
	Tue, 06 Dec 2016 07:49:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 07:49:39 -0800 (PST)
In-Reply-To: <1480545786-5069-3-git-send-email-obi@opendreambox.org>
References: <1480545786-5069-1-git-send-email-obi@opendreambox.org>
	<1480545786-5069-3-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 15:49:39 +0000
Message-ID: <CAJTo0LZxQO7B6V=MK9+XE1is=jNDFut8Fq+q7S9Mrov7FrLX5g@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] keyutils: new recipe (version 1.5.9)
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
X-List-Received-Date: Tue, 06 Dec 2016 15:49:58 -0000
Content-Type: multipart/alternative; boundary=001a114fddf64d0bde0542ff5b5d

--001a114fddf64d0bde0542ff5b5d
Content-Type: text/plain; charset=UTF-8

On 30 November 2016 at 22:43, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Used by nfs-utils for nfsidmap, if available.
>

This breaks under musl:

| key.dns_resolver.c: In function 'afsdb_hosts_to_addrs':
| key.dns_resolver.c:374:21: error: 'UINT_MAX' undeclared (first use in
this function)
|   unsigned int ttl = UINT_MAX, rr_ttl;
|                      ^~~~~~~~
| key.dns_resolver.c:374:21: note: each undeclared identifier is reported
only once for each function it appears in
| key.dns_resolver.c: In function 'dns_query_afsdb':
| key.dns_resolver.c:456:22: error: 'ULONG_MAX' undeclared (first use in
this function)
|   unsigned long ttl = ULONG_MAX;
|                       ^~~~~~~~~

Ross

--001a114fddf64d0bde0542ff5b5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 November 2016 at 22:43, Andreas Oberritter <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:33e" class=3D"g=
mail-a3s gmail-aXjCH gmail-m158b7687ad0b3ed1">Used by nfs-utils for nfsidma=
p, if available.<br></div></blockquote></div><br>This breaks under musl:</d=
iv><br>| key.dns_resolver.c: In function &#39;afsdb_hosts_to_addrs&#39;:<br=
>| key.dns_resolver.c:374:21: error: &#39;UINT_MAX&#39; undeclared (first u=
se in this function)<br>| =C2=A0 unsigned int ttl =3D UINT_MAX, rr_ttl;<br>=
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~<br>| key.dns_resolver.c:374:21: note: each undeclared identifie=
r is reported only once for each function it appears in<br>| key.dns_resolv=
er.c: In function &#39;dns_query_afsdb&#39;:<br>| key.dns_resolver.c:456:22=
: error: &#39;ULONG_MAX&#39; undeclared (first use in this function)<br>| =
=C2=A0 unsigned long ttl =3D ULONG_MAX;<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~<div><br></div><d=
iv>Ross</div></div>

--001a114fddf64d0bde0542ff5b5d--
