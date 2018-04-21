Return-Path: <matt@madison.systems>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7105B6059F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 13:15:12 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id r7-v6so8788634lfr.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ld1CoYZzIYMwB8GTdxsxUcEmhREOaa1ecQZENGww814=;
	b=V8dRy950HfwLidFCIXv0tahZtXN1wOmW7lRxbPx6sPQz+uadg1/SAmju950m6Vi/nf
	6b6zWaCwudzVu3mDR6XwDzEKTZMUQVTdueofxMGc8IkTzONxdTVYN7KUjKrgwkZPIKZD
	auToPvEEnwnZNjBM+Ul9n/ozww0pMCwD2SxhEbr2rAgchDTE4n5R/gRXGJ6xy8AGE8xE
	Q/t0PYeCz+HnLhePAfr2WRXpoFBzu7uKsfUqTjmnpVDYBcEFs6nlWXZbtMVpVdH2RQbk
	yrbCg9TEe6NAxkRZhkWlFcwsYnZBQ/DTEbOSQh7oa+V+o1V4FosD9o130gk4TH+QIlhe
	riNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ld1CoYZzIYMwB8GTdxsxUcEmhREOaa1ecQZENGww814=;
	b=JS10FsuyhHp4LE3k93I30uQo+99IhcyqUY3hQbeea82D3HCa8Kc9RAT3YlwSJTI0Gi
	gYv99Tp5B47H4E0zPXR7cSdvUC/wopvxSsWdDpuze6PJMTbhv0JoM0ZVxn/R+7J0KbLF
	AuhWzMxWhPLy2wy7mlqyLvN1+KHF0dXZC013GC0jEVdaqnFiQf1puD231baW4TEb4J39
	PkKuEFrtxLOZutyStaxu2mZdbmoprZ0QE0sJl2OL05VF2g8P9s1ad4+if/fwKe3qiM16
	GeWjKG3xS6+4qpps02IuUKdDyV/6kr1XMD3tt4TJjXGGgZpgdp4UjgApOnFv6ZLv5CEl
	LgjA==
X-Gm-Message-State: ALQs6tBxfqKZnpWhxTamf79a//nW+lXcGXGiBOhnJTPwkH3DKxJTv9R1
	T1xS5hImCVhz7dtktJV+6z6krvCzgltvTCzMHsVlPA==
X-Google-Smtp-Source: AB8JxZq6IkJ1p80uj1tEXMtebfxn/Hig6QCOml8/1l0blRN+M0CaNshJqIMAG8LQ74J2I5tqOjPmh65PCvHPBZA2ImM=
X-Received: by 2002:a19:e48a:: with SMTP id
	x10-v6mr5139659lfi.115.1524316512681; 
	Sat, 21 Apr 2018 06:15:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:550a:0:0:0:0:0 with HTTP; Sat, 21 Apr 2018 06:15:12
	-0700 (PDT)
In-Reply-To: <CAJTo0LYSXOA42j0_-8oVxtwnAj9FehKOikRBn-cghkyVhsUMQw@mail.gmail.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<CAJ86T=VfGDpng=GRuZVDBLm_2Pgh6pEKm3+1KpeN+kXAweLyvg@mail.gmail.com>
	<CAJTo0LbD2vOaKQW7_afZXzRtY5a665mUxThgO+LPjHEAyowbBg@mail.gmail.com>
	<CAJTo0La18XQEUw2AMnNXxmQCSZacGvsaKv5pK08T387JM5A78g@mail.gmail.com>
	<CAJTo0LYSXOA42j0_-8oVxtwnAj9FehKOikRBn-cghkyVhsUMQw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Sat, 21 Apr 2018 06:15:12 -0700
Message-ID: <CAGgRHJpBHBdtxwrhSpur2o6eL+bTg4vaLaXP6QVLnqu2CV5WMg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 13:15:12 -0000
Content-Type: text/plain; charset="UTF-8"

I've got a handle on the go-runtime issue, will send a patch shortly.

-Matt

On Sat, Apr 21, 2018 at 3:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Good news is that went green, so the problem is restricted to
> CC_FOR_BUILD usage I guess.
>
> Ross
>
> On 21 April 2018 at 09:09, Burton, Ross <ross.burton@intel.com> wrote:
>> Okay, fired at https://autobuilder.yocto.io/builders/nightly-x86-64-lsb/builds/969.
>> That won't be catching people using CC_FOR_BUILD in target recipes to
>> build pieces using the host compiler, but it will be interesting to
>> see if it catches anything.
>>
>> Ross
>>
>> On 21 April 2018 at 09:08, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 20 April 2018 at 23:09, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> On Fri, Apr 20, 2018 at 2:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>>> Hi,
>>>>>
>>>>> We'll hopefully be firing the 2.5 RC build on Monday, so I did a build
>>>>> today to see where we stand. As is typical we got two new failures on
>>>>> the autobuilder...  My test build included the pseudo bump which
>>>>> caused an almost complete rebuild, which is a great way to shake out
>>>>> intermittent failures.
>>>>>
>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12704
>>>>> Go appears to be using the target CFLAGS when using the host compiler,
>>>>> with predictable failures when the host is old and doesn't support new
>>>>> flags.
>>>>
>>>> Maybe worth resurrecting something like:
>>>>
>>>>   http://lists.openembedded.org/pipermail/openembedded-core/2016-February/118212.html
>>>>
>>>> to flush out similar issues?
>>>
>>> Thank you for finding that, I remembered there was a patch but
>>> couldn't find it. :)
>>>
>>> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

