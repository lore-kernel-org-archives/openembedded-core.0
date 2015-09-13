Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CF28473243
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Sep 2015 07:13:39 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so98259939wic.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Sep 2015 00:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=TauBkcAatEiKEWtNKEXJ2pKY92SlwYzJy6Y7VSInfU4=;
	b=XUPvClzineEKreoAQPKeIF9f6RLIG2WBVnntBLj9FMWMTNuW1UzKFhGpa1SF5PsG/7
	Pe3bW+2EZAyid7jMzE1TJ6slhfbOWw2BlRvgGHtknz3LOgLjjVh0kk77n1OAIKhQEiuu
	WLDhEk81hcNnAqZVf1+CYqwvwN7mjhCWI5dkiCocn2b0Jh36XfGre7XLscje0/Y2lm0s
	loRuOBHdc4EMBa8q9uKw91evgkRhsyxUzJRdCB3LRouruXd16nji6UzE5TNRZcyjAEQB
	3/NuEIVWgYgBQyzIcLI8SgoIhfF7OMtCuIvHkcAVwB0DjJoJwh1HBdp7uTnTO7dLAMBd
	uMCA==
X-Gm-Message-State: ALoCoQnCEl6j5AbEPdoljQNUkYGCFYnN6Og7E6yjFF3KUVK/YKfPc2SBCnIMgW6cyE0gkN8Cn9NH
MIME-Version: 1.0
X-Received: by 10.180.186.195 with SMTP id fm3mr13794174wic.1.1442128419019;
	Sun, 13 Sep 2015 00:13:39 -0700 (PDT)
Received: by 10.28.127.141 with HTTP; Sun, 13 Sep 2015 00:13:38 -0700 (PDT)
In-Reply-To: <1442095230.18370.2.camel@linuxfoundation.org>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<7f18159f085ddebd9b4dd58912b83c83f092b10e.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1442095230.18370.2.camel@linuxfoundation.org>
Date: Sun, 13 Sep 2015 10:13:38 +0300
Message-ID: <CAGNsrLD2jivE1q9g6HO2Yzoc-fRb=+CZF_sTS0moXUc1b6ZAXA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: leonardo.sandoval.gonzalez@intel.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/3] iasl: Recipe taken from the luv-yocto repository
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
X-List-Received-Date: Sun, 13 Sep 2015 07:13:43 -0000
Content-Type: text/plain; charset=UTF-8

On 13 September 2015 at 01:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2015-07-14 at 20:07 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Taken from [1]. ACPICA is licensed under two main licenses:
>> 1) An Intel license (Intel-ACPI) and 2) a dual GPL/BSP license. This
>> recipe uses the latter.
>>
>> [1] https://github.com/01org/luv-yocto/tree/master/meta-luv/recipes-extended/iasl

fwiw, acpica is already part of meta-oe and generate iasl:
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-extended/acpica/acpica_20140828.bb?h=master

>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>> ---
>>  meta/recipes-extended/iasl/iasl_20150515.bb | 27 +++++++++++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 meta/recipes-extended/iasl/iasl_20150515.bb
>
> Sadly this and the ovmf patch trigger failures in world and world-lsb
> builds:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds/495
> https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/builds/213
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

