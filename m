Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B14473189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 20:29:00 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id xj3so46980228obb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1yGHiC2wCIDsyACdAQzIbu+SQ4BTkAjxajFMamwgIbA=;
	b=zU46PpKjRANd3ApnpMXHaLoxys0S3CDy3/cwe+qvRZ4+EWGP9a0FGGGuYWPKxmUCo3
	qsNPaift8Laz9RHBYDVwt1RXxQy5/WG2nXO1Y5qoYgtNNr6wpxd9fOae+GSl8xwadOVV
	ihD0kdfJI9brIQBzz7XhOIMbEaEXZHHJT6SgEp8TMNSx3WEiOLM8xN0+trfhhhNx4hbh
	IvstcQMICZnFn96VMCKagE5IPgsPhw5tuXs68DDSG8cAp1TA4j5/+GGFZBuQ4ZNyzLBK
	rq1cHHdkzUaVIK/VmGYdyNVu5v5z77CLMVA9co3Y4yNDtFU1MTwGazZcy9Oe+85Fh9hI
	YaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1yGHiC2wCIDsyACdAQzIbu+SQ4BTkAjxajFMamwgIbA=;
	b=hMdrewUKvLiUwxqSVaSTzL1NjKF7cLsqUK76xhWpFDFjb5f/PGiqyLVaeyoViYWcIY
	jG6I2aGNtyjeZ6WJf+fQfOzmSRfyw+O+IxGKw71e/y02fhrgCC//lNEttmrmJTXAgg6q
	++n46jvqJVjZQ+4UwKk8vcVgkdX/MoyRUEFbI/pBZT41V2MiZ4CxmUV1Svf8msSuvh6I
	IpBtMj/qb5yZfs6EAoZA7gS2ikkz7r47aHa8NcG7QMsk+/+mt/swO/OKdYZUeJIZHtDc
	l4SDsX3OzMpC8fwHV8WeOai3K1xJmSuHfOaz/gM+fT9STQxLKM2K0vSJCmsKdaSjrfw2
	2utw==
X-Gm-Message-State: AD7BkJJtdLwRQpOftNYJw/0wjdqU2pYSwHwoZJWF3r65ia6LOfiiluEeRzJovTazFVEUa6rTT7VLaV6oIvHK4iCH
X-Received: by 10.182.138.7 with SMTP id qm7mr5646732obb.58.1458851341072;
	Thu, 24 Mar 2016 13:29:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Thu, 24 Mar 2016 13:28:41 -0700 (PDT)
In-Reply-To: <1458850608-50481-1-git-send-email-kad@kad.name>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Mar 2016 20:28:41 +0000
Message-ID: <CAJTo0LZan9vSeSBKfCFhaERpES5HuFwT9nkRsxo4uAx1y+WBNA@mail.gmail.com>
To: "Alexander D. Kanevskiy" <kad@kad.name>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 24 Mar 2016 20:29:04 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1cca8f714b6052ed14b6d

--e89a8ff1cca8f714b6052ed14b6d
Content-Type: text/plain; charset=UTF-8

On 24 March 2016 at 20:16, Alexander D. Kanevskiy <kad@kad.name> wrote:

> Existing compress framework for producing various compressed versions
> of images is powerfull enough to be extended for other uses, e.g. to
> convert types of images.
>

Indeed.  Sounds like we should rename COMPRESS_* to IMAGE_POSTPROCESS or
something in 2.2.

Ross

--e89a8ff1cca8f714b6052ed14b6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2016 at 20:16, Alexander D. Kanevskiy <span dir=3D"ltr">&lt;<a =
href=3D"mailto:kad@kad.name" target=3D"_blank">kad@kad.name</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":gcr" class=3D"a3s" sty=
le=3D"overflow:hidden">Existing compress framework for producing various co=
mpressed versions<br>
of images is powerfull enough to be extended for other uses, e.g. to<br>
convert types of images.</div></blockquote></div><br>Indeed.=C2=A0 Sounds l=
ike we should rename COMPRESS_* to IMAGE_POSTPROCESS or something in 2.2.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--e89a8ff1cca8f714b6052ed14b6d--
