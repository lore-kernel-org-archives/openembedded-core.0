Return-Path: <paul@betafive.co.uk>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id DFDEB7D19E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 09:28:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 01D0A22011;
	Tue, 28 May 2019 05:28:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 28 May 2019 05:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=U
	DV5tKjOAOFSvAd3bjoQAX1AloZu4miuh9veSQNOYOk=; b=SYZ5/GoLrdR2WtIAi
	i8rNRIjfRmJtCz9Htyveaf4/jjZiUg6uTWoXomakapDpm0sesvLCgHsxK5J0B2lL
	GhggpthX0uBneLtPiRkwu+Xu7RKOCSDWKT6rlzVSo5Wks1KwcvM1Lfflin7clMpQ
	XYrxg9Hb7eHBV247EQ42rf6aS0+Fc+uwHLSRvEx9gPXpPfLFHazVb5m5xUzzUvia
	oRFjn5HMqDMSCqikQxVYZnl9PmylYszkKYrLyySc4br3pZnOcZT4q37AXh2bu4gL
	hFBGP3xRf+EhVkqh3iwfWibQe4Uek1I4ft45sBvk8CT3yR0Twm38P/2uXmBfBzoq
	7DZ8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=UDV5tKjOAOFSvAd3bjoQAX1AloZu4miuh9veSQNOY
	Ok=; b=W2I8U5tukQfW2mMQ4KABTkGJvFF1zzuxV86HvJe08m5S/atDMZP+cNpaG
	BatlgL2C75E+rmqZoRZ7ts4WKEsNdqWd59qpjrNak8oXAfEGo00eLEcpzb2VPtn1
	pJ7d2NWu0mLWCneCI+tUotDiYFaZqbw+Op6pSjSf4jDRKKIELoSxgqjQJcGZ5lTp
	NHiFQafKSMT9UhJfM9jRy39VlVTehSTtYz3xa6QEvqHMnnW/zwWJHG/8PUvKKZ1s
	R2I255RwTCH0XYxgRDBpcTJDReWQ/XxbLczJW5BhACLqkT3xncYJhCSUI6RI19wP
	QYxVxsXOoeDeGoKOBKaf9Tt3ygz3Q==
X-ME-Sender: <xms:KP_sXBiGyakVb_PsxY4ZYsg_B5srE05fZddhClHU0MgeFHU5-NcHPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddvhedgudehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepuffvfhfhohfkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefrrghu
	lhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpehprggtkhgrghgvghhrohhuphdqtghorhgvqdgsohhothdrsggsnecukfhppeek
	uddrudekjedrfedvrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessg
	gvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KP_sXKSdjGjpQ29x8sj5rWIHDEQUep6jQIEHxAaqS0087dmVQY4qAw>
	<xmx:KP_sXMFjWyYvfyH1R1TENo4xmDPD7HTUGatFG0J5VaBNImioBCfC8Q>
	<xmx:KP_sXKnoc9NZpzutaHC9tbHUgeHvkdNRMdxQxHuo4Ny_ASQWT0pUcA>
	<xmx:KP_sXJzsSYYCaa_Ee7rBignjtF6z6957MuGCIGiYYROwgVekXJA48g>
Received: from [192.168.1.120] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7D2ED80059;
	Tue, 28 May 2019 05:28:07 -0400 (EDT)
To: Kang Kai <Kai.Kang@windriver.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <raj.khem@gmail.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
	<CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
	<7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
	<e3af3be2-c739-fa69-720f-d08ddef76b28@windriver.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <c052374a-28ec-74b9-a1c2-58329a937f5b@betafive.co.uk>
Date: Tue, 28 May 2019 10:28:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <e3af3be2-c739-fa69-720f-d08ddef76b28@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Tue, 28 May 2019 09:28:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 27/05/2019 02:49, Kang Kai wrote:
> On 2019/5/25 上午3:23, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: Khem Raj <raj.khem@gmail.com>
>>> Sent: den 23 maj 2019 22:59
>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>> Cc: kai.kang@windriver.com; openembedded-core@lists.openembedded.org; 
>>> richard.purdie@linuxfoundation.org
>>> Subject: Re: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd 
>>> as default init manager
>>>
>>> On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt 
>>> <mailto:peter.kjellerstedt@axis.com> wrote:
>>>> -----Original Message-----
>>>> From: mailto:openembedded-core-bounces@lists.openembedded.org 
>>>> <openembedded-
>>>> mailto:core-bounces@lists.openembedded.org> On Behalf Of
>>>> mailto:kai.kang@windriver.com
>>>> Sent: den 23 maj 2019 10:26
>>>> To: mailto:richard.purdie@linuxfoundation.org
>>>> Cc: mailto:openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
>>>> default init manager
>>>>
>>>> From: Kai Kang <mailto:kai.kang@windriver.com>
>>>>
>>>> Move configurations from local.conf.sample.extended to 
>>>> local.conf.sample
>>>> to make systemd as default init manager for poky.
>>> If we're going to change the default init manager to be systemd, 
>>> wouldn't
>>> it be more appropriate to change the real default values in bitbake.conf
>>> and http://packagegroup-core-boot.bb? And then include an example in
>>> local.conf.sample.extended to show how to configure sysvinit as init
>>> manager?
>>>
>>> That would change it for Oe-core and other distributions as well which
>>> is not the intention
>> Ok, then I'd say the change belongs in poky.conf. Doing this kind of 
>> changes
>> in local.conf.sample seems very wrong to me. Why? Because if I have an
>> existing build tree it will not be affected, but if I setup a new tree 
>> with
>> oe-init-build-env it will all of a sudden behave differently from the old
>> tree. In my mind, local.conf.sample should only be used for things the 
>> user
>> are likely to want to configure to adapt the build for his/her 
>> environment,
>> not to define the distribution (that's what poky.conf is for).
> 
> 
> If put the settings to poky.conf, it is complicated to override the 
> settings and hard for users to turn back to sysvinit when he/she wants.

If you want to make this override-able you could do something like this 
(forgive any mistakes or bad wrapping I'm just writing this in my email 
client without testing):

POKY_USE_SYSTEMD ?= "1"
DISTRO_FEATURES_append = "${@bb.utils.conditional("POKY_USE_SYSTEMD", 
"1", "systemd", "", d)}"
... etc ...

That would allow someone to set `POKY_USE_SYSTEMD = "0"` in their 
local.conf.

There may be more elegant ways to do this as well, but we the default 
can certainly be set in the distro config in a way that can be 
overridden in local.conf.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

