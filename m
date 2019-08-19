Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC9167CF88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:00:12 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id 66so1509316vsz.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fN89T6PFxrHjuhucVl1zbdq1+G5Y8cpXuHW2n1UKayk=;
	b=TMDGn5ZOp4pBoKY3a2Nt/Jx4zVzTetYSPqV3FziuJJzDbH7nPXlXXWzCVSl1lVLIjC
	i9oY9zQR8aS1HZZZ/t5S/GOJ+qTHq456ab2xJ2lYZymmoNB3bTM8bf3YR94dciE5oZyc
	ppRYa5NfiIyxxrUGvMk0d/4wWtlr3jLXhLL/mItUZR7kQ8sWt4+c0szPFTrZ7mDRvmhJ
	Xtt5g+1Z+b4uOtFT/xhH1qmFVkJrih2HlXmNV3aJ1+EGK5TRzgMR9zhr5hz8hLooz/4I
	gYETqKiX9juJuEQ6OlXMIZjh5QSy2oK5mwPvM8zeu0tvClco2rijTAnzDvigQnUBN+X9
	xL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fN89T6PFxrHjuhucVl1zbdq1+G5Y8cpXuHW2n1UKayk=;
	b=Zg0EHcR3M0HbwAUUR42IHf7jMu0qTETQlgx9ZrKA652k0zrsjC81XF9LLs0h0MP8Eq
	XRpdiU62uEaVpqrwgbeWWvMOsUWEIm4xmFttM820q8FdZip0eAV9SOPfa770a1r/cnqA
	xQc6+OcUBQ9YuhOSNIXyacjutDxncIB8lqAMR0Q3y35Tozpmvt5ipO+k0hbnaIdedWXT
	DiEWPKvsnLaEWwACorBNEobnvNWNWsTz9EZ43cMyeHJ/88OMVHIcCeJ2mQYoSJ4CsbUC
	eTeJqrsv3TIXrpK29vQpAlTs9D2gTXZpSx8QgG808N+8JbkNspwEF4V+fKvFjFzaDWpI
	B4Gw==
X-Gm-Message-State: APjAAAUU4F8dGBhaeARuFX+hVh9/YkZ3zWQWshrNh6uZHkuhjaDawd/7
	rSh4hkwG4ad4df+gSOKBL2tn//Ip/xUjstMQiJ4=
X-Google-Smtp-Source: APXvYqzKtXDGvloW7yhdJlnVYIvPZaixI5Zt54MiGBQMypDpRZ4oGvfDLi+fhJUyDZ7PjhI98CRQP9UoEJAqH1Fl9Bk=
X-Received: by 2002:a67:e45a:: with SMTP id n26mr1633130vsm.94.1566230413569; 
	Mon, 19 Aug 2019 09:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
	<28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
In-Reply-To: <28dbc362015c3cbae5b8550e8636e74802afbfc3.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2019 18:00:02 +0200
Message-ID: <CANNYZj8HZzpe=nhQW+d8tnEB02KO=d=43EyrYsaXvKWO13=cZQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 16:00:12 -0000
Content-Type: multipart/alternative; boundary="0000000000006ff2fc05907a6f61"

--0000000000006ff2fc05907a6f61
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2019 at 16:55, <richard.purdie@linuxfoundation.org> wrote:

> I'd even possibly accept a case for higher memory defaults for graphics
> images when GL is enabled. Pushing the default qemu memory size to
> 512MB everywhere is wrong though and sends out the wrong message for
> the project.
>

Thanks for the response (I do realize runqueue work is making you less
available).

I have basically one objection: trying to understand what went wrong in a
OOM situation, where the symptoms and error messages are unhelpful and
tools to diagnose the issue are missing from the target image, is just as
frustrating. Having a tighter limit makes this more likely to occur when
users experiment with images and add or change things in them (e.g. via
local.conf). You, me or Hongxu would dig deeper and get to the bottom of
it, but someone just starting out with the project could simply give up and
move to alternatives.

Other than that, I am fine with raising the memory in a more targeted way
(e.g. core-image-sato, subject to 'opengl' in DISTRO_FEATURES and elsewhere
where X would otherwise fail to start), and will rework the patches
accordingly.

Cheers,
Alex

--0000000000006ff2fc05907a6f61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 19 Aug 2019 at 16:55, &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">I&#39;d even possibly accept a case for hi=
gher memory defaults for graphics<br>
images when GL is enabled. Pushing the default qemu memory size to<br>
512MB everywhere is wrong though and sends out the wrong message for<br>
the project.<br></blockquote><div><br></div><div>Thanks for the response (I=
 do realize runqueue work is making you less available).</div><div><br></di=
v><div><div>I have basically one objection: trying to understand what went =
wrong in a OOM situation, where the=20
symptoms and error messages are unhelpful and tools to diagnose the issue a=
re missing from the target image, is just as frustrating.=20
Having a tighter limit makes this more likely to occur when users=20
experiment with images and add or change things in them (e.g. via local.con=
f). You, me or Hongxu would dig deeper and get to the bottom of it, but som=
eone just starting out with the project could simply give up and move to al=
ternatives.<br></div><div><br></div></div><div>Other than that, I am fine w=
ith raising the memory in a more targeted way (e.g. core-image-sato, subjec=
t to &#39;opengl&#39; in DISTRO_FEATURES and elsewhere where X would otherw=
ise fail to start), and will rework the patches accordingly.</div></div><di=
v class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Cheers,<br></d=
iv><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000006ff2fc05907a6f61--
