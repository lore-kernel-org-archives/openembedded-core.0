Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A3829770C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 10:59:32 +0000 (UTC)
Received: by qkca6 with SMTP id a6so51848468qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 03:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WjR4AE5cqXkjiQzrLya/C5kg6zP1OkvcsZVCnel5LOg=;
	b=U1dtNYwjz7VfMuXLnBHszD5aVphraX1yIx0rRQfQpxOKifK7SJ3gJPojeBC70yG880
	gRN9Nx0emE0576LY0TBdWvJqetK6vCpOuYYaTM9wdhxNxLj3ngLdtl2Qq6+bvZq/afbG
	AziiBci9JQpx/pSWGxcDXlN+EhziqBEnfa+5liMOjH9CtRU/4ngp/h5TuYH4PIJ0CzZm
	xotbG4lChUk5GwlImpjs3Cal1651Xq5IxQfUmPpOyCxsCiLtyHep5jpjazI3fHLK9+a0
	dsYut9ZD9bhBqPC6Ndr/PzjYKMXbJA12c5TZS/8c9/42o1j4VEAZ8B1PqmzN99CcpSgd
	0zfg==
X-Gm-Message-State: ALoCoQmc3VpVc0PwSt7pqtdWPrw2CwlMRT8S3sBxoqwnx40/E47LIJb00Vhr0oEVAJ6ladSoMVNL
X-Received: by 10.55.192.13 with SMTP id o13mr17210906qki.83.1445511572982;
	Thu, 22 Oct 2015 03:59:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 22 Oct 2015 03:59:13 -0700 (PDT)
In-Reply-To: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
References: <c64105ff4adca9a4e05280aa52644919d646d660.1445449278.git.andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Oct 2015 11:59:13 +0100
Message-ID: <CAJTo0LZ4eNqiyX0JzPEb=FLAk=k=2p2c2+c5mKd77a0zquepAw@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups: explicitly configure with systemd when needed
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
X-List-Received-Date: Thu, 22 Oct 2015 10:59:36 -0000
Content-Type: multipart/alternative; boundary=001a11479cfcd3a9a10522af63fe

--001a11479cfcd3a9a10522af63fe
Content-Type: text/plain; charset=UTF-8

On 21 October 2015 at 18:41, Andrew Shadura <andrew.shadura@collabora.co.uk>
wrote:

> +               ${systemd_system_unitdir} \
>

This isn't needed as systemd.bbclass handles it for you.

Ross

--001a11479cfcd3a9a10522af63fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 October 2015 at 18:41, Andrew Shadura <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura=
@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":689" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${systemd_system_unitdir} \<br></div>=
</blockquote></div><br>This isn&#39;t needed as systemd.bbclass handles it =
for you.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11479cfcd3a9a10522af63fe--
