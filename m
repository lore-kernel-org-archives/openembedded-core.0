Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 079836077D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 08:35:09 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id v20so6615684lbc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 01:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ImYLvkxYekE+Nsj69jta8kwxchx3+Vxrv0LfBusy+d0=;
	b=IYY2fb2n8XZ7RxFEA95CmwzuzK7ICvROz8SODLMKXEUijtSNMm+PoAsJmD70TTS2y9
	e6i627bprDyieRlx6LlaevN6wmiYyvqbvJ4vd/qKt4WYnuQIhZXpUcor3xyxUn6D5cLH
	3CWrN41uDbqrZ7Pv4CdoIhy1P6r3rOrQxnmXF58EzfqArVIfReEMMyRDvfiEUpHemoXA
	t7ir9TH3YdHq0n3sQBmTCav/ojjzcO9lgFkZhFfNRwJjhDKCRh24evW/WehWUnXyeEm4
	02ShZhiWLzVqE/ErG4YGHjZwPYtMZGtz/mh0xmeMJcbXRbCTwWFUgfVw2KMIMm9ISb90
	asig==
X-Gm-Message-State: ALoCoQlv0lUbi54j3D3MvM0ZW/Z2WS+UOUIwZ9ElLOmqAuHlYzAx7Qev8D2a7fUrUiW5jP0KQcm8
MIME-Version: 1.0
X-Received: by 10.112.20.137 with SMTP id n9mr7204169lbe.20.1376469309663;
	Wed, 14 Aug 2013 01:35:09 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Wed, 14 Aug 2013 01:35:09 -0700 (PDT)
In-Reply-To: <CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
Date: Wed, 14 Aug 2013 11:35:09 +0300
Message-ID: <CAGNsrLBwkuv8dW3vZK7kR_c6WQdEYBZOfNKNGFFFDxSXmO9FAA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Wed, 14 Aug 2013 08:35:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 13 August 2013 12:52, Laszlo Papp <lpapp@kde.org> wrote:
> As we have already discussed that, it is not any clear at all without
> example. Yes, the end user does not really care about the internal
> implementation of the feature ....
>
> Please provide useful examples and tutorials how to use a feature especially
> when a user (and apparently others posting here) is such clueless.

We're using the feature in our layer:
https://git.linaro.org/gitweb?p=openembedded/meta-linaro.git;a=tree;f=meta-linaro/recipes-core/busybox

> Oh, by the way, and I have mentioned this in the bug report as well. We need
> proper documentation, examples, and tutorials; i.e. I am not ahead of the
> day when I first read this post. ;-)
>
>
> On Tue, Aug 13, 2013 at 10:48 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
>>
>> On 13 August 2013 08:32, Laszlo Papp <lpapp@kde.org> wrote:
>> > So, everyone suggested PACKAGECONFIG in here on the mailing list except
>> > Khem
>> > whose reply I did not get.
>> >
>> > Yet, 4964 got closed by the "team". Could anyone please give a sane
>> > description why and what would block the end users other than fork?
>>
>> Quoting from comment 1 on 4964:
>>
>> """
>> Busybox is a rather complicated beast. PACKAGECONFIG is unfortunately
>> not sufficient to manage it's config system. It is very similar to the
>> Linux kernel config and we recently added configuration fragment
>> support to busybox from the kernel recipes:
>>
>> commit 56dc1720caa48344238d352c7b6e9b0f0d41aa54
>> Author: Chen Qi <Qi.Chen@windriver.com>
>> Date:   Tue Feb 5 14:36:40 2013 +0800
>>
>>     busybox: add config fragments
>>
>> This allows you to use the default config and include only the delta
>> in your layer's bbappend in the form of a config fragment added to the
>> SRC_URI.
>> """
>>
>> If this isn't sufficient or is buggy, then fixing this is preferred
>> (it works for the kernel, so should work for busybox).
>>
>> Ross
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Fathi Boudra
Builds and Baselines Manager | Release Manager
Linaro.org | Open source software for ARM SoCs

