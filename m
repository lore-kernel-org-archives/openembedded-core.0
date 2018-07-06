Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDC9178B58
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:15:05 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id i12-v6so24096464oik.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RoR8acBfCAHcog3ezLav5R26ZgLx8xtyIDXqfvhPkzU=;
	b=r2V0N3Nvj0ixslq6c5cXkhZXpKTO5Sh2c35CCnuCKWA+GElR/KNcKefvy9vSma04QW
	zfQ+YU7wEicnGLp3+ZGI9sS2Txv+VnYBDj7KE32noBa1//4ZjrPgs6BDxcp3gW5PVVo5
	Im1yZ9F+yEFYo6I+CbIfZONkm+p7zXcspPUhI6565jks37DNsk7Hv3yh61kaPx1NbNGO
	ruNbz/gEjHAkZYn1s22ytIMXRMrYuXDJ+eDK21kg6C6GHvXZ0neGgfvta763/ejTplb7
	QXl91mWE7o2p6clSTgNGGePOVDLHT6qoUWVf6lG2NEd+xNeHIoVsLfq0ZFm4DFG0VXZx
	/Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RoR8acBfCAHcog3ezLav5R26ZgLx8xtyIDXqfvhPkzU=;
	b=exiazlNICeJX9otkZNuHVkzxlMIP2hnAscRMOxhdOPZ5F2vnJYk/TjOn8Gv7IV6FJI
	/SMjx5s8OOkBJQTkSgJVQQu2JSuqFKndDMTi0312GxAgghHeoqSPmRxPCkDC33Os77A7
	H2M/gTpt9bQbF/0fayl4iyqbjTH9vjNpoU9W4ZBKrTtmsqczoXSmTzIQeBvZDcYFL9hT
	wItyixJbTi6p+qHR+N/2Dr39osGbRB9cyymG+2pKKZ/ORwOwftX8TJYUSRJ9AU9U9MTK
	OmijQAv0Js+locFD3qi7K9Zhw6l2C5CWdYnBUTwyvxaK4ukU3azEaEkI+NVeoaczPwM5
	viuA==
X-Gm-Message-State: APt69E0yWGKTanqv4H40sgphymU8W0SHXc1gpQzAOjTf9FEJzt6r7/Kg
	Pgq8QAzsFj1R58a3qkGl6iPOshGP4c0aNC9zbIclDw==
X-Google-Smtp-Source: AAOMgpdmiRyrtrCUQOoxpQ2ve730cqNx+5iwx3t2S26NcU+yXNeLKQlJN+puD36ojMtjcZFdjXUwH6KIDozm+526WTI=
X-Received: by 2002:aca:5f56:: with SMTP id
	t83-v6mr12532392oib.115.1530890106867; 
	Fri, 06 Jul 2018 08:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 08:14:46 -0700 (PDT)
In-Reply-To: <c5249320-c4a0-b443-4ef5-be8bab9021f7@windriver.com>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
	<31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
	<CAJTo0LbuaPOcp0WbB0_T9O+kivU9Wye6Zzb6w8xD-kQXXOpJzg@mail.gmail.com>
	<CAMKF1sqEzOBqP+ReVAA5zHn1qosQrrpti_2Aigv4OzzU6tF3Kg@mail.gmail.com>
	<c5249320-c4a0-b443-4ef5-be8bab9021f7@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jul 2018 16:14:46 +0100
Message-ID: <CAJTo0LapqQGDReJkvqeVc9oLpNA0nANs0efbfhHmYeRe88G=eA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Fri, 06 Jul 2018 15:15:06 -0000
Content-Type: text/plain; charset="UTF-8"

Okay, merged to MUT.  We'll see what the AB thinks!

Ross

On 6 July 2018 at 09:37, ChenQi <Qi.Chen@windriver.com> wrote:
> Hi Ross,
>
> Please consider merging this patch.
>
> With Khem's recent fix "libnss-nis: Limit parse skip only for target recipe
> on musl", I think this patch could be merged safely.
> I've tested it locally with glibc and musl.
>
> Best Regards,
> Chen Qi
>
>
> On 06/07/2018 01:17 AM, Khem Raj wrote:
>>
>> On Wed, Jun 6, 2018 at 9:48 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>>
>>> Try building a musl buildtools and it breaks:
>>>
>>> ERROR: Nothing RPROVIDES 'nativesdk-libnss-nis' (but
>>> /home/ross/Yocto/poky/meta/recipes-core/meta/buildtools-tarball.bb
>>> RDEPENDS on or otherwise requires it)
>>> nativesdk-libnss-nis was skipped: incompatible with musl C library
>>>
>> I think the compatibility check is too greedy in the recipe, this should
>> only be applicable to target class recipe.
>>
>>> Ross
>>>
>>> On 25 May 2018 at 03:54, Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>
>>>> Recent glibc change removed libnss-nis module from glibc and a new
>>>> recipe libnss-nis.bb was added.
>>>>
>>>> After this change, we need to make sure nativesdk-libnss-nis is also
>>>> included in buildtools-tarball, otherwise, we may encounter the
>>>> following
>>>> error when using 'tar' command from buildtools-tarball.
>>>>
>>>>    tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
>>>>         symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
>>>>         in file libnsl.so.1 with link time reference
>>>>
>>>> This error occured on my ubuntu16.04 host with 'nis' configured in
>>>> /etc/nssswitch.conf.
>>>>
>>>> So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb
>>>> b/meta/recipes-core/meta/buildtools-tarball.bb
>>>> index d98a9c9..377733f 100644
>>>> --- a/meta/recipes-core/meta/buildtools-tarball.bb
>>>> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
>>>> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>>>>       nativesdk-wget \
>>>>       nativesdk-ca-certificates \
>>>>       nativesdk-texinfo \
>>>> +    nativesdk-libnss-nis \
>>>>       "
>>>>
>>>>   MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

