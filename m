Return-Path: <matt@madison.systems>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD846079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 10:46:58 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id 90so1566422lfs.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sSK26XsDR4ikEcWDgnomevepa6R98zAc2YBcQKnq6WY=;
	b=CF47jKDM61bd70AYoVjhIG9TltqY078DhLMQMOkzjY4WBo9rywSe44I8p3qUq4EnoD
	Ea4VWzXaw/eOKiOqYwM53pVqhY5Wk62BWuvI5U20/UWUEormaGtZQ3t2jx19egkspChp
	cwQRvqegHPY1rWMNZBEWqVD3odQemSww0BxK4CkmvBecCxuNPPBxY+P+jdVrAbOLwcZe
	objyGG5dkXYa48d4+woVgmaOFL4si7FZbQdSXSUmEl897rGUf6ksdeJSHgdcSM0VhHoj
	TutZBK/NCnx7gEZGnW9V8AlscT5dpECMLBGzp8KCyaYzIEh6Mu+CMxTVZRnmsDNHSyO7
	2lwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sSK26XsDR4ikEcWDgnomevepa6R98zAc2YBcQKnq6WY=;
	b=jhsSIHkKEfOd0YfU2q4U37N/f+JzEELo21yS7im+SezGcjqtk0KXZR+V/sLOINEKsY
	ONTQ61cKsXizsI9w83zjPKR5i29JwwJ0/MfJPMf3wU82NuM1HaH2p5DMdXZksLkVDZMn
	8bOqK0iAgjvJd3eyNw2WOXDfeulLWb1K6VRpM/i4GZ/6M5WL/tXvsTgqwScCLS/1wcPl
	PMK7RAG1eZmt8wu93ZWENbT+qvo1ywjoMnTABzf/98VXOWiFxDMQtkWNz02FxTAMenFs
	D2aK/jHoGS59q4p5jgcVv+SsZV+W7SoxQ8ahI5X8wIVmkXXQe7kfAH6tuf8IjDnJF0Xf
	cbMg==
X-Gm-Message-State: AMCzsaX5YXWlR4zawOTydVPBEJ9HOzFD5SMJQ09A6HlkzMeoNanDkaLc
	GvRb3/b1IB631WnsqKw8xdHGwna0jgxdtmtoy+IDBg==
X-Google-Smtp-Source: AOwi7QDLAWvrSX/vy9SwtyyV+RydCkazo2H+zuIPIqnuHAXpwm9WaCEr3h2ndNjDITYaSKNuo5A04B/JMBWjQ/oB2Lk=
X-Received: by 10.46.25.18 with SMTP id p18mr3730281lje.24.1507718819945; Wed,
	11 Oct 2017 03:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.192.4 with HTTP; Wed, 11 Oct 2017 03:46:59 -0700 (PDT)
In-Reply-To: <CAMKF1srriGZ21vJPvdT6e556Wd2wLKac24_OBT5mae=Ls+LYOw@mail.gmail.com>
References: <1507633512-30719-1-git-send-email-matt@madison.systems>
	<CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
	<CAMKF1srOAF=5gtovmFypykLfbUut6AJcCsZUu_f58qesV7SUdQ@mail.gmail.com>
	<CAGgRHJq2yapC628m=zzgnvjgDsjoiuDc2fZ5n7ThA-hzWPyFGA@mail.gmail.com>
	<CAMKF1srriGZ21vJPvdT6e556Wd2wLKac24_OBT5mae=Ls+LYOw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 11 Oct 2017 03:46:59 -0700
Message-ID: <CAGgRHJqnZVX6b0jKGjBUH8D+6OQNY978v51hubnrgDw8Y-a8FQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: update to go1.9.1
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
X-List-Received-Date: Wed, 11 Oct 2017 10:46:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 3:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 10, 2017 at 1:36 PM, Matt Madison <matt@madison.systems> wrote:
>> On Tue, Oct 10, 2017 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Oct 10, 2017 at 9:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>>> On 10 October 2017 at 12:05, Matt Madison <matt@madison.systems> wrote:
>>>>>
>>>>> +PV = "1.9.1"
>>>>
>>>>
>>>> Surely having a go-1.9.bb which then sets PV=1.9.1 is confusing at best?
>>>> Why not just update the checksums and rename the files?
>>>>
>>>
>>> I think its in line with what we do with rest of toolchain.
>>
>> Yes, the pattern has already been long established in the gcc recipes, anyway.
>>
>>>                     Probably
>>>
>>> MINOR = ".1"
>>>
>>> PV = "{BASE_PV}${MINOR}"
>>>
>>> might be better.
>>
>> I'm not sure I understand this.  Where would BASE_PV come from?
>
> it was sort pseudo code, but you already have GO_BASEVERSION which is
> what BASE_PV stood for.

Got it, thanks.  V2 on its way shortly.

-Matt

>
>>
>> I'm also fine with just renaming the recipes, .inc file, and
>> subdirectory for the patches, if that's deemed preferable.
>>
>> Thanks,
>> -Matt
>>
>>>
>>>> Ross
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>

