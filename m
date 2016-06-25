Return-Path: <akuster808@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D11F60088
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 15:30:09 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id l125so18224928ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=zoXmYMxk8YICYnVngw2spfkak4rlLAGp6dZxCmC4dFU=;
	b=NCSaUpyS8uARseIZH+rHeYiiqHZxmi87bMLEUUeFc2Siclxw20unf96bNfkSPBla+e
	Q4p0Lr89nKngrd0ge2FZYs9n4aPpUc4MduScSBLrC27FHriQi9TAWAbIN3bgGnuZN71Z
	vRpzUekZIusJgvmvIdYDl4OED7m+dTBnVvSNy1+sJ+U0M9l0p6BtvuWveD4Csia0WC5a
	aR4TpH+B/cRBn3nQObdIIQa07+akRyURWNs3D4GqI/Tv23W64jhXJz1OvmORPhCxeizl
	YwcdIump2n6xGGcS5ZWIYxIfZpvcddtoYVUqToYS+8BmaWsy1CwPdS0zM8Zg5yWEpJGu
	nh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zoXmYMxk8YICYnVngw2spfkak4rlLAGp6dZxCmC4dFU=;
	b=Vl3PKpLmwpu7mA9QtL37V1cvLIGECtyDNdIEyFL/N6id+4gs5cU6Ll0xoIzIcUzBUH
	pp5+OiVQvt68qC+7plgJl93PIs+nTUJ6O6OVtjWejjyMiGcPwP5H1P2vGSY7ude6G4JB
	IoGX0c/6/Y8zj7lcS3LCi+dCZKPbHC+QrQwKuuRtsdtuWXYI9e1TES1j8WZZAWtH6odG
	jp2s0f5N362OOCdt5xoO7r6oGCGsXHXeJID/ovXKK1lcX+sfkc3643jcjdybZkijE72n
	dTpQYs/nHspEIqqIgpSv8+jqJ8+FVdo+MAZQXsoePtS3PxLSQYOZnXz0aOhOSaIpRJq0
	yj5A==
X-Gm-Message-State: ALyK8tIKsVGX1uDkCNCUcWCFge1Z47K4aAlPTPGP9Ial+ED7r3zYL3AZdo5/BbAyaYuXlw==
X-Received: by 10.37.47.213 with SMTP id v204mr6362615ybv.91.1466868610489;
	Sat, 25 Jun 2016 08:30:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:7088:5913:fd08:49ed?
	([2601:202:4001:9ea0:7088:5913:fd08:49ed])
	by smtp.googlemail.com with ESMTPSA id
	x82sm2016227ywd.27.2016.06.25.08.30.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Jun 2016 08:30:08 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
	<9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
	<576AC542.9020709@gmail.com>
	<112E5421-6EE1-465A-9D4A-AEC9A38B9EB7@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576EA37E.6050705@gmail.com>
Date: Sat, 25 Jun 2016 08:30:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <112E5421-6EE1-465A-9D4A-AEC9A38B9EB7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Sat, 25 Jun 2016 15:30:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 06/22/2016 10:21 AM, Khem Raj wrote:
> 
>> On Jun 22, 2016, at 10:05 AM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>>
>> On 06/22/2016 09:52 AM, Khem Raj wrote:
>>>
>>>> On Jun 22, 2016, at 8:29 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>>>
>>>> Since there are two gcc versions supported and any number of tcglibc,
>>>> it would be nice to know which ones are being used.
>>>> Add those to the build summary.
>>>>
>>>> Build summary
>>>> TCLIBC            = “glibc"
>>>
>>> libc is evident from TARGET_SYS
>>
>> TARGET_SYS="x86_64-oe-linux", this is not the my intent.
>>
>>
>> The intent is to track which libc is being used. I changed TCLIBC =
>> "musl" local.conf and now build summary show.
>>
>> TCLIBC            = "musl"
>> GCC_VERSION       = "6.1"
>>
>> Is there a clearer / better way to display this?
> 
> if you set TCLIBC = “musl” then TARGET_SYS should have changed to x86_64-oe-linux-musl
> and TARGET_SYS is displayed with build configuration.

Ah, ok. now I get it.

Would TCMODE be more useful?


is the GCC summary part OK?

- armin
> 
>>
>> - armin
>>>
>>>> GCC_VERSION       = "6.1"
>>>>
>>>> Not sure if the gcc version bit is best practice.
>>>>
>>>> Armin Kuster (2):
>>>> build summary: add gcc version being used.
>>>> build summary: add TCLIBC being used
>>>>
>>>> meta/classes/base.bbclass | 2 ++
>>>> meta/conf/bitbake.conf    | 2 +-
>>>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> --
>>>> 2.3.5
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
> 

