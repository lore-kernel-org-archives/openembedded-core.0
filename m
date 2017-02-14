Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id EA57B71A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 16:11:23 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id i10so28212734wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iqqQRylcUnSRWk/3hkkD3XK9pN7G6fJolRVPjx0V+E4=;
	b=AUlIa1tHxwOECAYKAOd2oPPn72ou5H2G3QtuGd8Pu6dHSqDJFu6aGNNbRTI16kuqpD
	Y58bsknXdZvq4vJqUs3/5YoYXwEPVC32ZwJpXP5tOcKM3YZpl+V4W2Bax6xYoUrT5s2g
	EyPw8wJYxCACFF+0v4PxhyiWhs5EuYixRXNlGpv/1cERhLlNTIogEp0DKJh0KFXi+UaK
	w8zLB4GlBe0eGgp8hnwLNTVgrUJfO/O29cRaNAWmFgiH9DA9Pgz/i3qCgeQgdfszNSvh
	/DYGLQx4yQCmHiRFtlpGbuCEVnPlUv/mKX3axtXc2NkzvngLh3wpYsFN4o816Imc0gPm
	Mc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iqqQRylcUnSRWk/3hkkD3XK9pN7G6fJolRVPjx0V+E4=;
	b=U88idywHeHPetiy4iw+liq/FmFCBYWEm+PnjFvuz76aFwgBUB5PeXbuOesrTPjSGCS
	Pj4FvCFtd0veb99Xh6+4twemchjzKcAT6iLEgf5Ruxyl8LTBM/lUgOjrGE9XdbrRLnHV
	oBVpJ7nkzmPBu+OLf9N0VFJwYwRH6B0jtuCg0Zl3YLez6fQwz1hqA5vv7GA4kNUihxjP
	dKcAfUBGwob2L+/SmPfC1ZDBNzeWU+OtwwoZdrTp6/Pnwl9LPl0ft10oT42w7ZZgH/vS
	A7BTF6BeiBrBvLZLgM9YbrgoB7VeWURaoxKhO871PZsML9/tNWemUzeJ1L7m9wkkRHiH
	T/xw==
X-Gm-Message-State: AMke39nisO+T8UWKNO0FJxCdLQX4c6ndbW1CTHDjN1005ihFfN6yb5ISwrTAuQjWFdBFzhDJN5NzsD9sXRqOOA==
X-Received: by 10.223.152.175 with SMTP id w44mr28813264wrb.151.1487088683299; 
	Tue, 14 Feb 2017 08:11:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.176.35 with HTTP; Tue, 14 Feb 2017 08:11:22 -0800 (PST)
In-Reply-To: <adcf4051-3269-986c-3d04-8850f30c270c@linux.intel.com>
References: <1487080669-10136-1-git-send-email-armccurdy@gmail.com>
	<adcf4051-3269-986c-3d04-8850f30c270c@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 14 Feb 2017 08:11:22 -0800
Message-ID: <CAJ86T=VM_oJjT22HzMTbgs8ewEGqD7jpB2RWOmYbDSshrmhJQA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: fix LIC_FILES_CHKSUM endline and md5sum for src/compositor.c
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
X-List-Received-Date: Tue, 14 Feb 2017 16:11:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 14, 2017 at 7:30 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
> On 02/14/2017 07:57 AM, Andre McCurdy wrote:
>>
>> The license text in Weston sources was changed from "MIT X11" to "MIT
>> Expat" in the 1.9.0 release. The new text is 3 lines longer than the
>> previous version, so endline and md5 hash have been incorrect for the
>> oe-core weston recipes from 1.9.0 onwards.
>
> If this is the case, why the build system did not complain on >= 1.9
> recipes?

The current endline and hash are valid from the build system's point
of view. The problem is that they only cover the first 23 lines of a
26 line block of license text.

>> https://cgit.freedesktop.org/wayland/weston/diff/src/compositor.c?id=a0bbfea64b04d3cf12327d8b488b9949a4cddc99
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta/recipes-graphics/wayland/weston_1.11.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_1.11.1.bb
>> b/meta/recipes-graphics/wayland/weston_1.11.1.bb
>> index 2736cc1..cdfac70 100644
>> --- a/meta/recipes-graphics/wayland/weston_1.11.1.bb
>> +++ b/meta/recipes-graphics/wayland/weston_1.11.1.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Weston is the reference implementation of a
>> Wayland compositor"
>>   HOMEPAGE = "http://wayland.freedesktop.org"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70
>> \
>> -
>> file://src/compositor.c;endline=23;md5=1d535fed266cf39f6d8c0647f52ac331"
>> +
>> file://src/compositor.c;endline=26;md5=e342df749174a8ee11065583157c7a38"
>>     SRC_URI =
>> "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>>              file://weston.png \
>
>

