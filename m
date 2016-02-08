Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 97E75731E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 22:43:39 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id 5so79200igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 14:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v8O2APaHROV4j7VzIyMpYRlQe0OSLDXJ+gDVkgWiOMg=;
	b=chsWIb8kD4JvBVClAJdv/QM/V1pQvFhdUJyHOFNa1nLPDEh+uUalJsipjfCvApRZiB
	buHN0lTaZc2DpalXt5NFZrOGNflGdj9oxvF7N6HS/8D46nymE+zOKBei1I8Z20CD7hA1
	dfyu64mbtJIDqZsa6XzvotnrWtOw/jOhSBDgFXz7j+z1fMVakX6f/YFVZ3FQUVXLIadi
	QSs+IQwWR9I5JQc9CRjQzQUTGGikdh4YbIcAZIolA3WOtRpd3OH1qO/nPb2EZDKFfP+B
	M041o79h4YKYxt4oMVleNazuTAdQy96+QqAhXxlvtwgI75RdaMaWDdMncX147wICkHec
	V06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v8O2APaHROV4j7VzIyMpYRlQe0OSLDXJ+gDVkgWiOMg=;
	b=WDFJiarQuPoR0Fk7S90rsQ9a6JAW0rrDT8i7j3c/A7Y7gaLiowhOCdKmJ99ou+ddlU
	nUpolu3bPBsPdG8SVy0T/OwcFZGvll3nBi2FDnd0oJqGWbP/C1yKBKePTOi1hezbTqbj
	69vPugXD+ah0+oYTVKTlXpFtIdmJeGbWKkoTGZJhbw1mOF+s+0ezhRedzhLz+WMkw4vQ
	9VjGWxVGRP4h6dSOI8poPuTja9kMW/TOMyJ+5GYfiZ3Wid4MFZEM1fJO/TNkMS/PAkz0
	zDFKnLezgB4bljG1cz+2rmhRZ2h2PSCdcDv4Iw8HGAQc0APpT510qWpcvbSKsU7+nNyK
	iV0A==
X-Gm-Message-State: AG10YOR6QvL1yW+6KAnMmBI1I/gbvgVxwe6Kg6630tfngoYvYhyYwctU+728QQ9tNFFkvgfJnxh/FX/r0uXBFtv6
X-Received: by 10.50.43.133 with SMTP id w5mr1252237igl.52.1454971420361; Mon,
	08 Feb 2016 14:43:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 8 Feb 2016 14:43:20 -0800 (PST)
In-Reply-To: <CAJ86T=WxJLfU0rObHB3oZ-4DzharyiWxQfFzxkuTQ6VDAX9FjQ@mail.gmail.com>
References: <1454944563-30448-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=WxJLfU0rObHB3oZ-4DzharyiWxQfFzxkuTQ6VDAX9FjQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Feb 2016 22:43:21 +0000
Message-ID: <CAJTo0LYFxUujG2SY3DXbbFSYw7=zifYrPs5x858iqBDZYa27Vg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-corei7.inc: tell qemu to emulate a matching processor
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
X-List-Received-Date: Mon, 08 Feb 2016 22:43:40 -0000
Content-Type: multipart/alternative; boundary=089e01175f2bab63de052b49ee8f

--089e01175f2bab63de052b49ee8f
Content-Type: text/plain; charset=UTF-8

On 8 February 2016 at 19:27, Andre McCurdy <armccurdy@gmail.com> wrote:

> What about corei7-32 and corei7-64-x32 ?
>

Yeah probably sensible to read the entire tune file isn't it.  V2 incoming.

Ross

--089e01175f2bab63de052b49ee8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2016 at 19:27, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":lt" class=3D"a3=
s" style=3D"overflow:hidden">What about corei7-32 and corei7-64-x32 ?<br></=
div></blockquote><div><br></div><div>Yeah probably sensible to read the ent=
ire tune file isn&#39;t it.=C2=A0 V2 incoming.</div><div><br></div><div>Ros=
s=C2=A0</div></div><br></div></div>

--089e01175f2bab63de052b49ee8f--
