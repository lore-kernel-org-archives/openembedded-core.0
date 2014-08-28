Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F56570E5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 19:43:43 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id mc6so1578668lab.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 12:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=OKU7/pvJNceYIbLx+aSng2witJ7+I231/GrJBdDKNVk=;
	b=PzpnSnv+smDVuEnOXdCWCD8D93bhWZUtpyqi2M8gjGYXq81tq7dTAEA7zIPMuGQIDx
	Rcp+VkWIrBYpSRCrP3uHm2V2CmGEJGB8P2kCjxdamlMV+KBxEcaC4xZHybBDxsQvX5yJ
	tqm7VFXpaSSKlKn6R2/Zb1Iq7zwdUSkhp2selu0Sx4sbK5czXn5GOLlgaZfUg5UQfhtM
	TDl3SOACFKjeSOYiwmPOgvO9mmssHRSt4OoMz9MtKe5Hb+TgdFrQwyMaeVJ222qwB6wi
	c9so+XjuFGwKqqHNm5QUhzVeS52hG+VOk+9ohY524Pc8FJPIOKoEjNXahItuxDjoFE3V
	IfnA==
X-Received: by 10.152.121.8 with SMTP id lg8mr5059690lab.98.1409255024772;
	Thu, 28 Aug 2014 12:43:44 -0700 (PDT)
Received: from [192.168.50.237] (ip-109-90-30-8.hsi11.unitymediagroup.de.
	[109.90.30.8])
	by mx.google.com with ESMTPSA id la9sm2983821lab.12.2014.08.28.12.43.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 12:43:43 -0700 (PDT)
Message-ID: <53FF866E.8010105@gmail.com>
Date: Thu, 28 Aug 2014 21:43:42 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1408953391-25759-1-git-send-email-sven.ebenfeld@gmail.com>
	<20140825101437.GP20524@jama> <53FEF8CF.6000801@gmail.com>
	<20140828143625.GG16066@jama>
In-Reply-To: <20140828143625.GG16066@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] md5deep: Add Recipe for md5deep package version 4.4
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
X-List-Received-Date: Thu, 28 Aug 2014 19:43:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 28.08.2014 16:36, schrieb Martin Jansa:
> On Thu, Aug 28, 2014 at 11:39:27AM +0200, Sven Ebenfeld wrote:
>> Am 25.08.2014 12:14, schrieb Martin Jansa:
>>> On Mon, Aug 25, 2014 at 09:56:31AM +0200, Sven Ebenfeld wrote:
>>>> I need to build hashdeep/md5deep within OE to include it in my images. This recipe enables OE to cross-compile md5deep. I needed to add the patch as do_configure_qa is complaining about cross-compilation errors otherwise. I added a pull request for the issue with the variable expansion to hashdeep as well.
>>>
>>> Please send this to openembedded-devel@lists.openembedded.org
>>>
>>>
>>
>> Did I understand this right, that I should send the whole patch to
>> OE-Devel ML? Or should I've sent anything else?
> 
> Whole patch as it was sent and picked by patchwork:
> http://patchwork.openembedded.org/patch/78901/
> 
> it was merged in master-next few days ago.
> 

Oh, I didn't see that, that's good news. Thanks!
Is it possible to get that patch into dora and daisy branch as well?
Unfortunately we are still developing in dora branch atm but I hope to
switch to daisy branch in near future.

