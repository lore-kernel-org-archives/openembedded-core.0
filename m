Return-Path: <marek.vasut@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFB378946
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:02:37 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t6so14443480wmt.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JkifuQZY4iJj66XTOsrGmZqqcL9kt/xk1GZfmO4n/8E=;
	b=Ksmn5TVQD80RSDKgoIaoaGNAyVB5STCcF2gqepsuadJqUyTUwG2dhDKNS5pyeAJBoh
	iZ2MJut1g7f7fi7D7fLSWnuWVImxPg/D4tKSKUKQA/hy9okLdHCZT+ymdRfbhpdZNy3h
	9/TPA22jDnML5XYBytgakfZtk8H6hZ0B+95t/PXTnjfz7T/HYbG3lOWPWLUbUnpp9gmw
	trzHekhyuo+xtMUwgzfaTWc/idBqE3c+roPf7XmEaE/fqRGSQMr9cveh7rkgHZEjVBuT
	iQQu3OWXvErE7MoBz/CaLzWNiQ7g9Gq+lWJ4HiCSPXf9zckTp2WOTtmLq3J6r4RmcrWL
	hnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JkifuQZY4iJj66XTOsrGmZqqcL9kt/xk1GZfmO4n/8E=;
	b=Ec8S0GQgwCAZxU/PlxhV0b4bU5vDpcF/kXRRkGsYZQn+sutM4dDa+e3hXMbBaJD1xF
	Xc4x83Hbi8dgfrbOAEpq0tPG5JK33eg26JAW7wh2388hkCNTMqMpYhuVwOHj+kdv/ytj
	4U45OSJFu781JFgpl9686DVIIa2QRJDLzqmHCMh4NdY60rYCyRz9qDIyUO+e3EQDoa37
	qh6/6hAvM4YbfCXvDhlfTARI048dLF1x8q1L5jYw4Q0lBBQDbPFWbvF5ui+YtV48bQOw
	nOml+xa5N/X49LWJw3UWdItBs7m6S+l4zbqu69v+ldF3iRn+8Hhi+BSOJDoOl+2TkCrK
	xn9w==
X-Gm-Message-State: AElRT7ElyM4z+eQbL25vpeQQor+SN1GpRQFXUmpAisQijfdttD6ANHU6
	uprtBZxPZTwEanZllSQ678Nkni/V
X-Google-Smtp-Source: AG47ELtZtGD0ry8mEAUP8+tiSECClcjE2vhMuyCVPJLM9hfyV0Vr/E5SnZS6hu6oE1a4QKAEQuEkBQ==
X-Received: by 10.28.130.1 with SMTP id e1mr7665987wmd.45.1521453758007;
	Mon, 19 Mar 2018 03:02:38 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50]) by smtp.gmail.com with ESMTPSA id
	69sm13398487wmp.36.2018.03.19.03.02.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 03:02:37 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
	<8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
	<caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c7ca8437-1517-e449-57b4-bdc39633b9e6@gmail.com>
Date: Mon, 19 Mar 2018 10:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.03 FAILED
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
X-List-Received-Date: Mon, 19 Mar 2018 10:02:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 09:50 AM, Alexander Kanavin wrote:
> On 03/17/2018 06:27 PM, Marek Vasut wrote:
> 
>>> You are receiving this email because you are the maintainer
>>> of *u-boot-mkimage* recipe and this is to let you know that the
>>> automatic attempt
>>> to upgrade the recipe to *2018.03* has Failed(do_compile).
>>>
>>> Detailed error information:
>>>
>>> do_compile failed
>>
>> It seems this only bumped some of the U-Boot recipes to 2018.03 while it
>> left some at 2018.01, so it's not really surprising it failed. Maybe
>> this is an auto-update bug ?
> 
> The problem is that AUH is using qemu machines to determine what needs
> to be updated, and to attempt building new versions. u-boot is not
> enabled in qemu at all, and so it's skipped:
> 
> ERROR: Nothing PROVIDES 'u-boot'
> u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in
> the qemux86 machine configuration.
> 
> I'm not sure how to solve it - perhaps you can simply take the email as
> a reminder to update the whole set on your machine manually?

I was hoping the tool will take care of that, now that I've finally
plucked all the extra patches out.

-- 
Best regards,
Marek Vasut

