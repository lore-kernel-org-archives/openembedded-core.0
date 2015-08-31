Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 878E374197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 18:46:08 +0000 (UTC)
Received: by obcbp4 with SMTP id bp4so28047853obc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=m6r/EKh0qpDSB+M1CsINcrXXItMWeaA1XtYHHfcAKuw=;
	b=z28c8B7kzOHk5YktHOAeQvFpfZxiKRMyj4C+oqxI/rvMCnEL2uT3b17wsnTaK4G/+q
	tQk6Jp6sFyyqbB7WTv2cYH4MFy4Mu9o6FzoNEJxmJGlGq/OKOZou0q/uMJVO/0R9WV0q
	uqlHgoTfFZvwXdFc1i1RwwhZB63pLRlBzmFggy22xu01q6Thl6PCXY6PN4YENWhGbyMf
	Owpyezlvhx2T1u1q/lT4/vUQjbtOprMM7QJFRTKkvBeOAu3WIHNhoTCYKJXZSAHQCejz
	aMJqMP/rWmQ1co5Y+IVk4jzDJOFH+KaX8uBnG0CxAlc3SRNtgXm7aKG8QU+NNMlEsxdI
	CdVQ==
MIME-Version: 1.0
X-Received: by 10.182.236.200 with SMTP id uw8mr14071914obc.19.1441046768633; 
	Mon, 31 Aug 2015 11:46:08 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Mon, 31 Aug 2015 11:46:08 -0700 (PDT)
In-Reply-To: <CABcZANnZNg4m_ofR8DZnJOsZLG8=2EPxPgTLRt+BYM0p6QnOJg@mail.gmail.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
	<CABcZANnZNg4m_ofR8DZnJOsZLG8=2EPxPgTLRt+BYM0p6QnOJg@mail.gmail.com>
Date: Mon, 31 Aug 2015 11:46:08 -0700
Message-ID: <CAJ86T=WwFqYkNfNnNKZFLWAKninfkh85Yb81bbzK3UoWxRtwBA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 18:46:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 11:19 AM, Christopher Larson
<clarson@kergoth.com> wrote:
>
> On Mon, Aug 31, 2015 at 10:51 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
>>
>> On 8/31/15 12:35 PM, Christopher Larson wrote:
>> >
>> > On Mon, Aug 31, 2015 at 10:10 AM, Khem Raj <raj.khem@gmail.com
>> > <mailto:raj.khem@gmail.com>> wrote:
>> >
>> >     On Mon, Aug 31, 2015 at 10:05 AM, Flanagan, Elizabeth
>> >     <elizabeth.flanagan@intel.com <mailto:elizabeth.flanagan@intel.com>>
>> > wrote:
>> >     > On 30 August 2015 at 17:31, Khem Raj <raj.khem@gmail.com
>> > <mailto:raj.khem@gmail.com>> wrote:
>> >     >> There is m4/ax_pthread.m4 macro which uses GPL-3.0 with autoconf
>> >     >> exception, there is no other occurance of GPL-3.0 use, lets mark
>> > the
>> >     >> licence correctly.
>> >     >
>> >     > Unless the macro is actually shipped with any of the packages, I
>> > don't
>> >     > think we actually need to do this. Generally, LICENSE should be
>> > the
>> >     > intersection of all LICENSE_${PN}*.
>> >
>> >     its not shipped on target,
>> >
>> >     >
>> >     > I think the correct fix here is actually:
>> >     >
>> >     > LICENSE = "GPLv2+ & PD"
>> >
>> >     why did you drop LGPLv2.1+
>> >
>> >
>> > I think we need a way to indicate the license of the source in addition
>> > to the
>> > license of what we ship, to cover the case where the license affects the
>> > ability
>> > to redistribute sources. I'd thought that the base LICENSE was
>> > essentially that.
>> > If that's not the case, then we should give some careful thought to how
>> > to cover
>> > both.
>>
>> The way the recipe 'LICENSE =' field was defined, AFAIK, was that it was
>> the
>> license of the source used to construct the binaries.
>>
>> So if the autoconf was GPLv3, but the package and it's sources are GPLv2+,
>> it
>> would be listed as GPLv2+.
>>
>> Making this assumption allows us to be confident that the general license
>> of
>> recipe matches the binaries constructed by the recipe, allowing
>> LICENSE-${PN} =
>> ${LICENSE} in the general case.
>>
>> This does certainly put in an interesting situation though if there is an
>> obscure license where the binaries and sources are effectively under
>> different
>> restrictions.  (Perhaps if a build environment contained a license that
>> required
>> an advertising clause, but the produced binaries did not include it.  The
>> obligation to advertise or not could be up for some debate by a lawyer,
>> even
>> though the source code may need to be redistributed.)
>
>
> Indeed, that's one case I had in mind when thinking about this.
>
>>
>> Do you know of any cases where this may be true or where end users may
>> have
>> concerns that a license is not properly represented?
>
>
> In the past, I've encountered situations where one is in a position legally
> to distribute the binaries, but not the source, of recipes under a
> particular license.

That's a common case for proprietary licenses. Do you have an example
where the same kind of situation happens with open source licenses
too?

> I don't think I've yet seen a situation where this was a
> license that sources were under but which wasn't listed in LICENSE, yet,
> though, it's theoretically possible we could encounter such a thing.
>
> If the license with problematic source distribution requirements was not
> listed in LICENSE, we'd not only be hiding that knowledge, we'd not be able
> to use the license filtered source distribution in archiver to limit
> distribution of those sources :) Possibly an unlikely case, but one I think
> there's value in considering, at the very least.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

