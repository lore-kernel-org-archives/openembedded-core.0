Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id DCC2C6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 15:59:07 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id f6so65707072ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jul 2016 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RkU0S4iYcdLjXnjuwMSdzpd7ehpBteuCcNEVb0eqZ7g=;
	b=L+XhYCPJPGcJdfgER3CKoVH/Gbmj/OvozwFLwaJDZ48spaL6uZtcXVABGFE3fvDN0l
	j090C0LdS35VFxhC4UC+uRHsrxcS4S6Sk5v1+3Hc9ArMHkLyt9E3JEhooEK2t1R2FdKw
	esLWd9eUvArX0c/hzdR1m6W6Vuu8pAsgEMqQ/ixnTFschiLCrBdXFYag8yCkXx+WbaO0
	h8hslzZ0n2kpHc4XBjW4GHNyB8cyyDKM2WOn0yOp9BTgV3s1GCDQ/+4BvInzX3rCRbM4
	cloJIVM30SSFY68qBFjp0HQApPigG8XSufF01lCSXRrmuYBa6ww4LfkHs2ideH/kdBNR
	GY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RkU0S4iYcdLjXnjuwMSdzpd7ehpBteuCcNEVb0eqZ7g=;
	b=gZZ5XLnLBR4Ed4kjcHCwHTYAnD22Af/R7zx6k6rcKLPcd/GuVkVUlz6ZcYkahFox1U
	vFohnJ31e4KZ1rA08CGMKzb7iNsuC0e5cHo9EL8y4qWBGfCbAY0u84AlU3In1G0uQbIY
	t9APfBdmtjWZgd3eE3n8vP5dDxEKvJOKYlj/LjR17hr8h/0dp4Jrfm6XYLDnP7kCRDxN
	L33PS3CZJFhcFBEaGjoqW2uJs8HtvPBPXnUBFr9H5WsVpikHvtlyTp96DFrQk0IKq6Uz
	kJ4MnKFeox6ZsN+MWzA4s9R5iZB1noU+ZPck5fOttRZnwKukMqgKJ+4BLduZTyrlctkZ
	dC4g==
X-Gm-Message-State: ALyK8tLivi27inJLJ9ONQix66M4MV6TM8KmWITXoSaPLLUCcPnBlx5LNfbkGE/nezv7t/CRAA380POXZudNdFFsG
X-Received: by 10.36.20.212 with SMTP id 203mr9308636itg.83.1467647941484;
	Mon, 04 Jul 2016 08:59:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 4 Jul 2016 08:58:42 -0700 (PDT)
In-Reply-To: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
References: <CAJ86T=XCwABdHj0rXHFsfK9pLndsKGQYv8R2=jOh4tz_9HmeAQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jul 2016 16:58:42 +0100
Message-ID: <CAJTo0LZjsiwdv6QB1SdDmyxtTvByjyiend_uSnXFQ_tRi8HwcA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatically creating tar files for bin_package.bbclass
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
X-List-Received-Date: Mon, 04 Jul 2016 15:59:08 -0000
Content-Type: multipart/alternative; boundary=001a1143e198354ce50536d16afc

--001a1143e198354ce50536d16afc
Content-Type: text/plain; charset=UTF-8

On 4 July 2016 at 16:00, Andre McCurdy <armccurdy@gmail.com> wrote:

> Say I have a proprietary library which only I can build from source
> and I have a conventional recipe which builds it within OE. I would
> now like to create a tar file of the library and headers etc, plus a
> companion recipe based on bin_package.bbclass to allow others to make
> use of the library in their OE builds. ie the situation described
> here:
>
>
> http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.html#packaging-externally-produced-binaries
>
> Is there a recommended way to create the tar file to support that?
> e.g. a class which automatically creates a deployable tar file of a
> recipe's ${D} directory?
>

You *may* be able to use package_tar in the recipe in some way to achieve
this.

Ross

--001a1143e198354ce50536d16afc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2016 at 16:00, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":lr" class=3D"a3s aX=
jCH m155b66d756d8ea95">Say I have a proprietary library which only I can bu=
ild from source<br>
and I have a conventional recipe which builds it within OE. I would<br>
now like to create a tar file of the library and headers etc, plus a<br>
companion recipe based on bin_package.bbclass to allow others to make<br>
use of the library in their OE builds. ie the situation described<br>
here:<br>
<br>
=C2=A0 <a href=3D"http://www.yoctoproject.org/docs/2.1/mega-manual/mega-man=
ual.html#packaging-externally-produced-binaries" rel=3D"noreferrer" target=
=3D"_blank">http://www.yoctoproject.org/docs/2.1/mega-manual/mega-manual.ht=
ml#packaging-externally-produced-binaries</a><br>
<br>
Is there a recommended way to create the tar file to support that?<br>
e.g. a class which automatically creates a deployable tar file of a<br>
recipe&#39;s ${D} directory?</div></blockquote></div><br>You *may* be able =
to use package_tar in the recipe in some way to achieve this.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e198354ce50536d16afc--
