Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D358787C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 18:34:52 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id s4so14119467ote.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=M/BdYrvslO3vLqWpltyxdsYuJmHz7UTTP7C6HsocIR8=;
	b=IK56stXVjkTBs6JulXIAa8ve05jajLl3mSi7u54gLYReS/94yumAxKAl7ywljVrLr0
	pmA8d4TpMz6223qh9TIk1gQSJmQfsRiNoC1uc8+LjZm7iTXRVmEOEivC/C52HdXNGeys
	jT6eJ9GqJljGYtEll3PRbtNwrgid4zDfovoerSjuOxcvyztUcrvcJryFiderBvRu+gzQ
	I4WongxtNZjaoGRIiq+ksv0ZEOXeP2TFBl+IRkpYKx7eYePwwXQTgtyfXIhT3IOoqPVf
	raiKq5vgduBFI+Su0l8ltMA63dxiVmsWEDLU0PFc+zbGrRylT9dex3PydubSaNYLky9L
	EJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=M/BdYrvslO3vLqWpltyxdsYuJmHz7UTTP7C6HsocIR8=;
	b=o0uznO21uonSFzoulk0l510eqVtUoOnfJKmNegwFYCK8qXAgDryuV16Dsl/Pc/MTdY
	rkvk7OB9RXrH7B3UbpzpJueBEo4JdPMgkXqqvGZSAhRLoHujocQ0SBc+vN/tj86hzHtS
	2PDAgrOpZDrWC7uCOB7ck6kGeyXUDTgVXo28ByO1vE7weHfzkh5Nghleeo1JwPFKi2Fl
	oKiQKaeoOK352K1snDlNdcHdw8A93VGFzdT0SqTbnAdoVg9a9BCKaudO5fRKFWO2NeBh
	zn/D+sLqgbxcArQ7EG4HR2AditSpVbm6gW3dzx6yET7mW4PdHaszSjNuca/h4y4Fm+NY
	VAdQ==
X-Gm-Message-State: AJaThX7oF1qY5cbAFyefuiKq8uQTG19sRFAcIUAEi1fC0jaTgrLYN4IV
	rlXjw5/E50OtM4gR//ZMVhZ6gKzS
X-Google-Smtp-Source: AGs4zMb9hsAmXX2YmW51U2Z+OiHGJwtdvP4UPtFA3HSC0HbEZcSRaiai55pX3jIHPYmQcZHtWu8UWQ==
X-Received: by 10.157.49.54 with SMTP id e51mr2047245otc.81.1510857293922;
	Thu, 16 Nov 2017 10:34:53 -0800 (PST)
Received: from mail-ot0-f172.google.com (mail-ot0-f172.google.com.
	[74.125.82.172])
	by smtp.gmail.com with ESMTPSA id 14sm717429oth.70.2017.11.16.10.34.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 10:34:52 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f172.google.com with SMTP id o23so12497272otd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:34:52 -0800 (PST)
X-Received: by 10.157.41.10 with SMTP id d10mr2125643otb.284.1510857292142;
	Thu, 16 Nov 2017 10:34:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Thu, 16 Nov 2017 10:34:51 -0800 (PST)
In-Reply-To: <e36c6902-f2ca-5f31-c4b8-d88be3475d19@denx.de>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<52e78a6cf11a3a374fab68885140c2b4@agner.ch>
	<12cc8c4c-7d8c-f3c5-eef0-938ff9d16801@denx.de>
	<CAP9ODKrR9X6Cr04hTvVPUTRnS5-1DjFVPsX+KOHXCmkznU3t2Q@mail.gmail.com>
	<e36c6902-f2ca-5f31-c4b8-d88be3475d19@denx.de>
Date: Thu, 16 Nov 2017 16:34:51 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqx+kxf44GTxQmz0Ye3xz9aBOQt+LDR_jOPVRpE0JDsVQ@mail.gmail.com>
Message-ID: <CAP9ODKqx+kxf44GTxQmz0Ye3xz9aBOQt+LDR_jOPVRpE0JDsVQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Thu, 16 Nov 2017 18:34:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 4:21 PM, Marek Vasut <marex@denx.de> wrote:
> On 11/16/2017 01:02 PM, Otavio Salvador wrote:
>> On Thu, Nov 16, 2017 at 6:12 AM, Marek Vasut <marex@denx.de> wrote:
>>> On 11/15/2017 05:47 PM, Stefan Agner wrote:
>>>> On 2017-11-14 19:32, Otavio Salvador wrote:
>>>>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
>>>>
>>>> You might encounter this when building fw_printenv/setenv tools alone:
>>>>
>>>> https://lists.denx.de/pipermail/u-boot/2017-November/311505.html
>>>
>>> [...]
>>>
>>>>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>>>>      file://MPC8315ERDB-enable-DHCP.patch \
>>> I also see that the number of out-of-tree patches didn't change since
>>> last time, even though I complained about it ... why are these patches
>>> still here ?
>>
>> Because you are the maintainer and didn't do your duty.
>
> And what duty is that exactly ? I at least inquired about the status of
> these patches and reviewed them [1] (the other was not submitted to ML
> yet and submitter is not responding), so do you have anything else in mind ?
>
> [1] https://marc.info/?l=u-boot&m=150533817907015&w=2

Good, so I don't see the reason for the question.

I did upgrade the recipe and tested. It didn't have patches merged so
there is nothing I can do. You being the maintainer can keep an eye
here.

>>> I also see that the number of out-of-tree patches didn't change since
>>> last time, even though I complained about it ... why are these patches
>>> still here ?

Your question was pointless. So instead of "complain" as you said,
make sure those are merged.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

