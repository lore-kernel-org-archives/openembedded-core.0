Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id C554D60234
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 19:48:24 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so20411990vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 11:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hWtIbMAO+slDcqa/n1980xSDaZVH+Mb5rF8be9Vbe0g=;
	b=q3zZG/1vD5dquEniKy4FyvmRSvP4ilCMbVm695D+qLiVR/biSfggynf/T2d0HTxgtX
	IGBHYzy7QUKsbyyEYq0GtjIUV9XRiiElxz1wl5pAQYU6SsWXprE8PJ4OnYPgrh/zitXb
	ZBqZF5Zs3k7OuW2K5h/B5WeEo+8BD3e6nSGkemh4Ii8F/HLd1HCFegcaDWrvIZBOxNfR
	tyUDF48Nwb8vh1NL+fVsqSrG7ADKeyQ4ijNnKsael7AYS6m0N+jU/5BAGP1SEXE6b7j6
	fAB2jVKh1+nxZ5BB62KiQYYZ2fX0QtATsN2zjGeZ2OrMRaTvW1Ud+3Xk11xOsX3CJBkD
	714Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hWtIbMAO+slDcqa/n1980xSDaZVH+Mb5rF8be9Vbe0g=;
	b=WXuAefFjGn+IDjITgzHbfcJNC60/9jurFqLofJKZjVBmJw51EdWoVAkz6T/qXZlqHV
	DwXV2aizG3DCbrll7HOyFO2cHYeX20eqQekRaAHaKolTDMZFKha/hOT9VNw8g/Usi0Rm
	MKYLz21z6Sxb6UkUMAjMJv1xGmOdIOxobmIirm8Gjg25EieEhuiN7qHUnUnJ6hF7fE8O
	5YMspOaTrqHVfy6wMyXEOITkcueq9rEHLSqBGu4Nt4oWDvl/XZKmEiHER6oM0K0YaXH9
	0eN1KyRgRMk2veTVHdvcid6bbpJW+7+t2N1eiXTj1hUNblD5QU4PsBVZy9bmx8wIVw6I
	0BBQ==
X-Gm-Message-State: AKaTC00wl13JBGQwQ9RbXUV+ifVwJFfy/5EonkdRSOavCzJ8VbpzTZaMpT+q1uAp5Z73zK4NNZFcBEHvyeA87Q==
X-Received: by 10.31.115.205 with SMTP id o196mr17860205vkc.139.1481140105868; 
	Wed, 07 Dec 2016 11:48:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 7 Dec 2016 11:47:55 -0800 (PST)
In-Reply-To: <33b8cb66-7285-cfbb-6424-f86b319bf24b@igalia.com>
References: <1478627553-13710-1-git-send-email-clopez@igalia.com>
	<D1A701D4-6205-498C-9A83-C65F7542F91E@gmail.com>
	<33b8cb66-7285-cfbb-6424-f86b319bf24b@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2016 11:47:55 -0800
Message-ID: <CAMKF1srtVjVmEN0s2vKgw89g=LxJSG36eEkxFdhhouuxzg6KYQ@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
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
X-List-Received-Date: Wed, 07 Dec 2016 19:48:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2016 at 11:46 AM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> On 05/12/16 23:56, Khem Raj wrote:
>> Carlos
>>
>> webkitgtk fails now e.g. see
>>
>> http://errors.yoctoproject.org/Errors/Details/111221/ <http://errors.yoctoproject.org/Errors/Details/111221/>
>>
>> fatal error: 'stdlib.h' file not found
>> #include_next <stdlib.h>
>>
>> This is when building with clang, I think its too early to drop this patch.
>
> Hi,
>
> I thought this was an issue only with GCC ...
>
> Some questions:
>  * Which version of clang is used ?
>  * The clang toolchain used is the one from the
> https://github.com/kraj/meta-clang layer ?
>

yes

>
> I don't have a fix for it at this moment, and investigating it would
> require time. So I think is fine to reintroduce the patch
> 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch (If possible,
> please change the commit message on the patch to tell that this an issue
> now only when building with clang).

Please send a revert then

>
>
> Thanks
>

