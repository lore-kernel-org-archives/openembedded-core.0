Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 443F460851
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:17:20 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q21so191036052iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BWPjGAfKt2o/jaeJd5mfAOrHgV4ThmXNikBp6JCV0UQ=;
	b=rIA57OpnmybIjkT6HeVgrTjAe6tsdMz/xGZB+vtMZ0d3MmkfRRVHwh0DaD3ayh9osr
	LC/p8CTgTdohOmt0Z1zvvLitwlpgn3//JOHNVWJH7e51j0Fi0UW8aX3uC3lHIEppLqlj
	/rYNhzzXs/lk00IGjbqNiyu+4o8o97s59DAAakyO/COmh7Adaf0SzvPZwe4TcmgNq+xl
	XeNTLibe+h2pQVrfvfG1tvtb3/OSXNaoWiI4r8s0rXhaxH1sLT55xSSDz/FpjOlZZibO
	ejeRNOtV0pozBHg9gtofuiZpw++PEQulj1gcYUw76O/qL/pUFGPSV4FDBIJJXiMCAMrU
	1HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BWPjGAfKt2o/jaeJd5mfAOrHgV4ThmXNikBp6JCV0UQ=;
	b=L2LQUccIWmTyNdmyoMRg2Apzq2z+TW/NMVNme3izWg4YBxPja1LIBHd/qM4k2x8rZK
	ak06mkG4ieR2N5d+0H/bZfrio8psMOGlUJz37U5pvC6SLS+MtGu5cc+F/2mRH8emW/3C
	fRBsFaDb2Yedo0Pz/pI6m3pvpi7Q0sYjNCgOvzcyZ3Um0PlX3dSwLoRUMc6T2PrAULka
	Ea6hOWN0w14/p8+i4hW8o5oHI1okLzPUScxiSTpkn0r0wuyGcGdmT5Kar50AuRQZEDgS
	sSXb0Lbyh72kj6X0VKmuyH2/wQyB5xWEuxij2fPh+VnI60wcjrmpMF2H1qw58/fqQIO9
	4rFA==
X-Gm-Message-State: ALoCoQneIeXA9Rf+CLzd0SYd2j2b/kc8ZNLbeIXox1Hwd6foxZ6+DufLJk6PJeNYP1qVy3qAzGNVXaeSx/RrztrPJWFlUNmgA7b5wyXWvuVNiUHWRwkgyMY=
X-Received: by 10.107.135.104 with SMTP id j101mr57241958iod.133.1452010641214;
	Tue, 05 Jan 2016 08:17:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 08:17:01 -0800 (PST)
In-Reply-To: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 16:17:01 +0000
Message-ID: <CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Tue, 05 Jan 2016 16:17:22 -0000
Content-Type: multipart/alternative; boundary=001a113ebe927aef900528989277

--001a113ebe927aef900528989277
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:

> I have done OE-Core only clean world builds for all Qemu machines
> without a single build failure and
> runtime boot tested.
>

I threw this at the autobuilder and glibc failed to build on one of the
runs:

http://errors.yoctoproject.org/Errors/Details/26057/

Ross

--001a113ebe927aef900528989277
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2016 at 19:00, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D":pk" class=3D"" style=3D"overflow:hidd=
en">I have done OE-Core only clean world builds for all Qemu machines<br>
without a single build failure and<br>
runtime boot tested.<br></div></blockquote></div><br>I threw this at the au=
tobuilder and glibc failed to build on one of the runs:</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.=
yoctoproject.org/Errors/Details/26057/">http://errors.yoctoproject.org/Erro=
rs/Details/26057/</a><br></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a113ebe927aef900528989277--
