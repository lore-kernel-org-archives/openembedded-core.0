Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7EC7C133
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 16:22:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y139so5033102wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1BSieOyCVaHKeljayh3fQECbF/PmhJLH0H6Yb4+ouLo=;
	b=NVqeCxAG9eOCrInq2Zyid6Chj9/GpUTBl66xtl7/nKcJE99RgJpexwuNGthQEbkNTC
	AlRhPysCr+VWcK8MQ2v11VMlt3s3KJTM9k8UZ1n/3avcArkm5IdUvESKCdeqBFAfpgxu
	0d4wingnHaO+SXMPI4Vy9j4GzmRbEr+f+Z3l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1BSieOyCVaHKeljayh3fQECbF/PmhJLH0H6Yb4+ouLo=;
	b=HR4gSr8nFqqdteCKh+2x7zcrGfFcZNie+eGic+568U5cazpltxt1f00YJpRnKXie2t
	L5UJz3odZLAi6EGyKBNa7OCBtkRc1HfsGn5ca1Xcx0CrgB+B9c15Z8eV6e2sQS6WxQ2U
	1g9Hhh8vWMH7/IgLb0RSvwMK5Q23bHBHRXx7sxXB5f7GopAsqpOlyNbpZHQgAajQCOkf
	yeo7OoQOEs5PMZkVwZKSkzvrFK6al0ZHUR3vN1PB1Rv2oTeuMYZri41z0Nmh8HjYzjGn
	cbLDBJEf8oxtF7LqvAAbQy/bNYH/anr89Eo7lSP+IsO5Nb+Fz4wOcHab2IIFfc1aoBGX
	yj0A==
X-Gm-Message-State: AJcUukfa0IllVLxN8vZghW6N3NPNRVVOfDFuFw9lTOd7/gNspeZuAvjz
	SQPIgXoiS6PPuWyYk9n+101DsQ==
X-Google-Smtp-Source: ALg8bN5Gi2Ep+u4PfsreV7qxDfGuPLF2FFuRXrFOSouMxC0r+uvh6+C2MeqPui0zE/FJmSxV4kF9aA==
X-Received: by 2002:a1c:60c3:: with SMTP id u186mr6629829wmb.66.1547310138153; 
	Sat, 12 Jan 2019 08:22:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm65748132wrs.58.2019.01.12.08.22.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Jan 2019 08:22:17 -0800 (PST)
Message-ID: <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Serhey Popovych <serhe.popovych@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 16:22:16 +0000
In-Reply-To: <018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Sat, 12 Jan 2019 16:22:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
> Richard Purdie wrote:
> > On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
> > > In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while
> > > kernel
> > > selected by the installer depending on PowerPC machine type:
> > > 
> > >   * 32-bit for PowerMac G4 (ppc7400) and below
> > >   * 64-bit for PowerMac G5 and above
> > > 
> > > Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
> > > userspace
> > > making build impossible due to missing some of lib64 multilib
> > > equivalents in Ubuntu repository.
> > > 
> > > Using setarch(8) override to make whole host look as PowerPC 32-
> > > bit
> > > can actually help with build but requires mapping for ppc target
> > > to
> > > their libgpg-error equivalent to fix native build.
> > > 
> > > Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
> > > command:
> > > 
> > >   MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline
> > > 
> > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > ---
> > >  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-support/libgpg-error/libgpg-
> > > error_1.33.bb
> > > b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > index 325529d..4153954 100644
> > > --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > @@ -47,6 +47,7 @@ do_compile_prepend() {
> > >  	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
> > >  	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
> > >  	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> > > +	  ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
> > >  	  ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
> > >  	  ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
> > >  	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
> > 
> > This doesn't feel correct. It only works if you're using the local
> > setarch workaround and I'm worried most users are never going to
> > find
> > that.
> > 
> > I'm fine with adding in general fixes but this is getting very
> > specific
> > to an very uncommon usecase :(
> 
> Understand your position. Doing setarch(8) to run bitbake on ppc64
> kernel with 32-bit user space with missing 64-bit multilib seems to
> be the only option.
> 
> Anyway this change just maps ppc to corresponding tuple used by
> libgpg-error, so with this fix we hit both
> 
>   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
>      no multilib
>   b) native 32-bit powerpc host that is running as virtual machine
> for
>      example).

I'd understand that if this were just libgpg-error-native but our
qemuppc builds work which I guess is why I don't quite understand what
is wrong here?

Cheers,

Richard




