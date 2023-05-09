Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B19C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 14:00:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.33297.1683640834024683338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 07:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HOwhHepd;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C15491BF217;
	Tue,  9 May 2023 14:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683640831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=37+NyvQc0KmJICf/bD6D431uZM7JaQ/omNee5ynHCFo=;
	b=HOwhHepdKUj5HZSe/wrPC85ZM5TQpfwuGvHUnqUSATWiSzPwgnTWwHCsfBReRUvMPn+JkR
	YQmy925CColyGOwKf15uxRNtbWGsoDjzIvlVyyOakEuaX+DwKfaRoQ6KGxLCDd/9KhGg7h
	K0YRfcYIvg47Zypcy1Q7vLmhyVb1mXDkOd58vI+jQ4B8bcHsTJNWbUguc/Eo2RjAhs1IRg
	jnkxEEw8wPDxQoDTglZh9H4tTOqHmSVipHiZiPsM0MTlnMnO2g+SbaonrIqY7scnX2AciG
	9vs1CKlBNhTW3le4QZREHnrPSr0/hg/ZokqeL8L6ABSbRV7qZ9C4e4QDvFb01w==
Message-ID: <427458dc-ccf0-7fd3-6e9a-960db63fe3cb@bootlin.com>
Date: Tue, 9 May 2023 16:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v4] devicetree.bbclass: Allow selection of dts
 files to build
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 =?UTF-8?Q?Petr_Kubiz=c5=88=c3=a1k_-_2N?= <Kubiznak@2n.com>
References: <20230426072204.3255437-1-kubiznak@2n.com>
 <2826abbfbfb636f23354faddf7d35def35a7dc13.camel@linuxfoundation.org>
 <DB4PR02MB10030398AE71DDC1E005F8848E2729@DB4PR02MB10030.eurprd02.prod.outlook.com>
 <5256ecbe3a4fda1014bbe260740f529d90727943.camel@linuxfoundation.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <5256ecbe3a4fda1014bbe260740f529d90727943.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 14:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181042


On 05.05.23 at 13:10, Richard Purdie wrote:
> On Fri, 2023-05-05 at 10:59 +0000, Petr Kubizňák - 2N wrote:
>> Thanks for accepting the patch.
>>
>> I can for sure send a doc patch, just want to make sure it is desired
>> since the glossary does not list any DT_* variable at the moment, and
>> the devicetree class section in this respect only refers to the class
>> sources. So I think both DT_FILES and DT_FILES_PATH variables should
>> be documented at least, right?
> Ideally all the variables in use would be documented in the manual.
> We're trying to fix and improve the docs so yes, adding docs for the
> ones you added would be great, bonus marks if there are others you can
> add at the same time!


I have the same challenge with 
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/uboot-sign.bbclass

The number of variables which can be modified is overwhelming! I guess 
what matters in the documentation is to refer to the variables for which 
there is a legitimate reason for changing the default value, right?
Like UBOOT_FIT_ADDRESS_CELLS, which was introduced recently.

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


