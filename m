Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9F7C7C0C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 19:18:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u4so18660374wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1K7Vl2JhISy4JXqFdLjUe6z0VRHAtEitO5RH4JGx87Y=;
	b=JZsk6HYan5P/kk28nY2hnPA4JMz5OtAeRkTeVGKqmqfxeFZiHl2wMZrFe3j/ap2E8u
	zjabN7izC/CYZ7KS83bPh/uMhuFBjGs2P2rBhLDWZ3ADGrnb07+VgFQ98KblIdh2Ql6q
	+uRzebUxth+bIgLX3oaNY2Bw7JEe/JDlyZUeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1K7Vl2JhISy4JXqFdLjUe6z0VRHAtEitO5RH4JGx87Y=;
	b=tOZTyT/25ab9VpcdvyUH2MmmpU3P4b/Khu8k4OsBh6l8/tidi0QJkRzyiw5Gank3nH
	RNFk81t/t1cn6Qxl71SsOQe/BX88rY7aOAkrbjLnyN2VnrzSPNu999V9nUml91wHIOdI
	muUTZiieV61FVXNBShLbM73Ebf+UWlSP1mzr4HKk92Ebz/GqkxBP9s1SBd2C08UhLIIZ
	mlegXpCqGIX1TStcr8d97auHlAEFS+03ia1NdCs9DrbPsaxE0wWz1JsJ+PHhoDUSsxnx
	JOGtX+oojb/6IJP9NUkVtCeM6L5VZsp7c9C7MBgLw780EKAo9dQDARz/cFOZjddVZpjg
	tCIQ==
X-Gm-Message-State: AJcUukf6QnggL1yHHz5LXEHnhD1OL1IojU/RnOtVC3jloNR5aquS/i8w
	CxiMC/4eS46/XwLDYCWGze9ILg==
X-Google-Smtp-Source: ALg8bN4+3Fy9BPrYU+ozwGOfk62rBr33D8Rr7uUZd13km2NdxVWOODOun/B5AiqdrmaHiX5181Wc4w==
X-Received: by 2002:adf:9c01:: with SMTP id f1mr18915133wrc.286.1547320705075; 
	Sat, 12 Jan 2019 11:18:25 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id
	l19sm23737613wme.21.2019.01.12.11.18.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Jan 2019 11:18:23 -0800 (PST)
Message-ID: <98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 19:18:22 +0000
In-Reply-To: <CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
	<7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
	<CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 19:18:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-12 at 10:31 -0800, Khem Raj wrote:
> On Sat, Jan 12, 2019 at 8:22 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
> > > Richard Purdie wrote:
> > > > On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
> > > > > In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit
> > > > > while
> > > > > kernel
> > > > > selected by the installer depending on PowerPC machine type:
> > > > > 
> > > > >   * 32-bit for PowerMac G4 (ppc7400) and below
> > > > >   * 64-bit for PowerMac G5 and above
> > > > > 
> > > > > Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
> > > > > userspace
> > > > > making build impossible due to missing some of lib64 multilib
> > > > > equivalents in Ubuntu repository.
> > > > > 
> > > > > Using setarch(8) override to make whole host look as PowerPC
> > > > > 32-
> > > > > bit
> > > > > can actually help with build but requires mapping for ppc
> > > > > target
> > > > > to
> > > > > their libgpg-error equivalent to fix native build.
> > > > > 
> > > > > Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
> > > > > command:
> > > > > 
> > > > >   MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline
> > > > > 
> > > > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > > > ---
> > > > >  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/meta/recipes-support/libgpg-error/libgpg-
> > > > > error_1.33.bb
> > > > > b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > index 325529d..4153954 100644
> > > > > --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > > @@ -47,6 +47,7 @@ do_compile_prepend() {
> > > > >     mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
> > > > >     mips*)      TUPLE=mips-unknown-linux-gnu ;;
> > > > >     x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> > > > > +   ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
> > > > >     ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
> > > > >     ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
> > > > >     *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
> > > > 
> > > > This doesn't feel correct. It only works if you're using the
> > > > local
> > > > setarch workaround and I'm worried most users are never going
> > > > to
> > > > find
> > > > that.
> > > > 
> > > > I'm fine with adding in general fixes but this is getting very
> > > > specific
> > > > to an very uncommon usecase :(
> > > 
> > > Understand your position. Doing setarch(8) to run bitbake on
> > > ppc64
> > > kernel with 32-bit user space with missing 64-bit multilib seems
> > > to
> > > be the only option.
> > > 
> > > Anyway this change just maps ppc to corresponding tuple used by
> > > libgpg-error, so with this fix we hit both
> > > 
> > >   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
> > >      no multilib
> > >   b) native 32-bit powerpc host that is running as virtual
> > > machine
> > > for
> > >      example).
> > 
> > I'd understand that if this were just libgpg-error-native but our
> > qemuppc builds work which I guess is why I don't quite understand
> > what
> > is wrong here?
> 
> this is when using ppc32 as build host :)

I appreciate that. My point is that we can build for ppc32 target
machines (qemuppc) so why are ppc32 target machines using a different
arch to native ppc32 machines?

If the native and target recipes were different I could understand it
but they're not.

Could is mean we're using a non-standard name for ppc32 target builds?
or does it mean setarch should be to something else like powerpc on
native builds? Basically I worry that we're using different names for
the same thing.

Cheers,

Richard




