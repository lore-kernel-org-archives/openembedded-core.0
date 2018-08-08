Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5240A78D3F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 16:10:16 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so4706379ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TSAdodm6zeyrkXM/cdPrHcuFdzqu3yep9580r++w4Hc=;
	b=Sh6N/8rbcG4bYcrtKqKBhXKDWZCH3n2qvo8/zL72qfDorFHKaIqFw28K8ixxSawDiX
	WdA1MZ/ocpVRqL8DMD+Umvt60pzrOCBppcZuesv1eNBKdBGY3QOEN/Xo2NwfCr/Mf0za
	aIH8tw8KTnH8ansiL71KuAEyXv1UNNvldad8dhS4LBWH8bJ0BsBTLrmJv3wsAZDHu7xH
	QPBNuWHvqfLgu6OyQVdUIaVpdMMJOviqNgFIcpS7Uw1P6YfyF3uI05JaWJOIDcPJLHq0
	Vj37pNWIjBxTf8fi4GhOJBvGTU/JNIoFNQ0Knk7rwVXiUCMHvcVveOw9Xq5MgIYQRiRb
	C8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TSAdodm6zeyrkXM/cdPrHcuFdzqu3yep9580r++w4Hc=;
	b=Bm4tWYrKz28aEaF6rQlCZ3INeVuku7yrfpaVgEqXXmaruQBZcXmvjyN/rIPhQw+cDa
	l5XX8i+dRWF9aS4I7XJrb15aoBwCq+Mic54/8b0goN6POp2WVrOGyWcNQ59KHLqnMqqZ
	lJ0qll3cKktloQALGUyXC8RldxTYEWw3OEoNo7WsvdKgJmrY/e+Wgw64fmlxU3NrKF3Z
	PyQ8lqkbbDIwThhoUyTS3sYHAyF5Gs/XTj6AMjiZki4QySsoabJAoGAF65f3xC2RdJoh
	Av8jzBnJ7vQvo4BFkwhS+BIQvwpUEpi/nSHST60L7W3ArItcIzeR06fC1ieaRd4GoMgf
	BeFQ==
X-Gm-Message-State: AOUpUlEW17A1z7qiK06XGfKl0ATEiN770dQJJgkbBUDAN2of3axEzGH3
	YEeZeX70y1Ay1hvfs7W/dBcgqSWjuZn+zFRXZAuLhw==
X-Google-Smtp-Source: AA+uWPwfprpXZV6C5TAGMNqSXKBOaa4ACfpvHBf82I5MlytSKRKh6NKStdL5XoCk9G7XrEUQ1uXt10t1iI7HRh86wX4=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr3706469oif.235.1533744617205; 
	Wed, 08 Aug 2018 09:10:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 09:09:56 -0700 (PDT)
In-Reply-To: <CAMKF1sqaXt17u1gGPmZi4qiziwVtwcFrd7_2nJ8kap5BSB3LiQ@mail.gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
	<e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
	<CA+chaQfiZ4MPSPE5B3JPYNrcJaDOEQiyHE4UsMf2dP_vWsfrwQ@mail.gmail.com>
	<CAMKF1sqaXt17u1gGPmZi4qiziwVtwcFrd7_2nJ8kap5BSB3LiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2018 17:09:56 +0100
Message-ID: <CAJTo0LbnL2uCT=r1iZ1BuummBhdJm5020YcqvKf4kiwGrhQKvQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/18] Disable crypt support in glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 16:10:16 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah squashing makes sense, as the intermediate commit is broken.

Ross

On 8 August 2018 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
> I deliberately kept it separate for readability from glibc upgrade,
> but squashing this with packaging changes alone is ok. I will leave
> that to Ross
> On Wed, Aug 8, 2018 at 8:48 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Should this be squashed with "glibc: Drop packaging libcrypt from 2.28+ onwards" ?
>>
>> I've accidentally cherry-picked the packaging change from patchwork and missed this one which results in:
>>
>> ERROR: glibc-2.28-r0 do_package: QA Issue: glibc: Files/directories were installed but not shipped in any package:
>>   /lib/libcrypt.so.1
>>   /lib/libcrypt-2.28.so
>> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
>> glibc: 2 installed and not shipped files. [installed-vs-shipped]
>>
>>
>> On Tue, Aug 7, 2018 at 12:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> We have independent crypt implementation coming from libxcrypt
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-core/glibc/glibc_2.28.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
>>> index 086daed04c..906e6c2b62 100644
>>> --- a/meta/recipes-core/glibc/glibc_2.28.bb
>>> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
>>> @@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>>>                  --enable-bind-now \
>>>                  --enable-stack-protector=strong \
>>>                  --enable-stackguard-randomization \
>>> +                --disable-crypt \
>>>                  ${GLIBCPIE} \
>>>                  ${GLIBC_EXTRA_OECONF}"
>>>
>>> --
>>> 2.18.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

