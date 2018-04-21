Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id B39BE60068
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 10:52:42 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id u18-v6so1750989wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=DlnDPEU3ajU/RLZdDfZKeV8lkvy3MvW28D+EG6LDh94=;
	b=P+sPyPEt/GTnqhbtVbIuffKkomLpiiIz/bHbBW6vi2+tTYcjy2iC1k3zVA4aSBYXla
	Et5YnuYMo5FCEz8ojF9xhctEr2c1twIFAE3n/0nDrVFtQCVf8QMpTs+IYRZhaNDwI96a
	8ra96mOkFczUsLG0MUJ4oDh9AYPRZHqX2c/ao9dovfmNt+NEbwqgAWDMG11deWaOJt7T
	RfcWJ667NPmsD9dVFpdcRLrUgCwhVwWk7rvMBinbm6QjMfePZt2ek58bnjIFfDHCFW9l
	2w1TylKTRww7xr7pmCGWIZ/7GWMxxOS3S4Rbobl3xsi5fkUzypRPuBw4NnHVyGeGljdM
	NaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DlnDPEU3ajU/RLZdDfZKeV8lkvy3MvW28D+EG6LDh94=;
	b=dxXVHBd6BYeIWdw+vDEtppo/LTe6iP1/HCArremCzOxdzkFL3HGSe+VeWezL7p4Gma
	ER233g8G3+K4daBoRyjRaOK14u0l1D4u1a5YFvQkB8u4zBjHTcnW2Ob7/3PYCylkNBfa
	/LOtJ/L3Qp4oAxoTHW1uhK/FoXNZ3q27YuqVBoyy2G7QDXhCGEvb2tQMZ1szILKJ7CAt
	pdIW8OIXZ2p/ZwxfZ8d0se4j/z7JXphykvNDM5Q5NMnARSCyuYdud+6UlkVnbml52hzh
	iCOlmyAqkKL192usII0Ld/+uOP0Z1RHqlXtrxQtpU48EPmsOUzw1eI65rTBPMhRoV3eo
	+PHA==
X-Gm-Message-State: ALQs6tCFiX8837rYLtJaOYionnQJ//c8vd1asQ+t1v5o7ey/l4p27bLq
	dDETOC6fGCDjrYf1XKR5N+659OUa
X-Google-Smtp-Source: AIpwx48+tCkR6tKLYesiphL6lZC873U89WHIm8kjbwBybLRit8Y/AwtK7WNnkIB4wYEyeqCJ+53Nog==
X-Received: by 10.80.193.153 with SMTP id m25mr18299279edf.151.1524307962990; 
	Sat, 21 Apr 2018 03:52:42 -0700 (PDT)
Received: from [192.168.42.50] (ppp-2-86-147-190.home.otenet.gr.
	[2.86.147.190])
	by smtp.gmail.com with ESMTPSA id q6sm4561999edh.48.2018.04.21.03.52.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Apr 2018 03:52:42 -0700 (PDT)
To: Marek Vasut <marex@denx.de>, "Burton, Ross" <ross.burton@intel.com>
References: <20180408230223.17260-1-marex@denx.de>
	<CAJTo0Lbdrm7y5ZHHSHH980jmZSJE0RbhLQCVY3NtQ1DPz-A3fw@mail.gmail.com>
	<2c318d94-b321-e83a-a5ef-254647b3d35e@denx.de>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <74130da7-8ae2-1cdc-b504-d7a3d006b29c@gmail.com>
Date: Sat, 21 Apr 2018 12:52:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <2c318d94-b321-e83a-a5ef-254647b3d35e@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Sat, 21 Apr 2018 10:52:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

Update:

This rocko 2.4/u-boot combination still seems to work[1]:

Note that this is before rocko 2.4.1 and before U-Boot 2018.01.

=> version
U-Boot 2017.09 (Nov 04 2017 - 20:32:29 +0000)

arm-poky-linux-gnueabi-gcc (GCC) 7.2.0
GNU ld (GNU Binutils) 2.29.0.20170912

[1] 
https://github.com/RobertBerger/meta-mainline/blob/rocko-training-v4.9.x/u-boot-wic-bsp/yocto-autobuilder/res-custom-rocko-multi-v7-core-image-minimal-uboot-vic.conf

Regards,

Robert

