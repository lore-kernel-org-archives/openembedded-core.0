Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02CF77BE3C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 19:23:08 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id e8so18359119otl.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=l1b2iqG8+5AyoX8s1KYS6ioxwUOVIoC7YxwfPqk6prc=;
	b=EN0GFQrw3ER9xDmpP32QskXFCoiZ/vbPxV6G9ZV35b7nvK8udQA8DH7ht1kzK3LgwS
	7pDAiKdhR6wKNOOmWIylUjyM4xWU6Sfne1KfnkhqcFmyH1VR9n3RuAatInXQt09mgtLv
	jokSDW0mmOGtLoe8vmsUBI77GW7jCqmgo65wURaVvrf2eV6SPWmR5FiPJ0FJV+UczWZR
	OU6PufuyXZacvWInRfXbR65oCTR7N+eFxXEpUf3LJUJPgIdExwBN5OCG9YZFhl5OB/ac
	BGBUi9NFpP8R+k4BgQQPIdXKnaiALybzCspvg3ZJsrZdxiuEHqxjjg9fGSavajQ0KQfW
	a2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=l1b2iqG8+5AyoX8s1KYS6ioxwUOVIoC7YxwfPqk6prc=;
	b=BjGC34aSfIWlb0Jj/vXetov2LH8G37k7jIkMZhEjExZB8X2rK6/4DRifuOqTSyl9aZ
	vDaWdPCe1gmL1xPo/nEBb39sv98zeN0j6DdKs0zDkLM4G6vjd1+1MQ+uv2sOSGJS7WlO
	0qNdy3+gDzOiqyE+VJvW/dOw8O/ZGnr4DC6B/OiFXm4mn/UMDCRRVNyHvxKdV7J/v9DR
	f1KLQItgDrdMs2Ek+OPS2cKZSoVSA6VNdAiuH1oAYRrH/0+DI0P9e/YkOwWSiQ6IWxsn
	b1qieICXVm4/7Jzmwk/V3mnhTtWY16fx0t9np+j7npbeEg9NKeBdzt1DlqTgJ3cUnyIn
	dBtg==
X-Gm-Message-State: APjAAAW7aYw6PL8Rp6FqQzMcjthMOhorKbE9gtym7VPA7Bp9aO/IeuEe
	QAefeXFPttm7hNHwT1j5y3BKAWggbGuj489BfksWBSJb
X-Google-Smtp-Source: APXvYqyegPtxhaoDfmkWQASNbKO4uTfPvkb05eR6S8Cq8GVLnRFyFlC3nNQFrZySs1McfAd2zqGKsXqdNTV1WW3+KYI=
X-Received: by 2002:a05:6830:16:: with SMTP id
	c22mr16779912otp.116.1562095389758; 
	Tue, 02 Jul 2019 12:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190702182403.24099-1-wbourque@gmail.com>
	<20190702183053.2330.89816@do>
In-Reply-To: <20190702183053.2330.89816@do>
From: William Bourque <wbourque@gmail.com>
Date: Tue, 2 Jul 2019 15:22:58 -0400
Message-ID: <CANBSh+N4AL=o5bsuVEWJRUX+VzpsLv=dPBSo=OWCZBZnx_vrpw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdpYy9wbHVnaW5zOiBTb3VyY2UgdGhhdCBzdXBwb3J0IGJvdGggRUZJIGFuZCBCSU9T?=
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
X-List-Received-Date: Tue, 02 Jul 2019 19:23:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

The error "scripts/lib/wic/plugins/source/bootimg-biosplusefi.py does
not exist" is a bit puzzling : this is the new file my patch is
adding.
Is this test failure expected for new files?

I sent this using git-sendmail; should I submit using a different way
(pull request, ...)?

Thanks,


On Tue, Jul 2, 2019 at 2:30 PM Patchwork
<patchwork@patchwork.openembedded.org> wrote:
>
> == Series Details ==
>
> Series: wic/plugins: Source that support both EFI and BIOS
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/18505/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Errors in your Python code were encountered [test_pylint]
>   Suggested fix    Correct the lines introduced by your patch
>   Output           Please, fix the listed issues:
>                    scripts/lib/wic/plugins/source/bootimg-biosplusefi.py does not exist
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

