Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 24B42606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:11:16 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id q83so154501114iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eUdps9rXlAG3HDxRrvn+HNEDobg8VW5xA9jf0x/SWio=;
	b=y+q922TK4KitDp3YmSTiQaCtURSPaZMmH3cj5nIiN1ausz9YX5lxaN0V+D/DlnYS7F
	qQq0LkbW845cX9jATwZdOusCRaQFQpi3EaEEKi0+L/ceQHKk/gsqR8RqXm6LLAaWiTfW
	pXtkduit/IXrgdz8dH9dpQIF6DbWWMAwlunMqF/a/wk6tsv4ff8k5o/CokQvQ/IIMhEs
	MO6VHhUXdLQUqT0UPF2vTJJG/IzFOJvolmSU3Rwc7xJW7aUFgDcZp3R0B7MvaTpecfdf
	HnfaU3KLnJgrpJZU+BzlI8Zr+ea6aoumMbyyy77qPa/zfc6Sedztn/aETFCGcwIUM/Ln
	9zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eUdps9rXlAG3HDxRrvn+HNEDobg8VW5xA9jf0x/SWio=;
	b=eUX+KO/whGMU3FjzYU19yONK/RyvhJaLopii0w/UL5Xfrz2SZor62wjhuQjbX/J2cU
	I3+e/93Tkl+shiIFVbWFDMaZaCb0vjf8Gq9O37baXBqDjcpcHI2VxeeocNcohisbSFb0
	G9viIc11LV4vwov3ZzKXTjyRRFRCCvXh7GAJdR3SP2vfEZgXdBsyaiPrCtYNgkLR0LrX
	DXdhJQrpHI/R49O0odLQcDvmW9tQHp2JVtinxhsJVnBsTLHJ5+AvGFKhLIvsOmp5DIP1
	8ZoMtz8v+31r2hrcyscRgCFHsmwpNvX8zotRPUPKj0ZcCfyaK2680LImhX970gDfx9Uv
	QWGA==
X-Gm-Message-State: ALyK8tKgnpfttKMFiwZkNUjvvhgrHwbmeqr9AzuMFMFt9UbAwVf28Rv2tkTwRFMha3723NBiRcxwsHX2aWJk0K9d
X-Received: by 10.107.138.212 with SMTP id c81mr31008023ioj.148.1468833077570; 
	Mon, 18 Jul 2016 02:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 18 Jul 2016 02:10:58 -0700 (PDT)
In-Reply-To: <8ca29bb46b3385cfb2d8c8874487d2cd1a4c0c27.1468503047.git.joshua.g.lock@intel.com>
References: <cover.1468503047.git.joshua.g.lock@intel.com>
	<8ca29bb46b3385cfb2d8c8874487d2cd1a4c0c27.1468503047.git.joshua.g.lock@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jul 2016 10:10:58 +0100
Message-ID: <CAJTo0LZumhkryN+hh1gr9vUcNdbN1Dy3y28mN=yo1iu+5JTe-A@mail.gmail.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v2 1/1] image: add do_image_qa task to run QA checks on the constructed image
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
X-List-Received-Date: Mon, 18 Jul 2016 09:11:17 -0000
Content-Type: multipart/alternative; boundary=001a113ed932d2d29f0537e5596d

--001a113ed932d2d29f0537e5596d
Content-Type: text/plain; charset=UTF-8

On 14 July 2016 at 14:36, Joshua Lock <joshua.g.lock@intel.com> wrote:

> +            qamsg = qamsg + '\Image QA function %s failed' % e.name
>

I fixed this typo when merging to mut.

Ross

--001a113ed932d2d29f0537e5596d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 July 2016 at 14:36, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"mail=
to:joshua.g.lock@intel.com" target=3D"_blank">joshua.g.lock@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":fu" class=3D=
"a3s aXjCH m155e9a1a64044f25">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qa=
msg =3D qamsg + &#39;\Image QA function %s failed&#39; % <a href=3D"http://=
e.name" rel=3D"noreferrer" target=3D"_blank">e.name</a><br></div></blockquo=
te></div><br>I fixed this typo when merging to mut.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932d2d29f0537e5596d--
