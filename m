Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 693526D7C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:11:20 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id z67so102385qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K4xScPzt5bo0lvB+5vC0WT54WNU4g0PGejktnELFED0=;
	b=s3szMx6HypnwAw/B+UkeJ7/irWQE4W3eiWwk2Ysb2DbXK5tmlFxNi1H1oaaAt/E0oW
	7GT6DgH09ol3oKYqrw15G80Q/jC/MKHcb0JaMGvoG2ntHLZlMovUSUqN1XD0ZqxzeedO
	Atv/8tX2ZcfP8DwuqZPzrhDhQfLABlrfLgq8MHlCani4zdBaPngIFqX1UD4IoFACQoz0
	8/l6zfkP1WeBLNdYsP40ukGXZyNE5ht/gOvamZxbA96b1Ok6Kb8Nn8IkyRvp7uklpA9f
	PPtDip0cjHYIsFJxAx6FRdXd1AZMbZarPL7HgCyxb22LmoA+YWJWbesu5bePh8qVOw2V
	SCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K4xScPzt5bo0lvB+5vC0WT54WNU4g0PGejktnELFED0=;
	b=uoPNm29CTjTFzP4p913lKJoe7tWjT3kJ+hU9H00f/0sszc+Gx1VCChn8m5bZdnlcPF
	haskDD2rNTnLYatKv0uyDD/yqm8IiSfs2vB3fFHRbBo9kKDA5pvvNn46aol2lOE7ebs3
	Ouogsi3uLdqPka+0jMgJtsqtitN9pADCsnp+7dLt4O6vcDf7Mn32gDLoRj/1kVoVYBtn
	grnDMNOpzdnJelMa2RWh8VvVmSx4oJ4KRO5GNBlgOky3L69xCYkKbzPwiJm8i+/tIQ9q
	dF2DxHkZdQOaKUM5j/fsXPlCyBUgJ0+4nNsBeqlD99dT9K7kInz20HAdezNg6O+8eGaT
	9Plg==
X-Gm-Message-State: APjAAAX5zI/1pDY5Z/YT+hKIFpvnVr315/YxgP2r/8FRUxCXotNyKKgA
	Leo9pKBcvtEktqPnoQuCckpu0pwHU8M2sIP0RE0=
X-Google-Smtp-Source: APXvYqypS0NiQG3cuIQBH8fct4Et+fSw5y3F7k46N/Ug/C3e5RKaughBFWkiBy/xJKZAgZVi/FFlNWUkA/xxhx4m9kI=
X-Received: by 2002:a05:620a:13d1:: with SMTP id
	g17mr189313qkl.9.1569291081012; 
	Mon, 23 Sep 2019 19:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
	<CAKmqyKPkQAHM5+X0QfRAR1wneOe2o1ffBirz0boqv8PetCRVkQ@mail.gmail.com>
	<7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
In-Reply-To: <7e0cc8d45ea1b5556dccf61519de8e0d31575550.camel@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 19:10:54 -0700
Message-ID: <CAMKF1sp6hDii_4dH6nrr1VstobnP2sCpyNUy74eiOaJGqVKhNg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu 4.1 boot regression with riscv/musl
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
X-List-Received-Date: Tue, 24 Sep 2019 02:11:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 23, 2019 at 6:39 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Mon, 2019-09-23 at 17:59 -0700, Alistair Francis wrote:
> > On Mon, Sep 23, 2019 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > Alistair,
> > >
> > > OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
> > > port. I could pin point it to
> > >
> > > https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f
> > >
> > > it works fine with 4.0, I havent looked further
> > >
> > > To reproduce
> > >
> > > build
> > > MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
> > > TCLIBC=musl runqemu nographic
> >
> > Thanks, I can reproduce this and am bisecting QEMU now.
>
> This QEMU patch causes the failure. It reverts cleanly on master and
> that fixes the issue:
>
> RISC-V: Clear load reservations on context switch and SC
>
> This prevents a load reservation from being placed in one
> context/process,
> then being used in another, resulting in an SC succeeding incorrectly
> and
> breaking atomics.
>
> Signed-off-by: Joel Sing <joel@sing.id.au>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>
> I'll investigate a full solution tomorrow, in the mean time do you want
> to just revert the patch?

yes lets use the revert for now, this will give you enough time to
investigate solution
since its riscv specific it will be low risk and we can even go to 3.0
release with it

>
> Alistair
>
> >
> > Alistair
> >
> > > Thanks
> > > -Khem
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core

