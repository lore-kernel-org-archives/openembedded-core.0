Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D587C60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 15:45:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w75so8662876wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sre6aGDqO3GMN0u4Rpf5yacZ0t/hclSCbBEGIUb/PYk=;
	b=w9J539uiTgwJzn6GAfMy8ObLr8N7KQv1VH9HL/8VYXipAhUmahy38O3DpMKxarS3dX
	jdVMNrI6nTtqpgYwXI+Gt99bzOwx+iz20ce0qYwndhQmklMyzVEERqgMA733OWCvszoV
	Ni6mx33+Qm2Z5KiwKQeYbpQAs9ErDCHwIa5BQ4JIGgzDdj247nUq4BnxD47YbGuBQm+K
	0hahGkCml2GsncL40m2UP011fXQEvb7KSboZarEEKI8huOdktRef7aFCqpDQlwWl2TKF
	ctRZfPXC64pnE13HPzPcLBVOTKtP9BbhiEgB3TUQIuXj24NtEIshl/yOS/MTb/6c5Oed
	R9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sre6aGDqO3GMN0u4Rpf5yacZ0t/hclSCbBEGIUb/PYk=;
	b=R/CkTpC5Gem0SSPD8FB4hMw3iWAjVEV/v2V5O0/r31NwuKjWO53jwmDhqPhUejIpCZ
	p8z/u/mbSqVHrSJmRer3VWUWmugddktDAI8dO/mTNcNf+zdzQJWQRQoczIttnXIdrHZk
	Rh5L0DnmKPHngreEfaM3MmRPA0IPA4A1bi3SpiyrAYfN414GqvzvG4YKNtnkMi4O6abs
	eq1FW6PT5/k4EUE8JqfdRXJub0smRmWbmt5BbCpZnKZmdbHOJvW4x5jB6nmD5vx5l4Oi
	dOocyQUgMm73gPFyNnCajvUCzhRPvEAqKEPXoEQm5bbax2NTUrAFpWZDsM2dXKEA41Xy
	fR8g==
X-Gm-Message-State: ALyK8tJyKOIPBngphsE5+EF8ZMvcWpNz6449uFrnnb/+7Qtl74poxy5lEZv3asRlQxg6SS/socNvxUaQJnIS0Q==
X-Received: by 10.28.44.131 with SMTP id s125mr3981090wms.61.1467992753022;
	Fri, 08 Jul 2016 08:45:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.145.39 with HTTP; Fri, 8 Jul 2016 08:45:52 -0700 (PDT)
In-Reply-To: <CAMKF1srqV0H=Ogo9iZJjje4G8_r-yqV7+rbKguJDiPq7drqcPw@mail.gmail.com>
References: <1467925713-13460-1-git-send-email-kergoth@gmail.com>
	<CAJ86T=U4xLC9wtd4_+uhkdEaR4J1A8PSZvwyYTCoN7SF92siVg@mail.gmail.com>
	<CAMKF1srqV0H=Ogo9iZJjje4G8_r-yqV7+rbKguJDiPq7drqcPw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Jul 2016 08:45:52 -0700
Message-ID: <CAJ86T=VBxhCP_20hg+OJRN2jgt66Ew9aARY=9WOf9i-Op9yWuw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 08 Jul 2016 15:45:54 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2016 at 7:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jul 8, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, Jul 7, 2016 at 2:08 PM, Christopher Larson <kergoth@gmail.com> wrote:
>>> From: Christopher Larson <chris_larson@mentor.com>
>>>
>>> We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
>>> this in the toolchain, while convenient, actually hides bugs, as a failure to
>>> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
>>> poison the sysroot -- rather than relying on the default, notice right away if
>>> somoeone isn't obeying the needed flags.
>>>
>>> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
>>> which is what's often seen with external toolchains. This brings us all on the
>>> same page, and makes sure a failure to obey LDFLAGS is seen early.
>>>
>>> This is limited to cross, to retain ease of use for SDKs.
>>>
>>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>> ---
>>>
>>> Supercedes '[PATCHv2] gcc-cross: remove --with-linker-hash-style'
>>> v3 changes: per khem's advice, switched to use of LINKER_HASH_STYLE
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
>>> index f479360..c0b8751 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
>>> @@ -13,6 +13,11 @@ PN = "gcc-cross-${TARGET_ARCH}"
>>>
>>>  require gcc-configure-common.inc
>>>
>>> +# While we want the 'gnu' hash style, we explicitly set it to sysv here to
>>> +# ensure that any recipe which doesn't obey our LDFLAGS (which also set it to
>>> +# gnu) will hit a QA failure.
>>> +LINKER_HASH_STYLE ?= "sysv"
>>
>> Defining a new variable (LINKER_HASH_STYLE_INVERSE ?) and setting it
>> to the opposite of whatever bitbake.conf ends up assigning to
>> LINKER_HASH_STYLE might be clearer here.
>>
>> Otherwise MIPS toolchains will continue to default to the same hash
>> style as MIPS LDFLAGS.
>
> Dont understand what you mean here. However for mips sysv is the only option.

OK, I hadn't realised that you can't even configure gcc for gnu hashes
for MIPS. If that's the case then having the MIPS toolchain default to
the same hash style as the MIPS LDFLAGS is the only option.

>>
>>> +
>>>  EXTRA_OECONF += "--enable-poison-system-directories"
>>>  EXTRA_OECONF_append_sh4 = " \
>>>      --with-multilib-list= \
>>> --
>>> 2.8.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

