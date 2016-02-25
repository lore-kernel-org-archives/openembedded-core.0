Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 38A04772CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 21:09:26 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x65so39063114pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=zPE4VUuWgh3mCU3QFFxw/s8ebtt/o2xVjga/KJt/Mbo=;
	b=J4UuZsumMiqJdNH2rAYWl7JwyGHzCtc1Oqpq+n/xUlrVcSZkblHuHaDrz7H/faRais
	EdQZSvMByperI22ab6Uox6Koq/BIixkqLdLRLOEAxFXhMxPJ0trv+zp1pDeiuB0zdV0O
	FN2a0J3wINmX//vNPhalvP1GvinNkM1pQyWGrH+J+wySNxT+1ghOQVIKg/mY7ToRIVam
	WYQBHUs2nQV/lNP61ZTPC+gBFvGr81ZcqvBivon5vNY+YY7JdQ5LNWTbz5zCGtmtWDw1
	zPauiduSlL5ksVJxxremabrDgePLjU8Nor+P7cIRyGK5gFpk1rqMEJFmlsfA6jCVS+g1
	bQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=zPE4VUuWgh3mCU3QFFxw/s8ebtt/o2xVjga/KJt/Mbo=;
	b=Fub/bkz0XMr3LyJYE/X5Z2P0CgWf1BRLguUk22LtwzovE9H+YLMROf7Ah4UKas2Ydg
	qnLV0zlQEFwmEwKo1fmCWThZGwz8MK2qwuulnCwLIUz0D1QpgWtZ+hbWq9MEVln+T2OS
	VdPzkC2U1+m0r+5zGzpJlKkTxpZikamQgStZqEqjrJq4AvfIyt6ESiOP83cnITuu5Bh2
	2Syl1M8nwcGJNTlriNMYlhKOTdACpo0ibHogPSlDcRPmh5pByWEIZGWuVUnjPiHiGXSx
	Dc3RxxLnlLvJfHUSGZGK5374iufdGiUQ5e483wLG60ArNLrbKLl4+Bn3EmWuws9Dj3Rb
	Jbyw==
X-Gm-Message-State: AG10YOSUeJXLJKs+uYlat8AYb+SbmMO8MDdSa4fHBOHwyRGLHEKacLEyIjbOEByrpM17iw==
X-Received: by 10.98.7.146 with SMTP id 18mr66178958pfh.47.1456434567445;
	Thu, 25 Feb 2016 13:09:27 -0800 (PST)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45]) by smtp.gmail.com with ESMTPSA id
	k14sm14261356pfj.0.2016.02.25.13.09.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 13:09:25 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f45.google.com with SMTP id ho8so39341610pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:09:25 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.151.177 with SMTP id ur17mr65396776pab.68.1456434565233; 
	Thu, 25 Feb 2016 13:09:25 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Thu, 25 Feb 2016 13:09:25 -0800 (PST)
In-Reply-To: <CAP9ODKqsktPQLesFdNbg7it-b81rANpx+16iNjEfqKaRMLzwZA@mail.gmail.com>
References: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
	<CAJ86T=UvGuB4ndSvJc9FPkEw56HK4NUw2A9iGJotBqk7FfoJOg@mail.gmail.com>
	<CAP9ODKqsktPQLesFdNbg7it-b81rANpx+16iNjEfqKaRMLzwZA@mail.gmail.com>
Date: Thu, 25 Feb 2016 18:09:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjO+Ykazs4SYPMDK3K+Z0WXana8QtmGBOYbzjQYCY5gw@mail.gmail.com>
Message-ID: <CAP9ODKqjO+Ykazs4SYPMDK3K+Z0WXana8QtmGBOYbzjQYCY5gw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox not buildable when using armv7ahfb-neon tune
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
X-List-Received-Date: Thu, 25 Feb 2016 21:09:27 -0000
Content-Type: text/plain; charset=UTF-8

Hello Andre,

(Adding Khem on Cc)

On Thu, Feb 25, 2016 at 5:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Feb 25, 2016 at 5:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, Feb 25, 2016 at 11:59 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> Hello folks,
>>>
>>> When building a target, with Big Endian enabled, busybox is failing to build.
>>>
>>> I reproduced the error with Jethro and master.
>>>
>>> Here goes a simplified log:
>>>
>>> http://termbin.com/1c8p
>>>
>>> Could someone shed a light on this?
>>
>> I don't see any errors in the log?
>
> Oh my, I need another coffee. Here it goes:
>
> http://termbin.com/28dx

Khem was kindly to spot the culprit. Reverting
117282486b68e4da468c21795ea87bfc85625885 (busybox: Use CC instead of
bare LD to be the Linker) I was capable of succeed in building it.

Any idea what would be the real fix for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

