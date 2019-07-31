Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 408147F4BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:41:46 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z4so67482794qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rsxcZcm7T4KGbPL0GUF9t2m1rJ3DGqDNoy/sqQv60sI=;
	b=Y7PZiE8MVuY35CsJ9cTSSUJ33sFtCRQSiIHKiUKeMpKwVIkDlpDFnKAV/NRk+lysjT
	uFCB90OFffJiX3Pln+a4w7+zNC6cIikOaA1XR3xjsedBI5UUyrpLwhoAeTLeZ2kgKnRR
	kA/EZeLkOgIWZJlXM1xoBmfl8GrJxpfap7q911EDBbcH7xGw9kuG9bsY+qLi+cpyZE0K
	aObTB/4rZwzlkR3/brzTzgRMR/xDkMeFH+TEizyLlNAZ6jlFOAAu9gsi/F0hlYaqtuSr
	3KYpsEob2lQQApNvP3VFFjEC/XnoWDjhDvFOuTs263Mz79EdwaHaygAjho7edP1AIFUF
	MhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rsxcZcm7T4KGbPL0GUF9t2m1rJ3DGqDNoy/sqQv60sI=;
	b=Y4ktBPvDM7bl/h5D6XGjg4gVq9kwaDamgIjcBiruIUu8ldwoQd4cLDSbFi6FN6qj5F
	S31yhmNw1x2ELmlNp3DoBKlmS7uhmDch0VzoHs89PNuIYSQWwW00NyPUy6boipcJTfAM
	jSNOTF+y9rI5BKmZqX966QOymVdm2/5fiJZZBab11uzXLLF4sgPLx/CBV7FSWTNWP8jB
	F8mTiIOGqZvLS/Y5/Y435YPKUUj/t+opp8wCGoXXTtDL3kKwwy7x6JgH9dpcnHpVyM2v
	G9wSkIa0O9TLJau2jOy5ep5ErVNXnokqs5QbKQAcCaPmJpfbyq3O1f3WS+9Gi+8SdUGL
	NwQg==
X-Gm-Message-State: APjAAAVJoJlgBEC+JDQpD3yBZgKU1RYhnlk7sUN3GlOjvfxtIFuCfxdi
	tSPjOQzJw8ovI7Il9v3LeFIXBi9CNJoVutQ39R4=
X-Google-Smtp-Source: APXvYqwr9jry7phWMvwoww5Pe26/bae4klLQqG4irwBU8kh8dRp6YLoahZ4geJE/b2ll3V0TpRrJ4e5Yo9w8i56SNjM=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr89162136qvc.68.1564594906740; 
	Wed, 31 Jul 2019 10:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
	<20190607121954.116898-3-alex.kanavin@gmail.com>
	<2d919bbd6f607604f8315c95e1154c169fd2c5da.camel@linuxfoundation.org>
	<2c3427c3986a8fe363e6a99f3d78a136c79efd61.camel@linuxfoundation.org>
	<4cf0eb7936f1e27033202312d5e4f27e27266641.camel@linuxfoundation.org>
	<4b8b7f96-a4df-f43d-603a-b3656f882563@debian.org>
In-Reply-To: <4b8b7f96-a4df-f43d-603a-b3656f882563@debian.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2019 10:41:28 -0700
Message-ID: <CAMKF1spBpjdWoKPGDGvOrRgb9dx0YaEZVdM8KLpW2YSb9Um2ww@mail.gmail.com>
To: "Ying-Chun Liu (PaulLiu)" <paulliu@debian.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions: Using OE toolchain of different arch.
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
X-List-Received-Date: Wed, 31 Jul 2019 17:41:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 10, 2019 at 12:47 PM Ying-Chun Liu (PaulLiu)
<paulliu@debian.org> wrote:
>
> Dear openembedded-core developers,
>
>
> I need some help about using OE toolchain from different arch.
>
>
> For example, on RPi3, we build the rootfs using armhf architecture.
>
> (require  conf/machine/include/arm/arch-armv6.inc)
>
> That means the whole rootfs is built by arm-linux-gnueabihf-*
>
>
> But when adding TF-A and OPTEE. On RPi3, TF-A and OPTEE runs in 64-bit
> mode. And TF-A will then load u-boot (BL33) and runs it in 32-bit mode.
> So the rest of the systems still run on 32-bit mode.
>
>
> The problem is now we want to build TF-A and OPTEE. So we need to
> compile it by aarch64 toolchains. That is we should use
> CROSS_COMPILE=aarch64-oe-linux-* from aarch64. But however it seems to
> me that I cannot do that. I tried to make a recipe for TF-A by chainging
> architecture of that recipe but I still don't have aarch64-oe-linux-*
> available. Is there a proper way of doing this?
>

I assume you want to use a prebuilt toolchain and not built another
variant along with
what OE will provide you. You can try something like this

https://github.com/akuster/meta-odroid/blob/master/recipes-kernel/linux/linux-hardkernel_3.14.bb#L7-L21

> BTW, this is not about ilp32 because we still want the whole system runs
> in armhf for compatibility.
>
> Yours,
> Paul
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

