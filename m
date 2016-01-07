Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4753E6FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:46:49 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id z14so36632799igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 07:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vUqK9Ihq6EH6sgt92qeAPGIpNA0N5dKdU/PE8b0R44I=;
	b=mft6hpY4wI5HOlNZcOMjpT9r5xkmKJvqVfOUSF6sBOGOPgsjz1a9XkBCI5NfnMgLuZ
	G9dtLF/xB5RXU8/6gTeM4RtnWZHn9lNcNbMkVqqEC7UR8cEP0cUgxiYowhACjjqxe0Dh
	ECBjAZtcxW3l3hVXjt9Kkdi5NBJY4Am2geCNZ+ddseXcECWDxEkgo19X3yeIk23Utkdn
	qdSB0+9CdtrJV9ZcaXOcxZ0RzdaIL66e565uxdoIfdNh97koMdv+PwC7Nrjn1gvzmBM7
	xePI9qUeDcV4NVOtoWv3fmza85MZLDUg6HT+ttddrLq50Jv+vF5Sqq8wtQGxDBM5UauD
	tDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vUqK9Ihq6EH6sgt92qeAPGIpNA0N5dKdU/PE8b0R44I=;
	b=ikY9DXhkg8b0vauI2hZgJmXmKkuV0Coxa23VK8/N6R7a7eVPia1JTBEAMb1kD1j0a4
	dDcJ3lzKPSZuk+TRANc4woocM4E4D6DGuSbP4TjYNRzak9/JLgygycvKJy2dMR8Otv9Z
	2jlzo6UOP4WiFRN34skmgC+zoiw/DMATYaMev1rmPa4CcMppCSOixnFqyOWS4v48hen1
	XoOO5gsSxw3CcNe2X8ppFTfnkJCL5mHTzRzW4LIEJHYfBr9igYxVWEIsWL8mk0p2ZiY3
	Vz2wxn/9x1Jhmvy1ufTtvfLsjIb8ADI/mVS7JidaZmCr7bJ+sEmwdQegYB7RQjkcdYEC
	KElg==
X-Gm-Message-State: ALoCoQkdaPPpURCeQrHXj3pX5E7DIwd+3+el3saboK67ke5nN0E9Dn0CvLqtngEEzNxLhHPxpWsQwCi+ve/NDX/qXm4vJopWLJvXzJt7EeZ9SwQI6knxMwI=
X-Received: by 10.50.126.8 with SMTP id mu8mr15462125igb.52.1452181610465;
	Thu, 07 Jan 2016 07:46:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 07:46:31 -0800 (PST)
In-Reply-To: <568E86EF.5050408@gmail.com>
References: <568DF5C6.90509@gmail.com> <568E1CB6.708@windriver.com>
	<568E86EF.5050408@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 15:46:31 +0000
Message-ID: <CAJTo0LaDS4+ETDGLc+Ja8Q+TjCOJ=xn6dSvO4UsNMnLUPhzkcw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: invoking a native compiler (gcc)
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
X-List-Received-Date: Thu, 07 Jan 2016 15:46:53 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf0aa91d0528c061e6

--047d7b1635bf0aa91d0528c061e6
Content-Type: text/plain; charset=UTF-8

On 7 January 2016 at 15:40, Trevor Woerner <twoerner@gmail.com> wrote:

> I was surprised to find that BUILD_CC is being set to whatever comes up
> first in our build computer's PATH. But I guess the alternative would be
> to make our builds longer by compiling our own native compiler for such
> cases.
>

You could always set BUILD_CC to explicitly point to the right compiler on
your machine.  When I was trying to make OE work on Darwin I had to set
BUILD_CC to point at brew's gcc binaries.

Ross

--047d7b1635bf0aa91d0528c061e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2016 at 15:40, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D=
"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3kn" class=3D"a3s=
" style=3D"overflow:hidden">I was surprised to find that BUILD_CC is being =
set to whatever comes up<br>
first in our build computer&#39;s PATH. But I guess the alternative would b=
e<br>
to make our builds longer by compiling our own native compiler for such<br>
cases.</div></blockquote></div><br>You could always set BUILD_CC to explici=
tly point to the right compiler on your machine.=C2=A0 When I was trying to=
 make OE work on Darwin I had to set BUILD_CC to point at brew&#39;s gcc bi=
naries.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--047d7b1635bf0aa91d0528c061e6--
