Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0F573286
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:58:41 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ik10so14899713igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YL5o+Lp+8S9j+EXnc2l6cgff4zI7b+vzvGdkaaeNOtc=;
	b=WS/vp41AYasEuTNf58OW3e/Dm7OFNMJD6vIq8BFzqWufkdaMNM4kd4xeP1Yzx6todv
	2aMs9/mQLhYw5vvzVKfU3Z8Xul7ZJD81ArnvvprQyHBecfj4AokFeJHw+9yIEEVoWnr5
	EtDMy/qu+W2/JcVRWXAV+SWxYoa75irFJYGAu9UcWJmau5qRx7Mld4uYcp7O6knGVOWo
	RGNdSfNPB0gOTcPDWbVxZyBb6TZHproliPQw79FLe1qfB+P5rTqkErCFoIsO4wDPvLHV
	i92lt9dgsmf5PYDvA5ma778RbR2zWN3sU8TolN/0h/awNsctyrofsyP/+AMYiFFwLf77
	h1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YL5o+Lp+8S9j+EXnc2l6cgff4zI7b+vzvGdkaaeNOtc=;
	b=U2aSInEcEc8AFBu32Rp24N3/x2eMEEFCgg4C+Fn3moRrSKShbKzeiATFTAl8Y2N5Sf
	zTDto094F+UPYBhcFP9FunSclhMWK5XhklnzUSBJt02a7KUf91xwYzvSpCz82xDWOxh9
	N+yY8eT/tiwcrPwlpaJcPYnIExLenBdbqx8T4fE9I18b8tlduNVMpe3+MRHK9DDQURhd
	aSt93YAWTyGsUq0sWds3lfxpiPLvoF3ayVK8+LIylZTUYJPZKs6YZA8uxGBLUs2WiVuy
	6pA27rd7ObrU+6aAhd24wHV3otbfj/zRp5g83UnEO1WzcpzwJlLIMtiI3VZ9t5Isxq1Y
	Ojdg==
X-Gm-Message-State: AG10YOR4+RuZW8qAgefdfkskXh5iyjRgT7AqVkc5K/4TWQYChytUzCxJUutM8GZM6w3ehWOhhNqWi0z+yO5NzQ==
X-Received: by 10.50.171.200 with SMTP id aw8mr4779872igc.77.1453481922416;
	Fri, 22 Jan 2016 08:58:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 08:58:13 -0800 (PST)
In-Reply-To: <CAJTo0LaXAskV2-5VjnVosQXOZD=CCmOXX6K=vhHfT-oJFQoiAw@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<521837682af1fee8a023a0fbb6ffa0f0761d041e.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LaXAskV2-5VjnVosQXOZD=CCmOXX6K=vhHfT-oJFQoiAw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 08:58:13 -0800
Message-ID: <CAMKF1soZr8=U_vJdUXxfwNGomuNYrFAs-DDUm7XVf-cghFeC0Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 65/73] grub: Backport fix for largefile detection/use
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
X-List-Received-Date: Fri, 22 Jan 2016 16:58:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +++
>> b/meta/recipes-bsp/grub/files/0001-Remove-direct-_llseek-code-and-require-long-filesyst.patch
>> @@ -0,0 +1,80 @@
>> +From 3bac4caa2bc64db313aaee54fffb90383e118517 Mon Sep 17 00:00:00 2001
>> +From: Felix Janda <felix.janda@posteo.de>
>> +Date: Thu, 22 Jan 2015 19:54:36 +0100
>> +Subject: [PATCH] Remove direct _llseek code and require long filesystem
>> libc.
>> +
>> +---
>> +Upstream-Status: Backport
>
>
> Missing Signed-off-by.

updated

https://github.com/kraj/openembedded-core/commit/35006da299d2f8c1f45fec6d89d9ae15bf9ca8a6

>
> Ross

