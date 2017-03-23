Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDC071ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 15:30:25 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n11so64286813wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 08:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HQqEOrpmWmF3o6j5ryrPIqBPxOt9s79SN+3zJ+u+78Y=;
	b=GZo2Xyn1MOc2hsSISzNsCtc2ohtyD+7mTZ+vpxIioztWRC/KmxGqWmE9zMAXqv/+0v
	A1sh2ukxtt1l3jusw3OvncNPRUg/Kqau2Mh+e8AVqKjE+eDLjmaSiHOcZ3LX0hak+5tP
	OMwfvYEdBenh6uDbkRfXDmPQ9YOvTVOi/fwB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HQqEOrpmWmF3o6j5ryrPIqBPxOt9s79SN+3zJ+u+78Y=;
	b=f2MlyEWBlW30OwGdRWYX+UgAQlEDnwDOto9ATTpAvZpKMy+Tsr54owj/lcbyvjBPVq
	xls/Dm8pfPxC7EM6mri76gMXWW/XtgAIxvCD28E5dA7TRA76LR1yVhdFp7+6tX3L6+9/
	f6Knh+89OxEf49Ob0j/h535FVqMf9Muo1fK/PjnOa6JcQUh+oNAlTQkX/LPav+tswXhX
	FmLYnFYmQ0tCfFLamgUtaS/xxzIXsFpQ20UqoNZ+KQmH+FC6BdcBKLgBTaYF0e6Qf61S
	uC6gYdW9f2NAkBhKUkN1PDxAe0zOMgNYTidCq8NHXSPAyde/e3n2R22u2+wfii2U6gWA
	KveQ==
X-Gm-Message-State: AFeK/H22A2sFdlcxnwuP/ED6svT9xxuSilxuae8Z/4Bo/9D1j3qnzCvEJR2CbSKEjf4IjlLK5CR4EWT4QYb3UwDz
X-Received: by 10.28.57.84 with SMTP id g81mr13158836wma.41.1490283026732;
	Thu, 23 Mar 2017 08:30:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Thu, 23 Mar 2017 08:30:26 -0700 (PDT)
In-Reply-To: <CAJTo0Lan2hjh13NJMFr2=j+g5D76CSNWBCnS4F=5M3MO7B9Fpw@mail.gmail.com>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
	<CAJTo0Lan2hjh13NJMFr2=j+g5D76CSNWBCnS4F=5M3MO7B9Fpw@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Thu, 23 Mar 2017 17:30:26 +0200
Message-ID: <CAGNsrLA5zuS=csj-G7kcRFvoPoB-8jcKBWYrXL9HrOSUkLbK0w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Thu, 23 Mar 2017 15:30:26 -0000
Content-Type: text/plain; charset=UTF-8

On 23 March 2017 at 13:25, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 March 2017 at 05:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>
>> +
>> file://0028-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
>
>
> Not that I'm suggesting you didn't test your patch, but this line is missing
> a backslash...
>
> :)

thanks for the catch. Actually, it has been tested ;)
It only breaks for folks that have a bbappend (it wasn't my case).

> Ross

