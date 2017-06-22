Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB7F77E8F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 10:07:11 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id d14so7988884qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K4CVGwaEjo9cO5D23pLoKvb8PXs2ujUhNkAUJG8qbOI=;
	b=cXF3PXC7yJ0rPb+WisqC4gzdzpAJbQm/JDPRh6nxX2wYSob5/34ou9Tfd+BNNG1kX0
	Ar5XcFcEL5CrqijCOwEo5y1htUdFCj/gffh/CWtRK7wZD08B785Fh0GN53aj2Onu/jRQ
	kyojFCeAkZTscSY79n98snVtFAN+vivganH5qIB48ZIjktC3/TcsNpgtb1qFUNOYgVhU
	Sd0H3e4uK0fYjddnnJCVGtGRz+3XakzyQ9Goylg1lM4R97KzkSPjvuAzQZ2SFBxbmYuR
	BbGjeNx4w+nOnabXcOz266TR4hMjtZeo46aszykQcMOQi4HDhBZzOgJoGBLzBY1OC41+
	b/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K4CVGwaEjo9cO5D23pLoKvb8PXs2ujUhNkAUJG8qbOI=;
	b=KPDdGOuS+O+fktMS0EL0aEYwS9uHSNq6WjlYzH9bCS0FbuD8HgLw4kT4mE65UuMMx2
	/Y7xc+3StB/uz3l/gDQKo4yFUXWpZCdLKsGXfoQZCUtlS8KW1xYQWli++eThEs3Nl51W
	K6Kp/nKwpGVn4u9i3urCPSe4xRVKyKM40b5bzOJNexX95wfh8FKygeR8jL0ZHU5X4ozv
	Kt14KmIR0iTA+b+75tZcy3pIvHrhKquYqgnLGsWKjlKrWjyPceuExPKdsdaNMLA8Auvj
	Dgz86yFU6DwH7BihlXZjHt86ypR2buXou2A9fjoen/KC3VPTUuJitcw/qkRKfHLmKBvx
	rF+g==
X-Gm-Message-State: AKS2vOysv9LMTw8ZD4Wh2q1iwKOoqiNR+Z9AbrUIG3UN4FdjE0+la2yR
	8phNpYNEsD6m4ULwvdS1CaxPGCNxnwDi
X-Received: by 10.55.102.84 with SMTP id a81mr1780097qkc.154.1498126032607;
	Thu, 22 Jun 2017 03:07:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 03:06:52 -0700 (PDT)
In-Reply-To: <CAHiDW_HgN8OpfohECj5dB6ux8tdNe7ALFOpRju-oFZNFwQaJYQ@mail.gmail.com>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-3-git-send-email-dv@pseudoterminal.org>
	<CAHiDW_HgN8OpfohECj5dB6ux8tdNe7ALFOpRju-oFZNFwQaJYQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 11:06:52 +0100
Message-ID: <CAJTo0LYRhd6xdx+d4Dw++rw1Z9fjbzEvEKF5X7ct1_30yPvUkA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] gstreamer1.0-plugins-good: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 22 Jun 2017 10:07:13 -0000
Content-Type: multipart/alternative; boundary="94eb2c05760e00b26b055289a685"

--94eb2c05760e00b26b055289a685
Content-Type: text/plain; charset="UTF-8"

On 21 June 2017 at 17:47, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> I think this breaks gstreamer1.0-meta-base packagegroup because now
> nothing provides gstreamer1.0-plugins-good-souphttpsrc. I've not tested
> this but I'd bet money it's because of "Fix plugin filenames to match
> plugin names" commit ** upstream: it probably leads to the plugin package
> names changing.
>
> The name in the package group should be changed. The question is do we
> also need to add special case RPROVIDES for the old names?
>

Yes and yes, IMHO.

Ross

--94eb2c05760e00b26b055289a685
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2017 at 17:47, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I =
think this breaks gstreamer1.0-meta-base packagegroup because now nothing p=
rovides gstreamer1.0-plugins-good-<wbr>souphttpsrc. I&#39;ve not tested thi=
s but I&#39;d bet money it&#39;s because of &quot;Fix plugin filenames to m=
atch plugin names&quot; commit ** upstream: it probably leads to the plugin=
 package names changing.=C2=A0<div><br></div><div>The name in the package g=
roup should be changed. The question is do we also need to add special case=
 RPROVIDES for the old names?=C2=A0<br></div></div></blockquote></div><br>Y=
es and yes, IMHO.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--94eb2c05760e00b26b055289a685--
