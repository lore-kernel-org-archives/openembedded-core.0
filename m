Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id AC93471A6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:28 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id k15so12049799qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 05:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BHYsWbIY89zBxaGDzbmXIKDqzsFUelL7nH9saWuutl0=;
	b=WiB5Lf4VWGkp2FQV4ddG4/k3RUE399LapQdOyKHQBRSd2xL6Z7xv/VLYxOcJh4gG8i
	N7ZtoTK325t8s/wqz8lKDJBhZ9s+GXiK1gFlRSoN2Y0KpkfihWSRzhCVwslAkM+ochZ9
	FCnpw7En/6zeBvasc+SO+qVyPjGUD1Owj16+bpvk4VBoUwoPfG6hK8TlwGMfmdPFrEc1
	Vbs+rVEiYLdvWTlkA2X4ynx/WpDBW9oMJzFV+6LUAHGXYv/0VUqoJa+MLTYZUmynSHx3
	y8Gu5pVgz0rntSeU3baYGmUGDPV/L6Hvfl+VqZV3p1+7SX6GDaMbztGIiJ+YvGeq93Un
	X58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BHYsWbIY89zBxaGDzbmXIKDqzsFUelL7nH9saWuutl0=;
	b=RnjAL8ARmhOH1zO8EhINuT8uxsDsddBFD3jn5j0t0eP5UoXtyb+6HmmrdV70is1Lip
	u0ZFQNQMYLeOHmR8SIYXOT15EoFna5FoYFQWlLbQVJ2MV7S2yFAkeVjItQXCYif4bYH6
	FD1nTc+UWaDo2pZrFXzCEJidqkn/RvQgjuPoGpkJYdDwRqvARxXIP7Exb73X9GHteUqd
	HHwtKCx0owvpa1saRplenTqqz4fWn9aKhqMxqSgjc1wKuxYJLHoPs1kfkXFlg/kwwcNG
	ISqPeQXRnEO+8rAWtRj7xNTJKupWA7bxBSPOwAvzAHSF6RtHF6MI+6OjK7QbT4Xan/OO
	c3cA==
X-Gm-Message-State: AIkVDXKshwTi+EFmKbUciYyK0lHrS6hZNZWt32IGfLH9iNpXrQG/aorjakK3AhqSsvlA74yd+0Tl0CLt5w+IBmbQ
X-Received: by 10.200.53.247 with SMTP id l52mr2898937qtb.144.1484747668455;
	Wed, 18 Jan 2017 05:54:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 18 Jan 2017 05:54:08 -0800 (PST)
In-Reply-To: <20170112202050.22808-1-raj.khem@gmail.com>
References: <20170112202050.22808-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jan 2017 13:54:08 +0000
Message-ID: <CAJTo0Law0LLbHdy6_dUoEnmd1amMJRygw-k=uspKDdxsve3kcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] glibc: Upgrade to 2.25 snapshot
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:29 -0000
Content-Type: multipart/alternative; boundary=001a1142ba205c2b6c05465ec1ab

--001a1142ba205c2b6c05465ec1ab
Content-Type: text/plain; charset=UTF-8

On 12 January 2017 at 20:20, Khem Raj <raj.khem@gmail.com> wrote:

>  .../glibc/{glibc_2.24.bb => glibc_2.25.bb}         |  23 ++--
>

I was wondering what the actual version was as this isn't 2.25 yet.  The
libraries are actually libc-2.24.90.so, so I think the recipe version
should reflect that, if only for clarity when 2.25 is actually released.

Ross

--001a1142ba205c2b6c05465ec1ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2017 at 20:20, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":2xh" class=3D"a3s aXjC=
H m1599457b32a34db4">=C2=A0.../<span class=3D"il">glibc</span>/{<a href=3D"=
http://glibc_2.24.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.24.bb</a=
> =3D&gt; <a href=3D"http://glibc_2.25.bb" rel=3D"noreferrer" target=3D"_bl=
ank">glibc_2.25.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 ++--<br=
></div></blockquote></div><br>I was wondering what the actual version was a=
s this isn&#39;t 2.25 yet.=C2=A0 The libraries are actually <a href=3D"http=
://libc-2.24.90.so">libc-2.24.90.so</a>, so I think the recipe version shou=
ld reflect that, if only for clarity when 2.25 is actually released.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a1142ba205c2b6c05465ec1ab--
