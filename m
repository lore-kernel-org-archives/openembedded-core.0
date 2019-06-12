Return-Path: <mike@foundries.io>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7DD7D38A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 21:17:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l19so7007558pgh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=cJWUW6Ktgg6E9kNGDN1TP2RFoF3r+3+ySvD0sy6luHo=;
	b=bkAd8IpQJxmIg9tbvaQC+ZeP6igZU6th1X69v4LOipcwL8K6MLeS6jFIIEEhTLV+7y
	hgg62BfSdHeqd0V/OAhcfBN28WOD7E1ZXbCTw8S7i6rcvuhKuCSqC9X1xKSiTZwA0E5l
	a6p8uFmsVOgVm3W4KZs13lHD/PPvbmqxTmm2mwQX4fs5w6rAJmeYqOYltnc1jT42TD05
	6KgVeHh9JncddkThjsAyyjEtELRsjzBoXnGtk3ojeZcnWIQo5bUk7MRvsoEMtK7zs65V
	j6SYf8RSVE9M3xG/G7r32p28gw2g7TWqzwbyvcTHJKUyLWP6R8+LkClsjv5HuU9o6YJ1
	ZhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cJWUW6Ktgg6E9kNGDN1TP2RFoF3r+3+ySvD0sy6luHo=;
	b=qYTZ1rg2c+ybwh6PqzL+MPpl/GE2ieSg0qn/0paB6PAzLmIyM1NIlF3rKjTZx7//i2
	AWv5OPZY1a5V7E5QRqMSQUvxDY8HOZpfop3rTp6Teco/FC58P+PBe1Lh7iNmd8nJs/Bt
	VOotILCRjWjIBsqizx0U+L1HT79YnyiTtKlah0SNC6nw4+9i4L9qnKNHal+FzwmryJuZ
	sgTI+TPYWM5q9lh4XxuP1abBXbAnaMYEI604DeKmtosgcRLmGkvEwXxmJ/5t+/ZRaoSH
	KKnW/4+Uoee+PzzMrO98TIdPPaSwgDkghPxpce1Yjp258sepbHrmKUDOw7U1CCbbyOU8
	pT+g==
X-Gm-Message-State: APjAAAVtb1qNWuB0TRY9lakh6T35z690+uALksqGkjFafuOxoYOGUc5h
	EW5K1IhM4X/8QpDg7jk3NyKxUM58xPs=
X-Google-Smtp-Source: APXvYqyKqu+EQqNRIdNGOWbEZcqPHhNBBHr+B6iAcSV2NfBUCikh9neJmJ0CsvSbxmi8fxWr9EekSw==
X-Received: by 2002:a62:1ec1:: with SMTP id
	e184mr89237843pfe.185.1560374226845; 
	Wed, 12 Jun 2019 14:17:06 -0700 (PDT)
Received: from [192.168.69.121] (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8])
	by smtp.gmail.com with ESMTPSA id j23sm477760pff.90.2019.06.12.14.17.06
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 14:17:06 -0700 (PDT)
To: Alex Kiernan <alex.kiernan@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
	<51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
	<CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
From: Michael Scott <mike@foundries.io>
Message-ID: <9cbbc692-2702-f3f4-199d-ec06cc0f212c@foundries.io>
Date: Wed, 12 Jun 2019 14:17:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Wed, 12 Jun 2019 21:17:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 6/12/19 11:02 AM, Alex Kiernan wrote:
> On Wed, Jun 12, 2019 at 10:59 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2019-06-12 at 09:15 +0100, Alex Kiernan wrote:
>>> Since UBOOT_DTB_BINARY empty means we don't need to inject signatures
>>> into the U-Boot DTB, we can remove the dependencies between consumers
>>> of
>>> these two classes and resolve a circular dependency between u-boot
>>> and
>>> kernel.
>>>
>>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>>> ---
>>>
>>>   meta/classes/kernel-fitimage.bbclass | 2 +-
>>>   meta/classes/uboot-sign.bbclass      | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>> Really wish we had tests and documentation for these classes...
>>
> I know... I have a dread anytime anyone touches it, me included... I
> sat on this change for a couple of weeks too.
>
> The truth is the pair of them are fragile and hopelessly intertwined,
> but without tests they're never going to get rewritten, so I might try
> and take some of that on (or get someone here to do it) as I still
> have multiple issues with them - signing doesn't really work the way I
> want, I still have a circular dependency I've not tracked down,
> doubtless other things I can't immediately bring to mind.
>
> If we were to add some tests around it, what would you pull out as the
> simplest thing that it could do which would be valuable?

Actually, you can ignore this patch.  We debugged the actual race 
condition contributing to the confusion, and that developer will submit 
a new patch with that fix.  We can review if that patch makes more sense 
(even without tests).

The test would need to follow:

1) Is there a pub key in the u-boot.dtb (symlinked file) in the deploy 
directory and is it the same as what is generated by mkimage when 
pointing at the fitImage in the deploy directory.
2) The race condition affects the build when there is a cached step 
built incorrectly.   The cached build step injects the u-boot.dtb prior 
to it being signed.

Hopefully that makes sense,

- Mike

>
-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: mike@foundries.io
W: https://www.foundries.io


