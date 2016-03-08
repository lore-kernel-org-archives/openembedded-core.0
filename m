Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2FFA960745
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 19:57:04 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id c3so30312281vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=IVFG1g41MwdGzTEukx0v6hAkJKkh752hqvLELvAxc2I=;
	b=lDiFNjylohbnkBWoW6nbLLnfo9M6r0yVIP1lSWRaCJ6t7ZGRQW9SET+TkrkbHPKTHB
	kfnrzTMNSX4cetiCY/bTJa/szoj1wBux1UIcVjoLc3g9Iwm6Vm0971DzbP8pexMVvsct
	2Y2LefB3QV/P9RlEPP7+rnEud1sW1mY0VJ3tkvxhBvvMHiI8n0UocYvJg8Wwz6RTR/9k
	trDFCN815YJEuuY9u0rbBIAg0jlYmp4zqRlBA40hRfGMWeZPp8p3SvnQSLdTI9/GOI7+
	p+QzN7H+Tg4ymENqsrU9mWTxDwAOqZv8x+mbCGS7QMSRNcxl7vPxolhxEYxa/6XKeiGa
	KeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=IVFG1g41MwdGzTEukx0v6hAkJKkh752hqvLELvAxc2I=;
	b=gWvqSsp02md1Mq0IncHsDtuSuEtFubXjruUvcn9PwEQbDxVbeyfsPWJ+LYWcux0/1S
	IMRdrmHcAZkAodOD6dlzB1IYE+lV2LPrmNlXhrkqJyaQGw1/hcV8p3DN7+8EUZY+80D0
	QxPQiHQTTke9sPH2DDNdMjCyK++B9CYCIhmuwkC0hlTZnjSwD3AZfGRGTwLklSoSU8hE
	XXaPJ72IzG0FoT1t9+mm7YZZSkxCx07j22Y0E7erw+DaVzo1Y+x/Yesd6f057bGmx6+9
	iyiDsUad9rdVOgUZFeBb5rWU65Z6znE7moUhqeNc0YvzgEvkQkyyTW5Yty1pt+Cfd3cy
	yMEw==
X-Gm-Message-State: AD7BkJI5N2doWwp7ZtCOSimkGVoVXSJ0ddLj3lvx0sMCJNpYxuN9dUBW0lcLAmTX3iVBpXKC1PTYEhUxcbtQBQ==
MIME-Version: 1.0
X-Received: by 10.31.54.194 with SMTP id d185mr23821048vka.130.1457467025226; 
	Tue, 08 Mar 2016 11:57:05 -0800 (PST)
Received: by 10.159.55.167 with HTTP; Tue, 8 Mar 2016 11:57:05 -0800 (PST)
In-Reply-To: <56DEDC5B.4050501@siemens.com>
References: <56CC6832.90506@siemens.com>
	<1457090416.2804.19.camel@linuxfoundation.org>
	<CALbNGRQbfu45fM=kijvTnx4sY2SzjiVSCtGXhyt0xM+akP1sSQ@mail.gmail.com>
	<56DEDC5B.4050501@siemens.com>
Date: Tue, 8 Mar 2016 20:57:05 +0100
Message-ID: <CALbNGRS4GEKAEaHOtiar-mb=t01Trq_k8RJcPfO_bGnyVWuj0A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Debugging using sysroots and GDB
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
X-List-Received-Date: Tue, 08 Mar 2016 19:57:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 8, 2016 at 3:06 PM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Hi Andreas
>> I am using sysroot for debugging too. I have no
>>
>> * INHERIT += "rm_work"
>>
>> and added
>>
>> INHIBIT_SYSROOT_STRIP = "1"
>>
>> to my local.conf
>>
>> I use this approach for very long time now and from my point of view
>> it has one BIG advantage: I can use these settings for productive
>> images and start remote debug within seconds without further
>> rebuilding.
>> OK - default compiler optimization sometimes causes headaches but it
>> works for solving >80% of my cases. In case I want to debug software
>> that I have developed setting optimization recipe wise helps or I
>> debug that on PC or target itself.
> How do you deal with the case where there is no source in your work dir because the package was taken from sstate?
> The only solution I found so far is to build without sstate :(
>
To be honest: I never had that - maybe because I am keeping a complete
tmp for each machine I am working with.

Andreas

