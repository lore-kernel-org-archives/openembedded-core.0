Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB1527F469
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:55:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u16so7690712wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kfC/d9MHWWBkMvt9UaerNLTwgZ0h0cgNsxEWnJVy/yY=;
	b=a9HFOXInQuMSJIYCziUmRRxGIIVZAdh4TsCRNkZEocw4QFUKKgDXaJ9j4gziF7gIxc
	SGplPYf1aweL3pZdrSmxM/2gJ38g26uuYTlG3xKYn8XOKlVUTv6nhkkFYtm4AKSUV5jl
	/DCNw8HXOofCs7J8AIxsHsYFKQuMYfLpiUsvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kfC/d9MHWWBkMvt9UaerNLTwgZ0h0cgNsxEWnJVy/yY=;
	b=f5zW0UoSooWYq+3zeRrSsmE8Rqu31Iv+Mau0LaOIrcsLodNQAWIZS28E7kbBES+wsS
	6RkIb24Eucvw59wn0YwH5kHirpTkqt0LQamNWSBY/5ZQM18x/HvPD03es47F/LDDcpX2
	MiDZdcXmSVqI8JxTcMNoASnsjF6Nyf3cYnZ9s9aqqnJFFo0xrooMRKQiWX3GAe1zE82y
	m3VGp+KxiEyq0cSSdqES9Stabb9vVCKHdTCd2aMwPkAzFrLEhV2tUXX+l8pCtdJl0QTV
	49oR5OqeOv7jlyC1uojx23UW4g7FoCriiKV4KlmECXatdOCLcChngog24tZCmkCYRXic
	Kicw==
X-Gm-Message-State: APjAAAUvkhlJdR5mU0VNCCxnCG+5eV+ghgHse7+pnn7rn4LPVbQRtNsB
	Dhv+MtB0/8cSpDPsP7eouDpD0g==
X-Google-Smtp-Source: APXvYqzZpKHA+07ELs1Pe24GZ7qqkqBaRcr0ufjzHarCUjAfO+ohpOCr38Sb2corv3fF9L9xHPIgrg==
X-Received: by 2002:adf:fa0a:: with SMTP id m10mr18276044wrr.174.1567184139297;
	Fri, 30 Aug 2019 09:55:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d19sm9769889wrb.7.2019.08.30.09.55.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:55:38 -0700 (PDT)
Message-ID: <92f66841b24106d9acc75a3a60c39ac5d28c0462.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Aug 2019 17:55:37 +0100
In-Reply-To: <CAMKF1sq8F5yc6G7i2L7+3aBLHeuumT_c-DFs=7EBzTvfe1iPNA@mail.gmail.com>
References: <20190830155354.18038-1-richard.purdie@linuxfoundation.org>
	<CAMKF1sq8F5yc6G7i2L7+3aBLHeuumT_c-DFs=7EBzTvfe1iPNA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Clean up fixed-includes
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
X-List-Received-Date: Fri, 30 Aug 2019 16:55:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-30 at 09:51 -0700, Khem Raj wrote:
> On Fri, Aug 30, 2019 at 8:54 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We had interesting failures where building gcc-cross-powerpc with
> > 5.0 kernel
> > headers, then building eudev after moving to 5.2 headers failed.
> > 
> > gcc-cross doesn't rebuild when linux-libc-headers changes due to
> > its
> > listing in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS. This shouldn't matter
> > but
> > fixincludes as adding asm-generic/socket.h to its filtered list
> > which
> > was then replacing the real header with an older version. This
> > mismatch
> > lead to build failures.
> > 
> > We trust the Linux kernel headers to be ANSI safe so lets just
> > clear out
> > any headers and trust the originals to be correct.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/gcc/gcc-cross.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc
> > b/meta/recipes-devtools/gcc/gcc-cross.inc
> > index 6222c2e8c91..e417b898734 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> > @@ -196,6 +196,8 @@ do_install () {
> >         # We use libiberty from binutils
> >         find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
> >         find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> > +
> > +       find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed
> > -type f -not -name "README" -not -name limits.h -not -name
> > syslimits.h | xargs rm -f
> 
> Whats different for limits.h and syslimits.h as compared to standard
> headers from libc, Maybe we should just get that sorted as well while
> here

limits.h looks to be gcc specific additions/fallback. syslimits.h is
just a passthrough. I decided to go with less risk in the patch and
leave those as is but am open to more investigation.

I suspect limits.h is there for pre glibc bootstrap?

Cheers,

Richard


