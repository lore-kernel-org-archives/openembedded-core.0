Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DADE771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:16:55 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id y34so29466713ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q2AmZ4hPlQukTIs5lC5GSyL5NQOd5bsP3TVn3TG8NUM=;
	b=CuJOsGBKQdHqC8lB/ETC3u3so8iCWKS1JUzjnubrqZi2e+Ib2dXQOTVLQtH+xuVsCp
	BENM2g93op9EGVfn8U77IS9+b6KtrQLTjCkAoSyaaBGoqHfvZ9mNF0L9ekoxeUh77Dnh
	ly4QELpjrO8xPicQhC/o++NJzWEAU7pjJei4Ya2Ad93+MRP1oanT4xhuD9BK4Cx583wg
	Ix9z2WIOO+bPukNGfF4U7FQNup1tD2XaV+Y2Tgfg89tsFHothltu6VLnOmxJtoYTtrYn
	as7OdMrhqQtgKH36FgksI4RmoTnl6WL0Uh+faDOzYnEzQ4wn4/JM14+JszzcSlhrXd0+
	iShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q2AmZ4hPlQukTIs5lC5GSyL5NQOd5bsP3TVn3TG8NUM=;
	b=KYuhFgVccoEhsjYq9PeAlDuiB3t3LVkFW3ikHyRJIIcaGONzvPQTdI63SxiK6+b6B3
	RBSXdwoCOA2htQIRWWseHOUaYXssL9ZrEwmzlJsH2R+6Npxz8E6guVyoEAX4fgBuViPq
	z8bpXX8cNCd62iW0OG1BBnMcCvEltawomNLe0wi7Azl1wm9gAJVXrNe1jRDF9WFGApoJ
	edo/7jBQZxtkGKDKbE6hPc4UySvniduoYalwUVV7LZQ1ZataGUt9ndvfwneUoUqenMWI
	Fi90pKAgcnByLUzSFNCObL5N8yWpLP9rI+2zbLMLFqDC8/B4jN4fwvSdQzEKVKQgFrnc
	bgSQ==
X-Gm-Message-State: AEkoouuvTzkw3cqijNhSv0kk+Rgr2QVRrINtpYSlB4a5z4TRpTcHmNBPFIG8Ray110Ar0dWNwiN9i+sYnR+Dzw==
X-Received: by 10.107.25.14 with SMTP id 14mr92641960ioz.168.1470687416579;
	Mon, 08 Aug 2016 13:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.88.4 with HTTP; Mon, 8 Aug 2016 13:16:56 -0700 (PDT)
In-Reply-To: <20160808180536.GP8521@denix.org>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<20160808180536.GP8521@denix.org>
From: George McCollister <george.mccollister@gmail.com>
Date: Mon, 8 Aug 2016 15:16:56 -0500
Message-ID: <CAFSKS=M=upTtm_zeHwVAvoka7JQm5h3oDxt1E5Odt6+7xe1CEg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, trini@konsulko.com,
	denys@ti.com, Andrew Bradford <andrew.bradford@kodakalaris.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 20:16:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2016 at 1:05 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Aug 08, 2016 at 11:37:52AM -0500, George McCollister wrote:
>> Add support for building fitImages that include an initramfs and booting
>> on x86.
>
> I'm in the process of testing this version now.
>
>
> I'm wondering, if bundling everything in a single patchset will delay
> acceptance even further? Case in point - I'm mostly interested in initramfs
> support and it's been in limbo state for several months now. It was a single
> patch back then and there were no major comments or issues with it. Few months
> later, 2 extra patches were added with x86 support. Now recent $B change broke
> few things and we need 2 more patches just to get everything working again...

I'm surprised it wasn't accepted when it was a single patch. At this
point I don't know what's keeping it from being accepted since I
haven't received any feedback. I suspect whoever is maintaining OE
core doesn't have time to look at it.

>
> The reason I'm bringing this up is because I've been working on this area
> recently and would like to contribute back some code (fixes, customizations).
> Since it depends on this patchset, I'm not sure if I should wait for it to get
> accepted or we'll just end up growing the patchset for another iteration...

Your fixes, customizations are welcome however I've had this concern
as it has grown. Hopefully we can get some feedback soon as to what's
holding up the acceptance.

>
> --
> Denys
>
>
>> * V2
>>  - Include Andrew Bradford's cd to $B patch since it is now required for
>>    do_assemble_fitimage to work
>>  - Fix initramfs support patch to cd to $B in do_assemble_fitimage_initramfs
>>  - Remove ${B} in call to fitimage_emit_section_ramdisk per
>>    Denys Dmytriyenko's suggestion
>>  - Add patch to cd to $B in do_concat_dtb()
>>
>> The following changes since commit c4dda05cb9755cb865c1d1bd142196f8a9f45d3d:
>>
>>   Revert "packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput" (2016-08-04 20:54:57 +0100)
>>
>> are available in the git repository at:
>>
>>   git://github.com/gmccollister/openembedded-core master-fit
>>   https://github.com/gmccollister/openembedded-core/tree/master-fit
>>
>> Andrew Bradford (1):
>>   kernel-fitimage.bbclass: do_assemble_fitimage(): cd to $B
>>
>> George McCollister (4):
>>   kernel-fitimage: add initramfs support
>>   kernel-fitimage: Add x86 support
>>   uboot-sign: Handle .rom signing the same as .img
>>   uboot-sign: do_concat_dtb(): cd to $B
>>
>>  meta/classes/kernel-fitimage.bbclass | 346 +++++++++++++++++++++++++----------
>>  meta/classes/uboot-sign.bbclass      |   4 +-
>>  2 files changed, 249 insertions(+), 101 deletions(-)
>>
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

