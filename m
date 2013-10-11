Return-Path: <fathi.boudra@linaro.org>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 619866CE84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 07:07:23 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ld13so2509530vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 00:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/yQzI+ezjp1/5WbVLLf3ARAyG+hjzXCpb8lilMwOQoI=;
	b=U8+ZsdCESKM1jEyYA9W8H6a33wNFap0WC7YtkNqT/J0c+ZY4sEn5A8wBzi+GMUPDyU
	chCBouk56OsrGXHvlvPM0C1Mbm4FpIRNnqPYzsF0yxAOZX1ZbXk7yRqi1QT8VvDv8cEI
	YNDSJoY51PbPp2jHGyC99hri/Gsuel5V+qpYvTNCZLpTQnT+CdURYP7klDPzWoBljnaK
	OFxC+Q6VykKyzO2dOsjVaKnZyggF5QI2YukrPqlo6ZR6fyUtAUSjvp4abyGKh8i+GBSm
	iM6rdaUuwjcXqHvIzvPajAXuUdcrG5n72Oc4QR+nRPoPg93f3wTYKsJ/zmsYKwyKMUZ3
	Gj2Q==
X-Gm-Message-State: ALoCoQnNknmCQFPo9BBS8EwWW+EqJf+EytaFb+BxcMYiEyrvqyZ7Dph7w7z80gnxhdwqg1krBNPM
MIME-Version: 1.0
X-Received: by 10.220.10.194 with SMTP id q2mr20018980vcq.2.1381475244633;
	Fri, 11 Oct 2013 00:07:24 -0700 (PDT)
Received: by 10.220.103.203 with HTTP; Fri, 11 Oct 2013 00:07:24 -0700 (PDT)
In-Reply-To: <F2DA74A1-4BC4-41A0-B1C3-BB6D787EF8AD@gmail.com>
References: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
	<CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
	<86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
	<F2DA74A1-4BC4-41A0-B1C3-BB6D787EF8AD@gmail.com>
Date: Fri, 11 Oct 2013 10:07:24 +0300
Message-ID: <CAGNsrLDDvoCmxsPG6sphmfJW8+Bd10GCQ5mYo26VQTQHMyYf9g@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Fri, 11 Oct 2013 07:07:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 October 2013 09:53, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Oct 10, 2013, at 11:48 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
>>
>> Op 11 okt. 2013, om 07:37 heeft Nobuhiro Iwamatsu <iwamatsu@nigauri.org> het volgende geschreven:
>>
>>> Hi,
>>>
>>> I have a question.
>>> Why don't you unite  name rules of  other architecture?
>>> Forexample, armeb is endian-big of arm.  mipsel is endian-little of mips.
>>> If you can unified name, arm64eb is better, I think.
>>
>> In an ideal world I'd do that, but that ghastly 'aarch64_be' is already in upstream gcc, binutils and eglibc  :(
>>
>
> Now that you work with them.

:) you can surely reached us before that...

> can you find out the reasoning behind it ?

we can ask...but it has been decided by ARM 3 years ago and we're a
bit late in the game. the we is including us, Linaro.

