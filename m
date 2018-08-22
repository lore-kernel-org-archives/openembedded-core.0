Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BE5697940F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:42:35 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b19-v6so1516024qkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p53krYv26kFHbVhE1TImA729sBCiUF2cYBFkyb+8Xq0=;
	b=tRFSrrfnh6BNbeKYTqgyBGcD88q58gRSPgD2/FiDbBEi0UD/Ap+BXXnvyrFc5aS2do
	qgWrku8PAP7s8G47a+t0UJASEnqtjbgkl97sIfMaTtbQkrCa5wfRRwGMqogCWE3AfR/h
	7PKtxZOlg2PW7o5SQucW3fYQpYKjS+BqdogrdeEjBZ2sCpmP5uZDWsUW8CaujnflUrUa
	cs8zTFRqaQn0BrYlh0Uivj3mBAk/avlF9vanymKG+2PClnx8Uxid5Tx6xl99Mve3wg1G
	1Gz6yatSRFQnvpEkQgnatr9+O60tXZLdESrC+VSRC7hV75nsVFQHa+p4SqMFUaSk33iK
	zPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p53krYv26kFHbVhE1TImA729sBCiUF2cYBFkyb+8Xq0=;
	b=GrOkmiiBZMB7xm2OlgqetDkxhjdf4mWc+qgWS5i4J0lFPSzH4gzEQ9El4NDO7aUPS/
	X4bvI33gjyaipoNO3gLXfEXDH03HvMnH8Gldzh/7Z9FoL3x9D8Np16rD0aS53b+NraVf
	TPQN2qADzpO8ibB/RQS7fRSqjJGBSsBfSZSPM1HTv4oEt2en7wSKYPEv6VsU3HKuLVPU
	z3h0y/XfgfvA5Kftc2OzWFwV3phl2VMDjhR6ZDcxfIR/X+gKK172vjRZJdSVuzqErcM0
	0cncvqVN6e6MJvL1wt+hiU9/rSVU9q0tVCgCnNyrop14Uwl2Y6MdZrXXXmIt10ZUtZJ3
	uvRw==
X-Gm-Message-State: AOUpUlF4dEa/6KFNenOveseMv7jjYidmuxLzead7uo7uRpiwTtL1VjT/
	y9UxgJBm5g/62KM/ydl/Nrlk02kdVzRGK22/YDc=
X-Google-Smtp-Source: AA+uWPzgBTuUUi1cNaIW1H07EvvCeMsXDUMkRIm8kCloFqeovDMlUjFPTouoG0wnfUg6DxtzT9bZgsgIttKNTPtx8EY=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr40780276qke.102.1534952556204; 
	Wed, 22 Aug 2018 08:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
	<CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
	<CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
	<15ac7737a9a1a20bfbb6ed98a79ba140a6e6c786.camel@linuxfoundation.org>
	<CAPybu_2BB1XmsvrrME9poTKABtW+C6qZvJo3eoo=MDUDJa5cuA@mail.gmail.com>
	<8fe6af7262abdf19ade58f0c04a25637b20d5aef.camel@linuxfoundation.org>
In-Reply-To: <8fe6af7262abdf19ade58f0c04a25637b20d5aef.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2018 08:42:09 -0700
Message-ID: <CAMKF1srqxVG639au7ikhM+CEhuSROSfyYEzYWU1M7+PG=EkP9g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 15:42:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 22, 2018 at 7:57 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-22 at 15:39 +0200, Ricardo Ribalda Delgado wrote:
> > On Wed, Aug 22, 2018 at 3:37 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > > > /libx32/ld-linux-x32.so.
> > >
> > > I just looked at what the function is doing and its broken. What is
> > > DEFAULTTUNE set to in your build?
> >
> > DEFAULTTUNE="dbfp4"
>
> As I suspected.
>
> Try applying:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d69f0127b44a5216dd21ad972d6f2b2e4cda6d13
>

this makes it a lot better thanks for doing it. Perhaps we should check for
libc-glibc override for glibc case and throw an error if no conditions are met
it might affect nativesdk version probably.

> and
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=95aa56ae11852c100be68d13aaffa9c83273b46b
>
> and then seen if that fixes things.
>
> Cheers,
>
> Richard

