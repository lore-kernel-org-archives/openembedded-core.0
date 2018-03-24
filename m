Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C17178332
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 18:59:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e194so8830971wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dXJxKx1ukbAiNNW91vELGuYJcciL6k617a5sMVnqBnQ=;
	b=jcuRVkGqSm4NMp1RsLU+UbGEmytET3Cnimt7wzhAX0JSncn27l0S50ldBsRk5qFCbm
	7gHQa9+9NyO1IRvfOBgVOge2Tj2QX9Fkr4SIR1hImr/vC4Nvzv/QrToWODYlkKYdH+Wm
	RmwlYGpKLIW/gsPBK9a9sJrl0ODwHzQpfJga4LOztebr47iw4oO89RNhvImioBbObJgB
	tRJw7TQLPZ7bKmWoajUrv2leHDe+hm4yOheAx96Rnw94QOiuvF0U76Ra8lnTXnatjDXY
	9YwqMb+R/O0wzZCvYaBJCwyR3Qiz59SC8mJEdFG3BWGyXTK0mQa9UZ0w04XOtEWQOEGR
	r+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dXJxKx1ukbAiNNW91vELGuYJcciL6k617a5sMVnqBnQ=;
	b=haGMIqu5Gt/nvwjklQjUdi4mCeNmk57NMowCDhXxG/BxJ8IRLeQ69Mb28ODGTr7bTe
	Zkx/bvWmVe3lfeaJJallWcylC+eHb4Qam0bs2/ROUF9MNehGxzzTtvmMTiDBEkSEyVLr
	iSdsEQSebMWtqEx+NZeicUqCzmavBpIK0JHpKEmZFmRxZ3QiNqswcZ+G0HSGJtAgPy/h
	tKnw8WH8SZbjpWnC1RnfK50ZL25FifSSbG6m1W2YVcmMiOg6h/GzD23oJT1FLfgpIt+3
	78jSnZYIH7/0YoUuTWbUifhm0a3QnXTNNs/fFtCcGx1MR+W7AWnD9hXRR13nTL9rWATX
	s8IA==
X-Gm-Message-State: AElRT7EcH1iWWKCifhMFpx0+NYPbxY+v6lKpapgkAP0n7o5uY3lbhcsk
	Oo2ItBTki9/FCTm4tT78dJzVrd6Co3QCF2nLVNQ=
X-Google-Smtp-Source: AIpwx48ww9QBGfF6SWTKc6PozvMxHMq3H1tLJ83STzH8R9FHxIAJuUrRGkjGcIoaZyPjfd6TqvYa2JJdGQCur81BT3g=
X-Received: by 10.28.63.148 with SMTP id m142mr1444895wma.153.1521917967645;
	Sat, 24 Mar 2018 11:59:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sat, 24 Mar 2018 11:59:27 -0700 (PDT)
In-Reply-To: <20180324132246.28c2f8cd@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 24 Mar 2018 11:59:27 -0700
Message-ID: <CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 18:59:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 11:22 AM, Seebs <seebs@seebs.net> wrote:
>
> Every other function we wrap *has* a meaningful prototype, with
> arguments in a knowable order. But look at the EABI example; if we want
> to actually *process* renameat2(), it's not enough to pass arguments on
> blindly, we have to be sure we know exactly which arguments are which.
> If the pointers can be 64-bit pointers, though, that may mean that
> we have to expect the incoming arguments to be (olddirfd, 0, oldpathhi,
> oldpathlo, newdirfd, 0, newpathhi, newpathlo, flags), but only on some
> architectures, where others would use (olddirfd, oldpath, newdirfd,
> newpath, flags).

The EABI example applies to 64bit values on 32bit architectures. Since
pointers are 32bit values on 32bit architectures the example doesn't
apply to renameat2 (which only passes int's and pointers - nothing
which would be a 64bit value on a 32bit architecture). ie there is
never any "oldpathhi, oldpathlo", only "oldpath", etc.

If there _were_ some architecture dependent ordering of the renameat2
arguments passed into the syscall() ABI then it would have to be
reflected in the code which originally calls syscall(), e.g. the code
in gnulib.

  http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/renameat2.c;h=a295ec33f33dfe14e1d29cfae5d2c36e82d01ef4;hb=HEAD#l74

