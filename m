Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CE4B86057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:17:45 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n63so10771865qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qqnl/mjCZ6oKoc3cWFCdvsRWu7imcVJJOoUcZyIokrc=;
	b=gQvQQEPm5Mcm45I1buhPU7CYCtDPRRQHkRaM1eYrppC70nXl8d5MfQ4lQ67FA4u68X
	/b4OujonRppVb35bZ9vPzXmcWrkHY+GCqStepdsBhOid8MViRlh3xaEiwn8RC3YA7518
	68E4RMeoqNi7klQxOQqtAsmMYpPxi18oAtD8eVy8K/ZBezxcoLmjXNMg7R9FqSTGhSiZ
	/pwJB7Jv6ebcHqfR+0zOgMZwa/sBgZdKXqBD1jJlB9tJfnabJh1J+RNqnGGd3P4Wamp0
	Uk3WxdkkNNgxFvVyHSl2qV8/xoYWnN7w39URKmgQsmYYaJvtIrdiMzUG9ui79dkeo2W/
	OPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qqnl/mjCZ6oKoc3cWFCdvsRWu7imcVJJOoUcZyIokrc=;
	b=XI6XQv2HcDbaz6M/2n87DCgk/FCLIPahwSSgNz7RViamndP2x226heExYtXtn+pseC
	WoaT9Y7M0lhIQ7mZbeBloKKvp14PZK/YASt2W4LS4v8hAYZuV3bjDdgS8yPa/zg+0jvk
	6tMjpHCeQ4t414axeYvHyjyXqXxlpkowz7C0fb/t3QvoMGPRfovHV7DDvuwOiuO8iO0V
	Zlr24rqNqXu7ONEGp/Djm4daynKy0ysS0ITrUJmS5eMrPbYRpGlb/dmCJRfdh9HfksHQ
	85VjUqFWzMUu47L3QQffn7y3IfrIEK+baVnGnIzvNwl+OFfagWgi53cb+OmFdLlVof3+
	NYQQ==
X-Gm-Message-State: AOPr4FXqF3INaRBusQffe0A7DQk8p0s4j+PrBHvTNcdo1SjGSMSBFfCw1CqpS5kh+08NmNzqbjT0LSCmoI+2JA==
X-Received: by 10.55.163.16 with SMTP id m16mr12715275qke.75.1460567866139;
	Wed, 13 Apr 2016 10:17:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 13 Apr 2016 10:17:16 -0700 (PDT)
In-Reply-To: <570E7EAB.4030308@windriver.com>
References: <1458077979-23303-1-git-send-email-raj.khem@gmail.com>
	<56E91CC8.9060907@dest-unreach.org>
	<CAMKF1sp7C3zCHQBiJ=i5YYsHcXfkBX74qYXgZxYX-tqcwqrD+A@mail.gmail.com>
	<570D631F.5020503@windriver.com>
	<CAMKF1srjaNz1dnZCHFkWn6=PyQ+w6Vb1FoF1rbDVCGaTCe3FrA@mail.gmail.com>
	<CAMKF1srQ5ayOr3ha=YTTGBS-ovX8Ht41ODoNaSEHBGW9EfjFGA@mail.gmail.com>
	<CAMKF1sqBwbkHWQBBzX8jbK0SoZtcMr6MO2ZSZ9dcMJJns6x+eQ@mail.gmail.com>
	<CAMKF1sq1kqM7iair34+2ZoxZh24=wszYniJ4cyoBc2M9_XzEQw@mail.gmail.com>
	<CAMKF1sou4V8jvOLKponmoR5gYsa8nEgXOa=ALF14Yyz23nrbEQ@mail.gmail.com>
	<570E7EAB.4030308@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Apr 2016 10:17:16 -0700
Message-ID: <CAMKF1sr2g3YzmjDTtG=+n5zoE_56zJ_MWEnXvCJoQFb2G9vEJw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Access c_ispeed and c_ospeed via APIs
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
X-List-Received-Date: Wed, 13 Apr 2016 17:17:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 13, 2016 at 10:15 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2016-04-13 11:57 AM, Khem Raj wrote:
>>
>> On Tue, Apr 12, 2016 at 3:33 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> I think I see the problem now. The constant should be converted to use
>>> Bnn
>>> values. When calling the baudrate apis. I will send a patch for you to
>>> test
>>> once I am close to computer
>>
>>
>> I have sent a potential patch.
>>
>>
>> http://lists.openembedded.org/pipermail/openembedded-core/2016-April/120229.html
>>
>>   It worked on musl env that I had ready here. Can you test it
>> with your env and make sure it works for you ?
>
>
> confirmed. I reverted my local change, applied this and socat is
> working without the assert.

Thanks

