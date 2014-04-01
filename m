Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id B21F86CA54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 05:41:54 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so8348203ieb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 22:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5Bb+P8YCstTMfbhnq3Kd+FykFfNwZ+NDhKKvfHBp25U=;
	b=aCogPwbdr5NBaASPC1jR5J7ZBHvK1wckqFAatijyKmMRzDyRNJEnUAwOGn/LhwysS/
	GNOln4/spaEUz3o072/cSM6pDvhmnrc4JGGP3AYt8oFvFZ3lGdZBpSlXcSm4ji8VxRi8
	KOoFcdLLj1y4qnxYD5jp0U4m5juSYaUHaw5LaF4ZmG+IXh17E4VXIxp8ELy8Z89QZLOG
	QTLusi2D2X9ZS3x5M3neVv08htHQCckNiQpE/qUj1+G7K87SrLiIckH/88e1KcSauo8D
	falxyiwagQgD7xuIuhTwnpDAwfrJyMaOPgMtWL9oDkd7DyTFhukYvdGmoJOLRP7hjKZJ
	pn9Q==
X-Received: by 10.42.203.202 with SMTP id fj10mr27939561icb.51.1396330915266; 
	Mon, 31 Mar 2014 22:41:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Mon, 31 Mar 2014 22:41:24 -0700 (PDT)
In-Reply-To: <20140328172824.GJ3370@denix.org>
References: <1366735649.5732.21.camel@phil-desktop.brightsign>
	<20140328172824.GJ3370@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2014 22:41:24 -0700
Message-ID: <CAMKF1srgiA4vLo0Ji78LOV9_rXegqJzaMyaBdkm+gpqhYeuGFw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Always use ld.bfd to link the kernel
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
X-List-Received-Date: Tue, 01 Apr 2014 05:41:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 28, 2014 at 10:28 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> -KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld ${HOST_LD_KERNEL_ARCH}"
>> +KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>
> I know this is almost a year-old change.
>
> The question I have is - what should one do when using an external toolchain
> that doesn't have ld.bfd provided? I know these days with gold vs. BFD linker,
> it's common to have ld.bfd, but there could be exceptions...
>
> Should this assignment be conditional, so it's easier to override from
> local.conf or distro?

Can external toolchain create ld.bfd symlink ?

