Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8242071988
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 17:08:32 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x190so302140466qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nIiMAsCnYnYV2blyOgdz4qq8K3T/t7GFT6uule2hWAk=;
	b=TuSErFQ7AxB28ow/s60k9x54pveS/EH1jv+0ZaK4gRmy3vDrk2PAw6lVikdDJxhXGb
	Ch8ErqXe1qrsZUN3v6U94N1KKNL9yZAp6dPM5CcwkuE98f6rxwg6JKNjrTWVSMIhdTLy
	s3n+S5fJV4xp+8EUd4HNtvZArmhUh6ORAj6Gk8K1PnibzGALiYMiEZCBov97sgOc3XIf
	k2vbYrRFgiWvU7jkE8Vks7VUrjM4bYhUjFUSQUWaXvjMHDuuJlYu8J+Qq9DlvBb3B7Qs
	iQ7ddDmXvkovOH7dL9LjwCb1L4PYDCDYwtuCKgXSiBPI5sBRXcNW8HV+bLfgfi8h6lOs
	8i8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nIiMAsCnYnYV2blyOgdz4qq8K3T/t7GFT6uule2hWAk=;
	b=da99AOJCXyZBM/vaHt3xjMKlxB5KUPKnn0sBqQBMetiKp7ltnwwy9j/SEDFCzaw8b+
	YxGK15UvDSscLo/GODavcBYpWl8MPkTHCMzlIbquJFWi/9/Ap9TPRhUOhGpYMn8OX0FY
	RU9BotUk3R6tQlbKDauabn94QgcoUuy9aNHV7LD1At8PGXAhHrJH8tUCUeInp1B+/y4/
	m3CheKmTjE0HXZKgC7zLRFOIkJiQKqu7OXH4QDO4C8Oo6Vjh/+CoDoIauJEp1TAKITLu
	xu6LTcTV8Dhrjup3z+SKDVYjCJxQb+RofpeZuwrr+lP7ZSTY+u4F2K1F8fo8OTKtjlo7
	/ZjA==
X-Gm-Message-State: ABUngvebsHF38tmU+/Ovee+nIHMEbQChH2ckzrkt09eExMDmz0tTveU5zL71+uqnUsi0lHaaFKSzoAu50VykZLY4
X-Received: by 10.55.8.20 with SMTP id 20mr7426058qki.3.1478797713491; Thu, 10
	Nov 2016 09:08:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 10 Nov 2016 09:08:13 -0800 (PST)
In-Reply-To: <20161110121414.12937-1-otavio@ossystems.com.br>
References: <20161110121414.12937-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Nov 2016 17:08:13 +0000
Message-ID: <CAJTo0LbQYQwY07evm3Re4x2_Bu-6AmcCW3_=GuAWGOJxGxFQ9A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-native: Extend RPROVIDES list
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
X-List-Received-Date: Thu, 10 Nov 2016 17:08:32 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6068610d0540f56c34

--001a114c9d6068610d0540f56c34
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 12:14, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> @@ -46,6 +46,9 @@ RPROVIDES += " \
>      python3-compression-native \
>      python3-core-native \
>      python3-distutils-native \
> +    python3-datetime-native \
> +    python3-enum-native \
> +    python3-terminal-native \
>      python3-email-native \
>      python3-importlib-native \
>      python3-io-native \
>

Is it time to extend the manifest script to write this for us?

Ross

--001a114c9d6068610d0540f56c34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 12:14, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":56e"=
 class=3D"a3s aXjCH m1584e350e930fbb1">@@ -46,6 +46,9 @@ RPROVIDES +=3D &qu=
ot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-compression-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-core-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-distutils-native \<br>
+=C2=A0 =C2=A0 python3-datetime-native \<br>
+=C2=A0 =C2=A0 python3-enum-native \<br>
+=C2=A0 =C2=A0 python3-terminal-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-email-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-importlib-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-io-native \</div></blockquote></div><br>Is it t=
ime to extend the manifest script to write this for us?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c9d6068610d0540f56c34--
