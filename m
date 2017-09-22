Return-Path: <moritz.fischer@ettus.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 519E77197A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 22:22:38 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id d17so2348328lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7+OIao7aHnIiCSpVfVKSNMHwt8Z+TsP+Uh61FNmhNV4=;
	b=hs2v12CwbI7Y0AaortIo+4S2gref7UCyOCfEm94cQFYK7DP/q+cEaYCfp7OABVYwzx
	fXwI37e3bINibT53NP1MCJn/2zIogPdyYKkvJQmK96+MOAV1D7d3GOh1cgi8aGnvEGwd
	4jxcBKRvhaJs501QYCAoG0Fe85HlGP3/8oHrajj5dGVpBwji0JDAY2d0kuZrER2WG2kd
	KaH/wZFeslaA4P4bInHD08H/+Rcv8ZWLLzVbigd8KpLQjpmMA12TfZm/vneHtxeRvgTB
	HmqiCZfQ4e1rXLcSgoU9ClTrwU3ZtniXMd1/uf9PmVhQGo5cwWFN/lwbbNV0/Awu4Wj6
	QTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7+OIao7aHnIiCSpVfVKSNMHwt8Z+TsP+Uh61FNmhNV4=;
	b=D4eIdX2Hn/VEXGW/FRysaCRmfQ4JksAXB21qWbxKaK60raxT5b7DNhz/nWB3ZhdANi
	+MIDP2QfbynjoGAn1E5S2AAPbD3CWkn9sClynlCBkC7633CzZRe5uSyb8Yven1Y9jfc8
	Hww5ScPCwQ7OFQG6VuxjcfjhyePzWnGye0w3TbRjPBmSoTvGQpC4TMZaVAeV4yJKmiXh
	IF8AdrClgsI/tGV9+9qK0zRAIbFkpodDegXNxtgCrmuuHsfZ4HxhFb3yJRS6qwJCmoxK
	n8G7qIpE++8T0vSobFB8rm+E6XZjsgcN42pdqwJm/eCh5Alj7MacgDLDUU4N7aMEyZTh
	a//A==
X-Gm-Message-State: AHPjjUiMXTDqoK+Dnhe0JAkuCzAOXyPWVn7Gx/dGHJl3o9XvpjLYbyFA
	GAT0qCs8Axj/akZE71RNaF66BTQXTTyhGtBt6/Owkw==
X-Google-Smtp-Source: AOwi7QA4JDsFd/cHL4lZEht+GSw8AI6V9Tt01NUqNhppCXo5NqqgbS/dvxSipNxmO9YWwYXdDxmQLSQauR7TTJS74eY=
X-Received: by 10.46.66.145 with SMTP id h17mr208688ljf.140.1506118959586;
	Fri, 22 Sep 2017 15:22:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.72.2 with HTTP; Fri, 22 Sep 2017 15:22:38 -0700 (PDT)
In-Reply-To: <ae60416c-a413-97d6-0702-f068304c1b28@denx.de>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
	<CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
	<20170918160610.GD17137@bill-the-cat>
	<a512c6ac-65d6-e105-8ce7-a2a387084dbe@denx.de>
	<500e4bce-840a-cd83-ef77-015ea622cbbe@balister.org>
	<ae60416c-a413-97d6-0702-f068304c1b28@denx.de>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Fri, 22 Sep 2017 15:22:38 -0700
Message-ID: <CAAtXAHcjbrc3o-_s3jB6=MRNDsSpNGK6-_LvEKuT9Dko3E4jzw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Fri, 22 Sep 2017 22:22:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, Sep 22, 2017 at 3:19 PM, Marek Vasut <marex@denx.de> wrote:
> On 09/21/2017 11:35 PM, Philip Balister wrote:
>> On 09/19/2017 04:15 AM, Marek Vasut wrote:
>>> On 09/18/2017 06:06 PM, Tom Rini wrote:
>>>> On Mon, Sep 18, 2017 at 04:51:31PM +0100, Burton, Ross wrote:
>>>>> On 18 September 2017 at 16:46, Otavio Salvador <
>>>>> otavio.salvador@ossystems.com.br> wrote:
>>>>>
>>>>>> What is the policy on doing u-boot version upgrades this late in the
>>>>>>
>>>>>> release cycle? SHouldn't this wait until after the release?
>>>>>>
>>>>>>
>>>>>> Why?
>>>>>>
>>>>>> It is just another recipe and we are upgrading to the final release.
>>>>>>
>>>>>> As Martin said, it was already broken.
>>>>>>
>>>>>> I'll take the responsibility to fix it. But as other packages, upgrades
>>>>>> has risk and we have more than enough time to proper fix it.
>>>>>>
>>>>>
>>>>> Why?  Because it was merged to master after the freeze.
>>>>>
>>>>> Personally I'm of the opinion that u-boot is one of those special recipes
>>>>> that if an upgrade appears just after freeze, we consider it.  If we don't
>>>>> keep it up to date BSPs won't use the recipe, and we'll be back to every
>>>>> BSP layer containing its own special copy of the u-boot recipe.
>>>>
>>>> Also please note that U-Boot has a rather regular and public release
>>>> schedule: http://www.denx.de/wiki/U-Boot/ReleaseCycle so you can have a
>>>> good idea beforehand if you want to grab something for a release or not.
>>>>
>>>> Personally, I would like to see this in.  But the security issue that's
>>>> been disclosed now is "resolved" just by not enabling functionality that
>>>> no one was enabling in mainline, and will be removed in the next
>>>> release, so don't feel you need to pull it in on those grounds.
>>>
>>> I agree that the 2017.09 upgrade is a good idea.
>>>
>>
>> OK, I just wanted to make sure everyone was on the same page about
>> timing of the update. We certainly don't want very many recipes to
>> decide they are special and take version bumps right up to release.
>
> Agreed. So what is the conclusion here about this , are we updating to
> 2017.09 or not ?

+1 for upgrade.

- morats
>
>> Philip
>>
>>
>
>
> --
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

