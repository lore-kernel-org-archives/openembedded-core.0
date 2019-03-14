Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2F17C410
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 15:57:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id j5so4144168pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NavqU4Tu/MUB8MTHfztHRhA0VreDFKFGnzbS3PUDnM4=;
	b=tq07ALh1pGa9VkfMdsEO6Fe5JPbeMynlOvjH6RIlqrJB0l2pFYQDILZMvTytOUmpMq
	Pa39vWG+g1u0z7zu4ghP/XEkxDOL3pSLcMTYABDp4qviCmiOMXjL5gQPvWQP5T5scoUD
	Uroeo1eJakFIFR7hpts3Wae+sYwuURTH3sm2S/ZgOn848ZRgHdsEV8Yz5h1f9o2Z0X4q
	dPeLa68mtxZkIg1mkeJUbpYSImAUSFx+Q4SNonjh84lLr0sz+D+TFkjC4mNSONtb6NI6
	YgudWNyaRAz5uIwWHBharCeITY42CogLTBOGTkMe3bSPMDqGuxE1PI4yp2Qllq5BUNq2
	sxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NavqU4Tu/MUB8MTHfztHRhA0VreDFKFGnzbS3PUDnM4=;
	b=mlIhWNrHiSGTW8vN2zZSRhGXQebIwch1/wJsmG/ygqrkTz6y2Qj7n45WZ9lZiPqzHV
	6m+pdWys4WP0pi6W5MDChjociSiXaEvRbDIK1rXhWDp7P6jmV8/UQP4t04a1HHxNAYxP
	7YubXPhNP6lV6B8cP4b6pqm7sKVlXQAv2yStzTvFzsEkK0CDU+3Zv2+NFlSbpdHdFGST
	AHEPcya+n5Kpy2SVgAPyTk7sfAqxN0HL0PYk8mt3nQdGTKvafvaWmxsch5LJndWiUQqA
	zcG0ffbdnWvLLlibBn75jcH3vQaAKPGywdGS9LULsqi4IRYvG8xgJcqDVp2WbxAV8z0q
	8abw==
X-Gm-Message-State: APjAAAVhEjuSdSeeS6x3i1+eEMmpEMW+8w9OYVA0MQ7IUh2kQKXUrTM1
	jL+GEpuFMLO8wK1Ffho29Ho=
X-Google-Smtp-Source: APXvYqwvhfh6uWTCixegM8jI1k5xT4jUN73m3iTyLOiF3jPtNi57pVKCd+6ug6fC5+9/V4VEYzMQHg==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr50471845pfa.130.1552579056511; 
	Thu, 14 Mar 2019 08:57:36 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:1c38:8eb8:1763:902b?
	([2601:202:4180:c33:1c38:8eb8:1763:902b])
	by smtp.gmail.com with ESMTPSA id
	y14sm39378145pgs.47.2019.03.14.08.57.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 08:57:36 -0700 (PDT)
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>,
	openembedded-core@lists.openembedded.org
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
	<20190313224749.GC14253@joraj-alpa>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cd83f247-3a1e-64d9-bc76-e0c05b4745f1@gmail.com>
Date: Thu, 14 Mar 2019 08:57:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190313224749.GC14253@joraj-alpa>
Subject: Re: [Thud][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Thu, 14 Mar 2019 15:57:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Jonathan,

On 3/13/19 3:47 PM, Jonathan Rajotte-Julien wrote:
> Hi,
>
> Disregard this series. It does not follow the project guideline regardi=
ng recipe
> update for stable release.
There are exceptions when a package update is a bugfix only change. I
know the kernel, openssl, bind, curl and a few others fall into that
category. Many minor version updates tend to be=C2=A0 bug fix only but th=
at
all depends on the upstream project policies. Binutils does not follow
that scheme as they add features in minor version updates. This is what
I know from personal experience. What helps the project along with the
maintainer is=C2=A0 having a brief summary of the changes in the commit
message. I am at the mercy of commit message.

Can you confirm this is bug fix only update?

regards,
Armin


> Thanks
>
> On Wed, Mar 13, 2019 at 08:55:53PM +0000, Jonathan Rajotte wrote:
>> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>=

>> ---
>>  .../lttng/{lttng-ust_2.10.1.bb =3D> lttng-ust_2.10.3.bb}        | 4 +=
+--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb =3D> lttng-ust_=
2.10.3.bb} (90%)
>>
>> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/reci=
pes-kernel/lttng/lttng-ust_2.10.3.bb
>> similarity index 90%
>> rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
>> rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
>> index d79a47931c..b5c43200d6 100644
>> --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
>> @@ -23,8 +23,8 @@ PE =3D "2"
>>  SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz=
2 \
>>             file://lttng-ust-doc-examples-disable.patch \
>>            "
>> -SRC_URI[md5sum] =3D "4863cc2f9f0a070b42438bb646bbba06"
>> -SRC_URI[sha256sum] =3D "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e466=
2712aef2d635b88ee9d"
>> +SRC_URI[md5sum] =3D "ffcfa8c1ba9a52f002d240e936e9afa2"
>> +SRC_URI[sha256sum] =3D "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69=
ffb7a3075d33b40852b"
>> =20
>>  CVE_PRODUCT =3D "ust"
>> =20
>> --=20
>> 2.17.1
>>



