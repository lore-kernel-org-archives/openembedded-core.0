Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sordb-0000Qh-Bz
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 09:47:07 +0200
Received: by obcva7 with SMTP id va7so1139570obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 00:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UHjNsTkRNinJ2rQ8GxwAw4qYmFifHrv2RHaWsUkRU0s=;
	b=ZUf7NpBTDTwrDPFXy3M6e3HmGrPq+o1JANoOuRQKr4LenRYdI0bwrKHKcyCVglHh9L
	K4ea9NIkPpnhqzfuVQaiqE2//XzeTJ4A4xPQtBQbHOlDTN85O66UZdBcn+dTpztDbLL7
	k06esMtO71jd3HgjEa0EI0j2sOoYc8A8F178pK2QAqXfNOQ5KVaNkpi2KNeXNN9c+3SX
	E7uHLJEL1dawYgnxY2S3jPTk61qJ8pVKi6RdchG3tPCFX/t++96Gjjt3TqsHYeYPlaVt
	B1W27XBfobTEN0VYIphW9NvOH5ByJZRuJzew+3KpLMlaSu+fV8LXg9PrgphAJzL9rPMj
	nowA==
MIME-Version: 1.0
Received: by 10.60.24.4 with SMTP id q4mr49389025oef.50.1341992155225; Wed, 11
	Jul 2012 00:35:55 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 11 Jul 2012 00:35:55 -0700 (PDT)
In-Reply-To: <CAF1ZMEf8hr8ahYjOtKOVM-uDq293dKfZKQs=2WzcppEhHY=w7A@mail.gmail.com>
References: <CAF1ZMEfHzvtM35g_PSigbyVCKysTbJY=UODmnKNU6aoncU8YfA@mail.gmail.com>
	<4FFD24A9.10801@intel.com>
	<CAF1ZMEf8hr8ahYjOtKOVM-uDq293dKfZKQs=2WzcppEhHY=w7A@mail.gmail.com>
Date: Wed, 11 Jul 2012 15:35:55 +0800
Message-ID: <CAF1ZMEcu2ket9CfSck0b0RaB_KiDC57Evc86ZgLeApn-q1Va9A@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build directfb-1.6.1 fail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 07:47:07 -0000
Content-Type: text/plain; charset=UTF-8

Hi Palcu:
  One possible solution would be disable imlib2 explicitly?

Dennis

On Wed, Jul 11, 2012 at 3:28 PM, Dennis.Yxun <dennis.yxun@gmail.com> wrote:
> H Palcu:
>   Right, that's the problem, actually I have installed imlib2 in my HOST.
> But even that, it's also a bug, since OE shouldn't rely on library
> which from my HOST.
> I mean, if it need imblib2, then OE should provide with imlib2, right?
>   Attached file is the config.log
>
> Dennis
>
> On Wed, Jul 11, 2012 at 3:00 PM, Laurentiu Palcu
> <laurentiu.palcu@intel.com> wrote:
>> Hi Dennis,
>>
>> It looks like the configure script finds imlib2 library even though
>> there is no recipe for imlib2. There is a possibility (I experienced
>> something similar for libx11) to use your host's imlib2 library...
>>
>> On my machine, for example, this is what config.log looks like:
>>
>> configure:19602: checking for imlib2-config
>> configure:19633: result: no
>> configure:19642: WARNING: *** Imlib2 library not found, building without
>> Imlib2 support ***
>>
>> And DirectFB compiles just fine.
>>
>> Can you attach the directfb config.log so I can have a look?
>>
>> Thanks,
>> Laurentiu
>>
>> On 07/11/2012 07:34 AM, Dennis.Yxun wrote:
>>> hi All:
>>>  Have problem build directfb, seems imlib2 library is missing
>>>  Attached file is full compile log
>>>
>>> Dennis
>>>
>>>
>>> g2.lo idirectfbimageprovider_mpeg2.c
>>> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
>>> r_dfiff.la" && ln -s "../libidirectfbimageprovider_dfiff.la" "libidirectfbimagep
>>> rovider_dfiff.la" )
>>> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
>>> r_gif.la" && ln -s "../libidirectfbimageprovider_gif.la" "libidirectfbimageprovi
>>> der_gif.la" )
>>> | idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such file or
>>> directory
>>> | compilation terminated.
>>> | make[4]: *** [idirectfbimageprovider_imlib2.lo] Error 1
>>> | make[4]: *** Waiting for unfinished jobs....
>>> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
>>> r_pnm.la" && ln -s "../libidirectfbimageprovider_pnm.la" "libidirectfbimageprovi
>>> der_pnm.la" )
>>>
>>


