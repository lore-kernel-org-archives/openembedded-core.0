Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9397971FC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 16:29:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAHGTk9S022685
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 08:29:46 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 17 Nov 2014 08:29:45 -0800
Message-ID: <546A2278.9030706@windriver.com>
Date: Mon, 17 Nov 2014 10:29:44 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1416213365.git.wenzong.fan@windriver.com>	<e6e4ba1fd6f31ecd724e7ca035f4cdc45576e0a3.1416213365.git.wenzong.fan@windriver.com>
	<546A17B5.6070704@mvista.com>
In-Reply-To: <546A17B5.6070704@mvista.com>
Subject: Re: [PATCH 1/1] serf: 1.3.6 -> 1.3.8
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
X-List-Received-Date: Mon, 17 Nov 2014 16:29:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/14, 9:43 AM, akuster wrote:
> Since Dizzy would need the security fix in serf 1.3.7, would  I backport
> 1.3.8 to Dizzy from master or do we need a separate 1.3.7 update for Dizzy?

Unless there is no way to backport, usual process is a separate 1.3.7 update for 
Dizzy.

--Mark

> - Armin
>
>
> On 11/17/2014 12:38 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Release changes:
>>
>> Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
>>     Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
>>     Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
>>     Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.
>>
>> Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
>>     Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>    .../serf/{serf_1.3.6.bb => serf_1.3.8.bb}          |    6 +++---
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>    rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)
>>
>> diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.8.bb
>> similarity index 74%
>> rename from meta/recipes-support/serf/serf_1.3.6.bb
>> rename to meta/recipes-support/serf/serf_1.3.8.bb
>> index 08b04d3..10db122 100644
>> --- a/meta/recipes-support/serf/serf_1.3.6.bb
>> +++ b/meta/recipes-support/serf/serf_1.3.8.bb
>> @@ -1,8 +1,8 @@
>>
>> -SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
>> +SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
>>               file://norpath.patch"
>> -SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
>> -SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
>> +SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
>> +SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
>>
>>    LICENSE = "Apache-2.0"
>>    LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>>


