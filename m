Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC7365D72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 00:32:55 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id i57so268530yha.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5YMDlruyYjjJkvPr/JGrxCJBkJH/q09qTiQoD4r6tZE=;
	b=Ttc2IFNP7tRGJ8IeXUulZMjtHy9kubGKI4iGhWAH8Fh0Ett9aDnKQYIs1Ox5VNxGiD
	Ymp55oH/Ilcz17nTjgwJMCkWsvGQbci/vT2TbdVqCy3f4YVFN/nmkrkv2YBlAG7IUu53
	JrRopQjX/cFcMWzEXSh2+56OmbM7oU1qrL2BKi9+DVYzkiqBn+eiK+X9S+AhmVlHMLII
	di+cnEPno6IMF5MQGhKfmaRbOXFvTlzjPz/XduCd39KWfsZt9itySnwqbgEXBEv8uSkg
	YTObkr1eT1puMqz4wW744YJ4lnYDXJ/0O6MTRWn5eMXKTr/deKK5LgIwVNEkfzkyUBZE
	aPfg==
MIME-Version: 1.0
X-Received: by 10.236.61.6 with SMTP id v6mr2331850yhc.44.1414024375687; Wed,
	22 Oct 2014 17:32:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Wed, 22 Oct 2014 17:32:55 -0700 (PDT)
In-Reply-To: <201410222239.17111.marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410192313.41430.marex@denx.de>
	<CAP9ODKqJKR6DUCYw5=+28hZr51OUf3di96g5GbzZDKMHHJwYQw@mail.gmail.com>
	<201410222239.17111.marex@denx.de>
Date: Wed, 22 Oct 2014 22:32:55 -0200
X-Google-Sender-Auth: Is3lwYZLYbUG3JjwSnDFeeRPhXA
Message-ID: <CAP9ODKrOOE5_+=18EyYWHn3WvwbzYBuUZvxKGOHomJHPrchUhw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 23 Oct 2014 00:32:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 22, 2014 at 6:39 PM, Marek Vasut <marex@denx.de> wrote:
> On Sunday, October 19, 2014 at 11:26:32 PM, Otavio Salvador wrote:
>> On Sun, Oct 19, 2014 at 7:13 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Sunday, October 19, 2014 at 09:25:36 PM, Otavio Salvador wrote:
>> >> On Sun, Oct 19, 2014 at 5:15 PM, Marek Vasut <marex@denx.de> wrote:
>> >> > Remove the lambda function setting KERNEL_IMAGETYPE_FOR_MAKE and
>> >> > instead set it in the anonymous python function. This also allows us
>> >> > to handle image types which are not supported directly by kernel, but
>> >> > require some other kernel target to be built. This is the case for
>> >> > example with the fitImage, which is the uImage successor.
>> >> >
>> >> > There is no functional change.
>> >>
>> >> This is not really what the code shows; your regexp is more permissive
>> >> than the previous lambda.
>> >
>> > Do you happen to have a suggestion how to improve the patch please ? I'm
>> > not really a python guru so any help is welcome ...
>>
>> I like the code, just the commit log needs improvement as you did
>> change the functionality here.
>
> So what do you suggest, just zap the following line from the commit message?
> "
> There is no functional change.
> "

Works for me :)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

