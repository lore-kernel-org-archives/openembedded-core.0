Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id C75D87E407
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 16:30:14 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i21so3615775ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Kic+qnQqAnEuII2nHvNmAiTP9V6cXxo/ILH4H7Fuaxg=;
	b=SUwBsRaVCgwQ9Al+LOjO3cNWBsEA5KDdkxdakMARlq5/g3asV5B7LKxPnXm93sV0zb
	gjEIae6uSjinrNQFHeqGM6XzzrpGtmrtiaEJ2AoF7m0DnmlaAKJZmgxl1RugaqIG34An
	/IvWCBJfdXxWEWSUmIXKDGIi5DgPl0v7IwNpYcrMvW6tnFYMTnb5LuXDRHoGQVUPWXcq
	gHDRnWMsgN4yxcqz842mwmvmqBsoI1Gg5mmY7gdSvuw1hYpCIAWud5TgqW5oZUoieeav
	xb2is8362F+VOzvqdWhcKSEawTBR+TQn6zUhTrFyPELj7f68SrHxAI/eM5ASw60gs7R4
	BlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Kic+qnQqAnEuII2nHvNmAiTP9V6cXxo/ILH4H7Fuaxg=;
	b=nyRVkVGUMu+AKEzYo62etzkwhpnayvTKERGCy5Zo6H30tqoQsPbNCM8XOqSGckBoQU
	xC8Pb92mRfcDPtcRGy5a7plQ3CVW6nq75/qC9tNkgvsu377Ipr/JXhrCaPX+mqIbYMAn
	Nwa5euY9v68XcaZFj1nPddDHlvclxMemlefrhjQW/wj9R7Z6wBqQ8EkiWFDed4Wj9Rsp
	19ENWoprQIoqVAgy5J0llwxnOUn0O5dN6Lv9rcBeJ04pryGMaO0X0WHGG1VGvFEMfgma
	7NDmZ98caN1DQmsTR8/Cg6wq8Y2W8U67KxaEUbe3wMK3ZfdckuNtkgwtYwFFSgF4pn+x
	E71g==
X-Gm-Message-State: APjAAAXLD0mqCiwIg3s4ezisQPi9237ndQEkzE9J3VNbl3aZCFamiX9A
	AQ/2V03JvoZOxs41zPNmeDE+Fq8m
X-Google-Smtp-Source: APXvYqxyI+A+pWrac3u51FaJBMH59dCXqGL8BtjPF10hVtmIeiC0bAZl85EbJHjBIBYf64y/ssFkjA==
X-Received: by 2002:a24:4344:: with SMTP id s65mr4701502itb.137.1559925015484; 
	Fri, 07 Jun 2019 09:30:15 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id v130sm985325itc.8.2019.06.07.09.30.14
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 09:30:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
	<c0cb96272d5dd5dddfe61dfbee2f428156b124d9.camel@linuxfoundation.org>
Message-ID: <8c1918e6-9b46-393a-5a11-a4ee64290091@gmail.com>
Date: Fri, 7 Jun 2019 11:30:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c0cb96272d5dd5dddfe61dfbee2f428156b124d9.camel@linuxfoundation.org>
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Fri, 07 Jun 2019 16:30:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 6/7/19 11:23 AM, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-06-07 at 10:51 -0500, Joshua Watt wrote:
>> Is there a reason for this change other than aesthetics?
> I have had a lot of complaints and in real world use I can understand
> why...
>
>> FWIW, we maintain some recipes across several versions of poky, so
>> this rename is going to cause me some headaches
> The mcdepends code is tollerant of either naming. We could teach cooker
> to translate any commandline references so both worked there. Would
> that be good enough to work for you?

Ya, that would be sufficient. I'll work up a patch for that.

>
> Cheers,
>
> Richard
>

