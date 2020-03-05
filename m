Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25426611D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:18:29 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t24so4133236oij.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=aqRjACvwhYRbJT32xy0kTwqRJtQYU+kHTP6twmHFZKY=;
	b=Rww+pAoVG6kOkOuyPwGb8To/o8vPU0Eth7eqgti+lAsvWrfk5PubZjmAqMgazS1RdF
	SrZkbU3G4pbROXEWzd8idB4pYWxeYSqXnjDLpGiqIPuGk5PUJfXmXpn/43imJtuO9VSW
	kWTNK2Df7qN5jkjVqCbYJKUuvfwbXll1/2Bb3oCQOhkeMuC4a1Toj+0EYVBGFkpp9uNS
	VQ8hMJsyq9FSZ3WLnkkq9+r73HYEkxoRI3mq8GC//iuHcJmFcfwZZSzLbXAnGz5YYL/8
	HAb0WCUJ2QlV0ILabp215Vwtd4a4fFBZdB5ByP3e5OKX4b3AIVdefu0M9RdiTNjo0hVB
	nEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=aqRjACvwhYRbJT32xy0kTwqRJtQYU+kHTP6twmHFZKY=;
	b=gZRVpBOY+Il9Ci6JQXjl+HFCzCGJmxLxO+W6lxEXPxlhZYK8x0nm6oauh7I1GH5bwS
	7J+Uhii/pmUF9zKyiC2docz7uCo0HXXZGlIAU0yVV2DY9bdfQYsU3GUAMe9edQw/EX1J
	rdxtpAxzDGGBZt/cCZbJf0Y1/zSxXBMKhGHrVRHz/GzE+m43v5LG2Z+X1eVg8p0Tx4D3
	oplwX7IWYTwKMXOTMdSKA/6TmyyWCnjYRyz0V6bIegiiTXiWC+WPvSR6A538mHjz1RE4
	gW002sQlqQVBxepRRduOWBGLkYpM49B1Ao6R8QTTZFjGKL1bZOZo6IJYEhPP6fYG3NIT
	Gpag==
X-Gm-Message-State: ANhLgQ1PnE9G/6EVa4vuTieV7vGhshrkvpdkREEV+oRwW+GRAQmptvYB
	4ZZRhAnku9+/s+xci1A1xupABTVeqmI=
X-Google-Smtp-Source: ADFU+vtfEUIEvk33FInihcGEbpBcSo8Xwv58FSyAF6wFAgMCmsHIuC7z2JxVnfsHNXfbOCqse4FSvw==
X-Received: by 2002:a54:468b:: with SMTP id k11mr3472362oic.134.1583367509944; 
	Wed, 04 Mar 2020 16:18:29 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:d40a:79d1:acb0:3414?
	([2600:1700:4c90:60a0:d40a:79d1:acb0:3414])
	by smtp.gmail.com with ESMTPSA id
	m69sm9580629otc.78.2020.03.04.16.18.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 16:18:29 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200305000548.6357-1-jpuhlman@mvista.com>
	<CAJ86T=W1axCCm0+tSSJR-AGz3xReJoGveg3GT01-fmzSrzs5vA@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <d68e67bc-ca24-ea8a-7d8e-3535c2ea1af6@mvista.com>
Date: Wed, 4 Mar 2020 16:18:25 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=W1axCCm0+tSSJR-AGz3xReJoGveg3GT01-fmzSrzs5vA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm-native: disable readline for the native package.
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
X-List-Received-Date: Thu, 05 Mar 2020 00:18:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/4/2020 4:16 PM, Andre McCurdy wrote:
> On Wed, Mar 4, 2020 at 4:05 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>
>> ---
>>   meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>> index 5326184181..52e35c8c2e 100644
>> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>> @@ -20,6 +20,8 @@ DEPENDS_class-native += "readline"
>>   # Needed for dbm python module
>>   EXTRA_OECONF = "-enable-libgdbm-compat"
>>
>> +EXTRA_OECONF_class-native = "--without-readline"
> Assuming the target version is being built without readline support
> (presumably that's true as the recipe doesn't indicate any dependency
> on readline, but you should double check) then this configure option
> should be passed in all cases, not just for native.
There is not explicit dependency which is why we are here in the first 
place for native.
>
>>   # Stop presence of dbm/nbdm on the host contaminating builds
>>   CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
>>
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


