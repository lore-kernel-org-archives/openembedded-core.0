Return-Path: <matt@madison.systems>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 348C778A7F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:10:54 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id l191so20257233lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MbuSRat1AA0B0iz5mYvKTysnaLrR5hCzkllJ+3Y7Ch0=;
	b=q4k62UoEB6m6YCmeyKz12v8rtsaTivOXgmS2M99Hs2eCLULPbzoPksXZp5jkHBvva2
	hJnvYgVdgBptlJTucLDF2HKxOBMDKc6pwNx8aVNHUk1K8L1Tj8zdRme+mWASG8yuxFUw
	3MU7h1K+QBc1aEeopDEAgfD+e8nFfz/nJx7CmDYrfkTYuEL6j0PbakgKfGJdi2s/Lrus
	3ClbgwE8dhoEQJzKgwOZiyFFwuBfv7IehmwsE/Act4kpvlbSTh1UfpI06xb8H/SPMhCG
	0wZKy0DR9MoQF6K7N5cOiSc1nPiYHqHNsysVF4lyQx2oU3cbDwb84mTXsDsLjaBT2nlA
	U5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MbuSRat1AA0B0iz5mYvKTysnaLrR5hCzkllJ+3Y7Ch0=;
	b=dFB5jv546RMYObRgEjw0E8/RXbWwKqeBOOQy3d7YRlCATxG3Dut/NslPpiDQOVPtRs
	9buwBscJzDmPfQg6bzPvuW5gyGl/r2R+KFZdU0UGnR8MBRj4bkp9OEPa8MnMPtniomYQ
	1wYiD7CwIxZG11UzJKRc3megBl8QlLRbIbdXUK+RD6oZlu/4qCuwvQKdKfVOcJXZRNA5
	FnBm7TQJjBdR3EFbWDlvHbhw5VHKhUmELFMxwYueNE2v1jAmxZrG24E4fxu3R9BbBGzV
	Bui+eMxMJZ4EZSWIAg8uLv7tvVmBTf0EolfkNXdE5mxhv31e+E+ffu7GM8RmV6SPrx2J
	ur2w==
X-Gm-Message-State: AElRT7HGPeRbG8ZLJw1Q/JUd7BBQUgB/mFWhZ5SBUVciq8Qf3lzhjhr3
	/tpB4xLUugo5fS0S5dZhbLZS3XRizDdZTrCm+fLHmA==
X-Google-Smtp-Source: AG47ELt/des0w3VUh8nP9tphQKiNgJpAvmWYt0Sj/6fleDTtK1UTfI8QswcjSWaKFsDT/Pa4xhfuW2woh74P9vLEwX0=
X-Received: by 10.25.24.203 with SMTP id 72mr8138717lfy.132.1520197855616;
	Sun, 04 Mar 2018 13:10:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.131 with HTTP; Sun, 4 Mar 2018 13:10:54 -0800 (PST)
In-Reply-To: <CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
	<CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
	<CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
	<CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
	<CAMKF1sp5tRPs7yB9bCZShJnozK_cHTskcSSTUP-=Vag72sZZRg@mail.gmail.com>
	<CAP9ODKpRAUwaUysuOVC7rWq1ZdXDAzH31L2YRAt2Dp7u1MoNkA@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Sun, 4 Mar 2018 13:10:54 -0800
Message-ID: <CAGgRHJpHT_OZu=MSfjYVq1RRR4bcL4a1aN6MbpzcKf_6EciasQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sun, 04 Mar 2018 21:10:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 4, 2018 at 12:46 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sat, Mar 3, 2018 at 11:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Mar 3, 2018 at 2:45 PM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Sat, Mar 3, 2018 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sat, Mar 3, 2018 at 9:44 AM, Matt Madison <matt@madison.systems> wrote:
>>>>> Since it looks like I'll have to do a v5 on my series anyway, I can
>>>>> pull in that backport for the aarch64 issue.
>>>>
>>>> sure,  I would suggest we keep 1.9 around as well.
>>>
>>> I am against. Go is good to provide backward compatibility and keeping
>>> both just causes people to delay the update. We have some time to
>>> April release and thus any regression will be ironed out. Possibly
>>> wait until 1.10.1 is out but keeping two releases I am unsure it is
>>> needed.
>>
>> Your disagreement is acknowledged.
>> There are larger systems written in go which haven't moved to go 1.10
>> and I know for sure influxdb and grafana are not working with 1.10
>> and there might be many more real world programs which will be in same
>> boat. This is no different then what we do with gcc releases where we
>> overlap them for couple of releases to smooth out transition.
>
> I understand the need and I see the value. The GCC is harder to
> upgrade but problems using newer Go toolchain does not happen very
> often and likely are caused by a regression on Go itself.
>
> As I said, there are two options:
>
> a) wait for 1.10.1 release
> b) keep 1.9.4 around
>
> My preference goes to (a) as I prefer to not include 1.10 now with
> those known issues.

I've reworked the patches in v5 to allow for either approach.  If it's
(a), we can simply remove the 1.9 recipes.

-Matt

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

