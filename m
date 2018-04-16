Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id D40637452A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 10:31:30 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id o9-v6so16801776otj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cafuW9gfi9wssj8R8Gdw1/hTkw56H0nk0pVpv9AsChg=;
	b=bylFzkTr1F6XO17og5dI8i0MU8+oMa07m3dCpPEyVW9gZI9dvpnWVMoN8+DTMjiVKo
	+RTQPmJRl1AX52VPdND7IAwm1hAbmEWGOAQWPNhVhRUoqw9UyVNR4voj02ZZWm01RCUB
	37FgrYKeKu4TvdmUHpHV113SoOioZU+uuqn+K1tLVM2WyAOgLTpGwF7T222lFi3NhTeE
	9BhoGFpZU6qmu9VSxcNRGU5YwCnGhxFPp8n+eBmtlZB9JrzB8/caEa10IqOXlhdIXDda
	B/T29xGswJ2fBJ7a+7i1g6UVIbywj+7e7AxNrM2P4aZklyhU6r+Wzvk6VSk16AzdSrb8
	pnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cafuW9gfi9wssj8R8Gdw1/hTkw56H0nk0pVpv9AsChg=;
	b=tPzxvhS03/ouOrbybjhklAsDmyzixjRgOcrSpabYThg1z+kD0COO36W8AdLbyD4sNn
	saru+9rAt9lb9KjK0T0mEVVcj6Pu2sKok1TlkpHl/d716Qp1Z8171o58YfagcvSeCu1b
	kpnHZNPC1U84o9gZWQ7mckWx1fXmrMriBdPZ4zWTcV1nljcxw7AnBxv4MUM1zwHbLBMX
	+v77i4WNzBOMDj+rwZ+yHzgVicU0o8+mUy9cfhWmj9jYpxznfEARzzcWWsCD0eUv6Z9T
	IsoYeSH/y53JMJc2GPvfNm9hk2XN31dgFEfUruHhkkuB1qEV/SujuhWu8IzJx5oNfSWG
	Qg4Q==
X-Gm-Message-State: ALQs6tCxYgu8lXMrPpH5cPNIK917bdU81mai0L3iy3CaB0pgg7MGC6Te
	cygbr06DV9fJMckbQIl/gjS42dqi5We4a2x+yeXCSA==
X-Google-Smtp-Source: AIpwx49uZPxH/rDMkpQe6ay1EjZT7LFh4P7VBVTPopCmgenxRpxBLWCTpHdLZSlTpmMXpz5cKsMBUEzW/1qrHzn4wv8=
X-Received: by 2002:a9d:3e1c:: with SMTP id
	a28-v6mr3338078otd.168.1523874691544; 
	Mon, 16 Apr 2018 03:31:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Mon, 16 Apr 2018 03:31:10 -0700 (PDT)
In-Reply-To: <ba83f506-26bf-dfef-d9d5-df352e4703ba@pseudoterminal.org>
References: <6c43a914-cf60-6d05-766c-1c1bfc92d13e@pseudoterminal.org>
	<CAMKF1spKY4WjXg1c=70w0TjMwqVNGQD3FdLdL_A7La5rEdh7kw@mail.gmail.com>
	<ba83f506-26bf-dfef-d9d5-df352e4703ba@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Apr 2018 11:31:10 +0100
Message-ID: <CAJTo0LaxaXVSkuWvERA2k5nK6P6cP299kn9z+vZamRz4RGNMwA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: dropping commerical flags in mpg123 and lame recipes
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
X-List-Received-Date: Mon, 16 Apr 2018 10:31:31 -0000
Content-Type: text/plain; charset="UTF-8"

I *think* we're good to do this.  If you could send a patch with a
nice long commit message with sources and comparisons to other
distros, then we can have a concrete patch to review and get further
advice on.

Ross

On 15 April 2018 at 09:12, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> Please note that the Fraunhofer page is from May 2017. These sources suggest
> that the final patent expired in December 2017:
>
> https://madfileformatscience.garymcgath.com/2016/04/05/mp3patent/
> https://www.tunequest.org/a-big-list-of-mp3-patents/20070226/
>
> Fedora now added LAME and mpg123 support, since they consider the patents
> expired: https://fedoramagazine.org/full-mp3-support-coming-soon-to-fedora/
>
> Fraunhofer terminated the mp3 licensing program in April 2017:
> https://www.iis.fraunhofer.de/en/ff/amm/prod/audiocodec/audiocodecs/mp3.html
>
> (German source) wikimedia now allows mp3 uploads:
> https://netzpolitik.org/2017/wikimedia-erlaubt-upload-von-mp3-dateien/
>
>
>
> On 2018-04-14 16:16, Khem Raj wrote:
>>
>> On Sat, Apr 14, 2018 at 1:30 AM, Carlos Rafael Giani
>> <dv@pseudoterminal.org> wrote:
>>>
>>> The lame and mpg123 can be built only if the commercial flag is
>>> whitelisted.
>>>
>>> However, the remaining mp3 patents expired in December, and no more
>>> royalties exist. This is why in GStreamer, the mpg123 and lame plugins
>>> were
>>> moved from -ugly to -good.
>>>
>>> So, can we drop the commercial flag in mpg123 and lame?
>>>
>> We probably need more clarification see
>> http://www.audioblog.iis.fraunhofer.com/mp3-software-patents-licenses/
>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

