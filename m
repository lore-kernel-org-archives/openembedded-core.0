Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 13422714E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:38:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I9cRC3009246
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 02:38:27 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 18 Sep 2014 02:38:27 -0700
Message-ID: <541AA812.9030905@windriver.com>
Date: Thu, 18 Sep 2014 17:38:26 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1410879378.git.kai.kang@windriver.com>	<21ec391160434407e70d89fe334515ede221d354.1410879378.git.kai.kang@windriver.com>
	<541A84B5.7020606@gmail.com>
In-Reply-To: <541A84B5.7020606@gmail.com>
X-Originating-IP: [128.224.162.231]
Subject: Re: [PATCH 9/9] perf: disable libunwind support for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 09:38:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年09月18日 15:07, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
>
>
> On 9/16/14 8:06 AM, Kai Kang wrote:
>> Disable libunwind support of perl for aarch aarch64 that libunwind
>> doesn't support aarch64.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf-features.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
>> index 2dbbb47..1782ae6 100644
>> --- a/meta/recipes-kernel/perf/perf-features.inc
>> +++ b/meta/recipes-kernel/perf/perf-features.inc
>> @@ -1,4 +1,5 @@
>>   PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
>> +PERF_FEATURES_ENABLE_aarch64 ?= "perf-scripting perf-tui"
>>   
> you could also say PERF_FEATURES_ENABLE_remove_aarch64 = "perf-libunwind"

Thanks. I'll try it.

--Kai

>
>>   def perf_feature_enabled(feature, trueval, falseval, d):
>>       """
>>
> - -- 
> - -Khem
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
> Comment: GPGTools - https://gpgtools.org
>
> iEYEARECAAYFAlQahLUACgkQuwUzVZGdMxRUTgCbB9mselfaJ3OdHJTFnZp34n15
> OacAni2H6G+Mri1zW7+W5OCHBbgzfE5L
> =lgJC
> -----END PGP SIGNATURE-----


-- 
Regards,
Neil | Kai Kang


