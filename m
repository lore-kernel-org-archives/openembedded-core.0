Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3FFD2736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:59:01 +0000 (UTC)
Received: by pasz6 with SMTP id z6so18997424pas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 19:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Fvieb8MMntqvt4DuvFXl6JBHBMUTFXr8NcoRmJC8Bws=;
	b=XQNACfhE7t9PWd3ZdYOlMfGJn+y/Y64/2tOC6SyKAy6MzF+taP7FTiEvvoVGhQfIJ1
	oBEgZicclpNy2mnoq/OTeBH5V/NR0AWCPqsa4GvG7b+UqElM0olhlmP0aWbZo6Vq1b+Q
	RiGabcTJtyEoQ6kwp3qZhB5fKbjft15BeURwbZybiVxYChN5/YHHq2jJr4fnpbp7llX8
	/LdBiTsEftylT4oQ/ZBiA4HxOfK8XQhEcR6FES+Fwv42nwd5T2v+Hwf5mqsgxSYVSKRs
	2M/0gqbrigrUzQ44KDaEXqaaDyBrQ1+hklTzU55g23NbiKxTS2eysy2ysU9NebqD9fSz
	cxbQ==
X-Received: by 10.68.201.97 with SMTP id jz1mr11297515pbc.28.1447214341845;
	Tue, 10 Nov 2015 19:59:01 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:4800:3563:946f:4500?
	([2601:646:8601:4580:4800:3563:946f:4500])
	by smtp.gmail.com with ESMTPSA id
	ey2sm6895902pbd.77.2015.11.10.19.59.00
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 19:59:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151110130935.GU8499@bill-the-cat>
Date: Tue, 10 Nov 2015 19:59:03 -0800
Message-Id: <58549136-994C-4F05-9310-5235F4E2F618@gmail.com>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
	<CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
	<563B6674.1030106@pseudoterminal.org>
	<20151110130935.GU8499@bill-the-cat>
To: Tom Rini <trini@konsulko.com>
X-Mailer: Apple Mail (2.3108)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Wed, 11 Nov 2015 03:59:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Nov 10, 2015, at 5:09 AM, Tom Rini <trini@konsulko.com> wrote:
>=20
> On Thu, Nov 05, 2015 at 03:23:48PM +0100, Carlos Rafael Giani wrote:
>> On 11/05/2015 03:22 PM, Otavio Salvador wrote:
>>> Hello Carlos,
>>>=20
>>> On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
>>> <dv@pseudoterminal.org> wrote:
>>>> So, this is because of the TOOLCHAIN_OPTIONS ?
>>>> Also, what about the ${CC} ? Right now it won't work properly with =
clang for
>>>> example.
>>> The clang is problem might involve us to rework something but all =
this
>>> needs to be based on last U-Boot releases; we shouldn't put
>>> workarounds and hacks on OE-Core without good reasons.
>>>=20
>>> Has the clang been tested with 2015.10?
>>=20
>> Still, then I'd add something to output an error message like
>> "U-Boot can only be compiled with gcc". Right now, the error
>> messages that would occur would be highly confusing and misleading.
>=20
> U-Boot supports clang, but it's not as well tested as other things.
> However, this patch is still wrong as we do not want to try and force
> flags to gcc, just like we don't with the kernel.  For more on U-Boot,
> see doc/README.clang (And then possibly do some fixups, I'm not having
> super luck with it right now, but I'm in a bit of a rush right now).
>=20

This patch is however injecting flags externally, so in case you were to =
use
clang with OE in context the TOOLCHAIN_OPTION will be appropriately set =
as well
so this should work fine. As far as u-boot=E2=80=99s own build =
architecture is concerned
its fine. I think the real problem is arising due to toolchain defaults =
in OE
e.g. when we default to hard float gcc does not really use hard-float =
unless specified on commandline. One can argue that OE should be fixed =
for that or gcc
should be using the right ABI as default which corresponds to default =
configs as used for gcc in toolchain.

One concern here I have is that when we switch float-abi like this, what =
is the impact on u-boot itself, has it ever been build and tested with =
hard-float, as long as there are no float function arguments this should =
not do anything to code
but then we need report on this.=20

> --=20
> Tom
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


