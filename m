Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 73A36606B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 22:06:45 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id f76so1471314qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OJSu5QJFHItSDmYr+9D8dEUxP+sjPajFg4GNvT+wyJg=;
	b=bcFcudL7IPNrNkT4YZuA4zSrVkkoVyRbeRFa7tx+9qEiGyJkcSRJxPDFZnk0Zds/+x
	Kx8zzV5oGyiQ0ezLGG6DVnwxYGqpURg3kNwI8Yc0Ap+WjkXkLETeXPI/LvJkdR1L81SL
	SvqVPAs0xEcvPGoIaAVaUwmvCFJhQIoyOx6trbuXzQkm5ZaQTX9Ij1aH0vLOVlgh27vd
	963nZFfaW+4vsd58w8uZUiVtAHfcd4zrKl0iwcCHJj1a5CYB3MCKC3yP+1C8Je6Z8Wtc
	WQlHsjv8w/SYRPW2Ze76M7U11OiSjpnY9w632seybLczZlc8CHPmhUQWuP0f2k+p5RDG
	Y8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OJSu5QJFHItSDmYr+9D8dEUxP+sjPajFg4GNvT+wyJg=;
	b=XTeuot5XUkgQNNAAeDh9IrpEgQ9VRU89NrnPQ7WmDbJc5cnyFS303avWQIJpjnK2TA
	Lz+fl5HgiG9CwMdtFtxDMiYtv/R1wUK+g1wKLzrOw8wThwEsBIAC/yjim+fMTfWZmLRe
	lCcFmpm3R8GXOpGzCfhAkbXAKSTpl9EH6d7ndr05wUwr5ZXWR10hYe2V4tGDSLcBJWnY
	C+UgLRN7gBFqLpZpzg9ry+PT+QNfDJsNSd6W1szGanfJiTpdMRHm1YxpogkHu7zsZnSh
	0eSZJ2lPenk0kI9TNiAJw2bETupJZZ6hMRMdTzDjGWxWK777ogmoGOuzTl9lSHPCobYQ
	2+Xg==
X-Gm-Message-State: AN3rC/7GKKbrQozEtEmLu+WYWuzZ7oL6KG6CF/lRHs3v71yIyuT89JW3
	7Ceekhtu3S6nKfRU2+xZx3wNs7meG/+6mGo=
X-Received: by 10.55.75.209 with SMTP id y200mr16977284qka.36.1492812407164;
	Fri, 21 Apr 2017 15:06:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 21 Apr 2017 15:06:26 -0700 (PDT)
In-Reply-To: <b38c61a5ad7e8ae2687fcd1807655ef7f47a3ae5.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<b38c61a5ad7e8ae2687fcd1807655ef7f47a3ae5.1492777818.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Apr 2017 23:06:26 +0100
Message-ID: <CAJTo0LaD3k-bt9xLu8JXc3XiL6fvnEbG+9WEeX5u+E+jNG3QGQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] libiconv: remove recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 22:06:47 -0000
Content-Type: multipart/alternative; boundary=001a114a88e83ee7cf054db47937

--001a114a88e83ee7cf054db47937
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 13:39, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> It was in use only when uclibc was used, and so serves no purpose anymore.
> Both glibc and musl provide their own implementation.
>

As per https://autobuilder.yocto.io/builders/nightly-qa-extras/builds/238
this is still needed by mingw builds, so maybe the recipe should be moved
into meta-mingw?

Ross

--001a114a88e83ee7cf054db47937
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2017 at 13:39, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D=
"gmail-:37x" class=3D"gmail-a3s gmail-aXjCH gmail-m15b908796c22c045">It was=
 in use only when uclibc was used, and so serves no purpose anymore.<br>
Both glibc and musl provide their own implementation.<br></div></blockquote=
></div><br>As per=C2=A0<a href=3D"https://autobuilder.yocto.io/builders/nig=
htly-qa-extras/builds/238">https://autobuilder.yocto.io/builders/nightly-qa=
-extras/builds/238</a> this is still needed by mingw builds, so maybe the r=
ecipe should be moved into meta-mingw?</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88e83ee7cf054db47937--
