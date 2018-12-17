Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2FAD6B06A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 10:26:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so11694581wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ex5uaHrMQldcBKi0on9oajyHIWB37Z33A8CpwJYy4ik=;
	b=SSAnQ2wrybfckUPiqtVPMry60zvSXqVllOi8CwV3kvbKbrdW5J3hK7xUYze5/LS1Qi
	QDLz+boNfhO8ss0xsz9EqIGs7R7IXCxFiB8vbOR1I5Ku0s+AmYuOxwdr4i+UzEJNJ5zh
	W5YBCyolPR9cl0kDHEfIS4yoDBSpgw+bGUzJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ex5uaHrMQldcBKi0on9oajyHIWB37Z33A8CpwJYy4ik=;
	b=AYVtlHHzWGH3uzXfwqXRlTcasmDQJeANDwAPpPZiPk2rYnTvrlTRH2+zc5LIjRCSNT
	eq8I22UxZk1i39EBB21NNqoLB/85uG6NzY6TrImSxuT7zQOtTKglgMaFiuxj5lngUew3
	KhK/yNP/7KaDTF65K+pkX2ojbI6q2ug7Dsx0djxYOmGOTMZRXIXmu/2Y9GXJYUU/E1hH
	PWP9yUQ1zQ/TDWC+2PnBz7n+X2eeCIrObBvh1Jg4Ylr971/Fd4rGG/H/eg8bZ4nncr5H
	SHXPb7dIuI9vAkro40Rq47b8Ex2ML0s/xVdBclrYmtZQKCdWmci+CRCjLOtCznVfoptN
	mJxg==
X-Gm-Message-State: AA+aEWYu82MZV0E7/36b6pefgHvYxsFgT5p4x0oJCD8nrlOu19etHA3J
	tG2z78b4hYyeIqXJmK1FfvpDLw==
X-Google-Smtp-Source: AFSGD/XydVW/BFIwIdsR3kyiy+xmA62Zg+9U18V8xaK0ypMyjirengpoZvigb+/B1g+xdpfmXRVm9g==
X-Received: by 2002:a5d:4303:: with SMTP id h3mr10267340wrq.273.1545042391389; 
	Mon, 17 Dec 2018 02:26:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b18sm12578398wrr.43.2018.12.17.02.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 02:26:30 -0800 (PST)
Message-ID: <e46df116cd674f3073acab5b9ead068e83690d2b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Serhey Popovych <serhe.popovych@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Dec 2018 10:26:29 +0000
In-Reply-To: <40d476be-b97b-641a-f823-25c9a162324e@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
	<CAMKF1spGeN_PxOKM5XC5CG6dPFSNv1H+OyDv2P9k6SoK6uAt5g@mail.gmail.com>
	<40d476be-b97b-641a-f823-25c9a162324e@gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/13] arch-powerpc64.inc: Use elfv2 ABI when building with musl
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
X-List-Received-Date: Mon, 17 Dec 2018 10:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 11:36 +0200, Serhey Popovych wrote:
> Khem Raj wrote:
> > On Fri, Dec 14, 2018 at 9:56 AM Serhey Popovych
> > <serhe.popovych@gmail.com> wrote:
> > > Historically first PowerPC ABI was big-endian only (elfv1
> > > currently). It
> > > is standard ABI for both 32-bit ppc and 64-bit ppc64
> > > architectures.
> > > 
> > > With PowerPC little-endian support new ABI was introduced (elfv2)
> > > and it
> > > is used primarily with ppc64le target only. While it has support
> > > for
> > > big-endian it is not commonly used and elfv1 still preferred.
> > > 
> > > Musl does support only elfv2 ABI for both LE and BE and does not
> > > have
> > > any plans to support elfv1.
> > > 
> > > Since then to build for powerpc64 with musl new ABI should be
> > > used. As
> > > expected it is not compatible with elfv1 but that isn't problem
> > > as long
> > > as there is no binary distributed software or assembly code
> > > written for
> > > elfv1 ABI.
> > > 
> > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > ---
> > >  meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc 
> > > b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> > > index f751c6b..d9916d4 100644
> > > --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> > > +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> > > @@ -7,6 +7,9 @@ TUNECONFLICTS[m64] = "m32 nf"
> > >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', '
> > > -m64', '', d)}"
> > >  TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ],
> > > 'powerpc64', '', d)}"
> > > 
> > > +# musl only supports elfv2 ABI for ppc64
> > > +TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in
> > > d.getVar('OVERRIDES').split(':')]}"
> > > +
> > 
> > I wonder if we should change gcc to use this ABI by default when
> > configured for ppc64/musl ?
> > This would avoid us adding compiler options here, in bad cases it
> > may
> > be that other compilers
> > call it out differently.
> 
> Good point. This should be easy to do with patch applied for libc-
> musl
> override.

Given our gcc shared-workdir which is shared between musl and non-musl
builds, I'm not sure this will be quite that easy. It would need to be
build configuration time rather than source patching...

Cheers,

Richard


