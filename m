Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006A3C3DA7F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 01:29:03 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web10.50084.1723080537951554078
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 18:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=IcSOekCL;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id 0DEAA3099;
	Thu,  8 Aug 2024 03:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723080535;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=U1dWbNb8SjWAR2UtBGgx64KbcCCc/nQQ783Uw4wnMsM=;
	b=IcSOekCLEXRBoKVhdC+e1Poc/MQk0iYZwxeAkPhSbOxbWTIHM2Q1XjAVypHHBMO2
	OFmcmgcKuZjNz+doMJ9Ajx3Uv0VdburJJNNge8jQOTxZk+OkE87fc5oJzyKBH80is44
	St7vYY5+zkRFUVeB7GujwNHFE1ctRAP0baYBlMLcTpRwFl0XTboZjH8w27ds1VCsvGP
	yda1Gs8c8Ax7+CaseBLMHtYsAZZglN1tloR/ZB8r7wQaqxDaLDe8ZrhnyB5Z+MI35GT
	oJT/s8Xx+lMn7oIYkIgkj4FVSO3rASGnZUfnqJNaL7zRT+dvgySmyd42lA5LjFlFD3y
	DjA0gxQ7cQ==
Received: by smtp.mailfence.com with ESMTPSA ; Thu, 8 Aug 2024 03:28:53 +0200 (CEST)
Message-ID: <6ebae088-0ed0-4b46-b6a1-9f1ca15cc288@redrectangle.org>
Date: Wed, 7 Aug 2024 18:28:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] curl: Update to 8.9.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240804014447.2463258-1-robert.joslyn@redrectangle.org>
 <26DDACCB-5F5D-4BD5-ADC3-C8622AD8F7CC@arm.com>
Content-Language: en-US
From: Robert Joslyn <robert.joslyn@redrectangle.org>
In-Reply-To: <26DDACCB-5F5D-4BD5-ADC3-C8622AD8F7CC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 01:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203099

On 8/5/24 4:11 AM, Ross Burton wrote:
> There=E2=80=99s a known regression in this release, can you also backpo=
rt this commit:
>
> https://github.com/curl/curl/commit/3eec5afbd0b6377eca893c392569b2faf09=
4d970
>
> (as per https://curl.se/mail/distros-2024-08/0002.html)
>
> Ross

Ah, sure thing. I'll send a v2.

Thanks,

Robert


>
>> On 4 Aug 2024, at 02:44, Robert Joslyn via lists.openembedded.org <rob=
ert.joslyn=3Dredrectangle.org@lists.openembedded.org> wrote:
>>
>> From: Robert Joslyn <robert.joslyn@redrectangle.org>
>>
>> This update contains minor features, bugfixes, and addresses several C=
VEs:
>> * https://curl.se/docs/CVE-2024-6197.html
>> * https://curl.se/docs/CVE-2024-6874.html
>> * https://curl.se/docs/CVE-2024-7264.html
>>
>> Full relese notes available at https://curl.se/ch/8.9.1.html
>>
>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>> ---
>> meta/recipes-support/curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb} | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> rename meta/recipes-support/curl/{curl_8.8.0.bb =3D> curl_8.9.1.bb} (9=
8%)
>>
>> diff --git a/meta/recipes-support/curl/curl_8.8.0.bb b/meta/recipes-su=
pport/curl/curl_8.9.1.bb
>> similarity index 98%
>> rename from meta/recipes-support/curl/curl_8.8.0.bb
>> rename to meta/recipes-support/curl/curl_8.9.1.bb
>> index 2b058e4e82..3abe1596a0 100644
>> --- a/meta/recipes-support/curl/curl_8.8.0.bb
>> +++ b/meta/recipes-support/curl/curl_8.9.1.bb
>> @@ -15,7 +15,7 @@ SRC_URI =3D " \
>>      file://disable-tests \
>>      file://no-test-timeout.patch \
>> "
>> -SRC_URI[sha256sum] =3D "0f58bb95fc330c8a46eeb3df5701b0d90c9d9bfcc42bd=
1cd08791d12551d4400"
>> +SRC_URI[sha256sum] =3D "f292f6cc051d5bbabf725ef85d432dfeacc8711dd717e=
a97612ae590643801e5"
>>
>> # Curl has used many names over the years...
>> CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl=
:libcurl daniel_stenberg:curl"
>> --=20
>> 2.44.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202940): https://lists.openembedded.org/g/openembe=
dded-core/message/202940
>> Mute This Topic: https://lists.openembedded.org/mt/107710560/6875888
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


