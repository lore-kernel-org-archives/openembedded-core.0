Return-Path: <matt@madison.systems>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED936069C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:36:35 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id n69so4636254lfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WIygtJpllFueQM+5Km0ltkCYtpl+y8UkjA697E4qqtk=;
	b=w5vBgHdJTNDtbF2aYBxizZnK2uI7vYT2Teraz5D+0aAbAxriOzDfgW3EPvZLzSj0Js
	3VIhS5lx45JvofoNuTABhI08fs03YlBR1oxSq4MN5I9pvWosSIjKrH4e3Xt6D58B1cFw
	6PGy01bwC37yXYQGNA5vrKXx2CImQ53Q30SJMTji/vfWE0SqfysjF4xiIy9AIYdTeCCy
	IaL1aJs/GnUj1ZfwfbKjbxhwryB143B9lcZvtIyy3aqnGhbh+BbJMJXBRdword67UNHX
	wawqAbpcu2AQILIm0UFZ5f0q2icE0homKfS9DYXnEkA4w0lGgtf7LFFKQ+hJ13ECH8Bt
	/Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WIygtJpllFueQM+5Km0ltkCYtpl+y8UkjA697E4qqtk=;
	b=KZRZap+Xs0JZubkXvCUhuPLEUqfsqmbXrMmK0dopUEyyt3Chi/jHWEC8V06D4+edPp
	++ZN+9jcQtka56i/VVvBtAgK0vFuodACi9NQ21T8D/fbPHj5IQgQB2dVGWXVeu+wYTa0
	IdREYKylmZa8ids23evDoz33Tg72ZRIaCBkoPcoUThm0yDi9yhUHqyPwRGBvXsGKd/qU
	oKMK95HH46twOGlGDb/JYfhN6TJqBr2hqd5gA3GgTSAQmYxXZQ5AByWzVNUEV96Osgdv
	ga+bRZOVqcK4D1Vpn71cyshMlvwCWJrhX3EIEKwphDpCguRFv3OojAqopdTGnwZ4o5Cm
	/SUw==
X-Gm-Message-State: AMCzsaX9qk4OJH75K+I86rihMy/w4Rp09w45CiaK2G6W9ezyO3M9oner
	LE6o93f+lawfXucc/teOb+hmK7VJgJDr5OfdlZnunA==
X-Google-Smtp-Source: AOwi7QAZK5CMFQcXpQESHRElod0wHWPCZ90cqhzmd8zNcdbUpMk8ucVK5oNxAaM/86dBZMYx1uRtclzzCSclqtBW9oI=
X-Received: by 10.25.148.217 with SMTP id o86mr5466599lfk.254.1507667796729;
	Tue, 10 Oct 2017 13:36:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.192.4 with HTTP; Tue, 10 Oct 2017 13:36:36 -0700 (PDT)
In-Reply-To: <CAMKF1srOAF=5gtovmFypykLfbUut6AJcCsZUu_f58qesV7SUdQ@mail.gmail.com>
References: <1507633512-30719-1-git-send-email-matt@madison.systems>
	<CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
	<CAMKF1srOAF=5gtovmFypykLfbUut6AJcCsZUu_f58qesV7SUdQ@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 10 Oct 2017 13:36:36 -0700
Message-ID: <CAGgRHJq2yapC628m=zzgnvjgDsjoiuDc2fZ5n7ThA-hzWPyFGA@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Oct 2017 20:36:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 10, 2017 at 9:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 10 October 2017 at 12:05, Matt Madison <matt@madison.systems> wrote:
>>>
>>> +PV = "1.9.1"
>>
>>
>> Surely having a go-1.9.bb which then sets PV=1.9.1 is confusing at best?
>> Why not just update the checksums and rename the files?
>>
>
> I think its in line with what we do with rest of toolchain.

Yes, the pattern has already been long established in the gcc recipes, anyway.

>                     Probably
>
> MINOR = ".1"
>
> PV = "{BASE_PV}${MINOR}"
>
> might be better.

I'm not sure I understand this.  Where would BASE_PV come from?

I'm also fine with just renaming the recipes, .inc file, and
subdirectory for the patches, if that's deemed preferable.

Thanks,
-Matt

>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

