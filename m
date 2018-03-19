Return-Path: <marek.vasut@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7993278945
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:53:42 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z8so8368070wrh.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ivFKkSCJVcpvAZlBfOfsg6tQwnEJpjbAbjASApxyOE8=;
	b=UxDAalUwvSKx5lhU1p7PClc8+2DM9qeeOc2v2EH2h3r0d26j9c51M1nnDRXdvjd8H+
	W0rdcG70STBvAkUrADIDExi8I//WNWIQ6dvFIJyxEVGS5Ut6f/XXjN9/oeyLr2xvYiqX
	+SsyLd+mjKS1jx3HBLzQTpd2CxaHA88l8yjzaEr738sVB3O980836HCM8FvjojqocJoH
	xsi8qEo0qKBjJYExoQraR7X8U68uP9lYuECeJbebR8FtuJC60xcNMFmrxrO4+14MkmEE
	wcjipESMml2S0AYePSFy/KGnG1Zyxx4zNQ03lP1A6RCbsbUkFhLOFNtCc8ACAr5iHwKr
	K4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ivFKkSCJVcpvAZlBfOfsg6tQwnEJpjbAbjASApxyOE8=;
	b=EAI4D/McUGn2BFwZ7+5MunQ4W48I1KGLB6N7MTg85b3ShTaaKWE7GR8tp6qpspO9Wd
	1xDDlS6GcDrUvrkm8m9m6RxqwlEwuT89CIlgYZw+yV200DYGDKLiIXlAhmav4PihlNwz
	KbAY9EYt/nkRWKn0eh1Ldny0oKKJC5w65IVFbGazuCVbifboFJC9LVOg4Y3lYU0Ib1zd
	Vp6obq1AUUxEPAdKBlyfMC8hPJNdv0Rvj1mHAA6UHn1xn3rs/kLWlOa+lh9WEpJzQxSB
	OwJtA9dLqlWxNNsTN7eMGE1FmB8MtEnZKI/+pGyAmlLnxJVyj66dIyLZsukPQCBi/Sy6
	Dlvw==
X-Gm-Message-State: AElRT7FpOt+PENELGuEH/xoWL68O3FDU0vOVnDy77R9dwKgmrtgbNCL3
	+vEFWSVqO0p2K+GgIiTllCz7kjnd
X-Google-Smtp-Source: AG47ELtPPtNKbl7DO2zD3dNM3C3ePpw62ZoNwORyfcj5k3OY3MZuTLRkegBQlUxUyUTX13EMZtjgAA==
X-Received: by 10.223.146.133 with SMTP id 5mr9457147wrn.109.1521456822840;
	Mon, 19 Mar 2018 03:53:42 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-107-50.net.upcbroadband.cz.
	[86.49.107.50])
	by smtp.gmail.com with ESMTPSA id m191sm80528wma.21.2018.03.19.03.53.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 03:53:42 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
References: <20180316092125.64DD7440071@auh.yoctoproject.org>
	<8f7b8f66-1a17-6051-e626-fc4a3d26c5af@gmail.com>
	<caedac22-09fe-1ee3-34c7-8e285743f352@linux.intel.com>
	<c7ca8437-1517-e449-57b4-bdc39633b9e6@gmail.com>
	<eebfb544-851e-6e67-9056-a997bc8863d1@linux.intel.com>
	<835df47e-ef32-61a7-f856-eee8dac4610c@gmail.com>
	<5420e82b-7ca0-5dea-659c-208e26e5bc32@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <34b82c6a-ef83-e603-3af5-3979e044a918@gmail.com>
Date: Mon, 19 Mar 2018 11:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <5420e82b-7ca0-5dea-659c-208e26e5bc32@linux.intel.com>
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
X-List-Received-Date: Mon, 19 Mar 2018 10:53:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 11:31 AM, Alexander Kanavin wrote:
> On 03/19/2018 12:08 PM, Marek Vasut wrote:
>>>>> I'm not sure how to solve it - perhaps you can simply take the
>>>>> email as
>>>>> a reminder to update the whole set on your machine manually?
>>>>
>>>> I was hoping the tool will take care of that, now that I've finally
>>>> plucked all the extra patches out.
>>>
>>> You can automate most of the upgrade by running 'devtool upgrade u-boot'
>>> though. Extra patches are not a problem for automatic updates. If U-BOOT
>>> and qemu can be made friends, that's even better.
>>
>> So what's the problem with qemu and u-boot ? I don't see why it couldn't
>> be built for qemu targets.
> 
> Maybe, but right now it's not working, and it's something the u-boot
> experts should tackle and test.
> 
> ak@kanavin-desktop:~/development/poky/build$ bitbake u-boot
> Loading cache: 100%
> |##########################################################################################################################################################################################################################|
> Time: 0:00:00
> Loaded 1310 entries from dependency cache.
> ERROR: Nothing PROVIDES 'u-boot'
> u-boot was skipped: Either UBOOT_MACHINE or UBOOT_CONFIG must be set in
> the qemux86 machine configuration.

Try building with UBOOT_MACHINE = "qemu-x86_defconfig" .

> I do see that u-boot has qemu configs though:
> 
> http://git.denx.de/?p=u-boot.git;a=tree;f=configs;h=a6603a9f312f1e86fa233adf21a51a2c7cf46653;hb=HEAD

Yes

-- 
Best regards,
Marek Vasut

