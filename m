Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 69679606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:31:22 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u46so3997047wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7mOpzoElQuEbvCD5tbcKG92Fo9CYFztDshq6W0DPvEk=;
	b=XynTOYH7g0IXWdJETJSczCm1ZuNU85UTmYTRUaeXV5lm+6kLYe0oP+BS5yaXmNRv8x
	tgYCMTCEA4uzshDOuAC68fn3hzZ/5VKLCrj3x4lV504A5MDHqjxlR9hluLUCHvC7PywU
	vz+z4wdrOO8yRk+0C1bg1zEWHfakykN9UNQtl87W2skJi0p1SlmmohNFPvaiQ+KpTyCa
	SUxR49M465QRWRqUA004dFILoTg309Dmw/yc7LDuvailIB4DN0Mi9nWLXBHUc+mI+3Mc
	gydaYv3ynCjxAcnY4M5BdK0LcXfVZoVlqRvP0LUYar8Wt9SwreF0oTnnG8Uxo4Y8Uhck
	fZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7mOpzoElQuEbvCD5tbcKG92Fo9CYFztDshq6W0DPvEk=;
	b=Oofz94skErcxkoSRdxonFtLPdq2x4TvRD5cpUJxHgo8bQ78dxvxA9sGz4VJKKu4f2f
	CwWaQCjwrSISF5apzLB7SYTl20e0YAfW2lV9j1W0MzfJNrs/sruSEibRgtARj0HLCIn5
	grg/no80QaiTnl3kUM7Ali6xS9f1T6xRxghjVNWjRzhZ9O2gdgIAbJMOUkqyu0UDl0FD
	TpIcd9qSsUJX6Mivy87dlx/TbDnlpzZ2uHR/XEIp/HfM7HxE1Pcasw/xBCb4brN5Q1Ph
	TmsqCvD1g8QWQQ9ppLoTuIBPcipmXI8f09WgEA7T91h0s273PMnH8QZ1FA3Lqotu0SPr
	70xw==
X-Gm-Message-State: AElRT7GrJA9Jgdq/6yP/LMEvg+4miD0HbJ9q7VVuwKUt8X+m/UAmWWxt
	EYqxaxMYW4PdL5ah9AfVHDrrmvMQ
X-Google-Smtp-Source: AG47ELu/yXrZ4vs0AOnFA5vk3kk7LoA2HZ4JUKlffLO6bHorrbKii5lYvwaSkOk4jee91N3El1b7mw==
X-Received: by 10.223.135.206 with SMTP id c14mr8655648wrc.134.1521455483040; 
	Mon, 19 Mar 2018 03:31:23 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50])
	by smtp.gmail.com with ESMTPSA id z9sm1358166wrz.4.2018.03.19.03.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 03:31:22 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
	<8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
	<caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
	<c7ca8437-1517-e449-57b4-bdc39633b9e6@gmail.com>
	<eebfb544-851e-6e67-9056-a997bc8863d1@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <835df47e-ef32-61a7-f856-eee8dac4610c@gmail.com>
Date: Mon, 19 Mar 2018 11:08:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <eebfb544-851e-6e67-9056-a997bc8863d1@linux.intel.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 10:31:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 10:57 AM, Alexander Kanavin wrote:
> On 03/19/2018 11:55 AM, Marek Vasut wrote:
> 
>>> I'm not sure how to solve it - perhaps you can simply take the email as
>>> a reminder to update the whole set on your machine manually?
>>
>> I was hoping the tool will take care of that, now that I've finally
>> plucked all the extra patches out.
> 
> You can automate most of the upgrade by running 'devtool upgrade u-boot'
> though. Extra patches are not a problem for automatic updates. If U-BOOT
> and qemu can be made friends, that's even better.

So what's the problem with qemu and u-boot ? I don't see why it couldn't
be built for qemu targets.

-- 
Best regards,
Marek Vasut

