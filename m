Return-Path: <jpewhacker@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70D4E6004D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:15:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so1763956pff.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Kh8NLXhKG69fZezX0c4kV6X7J31lmz+7UwGQEJ6fOjY=;
	b=YJZiLaqPRq8P1HwngSFMoS/HkgnoCg+Junh8CDF0zal2cnOUf/ztcOo8dz9cvAF7Fh
	huURwHgtANsRgkqPBe9hT7gR6HXaMpKyBhUj7t8Nn6jbC7nMNvecxUGEDq0+fSUaufRC
	kT+gdk/FssXv1PKx2ahex9mDok17xK1Mvo6gKHpbHduiklMRveC6LH5a3G1RFTDPhwzp
	QmMCVtojNHRb4y9v6+Hl7SkVf8PWtbS2zRojVqTEeMeS1GLqhtKyvbwEN7+1+k1vzx2q
	fPRGv2pfBY4fxOlbgTQEo3bNUORLtT1Qo3mc2xK0DrWG/RDuRpi9DCbcDUDYWMjE9XG8
	eGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Kh8NLXhKG69fZezX0c4kV6X7J31lmz+7UwGQEJ6fOjY=;
	b=i+Owq3vlerXXoa+kSt8n7AMB707os3amPO7HscBH6b8cLV9L9ALsYe9x6OOfDWEhxP
	KlWk2smuHff+TZ3UZHN1MNeEfTHaCe9Ot7TiQbzEKoXlM3AZ7hI/AAbXi99JciK1YTJY
	yDpl/qtjJgMbXw9ScxI9Lrtqhy/OKz55mG/9TOyaew7uCEcf8BDCS7P4K/rUBR95FAm/
	FiJxyeMkVbYdatuccADb4Bd4aodfTgpyfd/h4YCQsDk73vTJW5IHG08uPm8bL+iGoa61
	1SWTPktpEPcuEtwP/srjl2Oq4ASrEg0l5l7sSdzbT8ZvVxprZ1emJimnaNBWQehEg5qD
	NqHw==
X-Gm-Message-State: APjAAAUtFcLrRU70zhT+d/Lg9L7a7lubm4fWwmvyO4R21eUBh60qPYcu
	TltSXdK8RVgfoNfFaEK5M8QcVNFY
X-Google-Smtp-Source: APXvYqy5NNsP7L0NOV2ZfnBhAG4HJPR5pWe3RSJFZhLo99rKtirKSwXd3XCMmc2CsVy+MWQ436HgZg==
X-Received: by 2002:a63:a46:: with SMTP id z6mr5558598pgk.76.1561666542181;
	Thu, 27 Jun 2019 13:15:42 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	w65sm4265833pfw.168.2019.06.27.13.15.41
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 13:15:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
	<CAJ86T=Xp0L=12A1P-Mt2YLN_uyjmpUtPd-5a9JQ7Lfrw_sCSoA@mail.gmail.com>
Message-ID: <94dcb178-1ca6-f6fa-6c88-eb19a820f7d5@gmail.com>
Date: Thu, 27 Jun 2019 15:15:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xp0L=12A1P-Mt2YLN_uyjmpUtPd-5a9JQ7Lfrw_sCSoA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Thu, 27 Jun 2019 20:15:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/27/19 2:47 PM, Andre McCurdy wrote:
> On Thu, Jun 27, 2019 at 6:54 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>> gettext is required to generate the glibc locales in do_compile. If not
>> present, glibc will skip the generation which isn't reproducible.
> I guess you mean not deterministic rather than not reproducible?

Correct. I found all these in the context of trying to get reproducible 
builds working, but that is a more accurate statement.

>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
>> index 073d1533e37..c400ee10b0f 100644
>> --- a/meta/recipes-core/glibc/glibc_2.29.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
>>         file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>>         file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>>
>> -DEPENDS += "gperf-native bison-native make-native"
>> +DEPENDS += "gperf-native bison-native make-native gettext-native"
>>
>>   PV = "2.29"
>>
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

