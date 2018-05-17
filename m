Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 97BCD7489C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:12:40 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v60-v6so5439993wrc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=e/i6yaKKWg0BG674bezsJ/UvE3eLQYRlJ9xbum4xOjk=;
	b=lo93AkSgrkfux/PN8Eu66Yq5Nnpoi7hmACJgvCcVS6A8lFxx3CyWxUYZq6hNPQM8V6
	nNmBzJdqUMiB1Jw9Z9ut+87gjR6RlCA3M/Z5PdV/7CWnepeI5fiQYfpNzZumznfwm2Ek
	OIJ5YJFwLiZdkv/A/Qnvbxhe/HWsASI7Lvvo7joPdw37ZzU+ws6wi78r5pvQYhbOS6RF
	xgrjrL7N7QUA9wQ69BM59UlcvTEKL2IoKsU+Sl8yzzO80ti9G+hChthL+4OSHk6TvLgS
	EC7OST4tQeovI29+a5nonUQY/rnso8oixpZX4ihn7OXAlhhp3ghjmqU0WbyzQ7lH+8BZ
	+fKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e/i6yaKKWg0BG674bezsJ/UvE3eLQYRlJ9xbum4xOjk=;
	b=eKon4i+Ta7zDMI0f4wyM8AgLsnLDgR3/1YpumE9BSuxbq/wcPLjuCozvDCHgrYeBJ4
	+AkwLZ79LoKzPyuGSLneMNsVXyI8pnZ4Cjd1BYkF5YhGbAQ7chDeMh5IRBBAsDz88cE8
	D1vEVCNS9vrCkefeaVur/kkBZaBVyAW3oX6wENZHyVyVM/2WOo6chJLF421g4pJW5zYQ
	JHr9SfrO209nbqYMUZIUSjBg6NdbAI+RBv52WUR9WtGwK6ppZ6geEipH8JBWvGjfBj9W
	1feXqhYchdHKZJwGTJ4wcqDmoYzdGkewpHvRlgYDdc8GUTzTbByNbMNRxOmqw4qiu3rQ
	xS+w==
X-Gm-Message-State: ALKqPwfhB49xgD21tbazc8GrMoyTd6uo9wlDgHdHoZasG67eZwaAdYiG
	VUURRo7OtaqjHJJr20mXqhWQeVlI
X-Google-Smtp-Source: AB8JxZopyN0w7JfDoi5/BxzkBMc96fGOnkjGZcQAGoY1eTlY9EsV9qBhHblvnhCVb06RgDeWBo5+kg==
X-Received: by 2002:adf:df07:: with SMTP id
	y7-v6mr3813382wrl.279.1526559160610; 
	Thu, 17 May 2018 05:12:40 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	38-v6sm9748999wry.61.2018.05.17.05.12.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 05:12:40 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
Date: Thu, 17 May 2018 12:33:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
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
X-List-Received-Date: Thu, 17 May 2018 12:12:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 11:53 AM, Alexander Kanavin wrote:
> On 05/17/2018 12:56 PM, Burton, Ross wrote:
>> Looks like AUH runs as a x86 machine, which is why it doesn't catch
>> u-boot.
> 
> Also we have already discussed this 2 month ago. Marek, as the u-boot
> maintainer, can you look into enabling u-boot on qemu please?

Wouldn't it make more sense to fix the AUH so it handles U-Boot and
similar packages correctly even without the qemu dependency ?

-- 
Best regards,
Marek Vasut

