Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8444A6E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:59:22 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so89201116igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 05:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=/UIKZxJQtgRZ0ImmkUkZl0uW3Y5v8wR9LJs7GE99/U8=;
	b=iB0tZW+TUubluhhzb22jNJb2Mt+lsj9J0nWNMycucPH7enxHLU6OL+bVONTpyFv5Sa
	dS39ggHD8CNc6lktV/n0RAwYuhWDANtHtsdfZDA3Z4o97GnNkk4FovU0aHVitgpkA5Td
	rXY05pfV86YD/74BNgHTcMSzwGmErWPhUV9HhZ66XIxbSUbBzgcGFKsqOfygM2YFOsBA
	6dpWShFRZKHPRNwItEAxeLhZeLB6MKQeUSh61B1FU/QKTurFWACvWrRw20001u7QlJUf
	AnJgDUmuBx04xfnRKT7KrDYAaDdNRUI+mj2nTcKHMiMIL98zl8sJnq0yXdbUngYogGHh
	ajnA==
X-Gm-Message-State: ALoCoQnF6gebW3KpidYMJVhhwQ1RD+K5I/xOyV13j15x0wjFzM3Rm+srUzc7D3V6lhsy181dP7Xm
X-Received: by 10.50.59.211 with SMTP id b19mr17290705igr.42.1442235561823;
	Mon, 14 Sep 2015 05:59:21 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170])
	by smtp.gmail.com with ESMTPSA id 10sm7116151igt.2.2015.09.14.05.59.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 05:59:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so80812654igx.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 05:59:20 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.78.69 with SMTP id z5mr16955639igw.19.1442235560188; Mon,
	14 Sep 2015 05:59:20 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 14 Sep 2015 05:59:20 -0700 (PDT)
In-Reply-To: <CA+aJhH0vppTn6bA+EjVV=afUfS_EvLEvtjd6Lz7VO7toN6+Erg@mail.gmail.com>
References: <1441880652-12645-1-git-send-email-nathan@nathanrossi.com>
	<CAP9ODKr=Sg2Gq8AghfQD-SFWWr2vF=wOo0VqStfjsjkYW2WDRw@mail.gmail.com>
	<CA+aJhH0B8WM-TOM_aL-7cPOA3z8H5y7KyT1DYq9AhizR2VydMg@mail.gmail.com>
	<CAP9ODKpa9iFBdDfcRhkQbQFSAFqkkoojNRRvdvePNXO3EsBOoA@mail.gmail.com>
	<CA+aJhH0vppTn6bA+EjVV=afUfS_EvLEvtjd6Lz7VO7toN6+Erg@mail.gmail.com>
Date: Mon, 14 Sep 2015 09:59:20 -0300
Message-ID: <CAP9ODKoFGYt2SfWu0HUBXd6kCtop=kkfYxYMBMSDBEGtwq33jA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Mon, 14 Sep 2015 12:59:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 14, 2015 at 9:05 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
> On Mon, Sep 14, 2015 at 9:49 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Mon, Sep 14, 2015 at 6:29 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>> On Fri, Sep 11, 2015 at 3:50 AM, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>> On Thu, Sep 10, 2015 at 7:24 AM, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>>>> U-Boot will compile its own tools during the build, with specific
>>>>> configurations (aka when CONFIG_FIT_SIGNATURE is enabled) the host tools
>>>>> require openssl. This patch adds 'openssl' as a PACKAGECONFIG that
>>>>> enables the use of openssl-native as a dependency and also adds the
>>>>> HOSTCC flags that U-Boot uses when compiling the host tools.
>>>>>
>>>>> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
>>>>
>>>> Ideally we ought to ensure U-Boot stops to build the native part when
>>>> doing the target one.
>>>
>>> Are you suggesting that the compile step (of the recipe) should build
>>> the "tools"/native make target first, then execute the make target for
>>> the rest afterwards as two separate steps?
>>
>> Two separated _recipes_.
>
> Ah ok, to some degree that already exists with the u-boot-mkimage and
> u-boot-fw-utils recipes. However the problem is that there is
> currently no easy way (at least with mainline U-Boot) to get U-Boot to
> use the tools provided by the host/sysroot/PATH instead of building
> them.

I know but this seems to be the route we ought to pursuit.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

