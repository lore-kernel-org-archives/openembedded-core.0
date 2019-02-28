Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8A37CD1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 22:28:14 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n19so10693399wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=fRQFAuMbR6vHIxQUglYJha3025p7cDx4efIR+y1zkbA=;
	b=Je45zKhx3VEHqT1ggGTcN/YTtrybx5dmsbZ0bKOlorXVI7KErtXIVXvcFqv/x8AsB3
	bk1BVfw0n50OK125bmhI60SOMaJuKfTAawNrex7zFObQV+4lTwPskLe9QqxqUxpB5qYP
	S7g06zaibY+3eYZchPqm3FxZW4jxgljgt8a00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fRQFAuMbR6vHIxQUglYJha3025p7cDx4efIR+y1zkbA=;
	b=jZmQ0GAOrXB0ES3gYiDXW/Lw+LjxM7z8w2giiw/m/AD8k9WwuGUJsiSNUCUKnmfe+C
	PehVAc++XL6gaWNk9/+yhWAm76d5UN8zUtGzlmnCaaeBz9OqP59eu7xa7dfuhTz3fTSH
	TMiHPz8B7DRIXFOCkqT0tbVcxRHiPYnoD7NIdQn9NIgdK5yAGSvdJSx0wI3NgIkLTYqD
	OV4faeh7bLZtb8E2l19Cw3J1/qoxXd3dRoz1+jlss3hyDWJcfWqUa3HLT5rND73QQ5t/
	Q9gUOzyzUkPYzQxqi2uwqLncTRH4+bL1cB/tIz7+q5mL28j0hutuvDS08ZGc7rlIMBtQ
	makg==
X-Gm-Message-State: APjAAAXN+SPU6C8hBNx/fyDbVqzPEUL30MWgd+7JT6OTGjLNmwbgoiqu
	iXaz0vX7nUA2GtYsZ0Lv9VgSSA==
X-Google-Smtp-Source: APXvYqznVc1Ub/0H90UUzrUvz60vXiReSOa1/HDAm5OFBKflclFwXpmmFeb8wXsUBuFAXe8SfjrgGw==
X-Received: by 2002:a1c:2e85:: with SMTP id u127mr1160493wmu.70.1551392895698; 
	Thu, 28 Feb 2019 14:28:15 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y140sm9866577wmd.18.2019.02.28.14.28.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 28 Feb 2019 14:28:15 -0800 (PST)
Message-ID: <c41a4e170d2c8faa9e6e634643f4c0d0dfba16c3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 22:28:14 +0000
In-Reply-To: <CAMKF1so3KK1v=guafU5K+_nDU3jQm-0HG-CgRCf5qWA_i4gRpQ@mail.gmail.com>
References: <20190228213251.31036-1-alistair.francis@wdc.com>
	<44473a1d54ad68139b8fe9ef3e5b0fdc31870801.camel@linuxfoundation.org>
	<CAMKF1so3KK1v=guafU5K+_nDU3jQm-0HG-CgRCf5qWA_i4gRpQ@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 22:28:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-28 at 14:25 -0800, Khem Raj wrote:
> On Thu, Feb 28, 2019 at 2:24 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2019-02-28 at 21:33 +0000, Alistair Francis wrote:
> > > This is required to fix this build failure:
> > > 
> > > qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No
> > > such
> > > file or directory
> > >  #include <libfdt.h>
> > >           ^~~~~~~~~~
> > > compilation terminated.
> > > 
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > index c8acff8e19..0b6a7f8b6e 100644
> > > --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > > @@ -6,4 +6,4 @@ require qemu-native.inc
> > > 
> > >  EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_targe
> > > t_li
> > > st(d)} --disable-tools --disable-blobs --disable-guest-agent"
> > > 
> > > -PACKAGECONFIG ??= ""
> > > +PACKAGECONFIG ??= "fdt"
> > 
> > I think this is a rebuild bug, did you try cleaning and rebuilding
> > qemu-native?
> > 
> > I did hit this when testing but in amongst the rest of the chaos
> > from
> > today, forgot that :(
> > 
> 
> dont think so , if one has libfdt on host and is not version qemu
> like it will have build errors.

I think what happens is that the "old" qemu-native had this enabled. We
now split the qemu build so qemu-native is reconfigured and rebuilt but
its configure script/makefiles are buggy and it leaves part of the
system misconfigured leaving a build error. If you clean/rebuild this
doesn't happen again.

I did see this exact failure, it then went away after a clean and the
above was the only explanation I have. Should be easy to reproduce
though.

Cheers,

Richard





