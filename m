Return-Path: <matt@madison.systems>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 01066606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:12:48 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id g62so36812641lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M2cfYYPe87D5DNz0YNLN+oahB4k0uZho/RRGxH7Muzk=;
	b=FTAacbd7XxB0rkdgwZvJr3fXhhgFPGPhd603xqd0fWdQxtwSd6B/FrykYV2HwDyoIk
	BZzqyN+pEmwFMjeqw5IZkAg4WdZ/G6uAM5Wthq0ATNlBusWF3zI+r0XM1+RGvURE8OzZ
	/xt53X1yjHcMzdSy5C9WhWp/lPUPOutkQL9xFvKlz70y4fCmUprn5k/6qZyrv6ONmcc7
	6G25Pxo4L2Bnv3m0TfsfRG1t1br8YLrzkcJ9d3tP2x9h91djyxNiIFsFZEIpP3ILyQ03
	SFVuhokheKPJLcwrDR485KiTPsBZ958LEBefMc/dyMSfqVZ3cNPr68Y3gDEMSPaablkv
	xCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M2cfYYPe87D5DNz0YNLN+oahB4k0uZho/RRGxH7Muzk=;
	b=Tf64sra+R/ggzdwuI8MaPMp2u7IdeKEvWY8QfQ0i73rmb0ptb3gPrZXipqIDwzgLzi
	2riQYixQcIavULxMQtBhDP/8h6exoNLvxrjGdbGpgfdv5nyHMFlBr6ILpmX7/3bhpwd9
	Ue5ETK/aClgdU3EIp+c42flzn/AK+yVwCmQmuDRyVVNXLhcJUJYx675LLJRkpKsNdcyW
	z8JIy9y1cobUQj61lO4epE4bsdKQ7Kyt6u75hO/lnzrN3+R+ar4KHifRFOZclvh9A6jb
	OpPzgofeA/DvDt6Umn7QDcgvi3t44Wn409dmLp+qd+qWSXMyAs3V6pgQdBV0EVbNLyyG
	Dexg==
X-Gm-Message-State: ALyK8tIEgeps6YlsKRZwvH557OpXQZZ00HwnxY7Fm+8zxYLjA0Qg+C1YN3mv/n8iDGTygNMha84PqIHZfX7nGw==
X-Received: by 10.46.9.76 with SMTP id 73mr20042960ljj.61.1469016768789; Wed,
	20 Jul 2016 05:12:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.24.162 with HTTP; Wed, 20 Jul 2016 05:12:48 -0700 (PDT)
In-Reply-To: <CAJTo0LbN7s2Au_77p=rU=oMKrv9JC3u5EnijyPf572jxyiA3Qg@mail.gmail.com>
References: <1468930727-2937-1-git-send-email-matt@madison.systems>
	<CAJTo0LbN7s2Au_77p=rU=oMKrv9JC3u5EnijyPf572jxyiA3Qg@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 20 Jul 2016 05:12:48 -0700
Message-ID: <CAGgRHJpRD4-OyZoBSxrtHW3rT9+t09k2s1gj7NErtQH5y6U+4Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: fix Python 3 error
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
X-List-Received-Date: Wed, 20 Jul 2016 12:12:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 20, 2016 at 4:56 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 July 2016 at 13:18, Matt Madison <matt@madison.systems> wrote:
>>
>> -        for dep in rdepends.keys():
>> +        for dep in [k for k in rdepends.keys()]:
>
>
> I'll admit to being fairly new to Python 3 idioms, but wouldn't
> list(rdepends.keys()) be neater?

I'm no expert, either, and that way works fine, too - I'll send out a
V2 shortly.

Thanks,
-Matt

>
> Ross

