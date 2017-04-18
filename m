Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6ECC971CA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 20:30:28 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id d131so4119744qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HuZBrQVkRAKX3PK+XHqFaNWzpwX+dalZxN8iXZj3n5w=;
	b=RmzFbCgmgTATOAbx5Ovrj6tQw5M0o4SNnYfbjKy3CK+ahz/GZTA4nqsZgfO3Fsig9N
	4uc5qwaq/9JsMcpmcujkhtrMMEQxDmPWrAAObrCuNN0/0X6mSoWCpx2sVfGiW9UMQoWV
	CjSeweis5NDjuu87xseg/0jSg44Tz7Dre+Hyl2s1iirDQfDK8rFi+8QpTT2IbEx/mkh4
	/uFB95li8QzJXR5vJ8nukDvzT+TZd4Ej378D3+CyDu3pb5KvfHidBgBqKkAtY8gvJnKW
	kw5EkEiyDVkfIy0LmkvSio+GHsCsJhz6g5VPEHecNyJ+XaC1JPo+hi5blGKNWtjic74F
	98Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HuZBrQVkRAKX3PK+XHqFaNWzpwX+dalZxN8iXZj3n5w=;
	b=NsXzWID2TT8v3HZXg0iSqZZ/WPt9GQ9pDjU7z4AFJTpA82tsoKDQyvWt9fk5rlIcKj
	PD6N1H9rRfz1Euv8LmdA8Fa2fdnGpN2os4YfiVMmd9XB3ud8Jw3LILKgXq30/5OBkaPT
	bjqupsARTnwtTdocbU0c6j1fdgKDWzRdfQ/u44t3M8pK9wBFGvpESseYOSxk+MJLUhji
	NzuCvUq1a1Ycfryyf5PPukrUGMvJ1JTrFbszBF+mSuvSNx8A+WHKrBDKh9gfhepAhjBn
	hRJa9LMIgCCjmuhK3c83/xsEO+4c0PBGRN7YivF8G0mMz5ifBYd0/aAgDq+bXqywAKKp
	2XwQ==
X-Gm-Message-State: AN3rC/6SW7Qr9zevlKg7S3Uc62GKIUyP7nmaq2KVbJkLEl3NUMrkIF+1
	hq0nNzAmAwUdWe8KcNHJFqYePvi3ntLR
X-Received: by 10.55.18.91 with SMTP id c88mr16643502qkh.3.1492547428490; Tue,
	18 Apr 2017 13:30:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 13:30:08 -0700 (PDT)
In-Reply-To: <20170418192820.27256-1-twoerner@gmail.com>
References: <20170418192820.27256-1-twoerner@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 21:30:08 +0100
Message-ID: <CAJTo0Lbhos-V4tGZy0E+5+ys2YYFLPSx-2FSJrQLjX2XOaAY9w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: libgl has multiple providers
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
X-List-Received-Date: Tue, 18 Apr 2017 20:30:29 -0000
Content-Type: multipart/alternative; boundary=001a11473eca493172054d76c740

--001a11473eca493172054d76c740
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 20:28, Trevor Woerner <twoerner@gmail.com> wrote:

> -PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
> +PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,virtual/libgl"
>

That's the runtime dependency not build time, so virtual/libgl is wrong.
Mesa for example generates packages called libgl-mesa that RPROVIDES libgl
and libgl1.

Ross

--001a11473eca493172054d76c740
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 20:28, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":u0" class=3D"a3s a=
XjCH m15b8289fb761c032">-PACKAGECONFIG[glx] =3D &quot;--enable-glx,--disabl=
e-glx,,<wbr>libgl&quot;<br>
+PACKAGECONFIG[glx] =3D &quot;--enable-glx,--disable-glx,,<wbr>virtual/libg=
l&quot;<br></div></blockquote></div><br>That&#39;s the runtime dependency n=
ot build time, so virtual/libgl is wrong.=C2=A0 Mesa for example generates =
packages called libgl-mesa that RPROVIDES libgl and libgl1.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11473eca493172054d76c740--
