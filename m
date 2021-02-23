Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
 by mx.groups.io with SMTP id smtpd.web11.7783.1614074214285245761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 01:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@basmevissen.nl header.s=default header.b=Og/fD53M;
 spf=pass (domain: basmevissen.nl, ip: 178.18.92.162, mailfrom: abuse@basmevissen.nl)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 4F82821203E;
	Tue, 23 Feb 2021 10:56:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=basmevissen.nl;
	 h=message-id:user-agent:references:in-reply-to:subject:subject
	:from:from:date:date:content-transfer-encoding:content-type
	:content-type:mime-version; s=default; t=1614074207; x=
	1615888608; bh=FFe+8M6MJj2nSZ8rKS83GgKv3pcz5WV2wO2Ap+/q3r8=; b=O
	g/fD53MoHUhgqJMuCrkEc2bMfHEToO8SsjdLiCuXKWP0WABBhb2bslKvko9Ap9N+
	oKj2BsXfX2AHiA39mXWjCJgQG/MMX0+RaANEhAcOxXdRC0gQ0qsTPLAYB4/INv3H
	DacJkGH6lDLCGlNEUqPGfB4gFOt4uXAsV8TgjO9kA1gKQpeYGSUMX3PfVm0Icc7P
	TXU06XRSu5O80ueqPHgL/UH3miPEkWYr8xHWcP5cWUlOWvK9m6Z050J5moWqcK9w
	1cS9WzYazAfHBqMWOeXQc/W7vX0o1tWJXGCGLOXI/GXf8G2HWH3mWR2Jn6/ip1ld
	Y3J91cVzivQGb/PjJWuMlzvhux/hPkzMk+4lHGrnffVBIIfjK0UurnEKBdyAupjp
	1nY/dt3JHdlDlgRk18vSFaRo6hV//wYKFekFKX3p4UNh2kCKvmoxJ6GARjkIm3Z9
	Ea8ptinwvZHbgqsSCtM01NrqPsEZon70Y0vYpC8Hiq+efenzOsRGlfIR+x3CcYCa
	4WZFBEjMBYG5yact6tL20RKUj6jo/AWIl9+FUHQZ4rKRTeQx5Iki3whiuoNnOMkT
	nshz3cxaBZKncg83v2J9aqSIHtixIEDNq9+D8O092S7dUoF1CLsST00Qk/sVo2M/
	X92UiKThsgrOLH4Z9Nmro5xVyf56QMo21hXseeZWCY=
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with LMTP id C3i_bXf0ecxl; Tue, 23 Feb 2021 10:56:47 +0100 (CET)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id A8B47212038;
	Tue, 23 Feb 2021 10:56:47 +0100 (CET)
MIME-Version: 1.0
Date: Tue, 23 Feb 2021 10:56:47 +0100
From: "Bas Mevissen" <abuse@basmevissen.nl>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
In-Reply-To: <CANNYZj_JMoBs4KzZtRToeUuJEUorVe4fw9_j-txZah6+XAMBkA@mail.gmail.com>
References: <20210222154956.27267-1-andrej.valek@siemens.com>
 <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
 <CANNYZj_1RL9rSJxaaRTQf__mnzEr49Eze5gW44TBtJn7FEhN0Q@mail.gmail.com>
 <9ea4df35-c70e-e03e-7fea-e56960ef17c6@gmail.com>
 <CANNYZj9xb3q+b4Mqng_RQoR+NvstzwOXeHRfCMrKuyCyxzyNEQ@mail.gmail.com>
 <CAMKF1sr0cHysY1wjfmXTsKVQ-1nhzx3=avprqfMC+AVU1QWzYA@mail.gmail.com>
 <CANNYZj_JMoBs4KzZtRToeUuJEUorVe4fw9_j-txZah6+XAMBkA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <189b378d449ae00705db06a45e0145e2@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2021-02-22 21:00, Alexander Kanavin wrote:

> I am also not sure if there's actual meaning behind this unstable 
> marker. It's not explained anywhere, there are no release announcements 
> where it's explicitly mentioned, and the branch in git has no commits 
> since 1.33.0
> https://git.busybox.net/busybox/log/?h=1_33_stable
> 
> I am leaning towards just taking the .0 versions.
> 

I agree that is fine for master. The project seems to be just very 
conservative in what it calls stable. The delta between unstable and the 
consecutive stable is small. For the branches, they can start with the 
then current version from master and get updated when there are stable 
updates.

So Gatesgarth should go to 1.32.1 and master to 1.33.0 IMHO.

Bas.

> Alex
> 
> On Mon, 22 Feb 2021 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> On Mon, Feb 22, 2021 at 10:44 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>>> 
>>> Right here: https://busybox.net/
>>> 
>> I see.
>> Gap between 1.32.0 and 1.32.1 release was about 6 months, I am not
>> sure if all distros are waiting for dot releases or not. I see that
>> upcoming fedora 34 ( due in April )
>> is already packaging busybox 1.33.0
>> 
>>> Alex
>>> 
>>> 
>>> On Mon, 22 Feb 2021 at 18:37, Khem Raj <raj.khem@gmail.com> wrote:
>>>> 
>>>> 
>>>> 
>>>> On 2/22/21 8:39 AM, Alexander Kanavin wrote:
>>>>> On Mon, 22 Feb 2021 at 17:02, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org
>>>>> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>>>>> 
>>>>>> +UPSTREAM_CHECK_URI = "https://busybox.net/ 
>>>>>> <https://busybox.net/>"
>>>>>> +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\
>>>>> \(stable\)"
>>>>> I just realised/wondered whether:
>>>>> 
>>>>> inherit upstream-version-is-even
>>>>> 
>>>>> would work here?
>>>>> 
>>>>> 
>>>>> I don't think so - busybox seems to declare x.y.0 as unstable, and
>>>>> everything else as stable.
>>>>> 
>>>> 
>>>> is it documented somewhere that x.y.0 is unstable ?
>>>> https://git.busybox.net/busybox/commit/?id=a4c3a341394a1fb25be8c15d2ddfe3ec77cbb83c
>>>> 
>>>> seems to indicate its a normal release.
>>>> 
>>>>> Alex
>>>>> 
>>>>> 
>>>>> 
>>>>> 
> 
> 


