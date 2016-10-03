Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 801A0719B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:03:48 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id r30so314148ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kNQdSSdzetItyUQ1pHSqjCZ/RBuxY9jOy8uYZONwag8=;
	b=xSiukR/3D8EdHh0g8+H8BmZeOSDH8sEjf3Q3qkI4qSd9BiIjkoh1FDy8mOfShSGnN0
	3jXo5gQzFIbNTL/SPEpeAbJFMoiR48d+k7EOc2eLIwBlFTmnP+gjvGqNGbmOJu9C9Yx+
	K9neD+IQ2NL8kxYah2hK5YjBMaaL/Pp3K5mmC+L21YL+EDGL+vZcMztY442v3Yp4X6WM
	VE2Wwd8Y2gLJr4KOJAhuTAza0QquYXYHrfkzXjV1ZAlKA9U1gdYULhadk/bB37qz7PKw
	GfdA3orfBdOcFzDiSxoQdKvY9GUSVYI2Q2tdOq+asSL9ASbf4qmAUr4Fek87TQA6UpHC
	Vg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kNQdSSdzetItyUQ1pHSqjCZ/RBuxY9jOy8uYZONwag8=;
	b=JU8bPW/Vi2VKhmD54Q4yAIxS9HWinrpzU2HvvqjsOa6X7yvAuZqlyQxRxx0SfhHqOn
	ICJPYvg6DGK4Ii2cX3CIwkAa3yFMVSjUkjb8TVhP24JVTgtGjbyYlGMCmuiCARrv7o2M
	0mkcCvkscUeANwhuJcQJAgitSEjCPokN2I9Xu7Vitz21Fb5Zd0yPgE5Bm0yH6clL31Yw
	4w0fESelXcPIXcY2DTjT53lX1dhZf/VB7wMcItEgZc/Fgyqp7HvsNfZHTu8gQ2TlVzcZ
	MFPFUYY+Ez0MPXvOhxfiPkYo6JsifM9pOeXAeXFFoUrqud8lqWZo7zA/TAxLi0bMzSzO
	sAnA==
X-Gm-Message-State: AA6/9RnPtU4RqWrNBtEEybSu7d70msTQ7oGVFFiMwKnhDE83mpkfalkFEPhWGQipvrQmbN/Jy7+68T9jSKCa7QIh
X-Received: by 10.107.5.147 with SMTP id 141mr21638748iof.132.1475510629466;
	Mon, 03 Oct 2016 09:03:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Mon, 3 Oct 2016 09:03:29 -0700 (PDT)
In-Reply-To: <CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
	<CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Oct 2016 17:03:29 +0100
Message-ID: <CAJTo0LYmZcbyNDW-2smOhvgJv_xi=3mBjmVkrj+u0yYPwosEVA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 16:03:48 -0000
Content-Type: multipart/alternative; boundary=001a113edf34eedeea053df81650

--001a113edf34eedeea053df81650
Content-Type: text/plain; charset=UTF-8

On 3 October 2016 at 16:57, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> Out of curiosity, what image type is this ?  built core-image-sato,
> kernel-dev for
> x86-64 and they all worked.
>

net-tools (via core-image-full-cmdline -c populate_sdk) for intel-corei7-64.

Ross

--001a113edf34eedeea053df81650
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 October 2016 at 16:57, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Out of curio=
sity, what image type is this ? =C2=A0built core-image-sato, kernel-dev for=
</div><div>x86-64 and they all worked.</div><div></div></blockquote></div><=
br>net-tools (via core-image-full-cmdline -c populate_sdk) for intel-corei7=
-64.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a113edf34eedeea053df81650--
