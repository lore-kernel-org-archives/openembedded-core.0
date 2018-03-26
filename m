Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6203371A9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:09:18 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s24-v6so1731303plq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=61gceD9mdDzvIIyt4Qn5GJZezChVvzIkhljb3QG6/yA=;
	b=XWCgl0tRszznYCxhDE1go9t14DGferffhZjXuNZOukKFcNWHpd+S+oAe5csLonoIR5
	l3d3oMjTyZRLvdl22Bq4Lka/HjnV9ZiOpUN4YEoDuDHa44u/9IW9TW3S0A6A10zxaNz0
	SvLJJjNKLZmcI5fC2Uv9zd7sX+Fnruq791GpQu36XyjC1yLiqmXc5vEnMIOHJ6BO5T8W
	syE/JQEg5VajFtR0G4Zd2vBnTyuaBqpyjg3NBsHuXA56uliHsRUruFfnfRFnzKjTds1I
	Ic4VleNgCFlgPb/por3k7mFSzWjKhw4A6EIXtpoHLwiB2U0VTJx8VdEjEpPkN3oSUI8n
	B2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=61gceD9mdDzvIIyt4Qn5GJZezChVvzIkhljb3QG6/yA=;
	b=AnnxRAGa1iBXu3anialFR6b4f6p59h9Zeg2BLP3SFj33kX2aV5xKHiNawqGJnicpTo
	2JDLq9POXE6Ui023R2e2pcCejage2RhEEv35J0L03hgoyP8VjFAakVMG3pxlurMPRe+2
	RKPE+wWtSJ8HB9O7zsOhEejNTrCwmbkUmIBKxzHVLKcHcibIjvY4HoKLSjJXKIb38ppI
	ZTf3u5Skg0ttMo0huegz1qMFys1OExFqqdhcz/JzQjDRJY9gRSabUQOXMIfqtr39/5KC
	l6wRfQzioZ9R5bmPV44ftnu0VasTRpvnJPTqLZmBgS2fec6sN87HLs7l9xCs/xuy/TIS
	+EDw==
X-Gm-Message-State: AElRT7EfjS/zrMlKnisIV46jk3lpVUpBH1oYnTVYrJFS0WMT4+pq7byt
	jkZNy7PKNRMVNge+AbZthQA=
X-Google-Smtp-Source: AG47ELtteF2GYHwr72OFCZ31F1fP9i9wWO3cHQUVRszLDMUWdt0vgyzOsutNYPlBmGnaA1mUqN7aeQ==
X-Received: by 2002:a17:902:5388:: with SMTP id
	c8-v6mr30140439pli.90.1522076960548; 
	Mon, 26 Mar 2018 08:09:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:203c:a04e:87e9:791b?
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	a65sm34830764pfg.170.2018.03.26.08.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Mar 2018 08:09:20 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1521989435.git.akuster@mvista.com>
	<917fba1ddf9aabf3aebf25ccd9def83808ac8a4c.1521989435.git.akuster@mvista.com>
	<849d5550-fa4a-3378-461d-71acc30ff504@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d4836bc9-3f31-19fa-34d0-c4783a14bfe0@gmail.com>
Date: Mon, 26 Mar 2018 08:09:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <849d5550-fa4a-3378-461d-71acc30ff504@linux.intel.com>
Subject: Re: [PATCH 11/21] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 15:09:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 03/26/2018 07:40 AM, Alexander Kanavin wrote:
> On 03/26/2018 05:30 PM, Armin Kuster wrote:
>> diff --git
>> a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>> b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>> index 4cc9e05..461fe83 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
>> @@ -4,14 +4,16 @@ AC_USE_SYSTEM_EXTENSIONS to get that defined.
>>   Upstream-Status: Submitted
>>   Signed-off-by: Ross Burton <ross.burton@intel.com>
>>   -diff --git a/configure.ac b/configure.ac
>> -index 0c98875..ebf4dee 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
>> - AC_CONFIG_HEADERS([config.h])
>> +Index: libxshmfence-1.3/configure.ac
>> +===================================================================
>> +--- libxshmfence-1.3.orig/configure.ac
>> ++++ libxshmfence-1.3/configure.ac
>> +@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
>> +
>> + AC_USE_SYSTEM_EXTENSIONS
>>      +AC_USE_SYSTEM_EXTENSIONS
>>   +
>>    # Initialize Automake
>>    AM_INIT_AUTOMAKE([foreign dist-bzip2])
>> +
>
> When devtool refreshes a patch, you do need to read the outcome to
> check that it is, indeed, applied correctly. Especially suspicious are
> the patches that are backports or 'Submitted'.
>
> In this case, a duplicate line is inserted due to patch fuzz -
> harmless I guess, but unnecessary.

Does this mean you are looking for a V2 ?

- armin
>
>
> Alex


