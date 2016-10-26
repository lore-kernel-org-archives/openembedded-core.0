Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 906DE60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 23:54:39 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 12so715137uas.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 16:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=siCG4UnVCnRQMvcv8vQDFpiWfda02cv6X7FGF7WDq8M=;
	b=SYpGK0mgimO6c1GA7KIdbkJsxOmOz0/W8hvHb5nH8vBz80wJ7u9FacfrxjsET/ZQUu
	PFYmHIS39LFN8BdgqjsrZsfJtPHbSk4molir9omBB+mfEL5vjA6B0yTJz5zRm67qlGnL
	Ve4sc27oMMV9SA2vhBw3goaeiiXXvtSyt7r1qd30h+nxwurkDxALifJXo7qiBv2hHG8C
	EZ7XAdk2PcV+PjPweoXnYS0jobjebJgOBOtWMwGGD4EmaBBJvINan83xcdX2R2Y8OFHr
	Do7X3NXN6KGlwjHgABf5JOmJermr6q+FKjIV65nXZVp3oPDdm5vrA31SpRphUboRcsxF
	csHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=siCG4UnVCnRQMvcv8vQDFpiWfda02cv6X7FGF7WDq8M=;
	b=IkdMg/zY5ajF7cS/Rt9Ove0XAlc+tu1zjpQfrCnnlW1ZqEuyX1yVXMnk/RzFPMbjcE
	98pTcmtuwESH1YP6pHjr7f5SlSsCwbpWX9aLs8S06jS4i9YJf+fHKBLJNICDSg0GqNf3
	IW1SMN9Fhm2VozX7oZ5o6nJyNjX1yDLxb9fCeM7R1RPZ3NdHfqi/xs4jvkk/us2T1YoL
	qmJNWrHDHNLoDQv86yyYvjf2/srspkXUiDbSvzyv2TcWTv8xOkCf0qgCP14rZZAQISSu
	disMU3xekbRwCEEVZLMHaLS7Yo0kYlPGVaKaVo9xvO7rJYBcydaeBuYR3c6tqxiMixSX
	K38w==
X-Gm-Message-State: ABUngve/ANTQjxvb4I6wavCBrXrL1KaujAtdC38zWnKa8+votTJ1v4fklwN0dTox32N/QgNaoNL/uw9ZM6VVrg==
X-Received: by 10.159.55.200 with SMTP id q66mr3621144uaq.107.1477526081238;
	Wed, 26 Oct 2016 16:54:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Wed, 26 Oct 2016 16:54:10 -0700 (PDT)
In-Reply-To: <20161026092715.GA2297@linux.intel.com>
References: <20161026015017.13160-1-raj.khem@gmail.com>
	<20161026092715.GA2297@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Oct 2016 16:54:10 -0700
Message-ID: <CAMKF1sqHUr7MKMQs09=mKVNdiEtrqEPWd2ikODzANyLSE7JkMQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Add dosfstools-native mtools-native to dependencies
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
X-List-Received-Date: Wed, 26 Oct 2016 23:54:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 26, 2016 at 2:27 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Hi Khem,
>
> On Tue, Oct 25, 2016 at 06:50:17PM -0700, Khem Raj wrote:
>> these tools are needed for building wic images for some
>> boards e.g. overo/gumstix
> NAK
>
> Usage of native tools depends on .wks content: modules, partition types,
> etc. Your change will cause unnecessary build activity for some
> machines/wks files where those tools are not used.
>
> I'd suggest to put these dependencies to board-dependent meta.
> Please, look how it's done for genericx86, beaglebone and edgerouter:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/include/genericx86-common.inc
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/beaglebone.conf
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/edgerouter.conf
>
yes, agreed, I was trying to see if it could be made easy for using
wic out of box but then there
are many machine specific deps would make it futile I guess.

>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/image_types.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
>> index a7fffbc..be7e38c 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -298,7 +298,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>>  IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>> -IMAGE_DEPENDS_wic = "parted-native"
>> +IMAGE_DEPENDS_wic = "parted-native dosfstools-native mtools-native"
>>
>>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>>  IMAGE_TYPES = " \
>> --
>> 2.10.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Regards,
> Ed

