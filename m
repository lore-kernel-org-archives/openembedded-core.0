Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 75D7277AC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 22:43:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id i23so139790pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 15:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZsUYmMjK+p0mtJSMg84yC8iSBH9rRvwkuZCvaYkFT6c=;
	b=naqeupC3mkgqIYhesTnNtUUQB5OV0mLnMesMFglW+EjkY6/8p20PKL+k5rxpEmZDQx
	77IQ431pRpbpyBsvutuVP9bREFWWPc8KcLAjtbmVXodpaeDMrElGUwlUr2QyD/rnA/nY
	9cDbxlDsAzMLMMtBSWNH4dMAULnTO3hyo+IvO27+LbR+D5YZ4V1q/qqVuT9WjWTGUfQf
	xFqv6lGST/SQ2e9+nFmz7c+S4BPsbgKW7A66wtMqfT8LYl+C2o2tocaVZ4BsEjOKjEs6
	pf14xyTiLnOwsOblyJVMsFr2OaEELC2Av2sV5udhPRN/4GXR9D23buh7gSl/qS8Xx0HZ
	hniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZsUYmMjK+p0mtJSMg84yC8iSBH9rRvwkuZCvaYkFT6c=;
	b=F3BNcDWe3J3inEMUytJe4FIPdnvmacHaLG6n19RhZokxWYUa6hH9TR7yvXOsxtrcSr
	DJ1NpbkcAUwbLiRxjVnadR44kGT+ZOB1kLR66Y9PlwLdBHFKKBL5oHE9IClz6mfJ6kpg
	R7t9GAaYEMyOvJgO4CMDaFxHjPMs1M6zn0R4JmVTyEX1GXfaMhxxKFrxtVzgNrC9Nh5g
	VwTIAsCsGdF5Fj5xVGj4qfNDqNij7V3ZJdugBQn8EsmqI+TT1kZ1ddZwjZ1joSf4duEL
	pdtJLWjDrJxbDCfiGc7Jr6yeue9ba0kDywC3DiP9k/hhv82s8nWr3PHtbAQ7/t9IrLKp
	/5/w==
X-Gm-Message-State: AMCzsaWPun+7fKbjmoog3WRfQvMwCKS7Z+7CSrF2wJsah6lzbmWkKw/a
	QpWwZXTddz8TYY1mW0w7CvgKxxD7U138Ew+kB6U=
X-Google-Smtp-Source: AOwi7QBGdtBiJlnIZRHSi4miM9EOCDLfQVriUR8i0XUzDJhFCIipPrgFycYOigtnAMQZ0KnyG/AZPeMmfMNjzEZYLTg=
X-Received: by 10.84.177.129 with SMTP id x1mr13646536plb.161.1507675392880;
	Tue, 10 Oct 2017 15:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 10 Oct 2017 15:42:42 -0700 (PDT)
In-Reply-To: <CAGgRHJq2yapC628m=zzgnvjgDsjoiuDc2fZ5n7ThA-hzWPyFGA@mail.gmail.com>
References: <1507633512-30719-1-git-send-email-matt@madison.systems>
	<CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
	<CAMKF1srOAF=5gtovmFypykLfbUut6AJcCsZUu_f58qesV7SUdQ@mail.gmail.com>
	<CAGgRHJq2yapC628m=zzgnvjgDsjoiuDc2fZ5n7ThA-hzWPyFGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2017 15:42:42 -0700
Message-ID: <CAMKF1srriGZ21vJPvdT6e556Wd2wLKac24_OBT5mae=Ls+LYOw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
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
X-List-Received-Date: Tue, 10 Oct 2017 22:43:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 1:36 PM, Matt Madison <matt@madison.systems> wrote:
> On Tue, Oct 10, 2017 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Oct 10, 2017 at 9:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> On 10 October 2017 at 12:05, Matt Madison <matt@madison.systems> wrote:
>>>>
>>>> +PV = "1.9.1"
>>>
>>>
>>> Surely having a go-1.9.bb which then sets PV=1.9.1 is confusing at best?
>>> Why not just update the checksums and rename the files?
>>>
>>
>> I think its in line with what we do with rest of toolchain.
>
> Yes, the pattern has already been long established in the gcc recipes, anyway.
>
>>                     Probably
>>
>> MINOR = ".1"
>>
>> PV = "{BASE_PV}${MINOR}"
>>
>> might be better.
>
> I'm not sure I understand this.  Where would BASE_PV come from?

it was sort pseudo code, but you already have GO_BASEVERSION which is
what BASE_PV stood for.

>
> I'm also fine with just renaming the recipes, .inc file, and
> subdirectory for the patches, if that's deemed preferable.
>
> Thanks,
> -Matt
>
>>
>>> Ross
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>

