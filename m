Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E935674702
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 21:20:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p18-v6so7088858wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oJ5bDeCTkl7XP7X1iwYBp8XfBFUHECuo0WDWQ2P1mBA=;
	b=iAnQBF4ttTKNfqIwvuteia/Xl+4CR58AYTAQ4w3rjw7HSJErHydNRCZ1+pAglIUL5W
	7tsi+4olNBkuGJMagF7FlF/viKfxQFvNjJ8J43f8BO472H/7AwX1TFf08qu9f8AKbAp8
	tOvCAdith3Lnh+Mea6CPjkaGzrWAUkGTy4hQ+yv6yzX10w40snV9/yn91iK043oJWvGS
	gjWwM3JUFdBiZO6yh8sNbk8cJP+UISnOJiEisstQ9cgBjXfya8pg8Ixx7R+KKm6IMN+e
	8Xsn+mDroqbP+yDrFef5xrGREyZVtRpVxhcY1+lDrykdhpdHgbjjCxqAH3CbOiyNfXNi
	AbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oJ5bDeCTkl7XP7X1iwYBp8XfBFUHECuo0WDWQ2P1mBA=;
	b=HdyNn8kZDOz4Ckn7Y+WLsRqAxybh3a6YiUn5DphmQKf0ApN4XFmtoqGuPd1odgAX6B
	gcjI2lX0AGrou2CqFJtPoCiuFEVLvbMZJ8nhvgR9T2enbR18S4BMuU16p0xAT2EoZRjp
	4WznZyaGorZEyDiDkFtzn8h+TzFkWzGj8aSsPtYnnig8rhDVG3YjLN9IvLlR0cZqUszu
	bmy+3D4pNxgNwHypHqWYUiYkTH0HyQF85vEw8huhd52lXnPx4pIQ/FJytmvji4LZV9yH
	j9Rxk1/Rpe91nmWAdagDqNaIlFV0HI93pvqYR7X7kWHT3WDbSogKSKeHl+Y451sNub2y
	0w6Q==
X-Gm-Message-State: ALKqPwfPwkgPs2yeAwfRTi0NJjnIVrGjrKmSkxsXK80el8Bu+1R1amF3
	uEo46PAVTZWiwGLFOGqZhaAtTXfB
X-Google-Smtp-Source: AB8JxZozGo09ja/+LGGpqckgiPvDtF1p98t0q5mmpzwYFhkTdrYgfAvdUoyFycdjUpbMh6gW+aE4EA==
X-Received: by 2002:a5d:4045:: with SMTP id w5-v6mr200546wrp.96.1526592056729; 
	Thu, 17 May 2018 14:20:56 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	k82-v6sm6279477wmf.17.2018.05.17.14.20.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 14:20:56 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
	<8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
	<0df38331-afdf-b47c-410e-6640c74e8b14@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b791ecd2-619b-ab33-b474-e2d7630eb80d@gmail.com>
Date: Thu, 17 May 2018 23:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <0df38331-afdf-b47c-410e-6640c74e8b14@linux.intel.com>
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 21:20:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 03:04 PM, Alexander Kanavin wrote:
> On 05/17/2018 01:33 PM, Marek Vasut wrote:
>>>> Looks like AUH runs as a x86 machine, which is why it doesn't catch
>>>> u-boot.
>>>
>>> Also we have already discussed this 2 month ago. Marek, as the u-boot
>>> maintainer, can you look into enabling u-boot on qemu please?
>>
>> Wouldn't it make more sense to fix the AUH so it handles U-Boot and
>> similar packages correctly even without the qemu dependency ?
> 
> Determining the latest upstream version, performing the recipe upgrade,
> and testing that the upgraded version builds are all done by calling
> bitbake. Which of course requires that MACHINE is set to something
> specific, in this case qemux86. As u-boot is disabled there, it gets
> skipped. I could special-case u-boot, but I do think it's better to
> enable it on qemu, which would also allow better AB testing across
> architectures and during runtime (booting images) for instance.

Let's see how this works:
https://patchwork.ozlabs.org/patch/915781/

Once this gets mainline, we should then be able to enable u-boot for
qemux86/qemux86-64 . I have a patch ready for that too, but let's wait
until the U-Boot patch discussion is over.

-- 
Best regards,
Marek Vasut

