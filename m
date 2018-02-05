Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8B2784D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 14:51:02 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 72so30451470iom.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 06:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xmfyPuvs8OuFmTo1XM1BSOqmTJFdIx9h1RBH74e23JA=;
	b=Ueam9cu6WP6mRAkxeJOThjSon2XD5129jB+7Fg8mar7FJhl9q2zNA8M9SFEnzqOl4Q
	jJ587sObWil5RmiZFdglMlpaAo0weGShRd5aSxNJbJuHD9HpdOvoLRczzETM8G/Uy17o
	b0WwA8x8/ryY0YTPTDJTWB18Q6j/utmFQc1Ssff6NOtgQzXhY6MaAjYKQzLUCcDsYvsY
	CCYiv6W7nWJb+zMDI8H2+J4clM/3qqxHpVbXbzXJPXA4IulHLVxV3FSofyjFKIm9Dbf+
	ZRWp/FMpgaEA1/qlaQXvg0FQH0Sh4CAwMrtINq42YeTIPwK5alp4YVZ0rwIl8ZQuITWt
	KVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xmfyPuvs8OuFmTo1XM1BSOqmTJFdIx9h1RBH74e23JA=;
	b=ct2qskxORuXk7Dd+p+Fs1wwQtoAwU8UENM+yrSwssVmBnEKSy9/rVBa2yO8QWQEu2Y
	4zK6XG8UzeeLoaC9b4LeckX6pVb2E/X15xnsQvwO5vtDAuI2rUFM07okq4dh6p6hbj5K
	YxzFxhM+LsHsWrUoeW/w4XWvUjx14zV4j36HmwPHh6i7SH+UXU79XI4MGySu6wJIfTYK
	relGFh2SfQbcvZkmxY52sPcplafQJ5inqhCIe9kaOAr5SVAVyyzLri3KXx4Egy/9U4bq
	lCDtHNJmeXpUWgluNDKYqTQEjo06lZJhomZalF4JSjMpCQA3e9rDCRZenfiwE08RSvAj
	EaSQ==
X-Gm-Message-State: APf1xPCNfPQvnayg4TDWnvkjTR3Xlm+euv0YKNX5x6VYYevCatWoZK19
	QTsB4NhF2Mtc0IxjJFI/0NIr4lDyfBK215eTIAabXg==
X-Google-Smtp-Source: AH8x226wQYgMSRp4VQrsMbFZeEGAgpDCh4VLZkiC3u8ln1JKqiRqGOrpCmnw1UsXTmc6IAFlhu6JEt+oxHUfHCJ/vjw=
X-Received: by 10.107.9.154 with SMTP id 26mr9517965ioj.52.1517842264135; Mon,
	05 Feb 2018 06:51:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 06:50:43 -0800 (PST)
In-Reply-To: <1517811692-28225-3-git-send-email-anuj.mittal@intel.com>
References: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
	<1517811692-28225-3-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 14:50:43 +0000
Message-ID: <CAJTo0LYjqJd5K5q7_Xie--URMSzqagSpRLrJaPk+6N2kBTrC6w@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] libva-utils: upgrade to 2.0.0
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
X-List-Received-Date: Mon, 05 Feb 2018 14:51:03 -0000
Content-Type: multipart/alternative; boundary="001a113ea2b6fad43105647830f1"

--001a113ea2b6fad43105647830f1
Content-Type: text/plain; charset="UTF-8"

On 5 February 2018 at 06:21, Anuj Mittal <anuj.mittal@intel.com> wrote:

> -SRC_URI = "git://github.com/01org/libva-utils.git;branch=v1.8-branch"
> -SRCREV = "011c709b98b52db3b10aeb361dfea9da43930364"
> -UPSTREAM_CHECK_URI = "https://github.com/01org/libva-utils/releases"
> +SRC_URI = "git://github.com/intel/libva-utils.git"
> +SRCREV = "505216d0e0d30273f665c888d4c60aa694060729"
> +UPSTREAM_CHECK_URI = "https://github.com/intel/libva-utils/releases"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
>

There are proper tarballs available on the github site too now:

https://github.com/intel/libva-utils/releases/download/2.0.0/libva-utils-2.0.0.tar.bz2

<https://github.com/intel/libva-utils/releases/download/2.0.0/libva-utils-2.0.0.tar.bz2>Can
you switch this to use those instead?

Ross

--001a113ea2b6fad43105647830f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 February 2018 at 06:21, Anuj Mittal <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">-SRC_URI =3D &quot;git://<a href=3D"http:=
//github.com/01org/libva-utils.git;branch=3Dv1.8-branch" rel=3D"noreferrer"=
 target=3D"_blank">github.com/01org/libva-<wbr>utils.git;branch=3Dv1.8-bran=
ch</a>&quot;<br>
-SRCREV =3D &quot;<wbr>011c709b98b52db3b10aeb361dfea9<wbr>da43930364&quot;<=
br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/01org/libva-uti=
ls/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/01org/=
<wbr>libva-utils/releases</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/intel/libva-utils.git=
" rel=3D"noreferrer" target=3D"_blank">github.com/intel/libva-<wbr>utils.gi=
t</a>&quot;<br>
+SRCREV =3D &quot;<wbr>505216d0e0d30273f665c888d4c60a<wbr>a694060729&quot;<=
br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/intel/libva-uti=
ls/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/intel/=
<wbr>libva-utils/releases</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;(\d+(\.\d+)+))&qu=
ot;<br></blockquote><div><br></div><div>There are proper tarballs available=
 on the github site too now:</div><div><br></div><div></div><div><a href=3D=
"https://github.com/intel/libva-utils/releases/download/2.0.0/libva-utils-2=
.0.0.tar.bz2">https://github.com/intel/libva-utils/releases/download/2.0.0/=
libva-utils-2.0.0.tar.bz2</a><br></div><div><br></div><div><a href=3D"https=
://github.com/intel/libva-utils/releases/download/2.0.0/libva-utils-2.0.0.t=
ar.bz2"></a>Can you switch this to use those instead?</div><div><br></div><=
div>Ross</div></div></div></div>

--001a113ea2b6fad43105647830f1--
