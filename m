Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 660CD78302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:34:55 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id n195so3094219itg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UFhfcNIyIHfjDZvIDZHBD8Y1YgiQpX0ecB7tA/gcXqY=;
	b=1yiOpRL2aQMHz3ewl+X3B441SV0W0i0uFyl+XO3pjQjD7XI7KB7yRJH0UvRJD/CNDm
	QcnbYudJ9I436x0F35ZyIMZXzEymaR+3BZ/aklTPaKLGJuyWI6n44SG6BKiHw411qDrV
	5io7Ip35yxwO0qK2DaWbL1tE0OOmD3pPBamHf1o8Q3tIS3JCohgwhOLk09yx65RGq3UJ
	CFbtjJ74HOEYngqWWCwwy08IpmRoY4rCBPI1AxWEcGtKvMtkdIJHxJ3l6L5BRhxYKjpD
	g5RDMgDEP0r6S1CcZ1KXNnkh0wfnwzpvY/fTEKPBSzg7396zWMBgHC5mQqV7z22rRC8m
	slPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UFhfcNIyIHfjDZvIDZHBD8Y1YgiQpX0ecB7tA/gcXqY=;
	b=DFsFeQB8HqMoYPBc9Kqy/ELssY5io176lzzOoEZPR9IVczaghAGSgB4FOFnGcnv3yI
	0DuPMD+GDNWJG+c4YFUoiqhO3pesEDwwQ6z1+zmlzriSeRQvqH16LdFw/2SJevsHWzM3
	xAwMFXszVymrryVO303iEkj5vdbbi/vF9isVSFTpTnLc2rswcm/zLZJSTTIy8OwMy6ii
	1V6n57yqXYgNVziTsjdJsmgkJdD/86KDPeA545YBfy6i7yfmdzaGHfjG39+JRo4r/S8M
	yC+Xo4zcUgoHJWN2a7LtAM4RNGF6xX1LjnIo4fumc87ueGOIlzW2zY588mjyWWVS2Cy0
	jE1A==
X-Gm-Message-State: AMCzsaVLgXyqW1sKEhzetJOaZGFdnjt3ZAKG7xCSZsXN+NIhG04nmhe/
	UD23OfJW4hyFeAOKw/iAR6+Or6bGpPApTEzsFE87DQ==
X-Google-Smtp-Source: ABhQp+QCeBeDDwPc5JJeDihMbHk8C585VDJrx/3MwkxufTRsEo0Fu/RBp4MkPIAANPwd7++w8+vCmUe6mZJ0g9zf310=
X-Received: by 10.36.138.133 with SMTP id v127mr6510795itd.151.1508258095965; 
	Tue, 17 Oct 2017 09:34:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 17 Oct 2017 09:34:35 -0700 (PDT)
In-Reply-To: <CAP9ODKpRhkqs60cd46V0ngy31PJyA4mO+sCiYrHcNQmS0Zfi=w@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-4-raj.khem@gmail.com>
	<CAJTo0LZC2At7Jnni1eLBTXyAdWsNVf-ynAVX8thc1EOujnsRuA@mail.gmail.com>
	<CAMKF1sov3p8viw9h1SjNF9Hyz0X5LuMqbJ4JnyFw-7HHxnKTLA@mail.gmail.com>
	<CAJTo0Lb81WDPU5mFKi+5SJkuqXDgxFEwnD2LLCMk+T24_M7nWg@mail.gmail.com>
	<CAMKF1soaVRfyvgYcZy2TSfjgOT+Er4eB0kCKtWd0_wqbZwH17w@mail.gmail.com>
	<CAP9ODKpRhkqs60cd46V0ngy31PJyA4mO+sCiYrHcNQmS0Zfi=w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Oct 2017 17:34:35 +0100
Message-ID: <CAJTo0LYP_8ad247vn-hVxTuhWAS29tqUmiKnX8eW9_eAbyCdrQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] libevdev: Add dependency on libcheck
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
X-List-Received-Date: Tue, 17 Oct 2017 16:34:56 -0000
Content-Type: multipart/alternative; boundary="94eb2c0800860a7ab0055bc0b470"

--94eb2c0800860a7ab0055bc0b470
Content-Type: text/plain; charset="UTF-8"

On 17 October 2017 at 17:32, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> > and I am using new pkgconf
>
> pkgconf is broken on master as far as I know.
>

It breaks with the wayland sysroot patches, but that's the only known
breakage and they're not in master.

Ross

--94eb2c0800860a7ab0055bc0b470
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 17 October 2017 at 17:32, Otavio Salvador <span dir=3D"=
ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D=
"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">&gt; and I am using new pkgconf<br>
<br>
</span>pkgconf is broken on master as far as I know.<br></blockquote><div><=
br></div><div>It breaks with the wayland sysroot patches, but that&#39;s th=
e only known breakage and they&#39;re not in master.</div><div><br></div><d=
iv>Ross=C2=A0</div></div></div></div>

--94eb2c0800860a7ab0055bc0b470--
