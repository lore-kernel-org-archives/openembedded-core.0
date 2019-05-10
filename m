Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 256B17CFEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 22:16:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g5so3437927plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4tPGcLPLXbpJAAP7mEF6I4gCdyYjHVF9cKBX2+iQiRY=;
	b=BD3E2steovUM1GVsEZsLEdX6Yg3MYUhVA39QNtmJCUuAr/ljycEpdYe3vysBzM6yWG
	/n7qDATIPenQSwT6wFWmcs0XdK8PIQpR5Ybzh0yo1ibqISigsXC1D+ol2C1fzG6OhDhN
	pl8iEmx22Tc6B/2eMOyo6KtZZsBDSV3OoEUaKFU6mhyfx+Xa6NcL7igraJGi0kCtrkOZ
	/DX0HP4/2ZOupyMMRJwNol5r9OHLMVCGOME1aUlRDFnvrsbLNU41MmTXdQaNp7AwvHYG
	LnDUjfO7QuBoixI1n6p0vcPqiBldcnEJqtuO2clB8GXeB82M3Vh3/B108JBF+BaiVXTa
	70ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4tPGcLPLXbpJAAP7mEF6I4gCdyYjHVF9cKBX2+iQiRY=;
	b=UMW0T/+n2zk0M9i1XKKpi/9BYVZLJ52/zfpdQjs1zAUeTcl1wASUU6HcyQrsUK45D9
	jsPhPVxADRMXzxgUL8DkRanf9RBuvHu/nAwmTfoTrTJ+SkUnC8Kmdi+05d6IPLaHTh7p
	btgwMXpOVQZti4xdYYnW/K6Q1Tqk6lA6+uOzScDho4J15oxln3kCHo+kpavio+vFs3tl
	jwVRrw+NTjfuhMC/zf0SkeUUX8yEY9gM6XtOInFRsi0WpsYLsJVPRJbUoq/MbrHoo+XM
	tpZ1akKAN2IhYE0+KRit1LUj8fG7py6jKiuyJroe1iDHevXgao0eXOzQ30t75lD4hwWr
	GNbA==
X-Gm-Message-State: APjAAAX1octSstS5CtHTJzPCiJ0SfoDj1w+CeuZXJYLCo9w+DcSAHTXr
	2Y8lfonbGllssWbfqRLU89YnQSljids=
X-Google-Smtp-Source: APXvYqzBfX8zkP12wsyaGS3iG3T8o5p/XkgtLpJgTuax5pP43ry/0NqeOQkWgmxkwyi9+qwM87gWNw==
X-Received: by 2002:a17:902:2aa6:: with SMTP id
	j35mr15901417plb.236.1557526594639; 
	Fri, 10 May 2019 15:16:34 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:6095:8839:3497:2f69])
	by smtp.gmail.com with ESMTPSA id
	h30sm6491652pgi.38.2019.05.10.15.16.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 15:16:33 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
Date: Fri, 10 May 2019 15:16:32 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Fri, 10 May 2019 22:16:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/10/19 3:13 PM, akuster808 wrote:
> should we change the default to openssl ?
> 

I dont think so. Since newer versions of gnuTLS works okay.

> - armin
> 
> On 5/10/19 2:55 PM, Martin Jansa wrote:
>> * gnutls from meta-gplv2 isn't new enough for this version of glib-networking:
>>    meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls' ['>= 3.4.6'] found '3.3.30'
>>
>> * disabling gnutls PACKAGECONFIG isn't an option either:
>>    meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled. Please enable at least one TLS backend
>>
>> * add an option to replace gnutls with openssl
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>> index 09af229d69..e2b4cffb2b 100644
>> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
>> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] = "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
>>   PACKAGECONFIG ??= "gnutls"
>>   
>>   PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
>> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
>>   PACKAGECONFIG[libproxy] = "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
>>   
>>   EXTRA_OEMESON = "-Dgnome_proxy=disabled"
> 

