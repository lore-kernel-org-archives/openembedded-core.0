Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8360E77103
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 17:20:05 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id n190so34741248iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e8XrOkjwiN8gxcqbxB6C3PpVJ4bbHsbVOam3g/zpyG8=;
	b=B/k2COhzhE/ex7PyXDibtu7i+DQ2oW93FOdRyKO3RdjXRUTFzHrY7Hz3wisjXmTOaN
	bemhw2wyfacyOU8xD6J5VKUQbRxYrrw2NSWFE71UkG+R50WtmzayOoR10oRy8u2yfDcs
	r00yd9v+5tBttu5jUpKis6Jxq6FSDqXjSUv/5ZIbLj293zgdFlEjLaSadnmHDTfkYdnW
	PUjrMGbHCznunATzr6UxV3cch0dA8WhAfnDiIavp3FAv3JLbofN9oZM9GR5D+RtAPD9Z
	b9ff35cIB4ayhcb57tXlIr2Uuue5cBsDjHDtXzhPTiUMqCAbvf7W5ECMhWgLea0ACZMf
	brSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e8XrOkjwiN8gxcqbxB6C3PpVJ4bbHsbVOam3g/zpyG8=;
	b=XQmJVtE+ZMCBUZ85IxKXB1hqGqvuy1HWXkCvFCggtx/J/BaM5FXc9nMl7SqVF5DGMf
	jvpwRnAbYlpqZ03NnP7Ap4/mG2XVtMyutY49GAMGjXYtCTJnf61KjR0ONpzGv4zwgMW+
	UZ9M5UDgwdxCsjiiQrIeZNxYvKVI0YinrnEmh5J3Dw/tdWanj0oE/g+cHpBktQlduVyG
	0HsgoN7TJ0O3KOBwnDlmTJITKY+lRk1kCbmobnxaEnQoTGoAyoQsKSTNr/VvEY2Gwe/4
	Dam2OcN9DPZVbhH7lh5C/2J3Jcxk5gOm1Q/Y0EkrarMX8PMC9mYA10PWQBE9AI9en83b
	gF6A==
X-Gm-Message-State: AD7BkJLZ+oEV0fmiuhd2ESwK9p6kNFp6sc87mYuUiNzl+KIBD8KTqnNBCl3DBRtVTmCZO/xsz8vHcQWLjQ+0qyca
X-Received: by 10.107.10.30 with SMTP id u30mr3775618ioi.99.1457025605829;
	Thu, 03 Mar 2016 09:20:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 3 Mar 2016 09:19:46 -0800 (PST)
In-Reply-To: <CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Mar 2016 17:19:46 +0000
Message-ID: <CAJTo0Lbuy6FTWVvtia_+ux03PazpDx0k65Ksu3EWz+9g23VzgA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Thu, 03 Mar 2016 17:20:07 -0000
Content-Type: multipart/alternative; boundary=001a113f92c0aa412b052d28358d

--001a113f92c0aa412b052d28358d
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 20:50, Andre McCurdy <armccurdy@gmail.com> wrote:

> gdb 7.10.1 depends on readline features which are not present in
> readline 5.2 (ie the GPLv2 version). Using the gdb internal readline
> is a workaround for people who don't want to switch to the GPLv3
> version of readline.
>

Would it be possible to force a -static argument into the link of the
internal readline to ensure that a static library is built?

Ross

--001a113f92c0aa412b052d28358d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 20:50, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":yh" class=3D=
"a3s" style=3D"overflow:hidden">gdb 7.10.1 depends on readline features whi=
ch are not present in<br>
readline 5.2 (ie the GPLv2 version). Using the gdb internal readline<br>
is a workaround for people who don&#39;t want to switch to the GPLv3<br>
version of readline.</div></blockquote></div><br>Would it be possible to fo=
rce a -static argument into the link of the internal readline to ensure tha=
t a static library is built?</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a113f92c0aa412b052d28358d--
