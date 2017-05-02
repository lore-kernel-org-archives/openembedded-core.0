Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1B771DA1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 16:49:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n198so15673881wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 May 2017 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9cSmTXzrzVZ36pSp8mXOj9WWJMJZgtOj8xB5lbXJCzA=;
	b=iZAxWUsM2LW5HF9iT2b5RXG+kRQZpwz3kRj5IMaD58P48d0kDH3g68egfy7/ysEpdQ
	+xKyh6KWc/4Km7MUnRhCtXk5hV3ZPcRJBwnKmu4jn6tf4U49gYx97ED66EwMXJBZ39sW
	Rv9SrKVpTKSjUEfjJwkhz5XXrSnrND9FCbVkP2CN+m9vfBFIxffKbFTGTKcoDvIoi09q
	FKr48Lfu4C5QVBZRaIV9UHPDVorqCXuDmayvMw0FQMTtQUXkhgjjAWoP9CI1igaMQ5Xf
	RClkTLiVHa7iSK3xivI2Apj7Rg83lkoqjJxJMEer5JnGkyfAh4lBrERhFNKh9lMmLfnZ
	8guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9cSmTXzrzVZ36pSp8mXOj9WWJMJZgtOj8xB5lbXJCzA=;
	b=ITodRN/wRZimupuVZ4pU4g4Cz0IbE6aMYdBoXNGXbWYKycGX8+Pylm2rVqRNNEvq1x
	OwUVzCSNuT5Tm3JXNCuh3ne3dTcheaCs9X/nVbr6RGh+OSntT+2uGohFlB3Ar2xm8JhB
	N2lwsgLDnw9qS8NhtXyQdQxqZGBQsGBhmVtQ607qEtWjV3Y8om8xveaZj9JHFQRSIfEn
	4gKhXUwaeg5o74fReFEQG1RZG9rOvB4rwR1bqPEKOSH4gCpAC7LN2eL6R+6yoaCRNXCx
	Lf18+68MJjRNNKpFW9dhL0QJgvnHU55Y7gzz9XvpSTPSwSfZ8fBTxiiQ7U6ThKGdo3bw
	1hfQ==
X-Gm-Message-State: AN3rC/5IjtOOgxxPTTx8eCFDgh5xf3qbZ2sVu2k0oO1Cli8a4EcJuF/g
	rqZid65FepuZRWAso9OwU45Wv06iQg==
X-Received: by 10.28.56.1 with SMTP id f1mr3489853wma.20.1493743752281; Tue,
	02 May 2017 09:49:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Tue, 2 May 2017 09:49:11 -0700 (PDT)
In-Reply-To: <CAPoQQ-3T6tJSTzzrpf5pfn7RXzP6FEic-54VFVt+6L=ZF5BD=w@mail.gmail.com>
References: <20170501194223.16344-1-dev@codyps.com>
	<CAJ86T=X4VYZTkCmeF1tsoKbXxYGJO-i1VPfVa36K38S1Qf-+zw@mail.gmail.com>
	<CAPoQQ-3T6tJSTzzrpf5pfn7RXzP6FEic-54VFVt+6L=ZF5BD=w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 2 May 2017 09:49:11 -0700
Message-ID: <CAJ86T=U29MAsgHYWo4qUt9C1j5CEDscJgEwttx9z6P+FQXEJqA@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Tue, 02 May 2017 16:49:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 2, 2017 at 8:49 AM, Cody P Schafer <dev@codyps.com> wrote:
>>>  do_compile[progress] = "percent"
>>>  cmake_do_compile()  {
>>> -       cd ${B}
>>
>> Removing the redundant "cd ${B}" should perhaps be a separate commit?
>
> I'm not really seeing that as useful, change right now can be viewed
> as "moves the ${B} from being in `cd` to being part of the command
> line for `cmake --build`". Is fairly straight forward because cmake
> requires a path be specified (where `make` makes it optional).

If ${B} is the default directory for both these tasks then "cd ${B}"
is redundant and can be removed. If it is not the default directory,
then removing it will potentially break do_compile_append() and
do_install_append() functions which rely on running in ${B}. That
logic doesn't depend on whether or not "cmake --build" takes care of
changing directory on it's own, so if "cd ${B}" is redundant, then
removing it should be standalone commit.

>>
>>> -       base_do_compile VERBOSE=1
>>> +       VERBOSE=1 cmake --build '${B}'
>>
>> This looks like it will cause parallel make and EXTRA_OEMAKE options
>> to be ignored?
>
> That is a good point. I don't think EXTRA_OEMAKE should matter here
> too much as configuration for cmake-based builds all is read at
> configure time, but the ${PARALLEL_MAKE} flag is definitely an issue.
>
> Doing this could work:
>
>     VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OEMAKE}
>
> (And similar for install)
>
> And for the case of `-jN` like flags, make & ninja happen to be
> compatible (they share a few other flags, like `-l` and `-n`.
>
> Another alternative is passing ${PARALLEL_MAKE} (and
> ${PARALLEL_MAKEINST}) instead of directly using ${EXTRA_OEMAKE}.
>
> Also: I took a look at what else `run_oemake` is doing, and it
> contains some output printing (`bbnote`s the make command & `die`s on
> make failure), which could be added directly around the `cmake
> --build` invocations instead.

