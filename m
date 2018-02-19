Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF28078839
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 20:11:59 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id p5so6186468plo.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 12:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+4lmDFxnmM+0ArCKk2KNv3bD85oEgYXhGjpIlN7gyvU=;
	b=r8+GM9A1amn5s16V47oCnXXsDAfhoZP0L3O3tiICFzw4+2fE/CjxjrcGTAoJTcqpOw
	KmOUEcHrxw9AUADjJ8rwuXEl4Hu95fTQo2C7bcOz3afGHHmy4gLYKyTPvYYpyIe1KBKE
	fkJnPtXjuIlJLv9PuGRCVscx03YgvtiRTUKIBzlzw1GeU1eI092QzaumqBuBlFG8ILDp
	qDT5G+TUsLesZVj9/ECMVRoOrvrfBIn3fokbyOHn7bSFMFWCmwhGGT1skoHEEMDbACUX
	LZWxKu/3NK5A9M2WG6pfYGO7UJC4nen2K9W7EVyqHmbbwHl6joO2qW7SexoZhR7fpPie
	prjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+4lmDFxnmM+0ArCKk2KNv3bD85oEgYXhGjpIlN7gyvU=;
	b=XUy4zKkqHxbf5NzCjOy4ec4AYEqoBNKAO7xXZjylbCEIptK6Rd38xyEoHc4oC57Zo1
	7b6XystmM15Kiy40Py/5+y1toenz7MPA2Iz4FjnCoSDpkGGl0BqvWqPqKLYij0F9z/NO
	7Va5/Ia6xTqJQ50khteEvS2K3AewXj0mtpeBDYANdbwMbfoKNoVm722Q1Y6sNqONIdvR
	sDsc6NlKJtvO4iQSf6RwPIsNMpdvoX2LRS930wU+UdYnYrEeivHX4h/hzKiEnfGyne4C
	2giw3d90QRN5/aMKCXgcOco4+7qlylzGiOsngz45EvdJjC9dcL9v/q5NoldoRvN/ecX+
	Qfjg==
X-Gm-Message-State: APf1xPARPyG/jbwPprvpFehYxAG4i9PtOYafy0QOn07ylT1Y43PusWMF
	fuHgWRBPXMRl48HuSLO2bWVys7YaiALpl49jUn0=
X-Google-Smtp-Source: AH8x227y6NMlG9IgqV+iTuLq2mM4fxAAqr4PgHqzJu7jmtlmKy0t85d+itmBNu0ZGgUARCD+59JGAFK8ZzhEiCknYtQ=
X-Received: by 2002:a17:902:6b48:: with SMTP id
	g8-v6mr15198204plt.151.1519071120936; 
	Mon, 19 Feb 2018 12:12:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.207.166 with HTTP; Mon, 19 Feb 2018 12:11:30 -0800 (PST)
In-Reply-To: <CAJTo0LaaNqCjg_+ATQ70b54NTKrdfo=_xm6JAeyX3XpFYmQezQ@mail.gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
	<CAJTo0LaaNqCjg_+ATQ70b54NTKrdfo=_xm6JAeyX3XpFYmQezQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Feb 2018 12:11:30 -0800
Message-ID: <CAMKF1sqzsxK5wRUgg-srT8+FAuvewf9uZoRikS9gKWbtEc_mWw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Mon, 19 Feb 2018 20:12:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 19, 2018 at 12:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Khem,
>
> Sigh, sorry, should have realised.  So locale-archives are not compatible
> between glibc releases?  Good to know, I guess.
>

they are not and its recommended that static binaries be relinked.  I
am not sure
if our usecase is a supported one either

> Ross
>
> On 18 February 2018 at 07:58, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Wanted to send update on this issue
>>
>> I got to bottom of this issue and Ross you should have known it :)
>>
>> https://patchwork.openembedded.org/patch/127105/
>>
>> introduced an optimization into nativesdk glibc to let it ride on
>> localedate from SDK host. This has now broken in glibc with
>>
>>
>> https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe62dc41be54
>>
>> it is recommended for static programs to be relinked if using glibc 2.27
>> our case is also similar mismatch of libc version and localedata just in
>> opposite direction where we are trying to read old data with new glibc
>> instead.
>>
>> I have initiated a discussion within glibc community on it to explore what
>> options we have, but be prepared to ship full localedata in worst case with
>> glibc 2.27,  this might be the worst case option if no alternative is found.
>>
>> Thank you
>> -Khem
>>
>> On 2/15/18 4:12 AM, Burton, Ross wrote:
>>>
>>> Yes, that's it.
>>>
>>> Ross
>>>
>>> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com
>>> <mailto:raj.khem@gmail.com>> wrote:
>>>
>>>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
>>>     <mailto:ross.burton@intel.com>> wrote:
>>>     > Getting there: https://autobuilder.yocto.io/tgrid
>>> <https://autobuilder.yocto.io/tgrid>
>>>     >
>>>     > Just two actual problems:
>>>     > - The non-gplv3 build failed as the make fix needs to be backported
>>> to
>>>     > meta-gplv2
>>>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the new
>>> glibc
>>>     > shouldn't be causing a problem with uninative so this is
>>> interesting, maybe
>>>     > the new one is behaving slightly differently.  Should be easy to
>>> replicate.
>>>     > The same problem caused selftest to fail.
>>>     >
>>>
>>>     is the UTF error like this one
>>>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>>>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
>>>
>>>      > Ross
>>>
>>>
>

