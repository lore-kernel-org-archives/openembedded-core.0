Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7464D60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 14:12:04 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so9785760qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jghrg36IXwB9pCKwpdoYgu2YdluG2Bs9D4+M6wLCFJY=;
	b=vHtBDsRcPgvVls4LY5SG/xgP/kWUqOBj48X4C2HL+KVbIw63IpSb7vI46R93PEdTyU
	yW+AfhCCOSvVC3Mf521W+SMbo1DabVyK2dp7FqhyCLwn/mOdwZJj+LJmm23SZ3s7dVWj
	smBCHgmR6IeA3J9YvuQ6apgbYKvoTmBRJyDVId94sO1IZSpcW+2+NvbquSJm/UqHHv5h
	6ykEKCRcuSvvBddtg+QXjR2WYnU/RQ0PUX3iXz+aoaDyvyVYOWDjxKHY6ugEtCWxN9wM
	yYTEnX5/ABog8nz4KLOe+B6g5j89tBZqscQnl0ulVTr/M4+XP7mfD9uiCy73k9sita9d
	vG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jghrg36IXwB9pCKwpdoYgu2YdluG2Bs9D4+M6wLCFJY=;
	b=CHX0p15VrddoAW4wcFJtDpTzvJ5J1bT1YNNr4SFPG207w/Uh9OiXzulXNf9aZtpWb/
	nl998N7vZeDOc6faSv1XyHBk3LpujeCW1iW0eEhtsT+4AdI3GNA1TsaQN/RdYYAKWjja
	FjOOp51Y+ifcwX9EmPlPRWUUYLU7GGkwPMc5BnZyGwohfGwxwX4uqkiWmDwyLmkgNuo3
	V+3cHtJIHCa7hdDNep+M7+Ygscc6NOlmNt47wm7Gph5bgJ3rm8vUG8QgSObVAgIAzHUc
	YFdQ2paiUb6e53fW5D1On5o9VeLfZiariCMzahaFYkBiosjidUE7V2OjhY0jMYHuivJ9
	eDcg==
X-Gm-Message-State: ALyK8tL5NNWled2qrVwbI8T8UjcvVcknyocSFVhmeyUZ6Eg7eSvo1iQa0xEsJMqNp7TSjty4C+O2z9JOoFkP3A==
X-Received: by 10.55.16.232 with SMTP id 101mr8099871qkq.151.1467987125655;
	Fri, 08 Jul 2016 07:12:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Fri, 8 Jul 2016 07:11:36 -0700 (PDT)
In-Reply-To: <CAJ86T=U4xLC9wtd4_+uhkdEaR4J1A8PSZvwyYTCoN7SF92siVg@mail.gmail.com>
References: <1467925713-13460-1-git-send-email-kergoth@gmail.com>
	<CAJ86T=U4xLC9wtd4_+uhkdEaR4J1A8PSZvwyYTCoN7SF92siVg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jul 2016 07:11:36 -0700
Message-ID: <CAMKF1srqV0H=Ogo9iZJjje4G8_r-yqV7+rbKguJDiPq7drqcPw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] gcc-cross: default linker hash style to sysv
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
X-List-Received-Date: Fri, 08 Jul 2016 14:12:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Jul 7, 2016 at 2:08 PM, Christopher Larson <kergoth@gmail.com> wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
>> this in the toolchain, while convenient, actually hides bugs, as a failure to
>> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
>> poison the sysroot -- rather than relying on the default, notice right away if
>> somoeone isn't obeying the needed flags.
>>
>> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
>> which is what's often seen with external toolchains. This brings us all on the
>> same page, and makes sure a failure to obey LDFLAGS is seen early.
>>
>> This is limited to cross, to retain ease of use for SDKs.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>>
>> Supercedes '[PATCHv2] gcc-cross: remove --with-linker-hash-style'
>> v3 changes: per khem's advice, switched to use of LINKER_HASH_STYLE
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
>> index f479360..c0b8751 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>> @@ -13,6 +13,11 @@ PN = "gcc-cross-${TARGET_ARCH}"
>>
>>  require gcc-configure-common.inc
>>
>> +# While we want the 'gnu' hash style, we explicitly set it to sysv here to
>> +# ensure that any recipe which doesn't obey our LDFLAGS (which also set it to
>> +# gnu) will hit a QA failure.
>> +LINKER_HASH_STYLE ?= "sysv"
>
> Defining a new variable (LINKER_HASH_STYLE_INVERSE ?) and setting it
> to the opposite of whatever bitbake.conf ends up assigning to
> LINKER_HASH_STYLE might be clearer here.
>
> Otherwise MIPS toolchains will continue to default to the same hash
> style as MIPS LDFLAGS.

Dont understand what you mean here. However for mips sysv is the only option.

>
>> +
>>  EXTRA_OECONF += "--enable-poison-system-directories"
>>  EXTRA_OECONF_append_sh4 = " \
>>      --with-multilib-list= \
>> --
>> 2.8.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

